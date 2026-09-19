`timescale 1ns / 1ps

module tb_Modulation_system_polar;

parameter N = 12;

reg clk;
reg rstn;
reg frame_ready;
reg [3:0] I_data_in;
reg [3:0] Q_data_in;

wire [5:0] DAC_RE;
wire [5:0] DAC_IM;
wire busy;

integer nonzero_samples;

Modulation_system #(
    .N(N)
) uut (
    .clk(clk),
    .rstn(rstn),
    .frame_ready(frame_ready),
    .I_data_in(I_data_in),
    .Q_data_in(Q_data_in),
    .DAC_RE(DAC_RE),
    .DAC_IM(DAC_IM),
    .busy(busy)
);

initial begin
    clk = 1'b0;
    forever #15.625 clk = ~clk;
end

always @(posedge clk) begin
    if ((DAC_RE != 6'd0) || (DAC_IM != 6'd0))
        nonzero_samples = nonzero_samples + 1;
end

initial begin
    rstn = 1'b0;
    frame_ready = 1'b0;
    I_data_in = 4'b0000;
    Q_data_in = 4'b0000;
    nonzero_samples = 0;

    #100;
    rstn = 1'b1;
    #62.5;

    I_data_in = 4'b1010;
    Q_data_in = 4'b1100;
    frame_ready = 1'b1;

    #62.5;
    frame_ready = 1'b0;

    #100000;

    if (nonzero_samples == 0)
        $display("FAIL tb_Modulation_system_polar: no nonzero DAC samples");
    else
        $display("PASS tb_Modulation_system_polar: nonzero_samples=%0d", nonzero_samples);

    $finish;
end

endmodule
