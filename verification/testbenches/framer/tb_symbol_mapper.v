`timescale 1ns / 1ps
module tb_symbol_mapper;


    reg         rate;
    reg  [5:0]  bits_in;

    wire [31:0] codeword;


    reg  [3:0]  gold_cw1   [0:7];
    reg  [3:0]  gold_cw250 [0:511];


    integer     n_err;
    integer     n_checks;


    symbol_mapper dut (
        .rate    (rate),
        .bits_in (bits_in),
        .codeword(codeword)
    );


    function [3:0] to_rtl(input [3:0] line);
        to_rtl = {line[0], line[1], line[2], line[3]};
    endfunction


    function [3:0] to_file(input [3:0] n);
        to_file = {n[0], n[1], n[2], n[3]};
    endfunction


    function [5:0] sym_to_bits(input integer value, input integer n_bits);
        integer k;
        begin
            sym_to_bits = 6'd0;
            for (k = 0; k < n_bits; k = k + 1)
                sym_to_bits[k] = value[n_bits-1-k];
        end
    endfunction


    task check_loaded(input [8*256-1:0] name, input r);
        integer i, n, bad;
        reg [3:0] v;
        begin
            n   = r ? 512 : 8;
            bad = 0;
            for (i = 0; i < n; i = i + 1) begin
                v = r ? gold_cw250[i] : gold_cw1[i];
                if (^v === 1'bx) bad = bad + 1;
            end
            if (bad != 0) begin
                $display("FATAL: %0s has %0d missing/invalid lines (expected %0d lines)", name, bad, n);
                $finish;
            end
        end
    endtask


    task test_1mbps;
        integer   v, junk, errs_before;
        reg [3:0] exp;
        begin
            errs_before = n_err;
            rate = 1'b0;
            for (v = 0; v < 8; v = v + 1) begin

                for (junk = 0; junk < 8; junk = junk + 1) begin
                    bits_in      = sym_to_bits(v, 3);
                    bits_in[5:3] = junk;
                    #1;
                    exp = to_rtl(gold_cw1[v]);
                    n_checks = n_checks + 1;
                    if (codeword[3:0] !== exp) begin
                        $display("ERROR: 1 Mb/s symbol %0d (bits_in = %b): c0..c3 = %b, expected %b",
                                 v, bits_in, to_file(codeword[3:0]), to_file(exp));
                        n_err = n_err + 1;
                    end
                    if (codeword[31:4] !== 28'd0) begin
                        $display("ERROR: 1 Mb/s symbol %0d (bits_in = %b): codeword[31:4] = %h, expected 0",
                                 v, bits_in, codeword[31:4]);
                        n_err = n_err + 1;
                    end
                end
            end
            $display("symbol_mapper 1 Mb/s   : 8 codewords x 8 unused-bit values -> %s",
                     (n_err == errs_before) ? "PASS" : "FAIL");
        end
    endtask


    task test_250kbps;
        integer   v, g, bad_groups, errs_before;
        reg [3:0] exp;
        begin
            errs_before = n_err;
            rate = 1'b1;
            for (v = 0; v < 64; v = v + 1) begin
                bits_in = sym_to_bits(v, 6);
                #1;
                bad_groups = 0;
                for (g = 0; g < 8; g = g + 1) begin
                    exp = to_rtl(gold_cw250[8*v + g]);
                    n_checks = n_checks + 1;
                    if (codeword[4*g +: 4] !== exp) bad_groups = bad_groups + 1;
                end
                if (bad_groups != 0) begin
                    $display("ERROR: 250 kb/s symbol %0d (bits_in = %b): %0d of 8 chip groups differ",
                             v, bits_in, bad_groups);
                    for (g = 0; g < 8; g = g + 1)
                        $display("         group %0d (chips %0d..%0d): got %b expected %b", g, 4*g, 4*g+3,
                                 to_file(codeword[4*g +: 4]), gold_cw250[8*v + g]);
                    n_err = n_err + 1;
                end
            end
            $display("symbol_mapper 250 kb/s : 64 codewords -> %s", (n_err == errs_before) ? "PASS" : "FAIL");
        end
    endtask


    reg [8*256-1:0] f_cw1, f_cw250;


    initial begin

        n_err    = 0;
        n_checks = 0;
        rate     = 1'b0;
        bits_in  = 6'd0;


        if (!$value$plusargs("CW1=%s",   f_cw1))   f_cw1   = "codeword_1Mbs.txt";
        if (!$value$plusargs("CW250=%s", f_cw250)) f_cw250 = "codeword_250kbs.txt";

        $readmemb(f_cw1,   gold_cw1);
        $readmemb(f_cw250, gold_cw250);


        check_loaded(f_cw1,   1'b0);
        check_loaded(f_cw250, 1'b1);


        test_1mbps;
        test_250kbps;


        if (n_err == 0) $display("==== TEST PASSED: %0d checks ====", n_checks);
        else            $display("==== TEST FAILED: %0d errors in %0d checks ====", n_err, n_checks);
        $finish;
    end

endmodule


