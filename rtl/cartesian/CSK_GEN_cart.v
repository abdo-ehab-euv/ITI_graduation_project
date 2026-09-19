module CSK_GEN_cart #(parameter N = 2, M = 6) (
    input  wire clk, rstn, latch,
    input  wire signed [1:0] DQPSK_RE, DQPSK_IM,
    input  wire [11:0] sample_address,
    output wire signed [5:0] DAC_RE, DAC_IM
);

reg signed  [1:0] dqpsk_re_active,dqpsk_im_active;
wire signed [4:0] chirp_re,chirp_im;

always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
        dqpsk_re_active <= 2'sd0;
        dqpsk_im_active <= 2'sd0;
    end else if (latch) begin
        dqpsk_re_active <= DQPSK_RE;
        dqpsk_im_active <= DQPSK_IM;
    end
end

complex_multiplier_c #(.WIDTH_1(2), .WIDTH_2(5), .OUT_WIDTH(6)) complex_multiplier_c (
    .a_real(dqpsk_re_active),
    .a_imag(dqpsk_im_active),
    .b_real(chirp_re),
    .b_imag(chirp_im),
    .y_real(DAC_RE),
    .y_imag(DAC_IM)
);

complex_exp_LUT_cart complex_exp_LUT (
    .sample_address(sample_address),
    .chirp_re(chirp_re),
    .chirp_im(chirp_im)
);
endmodule
