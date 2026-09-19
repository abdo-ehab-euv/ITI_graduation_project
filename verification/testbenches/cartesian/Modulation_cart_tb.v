`timescale 1ns / 1ps

module tb_Modulation_system_cart;


    parameter N = 2;


    reg clk,rstn;
    reg frame_ready;
    reg [3:0] I_data_in;
    reg [3:0] Q_data_in;


    wire [5:0] DAC_RE;
    wire [5:0] DAC_IM;
    wire busy;


    Modulation_system_cart #(
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
        clk = 0;
        forever #15.625 clk = ~clk;
    end


    initial begin

        rstn = 0;
        frame_ready = 1'b0;
        I_data_in = 4'b0000;
        Q_data_in = 4'b0000;


        #100;
        rstn = 1;


        #62.5;


        I_data_in = 4'b1010;
        Q_data_in = 4'b1100;
        frame_ready = 1'b1;

        #20;
        I_data_in = 4'b1010;
        Q_data_in = 4'b1100;
        frame_ready = 1'b1;

        #20;
        frame_ready = 1'b0;

        #50000;


    end

endmodule
