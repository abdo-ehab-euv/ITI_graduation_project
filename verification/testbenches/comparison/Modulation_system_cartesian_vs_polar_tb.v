`timescale 1ns / 1ps

module tb_Modulation_system_cart;


    parameter N = 2;


    reg clk, rstn, frame_ready;
    reg [3:0] I_data_in;
    reg [3:0] Q_data_in;


    wire [5:0] DAC_RE;
    wire [5:0] DAC_IM;
    wire [5:0] DAC_RE_polar;
    wire [5:0] DAC_IM_polar;
    wire busy, busy1;


    integer i;


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


    Modulation_system #(.N(32)) u_modulator (
        .clk         (clk),
        .rstn        (rstn),
        .frame_ready (frame_ready),
        .I_data_in   (I_data_in),
        .Q_data_in   (Q_data_in),
        .DAC_RE      (DAC_RE_polar),
        .DAC_IM      (DAC_IM_polar),
        .busy        (busy1)
    );


    initial begin
        clk = 0;
        forever #15.625 clk = ~clk;
    end


    initial begin

        rstn = 0;
        frame_ready = 0;
        I_data_in = 4'b0000;
        Q_data_in = 4'b0000;


        #100;
        rstn = 1;


        #62.5;


        for (i = 0; i < 8; i = i + 1) begin


            I_data_in = 4'b1010 ^ i[3:0];
            Q_data_in = 4'b1100 ^ i[3:0];


            #62.5;


            frame_ready = 1;
            #31.25;
            frame_ready = 0;


            #31.25;
            wait(busy == 1'b0 && busy1 == 1'b0);


            #156.25;
        end


        #50000;

        $stop;
    end


    initial begin
        $monitor("Time=%0t | rstn=%b | frame_ready=%b | DAC_RE=%d | DAC_IM=%d | busy=%b",
                 $time, rstn, frame_ready, DAC_RE, DAC_IM, busy);
    end

endmodule
