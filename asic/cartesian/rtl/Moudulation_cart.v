module Modulation_system_cart #(parameter N = 2) (
    input  clk,rstn,
    input  frame_ready,
    input  [3:0] I_data_in,Q_data_in,
    output [5:0] DAC_RE , DAC_IM,
    output busy
);
wire [(N-1) : 0] QPSK_RE,QPSK_IM, DQPSK_RE, DQPSK_IM, feedback_data_RE,feedback_data_IM;

wire [2 : 0] mem_Address;
wire [1 : 0] Ram_Address;
wire [11 : 0] sample_address;
wire [3 : 0] Period_address;
wire [6:0] Period;
wire I, Q,latch,clear,Ttick,mem_adderss_ovf;
wire Ram_inc, D_Ram_inc, Sample_inc, Periodreg_inc, Timer_en;

assign Ram_Address = mem_Address[1:0];
assign mem_adderss_ovf = mem_Address[2];

complex_multiplier_c #(.WIDTH_1(2),.WIDTH_2(2),.OUT_WIDTH(2)) complex_multiplier_c (
    .a_real(QPSK_RE),
    .a_imag(QPSK_IM),
    .b_real(feedback_data_RE),
    .b_imag(feedback_data_IM),
    .y_real(DQPSK_RE),
    .y_imag(DQPSK_IM)
);

dreg #(.N(1)) DeLAY_REG (
    .clk(clk),
    .rstn(rstn),
    .data_in(Ram_inc),
    .dataout(D_Ram_inc)
);
address_counter #(.N(3),.MAX(4)) Address_A (
    .clk(clk),
    .rstn(rstn),
    .clear(clear),
    .enable(D_Ram_inc),
    .address(mem_Address)
);
bit_RAM #(.Depth(4)) I_bit_RAM (
    .clk(clk),
    .rstn(rstn),
    .we(~busy),
    .r_address(Ram_Address),
    .data_in(I_data_in),
    .data_out(I)
);
bit_RAM #(.Depth(4)) Q_bit_RAM (
    .clk(clk),
    .rstn(rstn),
    .we(~busy),
    .r_address(Ram_Address),
    .data_in(Q_data_in),
    .data_out(Q)
);

 dqpsk_mapper_cartesian #(.N(2)) dqpsk_mapper (
    .I(I),
    .Q(Q),
    .QPSK_RE(QPSK_RE),
    .QPSK_IM(QPSK_IM)
);

feedback_memory_cartesian #(.N(2)) feedback_memory (
    .clk(clk),
    .rstn(rstn),
    .clear(clear),
    .we(latch),
    .datain_re(DQPSK_RE),
    .datain_im(DQPSK_IM),
    .address(Ram_Address),
    .dataout_re(feedback_data_RE),
    .dataout_im(feedback_data_IM)
);

CSK_GEN_cart #(.N(N),.M(6)) CSK_GEN(
    .clk(clk),
    .rstn(rstn),
    .latch(latch),
    .DQPSK_RE(DQPSK_RE),
    .DQPSK_IM(DQPSK_IM),
    .sample_address(sample_address),
    .DAC_RE(DAC_RE),
    .DAC_IM(DAC_IM)
);
address_counter #(.N(12),.MAX(1535)) Address_C (
    .clk(clk),
    .rstn(rstn),
    .clear(clear),
    .enable(Sample_inc),
    .address(sample_address)
);

 delay_LUT delay_LUT (
    .lut_addr(Period_address),
    .delay(Period)
);
timer #(.N(7)) delay_timer (
    .clk(clk),
    .rstn(rstn),
    .enable(Timer_en),
    .time_limit(Period),
    .trig(Ttick)
);
address_counter #(.N(4),.MAX(15)) Address_D (
    .clk(clk),
    .rstn(rstn),
    .clear(clear),
    .enable(Periodreg_inc),
    .address(Period_address)
);

Modulation_FSM_cart control_unit (
    .clk(clk),
    .rstn(rstn),
    .mem_adderss_ovf(mem_adderss_ovf),
    .frame_ready(frame_ready),
    .Ttick(Ttick),
    .latch(latch),
    .Timer_en(Timer_en),
    .busy(busy),
    .clear(clear),
    .Ram_inc(Ram_inc),
    .Sample_inc(Sample_inc),
    .Periodreg_inc(Periodreg_inc)
);

endmodule
