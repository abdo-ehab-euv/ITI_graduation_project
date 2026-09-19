`timescale 1ns / 1ps
module tb_css_tx_framer;


    localparam integer MAX_CHIPS = 4096;
    localparam integer MAX_SYMS  = MAX_CHIPS / 4;

    reg        clk;
    reg        reset;


    reg        start_Tx;
    reg        rate;
    reg  [7:0] payloadLength;
    reg        payload_we;
    reg  [6:0] payload_addr;
    reg  [7:0] payload_din;


    reg        mod_busy;
    wire       frame_ready;
    wire [3:0] mod_nib_i;
    wire [3:0] mod_nib_q;


    wire [9:0] ppdu_nibbles;
    wire       ppdu_done;
    wire       len_err;
    wire       busy;


    reg  [7:0] psdu     [0:126];
    integer    psdu_len;
    reg        gold_i   [0:MAX_CHIPS-1];
    reg        gold_q   [0:MAX_CHIPS-1];
    integer    gold_chips;
    integer    gold_syms;


    integer    n_err;
    integer    n_tests;
    integer    sym_cnt;
    integer    sym_err;
    reg        done_seen;
    reg        len_err_seen;
    reg        checking;


    integer    bfm_busy_min, bfm_busy_max;
    integer    bfm_gap_min,  bfm_gap_max;
    integer    seed;


    reg        rtl_i    [0:MAX_CHIPS-1];
    reg        rtl_q    [0:MAX_CHIPS-1];


    css_tx_framer dut (
        .clk          (clk),
        .reset        (reset),
        .start_Tx     (start_Tx),
        .rate         (rate),
        .payloadLength(payloadLength),
        .payload_we   (payload_we),
        .payload_addr (payload_addr),
        .payload_din  (payload_din),
        .mod_busy     (mod_busy),
        .frame_ready  (frame_ready),
        .mod_nib_i    (mod_nib_i),
        .mod_nib_q    (mod_nib_q),
        .ppdu_nibbles (ppdu_nibbles),
        .ppdu_done    (ppdu_done),
        .len_err      (len_err),
        .busy         (busy)
    );


    initial begin
        clk = 0;
        forever #15.625 clk = ~clk;
    end


    initial begin
        #20_000_000;
        $display("[%0t] ERROR: Global Safety Timeout Reached!", $time);
        $finish;
    end


    task read_psdu(input [8*256-1:0] fname, input msb_first);
        integer   fd, r, b;
        reg [7:0] v;
        begin
            psdu_len = 0;
            fd = $fopen(fname, "r");
            if (fd == 0) begin
                $display("[%0t] FATAL: cannot open PSDU file %0s", $time, fname);
                $finish;
            end
            while (!$feof(fd) && psdu_len < 128) begin
                r = $fscanf(fd, "%b\n", v);
                if (r == 1) begin
                    if (psdu_len == 127) begin
                        $display("[%0t] FATAL: PSDU file has more than 127 bytes", $time);
                        $finish;
                    end
                    if (msb_first)
                        psdu[psdu_len] = v;
                    else
                        for (b = 0; b < 8; b = b + 1) psdu[psdu_len][b] = v[7-b];
                    psdu_len = psdu_len + 1;
                end else if (r != -1) begin
                    $display("[%0t] FATAL: bad line in PSDU file after byte %0d", $time, psdu_len);
                    $finish;
                end
            end
            $fclose(fd);
        end
    endtask


    task read_gold(input [8*256-1:0] fname);
        integer fd, c, line, n_i, n_q;
        begin
            fd = $fopen(fname, "r");
            if (fd == 0) begin
                $display("[%0t] FATAL: cannot open golden file %0s", $time, fname);
                $finish;
            end
            line = 0; n_i = 0; n_q = 0;
            c = $fgetc(fd);
            while (c != -1) begin
                if (c == "\n") begin
                    if ((line == 0 && n_i > 0) || (line == 1 && n_q > 0)) line = line + 1;
                end else if (c == "0" || c == "1") begin
                    if (line == 0 && n_i < MAX_CHIPS) begin gold_i[n_i] = (c == "1"); n_i = n_i + 1; end
                    else if (line == 1 && n_q < MAX_CHIPS) begin gold_q[n_q] = (c == "1"); n_q = n_q + 1; end
                    else if (line > 1) begin
                        $display("[%0t] FATAL: golden file has more than 2 data lines", $time);
                        $finish;
                    end
                end else if (c != "\r" && c != " " && c != "\t") begin
                    $display("[%0t] FATAL: unexpected character '%c' in golden file", $time, c);
                    $finish;
                end
                c = $fgetc(fd);
            end
            $fclose(fd);
            if (n_i != n_q || n_i == 0 || (n_i % 4) != 0) begin
                $display("[%0t] FATAL: golden I/Q lengths %0d / %0d (must be equal, non-zero, multiple of 4)",
                         $time, n_i, n_q);
                $finish;
            end
            gold_chips = n_i;
            gold_syms  = n_i / 4;
        end
    endtask


    task load_gold(input r);
        begin
            read_gold(r ? f_iq250 : f_iq1);
            $display("[%0t] Golden for %s: %0d symbols (%0d chips per path)", $time,
                     r ? "250 kb/s" : "1 Mb/s", gold_syms, gold_chips);
        end
    endtask


    function [8*6-1:0] region(input integer s, input r);
        integer n_shr;
        begin
            n_shr = r ? 24 : 12;
            if      (s < n_shr - 4) region = "PREAMB";
            else if (s < n_shr)     region = "SFD";
            else                    region = "PHR+PL";
        end
    endfunction

    function integer rand_range(input integer lo, input integer hi);
        begin
            rand_range = (hi <= lo) ? lo : lo + ({$random(seed)} % (hi - lo + 1));
        end
    endfunction

    initial begin : bfm
        integer i, n_busy, n_gap;
        reg [3:0] exp_i, exp_q;
        mod_busy = 1'b0;
        forever begin
            @(posedge clk);
            if (!reset && frame_ready && !mod_busy) begin

                if (checking) begin
                    if (sym_cnt < gold_syms) begin
                        for (i = 0; i < 4; i = i + 1) begin
                            exp_i[i] = gold_i[4*sym_cnt + i];
                            exp_q[i] = gold_q[4*sym_cnt + i];
                        end
                        if (mod_nib_i !== exp_i || mod_nib_q !== exp_q) begin
                            sym_err = sym_err + 1;
                            if (sym_err <= 10)
                                $display("[%0t] ERROR: symbol %0d (%0s) I c0..c3 = %b%b%b%b exp %b%b%b%b | Q = %b%b%b%b exp %b%b%b%b",
                                         $time, sym_cnt, region(sym_cnt, rate),
                                         mod_nib_i[0], mod_nib_i[1], mod_nib_i[2], mod_nib_i[3],
                                         exp_i[0], exp_i[1], exp_i[2], exp_i[3],
                                         mod_nib_q[0], mod_nib_q[1], mod_nib_q[2], mod_nib_q[3],
                                         exp_q[0], exp_q[1], exp_q[2], exp_q[3]);
                        end
                    end else begin
                        sym_err = sym_err + 1;
                        if (sym_err <= 10)
                            $display("[%0t] ERROR: extra symbol %0d, golden has only %0d", $time, sym_cnt, gold_syms);
                    end
                    if (sym_cnt < MAX_SYMS)
                        for (i = 0; i < 4; i = i + 1) begin
                            rtl_i[4*sym_cnt + i] = mod_nib_i[i];
                            rtl_q[4*sym_cnt + i] = mod_nib_q[i];
                        end
                end else begin
                    $display("[%0t] ERROR: frame_ready while no frame is expected", $time);
                    n_err = n_err + 1;
                end
                sym_cnt = sym_cnt + 1;


                n_busy = rand_range(bfm_busy_min, bfm_busy_max);
                n_gap  = rand_range(bfm_gap_min,  bfm_gap_max);
                mod_busy <= 1'b1;
                repeat (n_busy) @(posedge clk);
                mod_busy <= 1'b0;
                repeat (n_gap) @(posedge clk);
            end
        end
    end

    always @(posedge clk) begin
        if (ppdu_done) done_seen    <= 1'b1;
        if (len_err)   len_err_seen <= 1'b1;
    end


    task apply_reset;
        begin
            reset         = 1'b1;
            start_Tx      = 1'b0;
            rate          = 1'b0;
            payloadLength = 8'd0;
            payload_we    = 1'b0;
            payload_addr  = 7'd0;
            payload_din   = 8'd0;
            repeat (4) @(negedge clk);
            reset = 1'b0;
            repeat (2) @(negedge clk);
        end
    endtask


    task fill_ram(input [7:0] pattern);
        integer a;
        begin
            for (a = 0; a < 128; a = a + 1) begin
                @(negedge clk);
                payload_we = 1'b1; payload_addr = a; payload_din = pattern ^ a[7:0];
            end
            @(negedge clk);
            payload_we = 1'b0;
        end
    endtask

    task write_payload;
        integer a;
        begin
            for (a = 0; a < psdu_len; a = a + 1) begin
                @(negedge clk);
                payload_we = 1'b1; payload_addr = a; payload_din = psdu[a];
            end
            @(negedge clk);
            payload_we = 1'b0;
        end
    endtask

    task write_rtl_output(input [8*256-1:0] fname);
        integer fd, k;
        begin
            fd = $fopen(fname, "w");
            for (k = 0; k < 4*sym_cnt && k < MAX_CHIPS; k = k + 1) $fwrite(fd, "%0d", rtl_i[k]);
            $fwrite(fd, "\n");
            for (k = 0; k < 4*sym_cnt && k < MAX_CHIPS; k = k + 1) $fwrite(fd, "%0d", rtl_q[k]);
            $fwrite(fd, "\n");
            $fclose(fd);
        end
    endtask

    task run_frame(input [8*40-1:0] name, input r,
                   input integer busy_min, input integer busy_max,
                   input integer gap_min,  input integer gap_max,
                   input [8*256-1:0] out_fname);
        integer guard, errs_before;
        begin
            errs_before  = n_err;
            bfm_busy_min = busy_min; bfm_busy_max = busy_max;
            bfm_gap_min  = gap_min;  bfm_gap_max  = gap_max;
            while (busy) @(negedge clk);
            load_gold(r);

            $display("[%0t] ---- %0s : rate = %s, L = %0d, golden = %0d symbols ----", $time, name,
                     r ? "250 kb/s" : "1 Mb/s", psdu_len, gold_syms);
            sym_cnt   = 0;
            sym_err   = 0;
            done_seen = 1'b0;
            checking  = 1'b1;

            @(negedge clk);
            rate          = r;
            payloadLength = psdu_len;
            start_Tx      = 1'b1;
            @(negedge clk);
            start_Tx      = 1'b0;

            guard = 0;
            while (!done_seen && guard < 400000) begin @(negedge clk); guard = guard + 1; end
            if (!done_seen) begin
                $display("[%0t] ERROR: ppdu_done not seen (captured %0d symbols)", $time, sym_cnt);
                n_err = n_err + 1;
            end


            repeat (50) @(negedge clk);
            checking = 1'b0;

            n_err = n_err + sym_err;
            if (sym_err > 10)
                $display("[%0t] ... %0d mismatching symbols in total", $time, sym_err);
            if (sym_cnt != gold_syms) begin
                $display("[%0t] ERROR: framer sent %0d symbols, golden has %0d", $time, sym_cnt, gold_syms);
                n_err = n_err + 1;
            end
            if (ppdu_nibbles != gold_syms) begin
                $display("[%0t] ERROR: ppdu_nibbles = %0d, golden has %0d", $time, ppdu_nibbles, gold_syms);
                n_err = n_err + 1;
            end
            if (out_fname != 0) write_rtl_output(out_fname);
            n_tests = n_tests + 1;
            $display("[%0t] ---- %0s : %s ----", $time, name, (n_err == errs_before) ? "PASS" : "FAIL");
        end
    endtask

    task run_len_err(input [7:0] len);
        integer errs_before;
        begin
            errs_before = n_err;
            while (busy) @(negedge clk);
            len_err_seen = 1'b0;
            checking     = 1'b0;
            @(negedge clk);
            payloadLength = len;
            start_Tx      = 1'b1;
            @(negedge clk);
            start_Tx      = 1'b0;
            repeat (20) begin
                @(negedge clk);
                if (busy || frame_ready) begin
                    $display("[%0t] ERROR: L = %0d started a frame", $time, len);
                    n_err = n_err + 1;
                end
            end
            if (!len_err_seen) begin
                $display("[%0t] ERROR: L = %0d did not pulse len_err", $time, len);
                n_err = n_err + 1;
            end
            n_tests = n_tests + 1;
            $display("[%0t] ---- len_err L = %0d : %s ----", $time, len, (n_err == errs_before) ? "PASS" : "FAIL");
        end
    endtask


    reg [8*256-1:0] psdu_file, f_iq1, f_iq250;
    integer         ri;
    reg             r;

    initial begin
        n_err = 0; n_tests = 0; sym_cnt = 0; sym_err = 0;
        checking = 1'b0; done_seen = 1'b0; len_err_seen = 1'b0;
        seed = 32'hC55;
        bfm_busy_min = 1; bfm_busy_max = 1; bfm_gap_min = 1; bfm_gap_max = 1;

        if (!$value$plusargs("PSDU=%s",  psdu_file)) psdu_file = "payload.txt";
        if (!$value$plusargs("IQ1=%s",   f_iq1))     f_iq1     = "IQ_paths_output_1Mbps.txt";
        if (!$value$plusargs("IQ250=%s", f_iq250))   f_iq250   = "IQ_paths_output_250kbps.txt";

        read_psdu(psdu_file, $test$plusargs("PSDU_MSB_FIRST"));
        $display("[%0t] Loaded %0d payload bytes from %0s", $time, psdu_len, psdu_file);

        apply_reset;


        for (ri = 0; ri < 2; ri = ri + 1) begin
            r = ri[0];
            $display("[%0t] ======== %s ========", $time, r ? "250 kb/s" : "1 Mb/s");


            fill_ram(8'hA5);
            write_payload;
            run_frame("TC1 fast handshake", r, 1, 1, 1, 1,
                      r ? "rtl_IQ_output_250kbps.txt" : "rtl_IQ_output_1Mbps.txt");


            run_frame("TC2 random handshake", r, 1, 12, 0, 8, 0);


            apply_reset;
            fill_ram(8'h3C);
            write_payload;
            run_frame("TC3 after reset", r, 30, 40, 5, 20, 0);


            run_len_err(8'd128);
            run_len_err(8'd255);


            run_frame("TC5 after len_err", r, 1, 3, 0, 2, 0);
        end

        repeat (10) @(negedge clk);
        if (n_err == 0) $display("[%0t] ==== TEST PASSED: %0d tests, both data rates ====", $time, n_tests);
        else            $display("[%0t] ==== TEST FAILED: %0d errors ====", $time, n_err);
        $finish;
    end


    initial begin
        if ($test$plusargs("dump")) begin
            $dumpfile("tb_css_tx_framer.vcd");
            $dumpvars(0, tb_css_tx_framer);
        end
    end

endmodule
