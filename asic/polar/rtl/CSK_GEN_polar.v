module CSK_GEN #(parameter N = 12,M = 6) (
    input  clk,rstn,latch,pause,
    input  [(N-1) : 0] DQPSK,
    input  [4 : 0] chirps_address,
    output [M-1:0] DAC_RE , DAC_IM
);

wire [(N-1) : 0]  Freq,initFreq,theta,sfc,sbw,sdfdt;
wire fc_sign,dfdt_sign,bw_sign;

localparam [(N-1):0] Fc   = (101 * (64'h1 << N)) / 1024;
localparam [(N-1):0] hBW  = (278 * (64'h1 << N)) / 1024;
localparam [(N-1):0] dfdt = (7   * (64'h1 << N)) / 1024;

assign bw_sign = ~dfdt_sign;
assign initFreq = sfc + sbw;

integrator #(.N(N)) Phase_integrator (
    .clk(clk),
    .rstn(rstn),
    .we(latch),
    .X0(DQPSK),
    .dxdt(Freq),
    .OUT(theta)
);
complex_exp_LUT #(.N(N),.M(M)) complex_exp_LUT (
    .clk(clk),
    .rstn(rstn),
    .pause(pause),
    .theta(theta),
    .cos(DAC_RE),
    .sin(DAC_IM)
);


integrator #(.N(N)) Frequency_integrator (
    .clk(clk),
    .rstn(rstn),
    .we(latch),
    .X0(initFreq),
    .dxdt(sdfdt),
    .OUT(Freq)
);
Freq_LUT Freq_LUT (
    .lut_addr(chirps_address),
    .fc_sign(fc_sign),
    .dfdt_sign(dfdt_sign)
);
twos_comp_gen #(.N(N)) s_fc(
    .X(Fc),
    .sign(fc_sign),
    .OUT(sfc)
);
twos_comp_gen #(.N(N)) s_hBW(
    .X(hBW),
    .sign(bw_sign),
    .OUT(sbw)
);
twos_comp_gen #(.N(N)) s_dfdt(
    .X(dfdt),
    .sign(dfdt_sign),
    .OUT(sdfdt)
);


endmodule
