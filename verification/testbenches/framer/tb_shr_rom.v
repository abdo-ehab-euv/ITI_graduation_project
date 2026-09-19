`timescale 1ns / 1ps
module tb_shr_rom;


    reg         rate;
    reg  [4:0]  idx;
    wire [3:0]  nib;
    wire [4:0]  last_idx;


    reg  [3:0]  gold_shr1   [0:11];
    reg  [3:0]  gold_shr250 [0:23];

    integer     n_err;
    integer     n_checks;


    shr_rom dut (
        .rate    (rate),
        .idx     (idx),
        .nib     (nib),
        .last_idx(last_idx)
    );


    function [3:0] to_rtl(input [3:0] line);
        to_rtl = {line[0], line[1], line[2], line[3]};
    endfunction


    function [3:0] to_file(input [3:0] n);
        to_file = {n[0], n[1], n[2], n[3]};
    endfunction


    task check_loaded(input [8*256-1:0] name, input r);
        integer i, n, bad;
        reg [3:0] v;
        begin
            n   = r ? 24 : 12;
            bad = 0;
            for (i = 0; i < n; i = i + 1) begin
                v = r ? gold_shr250[i] : gold_shr1[i];
                if (^v === 1'bx) bad = bad + 1;
            end
            if (bad != 0) begin
                $display("FATAL: %0s has %0d missing/invalid lines (expected %0d lines)", name, bad, n);
                $finish;
            end
        end
    endtask


    task test_rate(input r);
        integer   i, n, errs_before;
        reg [3:0] exp;
        begin
            errs_before = n_err;
            n    = r ? 24 : 12;
            rate = r;


            idx = 5'd0;
            #1;
            n_checks = n_checks + 1;
            if (last_idx !== n - 1) begin
                $display("ERROR: rate %0d last_idx = %0d, expected %0d", r, last_idx, n - 1);
                n_err = n_err + 1;
            end


            for (i = 0; i < n; i = i + 1) begin
                idx = i;
                #1;
                exp = to_rtl(r ? gold_shr250[i] : gold_shr1[i]);
                n_checks = n_checks + 1;
                if (nib !== exp) begin
                    $display("ERROR: rate %0d idx %0d (%0s): c0..c3 = %b, expected %b", r, i,
                             (i < n - 4) ? "preamble" : "SFD", to_file(nib), to_file(exp));
                    n_err = n_err + 1;
                end
            end

            $display("shr_rom %s : %0d nibbles + last_idx -> %s", r ? "250 kb/s" : "1 Mb/s  ", n,
                     (n_err == errs_before) ? "PASS" : "FAIL");
        end
    endtask


    reg [8*256-1:0] f_shr1, f_shr250;

    initial begin

        n_err    = 0;
        n_checks = 0;
        rate     = 1'b0;
        idx      = 5'd0;


        if (!$value$plusargs("SHR1=%s",   f_shr1))   f_shr1   = "preambleSFD_1Mbps.txt";
        if (!$value$plusargs("SHR250=%s", f_shr250)) f_shr250 = "preambleSFD_250kbps.txt";

        $readmemb(f_shr1,   gold_shr1);
        $readmemb(f_shr250, gold_shr250);


        check_loaded(f_shr1,   1'b0);
        check_loaded(f_shr250, 1'b1);


        test_rate(1'b0);
        test_rate(1'b1);


        if (n_err == 0) $display("==== TEST PASSED: %0d checks ====", n_checks);
        else            $display("==== TEST FAILED: %0d errors in %0d checks ====", n_err, n_checks);
        $finish;
    end

endmodule
