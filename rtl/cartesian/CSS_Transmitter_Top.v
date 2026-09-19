`timescale 1ns / 1ps

module CSS_Transmitter_Top (
    input  wire       clk,
    input  wire       rstn,


    input  wire       start_Tx,
    input  wire       rate,
    input  wire [7:0] payloadLength,
    input  wire       payload_we,
    input  wire [6:0] payload_addr,
    input  wire [7:0] payload_din,


    output wire [5:0] DAC_RE_cart,
    output wire [5:0] DAC_IM_cart,


    output wire       system_busy,
    output wire       len_err,
    output wire [9:0] final_ppdu_nibbles
);


    wire       frame_ready;
    wire       mod_busy;
    wire [3:0] stream_i;
    wire [3:0] stream_q;

    wire       framer_busy;
    wire       ppdu_done;


    assign system_busy = framer_busy || mod_busy;


    css_tx_framer u_framer (
        .clk          (clk),
        .reset        (~rstn),
        .start_Tx     (start_Tx),
        .rate         (rate),
        .payloadLength(payloadLength),
        .payload_we   (payload_we),
        .payload_addr (payload_addr),
        .payload_din  (payload_din),


        .mod_busy     (mod_busy),
        .frame_ready  (frame_ready),
        .mod_nib_i    (stream_i),
        .mod_nib_q    (stream_q),


        .ppdu_nibbles (final_ppdu_nibbles),
        .ppdu_done    (ppdu_done),
        .len_err      (len_err),
        .busy         (framer_busy)
    );


    Modulation_system_cart #(.N(2)) Modulation_system_cart (
        .clk         (clk),
        .rstn        (rstn),


        .frame_ready (frame_ready),
        .I_data_in   (stream_i),
        .Q_data_in   (stream_q),


        .DAC_RE      (DAC_RE_cart),
        .DAC_IM      (DAC_IM_cart),
        .busy        (mod_busy)
    );

endmodule
