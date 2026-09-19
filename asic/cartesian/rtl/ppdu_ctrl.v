module ppdu_ctrl (


    input  wire       clk,
    input  wire       reset,
    input  wire       start_Tx,
    input  wire       rate,
    input  wire [7:0] payloadLength,
    input  wire [4:0] shr_last,


    input  wire       mod_busy,


    output reg        rate_q,
    output reg  [6:0] len_q,
    output wire [6:0] ram_raddr,
    output wire       acc_clear,
    output wire       acc_preload,
    output wire       acc_load,
    output wire       acc_byte_vld,
    output wire       acc_consume,
    output wire       il_clear,
    output wire       il_hold_en,
    output wire [3:0] nib_idx,
    output wire [4:0] shr_idx,


    output wire       frame_ready,
    output wire       buf_sel_shr,
    output reg        ppdu_done,
    output reg  [9:0] ppdu_nibbles,
    output reg        len_err,
    output wire       busy
);


    localparam [2:0] S_IDLE   = 3'd0,
                     S_SHR    = 3'd1,
                     S_PHR    = 3'd2,
                     S_LOAD   = 3'd3,
                     S_ENCODE = 3'd4,
                     S_DONE   = 3'd5;


    reg [2:0]         state;
    reg               start_prev;
    reg [7:0]         byte_idx;
    reg [1:0]         load_cnt;
    reg [1:0]         win;
    reg               phr_blk;
    reg [4:0]         shr_cnt;
    reg [3:0]         k;
    reg               half;
    reg signed [11:0] bits_left;
    reg [9:0]         wptr;
    reg               busy_prev;


    wire start_edge = start_Tx & ~start_prev;


    wire len_ok     = (payloadLength <= 8'd127);


    wire accept     = (state == S_IDLE) && start_edge && len_ok;


    wire [4:0]         step      = rate_q ? 5'd12 : 5'd6;


    wire [1:0]         win_last  = phr_blk ? (rate_q ? 2'd0 : 2'd1)
                                           : (rate_q ? 2'd1 : 2'd3);


    wire signed [11:0] left_next = bits_left - $signed({7'd0, step});


    wire               half_next = rate_q & ~half;


    wire               more      = rate_q ? ((left_next > 12'sd0) || half_next)
                                          : (left_next >= 12'sd0);


    wire enc_write   = (state == S_ENCODE) && (!rate_q || half);


    wire enc_consume = (state == S_ENCODE) && (!rate_q || !half || (k == 4'd15));


    assign frame_ready = (state == S_SHR) || enc_write;


    always @(posedge clk) begin
        if (reset) busy_prev <= 1'b0;
        else busy_prev <= mod_busy;
    end


    wire busy_edge = mod_busy & ~busy_prev;


    wire stall = frame_ready && !busy_edge;


    assign ram_raddr    = (state == S_LOAD) ? (byte_idx[6:0] + 7'd1) : byte_idx[6:0];


    assign acc_clear    = accept;
    assign il_clear     = accept;


    assign acc_preload  = (state == S_PHR);


    assign acc_load     = (state == S_LOAD) && !stall;
    assign acc_consume  = enc_consume && !stall;


    assign acc_byte_vld = (byte_idx < {1'b0, len_q});

    assign il_hold_en   = (state == S_ENCODE) && rate_q && !half;
    assign nib_idx      = k;
    assign shr_idx      = shr_cnt;
    assign buf_sel_shr  = (state == S_SHR);
    assign busy         = (state != S_IDLE);


    always @(posedge clk) begin
        if (reset) begin


            state        <= S_IDLE;
            start_prev   <= 1'b0;
            rate_q       <= 1'b0;
            len_q        <= 7'd0;
            byte_idx     <= 8'd0;
            load_cnt     <= 2'd0;
            win          <= 2'd0;
            phr_blk      <= 1'b0;
            shr_cnt      <= 5'd0;
            k            <= 4'd0;
            half         <= 1'b0;
            bits_left    <= 12'sd0;
            wptr         <= 10'd0;
            ppdu_done    <= 1'b0;
            ppdu_nibbles <= 10'd0;
            len_err      <= 1'b0;

        end else if (!stall) begin


            start_prev <= start_Tx;
            ppdu_done  <= 1'b0;
            len_err    <= 1'b0;

            case (state)


                S_IDLE: begin
                    if (start_edge) begin
                        if (!len_ok) begin

                            len_err <= 1'b1;
                        end else begin

                            rate_q    <= rate;
                            len_q     <= payloadLength[6:0];

                            bits_left <= 12'sd12 + $signed({2'b00, payloadLength[6:0], 3'b000});
                            byte_idx  <= 8'd0;
                            load_cnt  <= 2'd0;
                            win       <= 2'd0;
                            phr_blk   <= 1'b1;
                            shr_cnt   <= 5'd0;
                            k         <= 4'd0;
                            half      <= 1'b0;
                            wptr      <= 10'd0;

                            state     <= S_SHR;
                        end
                    end
                end


                S_SHR: begin
                    wptr <= wptr + 10'd1;
                    if (shr_cnt == shr_last)
                        state <= S_PHR;
                    else
                        shr_cnt <= shr_cnt + 5'd1;
                end


                S_PHR: begin

                    state <= S_ENCODE;
                end


                S_LOAD: begin
                    byte_idx <= byte_idx + 8'd1;
                    if (load_cnt == 2'd2) begin

                        load_cnt <= 2'd0;
                        win      <= 2'd0;
                        phr_blk  <= 1'b0;
                        state    <= S_ENCODE;
                    end else begin
                        load_cnt <= load_cnt + 2'd1;
                    end
                end


                S_ENCODE: begin
                    if (enc_write)
                        wptr <= wptr + 10'd1;

                    if (enc_consume) begin

                        bits_left <= left_next;
                        k         <= 4'd0;

                        if (rate_q)
                            half <= ~half;


                        if (!more)
                            state <= S_DONE;
                        else if (win == win_last)
                            state <= S_LOAD;
                        else
                            win <= win + 2'd1;
                    end else begin
                        k <= k + 4'd1;
                    end
                end


                S_DONE: begin
                    ppdu_done    <= 1'b1;
                    ppdu_nibbles <= wptr;
                    state        <= S_IDLE;
                end


                default: state <= S_IDLE;
            endcase
        end
    end
endmodule
