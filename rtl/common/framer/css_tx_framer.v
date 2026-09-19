


module css_tx_framer (
    input  wire       clk,
    input  wire       reset,

    input  wire       start_Tx,
    input  wire       rate,
    input  wire [7:0] payloadLength,
    input  wire       payload_we,
    input  wire [6:0] payload_addr,
    input  wire [7:0] payload_din,


    input  wire       mod_busy,
    output wire       frame_ready,
    output wire [3:0] mod_nib_i,
    output wire [3:0] mod_nib_q,


    output wire [9:0] ppdu_nibbles,
    output wire       ppdu_done,
    output wire       len_err,
    output wire       busy
);
    wire        rate_q;
    wire [6:0]  len_q;
    wire [6:0]  ram_raddr;
    wire [7:0]  ram_rdata;


    wire        acc_clear;
    wire        acc_preload;
    wire        acc_load;
    wire        acc_byte_vld;
    wire        acc_consume;
    wire [11:0] acc_window;

    wire [5:0]  i_bits, q_bits;
    wire [31:0] cw_i, cw_q;
    wire        il_clear, il_hold_en;
    wire [3:0]  nib_idx;
    wire [3:0]  nib_i, nib_q;
    wire [4:0]  shr_idx, shr_last;
    wire [3:0]  shr_nib;
    wire        buf_sel_shr;


    ppdu_ctrl u_ctrl (
        .clk          (clk),
        .reset        (reset),
        .start_Tx     (start_Tx),
        .rate         (rate),
        .payloadLength(payloadLength),
        .shr_last     (shr_last),

        .mod_busy     (mod_busy),

        .rate_q       (rate_q),
        .len_q        (len_q),
        .ram_raddr    (ram_raddr),
        .acc_clear    (acc_clear),
        .acc_preload  (acc_preload),
        .acc_load     (acc_load),
        .acc_byte_vld (acc_byte_vld),
        .acc_consume  (acc_consume),
        .il_clear     (il_clear),
        .il_hold_en   (il_hold_en),
        .nib_idx      (nib_idx),
        .shr_idx      (shr_idx),

        .frame_ready  (frame_ready),
        .buf_sel_shr  (buf_sel_shr),

        .ppdu_done    (ppdu_done),
        .ppdu_nibbles (ppdu_nibbles),
        .len_err      (len_err),
        .busy         (busy)
    );

    payload_ram u_payload_ram (
        .clk  (clk),
        .we   (payload_we),
        .waddr(payload_addr),
        .wdata(payload_din),
        .raddr(ram_raddr),
        .rdata(ram_rdata)
    );

    bit_accumulator u_acc (
        .clk     (clk),
        .reset   (reset),
        .clear   (acc_clear),
        .preload (acc_preload),
        .phr_len (len_q),
        .load    (acc_load),
        .byte_vld(acc_byte_vld),
        .byte_in (ram_rdata),
        .consume (acc_consume),
        .rate    (rate_q),
        .window  (acc_window)
    );

    iq_demux u_demux (
        .bits_in(acc_window),
        .i_bits (i_bits),
        .q_bits (q_bits)
    );

    symbol_mapper u_map_i (
        .rate    (rate_q),
        .bits_in (i_bits),
        .codeword(cw_i)
    );

    symbol_mapper u_map_q (
        .rate    (rate_q),
        .bits_in (q_bits),
        .codeword(cw_q)
    );

    bit_interleaver u_il (
        .clk    (clk),
        .reset  (reset),
        .clear  (il_clear),
        .hold_en(il_hold_en),
        .rate   (rate_q),
        .cw_i   (cw_i),
        .cw_q   (cw_q),
        .nib_idx(nib_idx),
        .nib_i  (nib_i),
        .nib_q  (nib_q)
    );

    shr_rom u_shr (
        .rate    (rate_q),
        .idx     (shr_idx),
        .nib     (shr_nib),
        .last_idx(shr_last)
    );


    ppdu_mux u_mux (
        .shr_nib    (shr_nib),
        .data_nib_i (nib_i),
        .data_nib_q (nib_q),
        .sel_shr    (buf_sel_shr),
        .out_i      (mod_nib_i),
        .out_q      (mod_nib_q)
    );

endmodule
