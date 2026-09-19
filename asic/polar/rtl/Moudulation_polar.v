module Modulation_system #(parameter N = 10) (
    input  clk,rstn,
    input  frame_ready,
    input  [3:0] I_data_in,Q_data_in,
    output [5:0] DAC_RE , DAC_IM,
    output busy
);

wire [2 : 0] mem_Address;
wire [1 : 0] Ram_Address;
wire [4 : 0] chirps_address;
wire [3 : 0] Period_address;
wire [6:0] Period;
wire I, Q,latch,clear,Ttick,mem_adderss_ovf;
wire [(N-1) : 0] PHI, DQPSK, feedback_data;
wire Ram_inc, D_Ram_inc, chirpreg_inc, Periodreg_inc, Timer_en,pause;

assign Ram_Address = mem_Address[1:0];
assign mem_adderss_ovf = mem_Address[2];

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

assign DQPSK = feedback_data + PHI;
dqpsk_mapper_polar #(.N(N)) dqpsk_mapper (
    .I(I),
    .Q(Q),
    .PHI(PHI)
);
feedback_memory_polar #(.N(N)) feedback_memory (
    .clk(clk),
    .rstn(rstn),
    .clear(clear),
    .we(latch),
    .datain(DQPSK),
    .address(Ram_Address),
    .dataout(feedback_data)
);

CSK_GEN #(.N(N),.M(6)) CSK_GEN(
    .clk(clk),
    .rstn(rstn),
    .pause(pause),
    .latch(latch),
    .DQPSK(DQPSK),
    .chirps_address(chirps_address),
    .DAC_RE(DAC_RE),
    .DAC_IM(DAC_IM)
);
address_counter #(.N(5),.MAX(31)) Address_C (
    .clk(clk),
    .rstn(rstn),
    .clear(clear),
    .enable(latch),
    .address(chirps_address)
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


Modulation_FSM control_unit (
    .clk(clk),
    .rstn(rstn),
    .mem_adderss_ovf(mem_adderss_ovf),
    .frame_ready(frame_ready),
    .pause(pause),
    .Ttick(Ttick),
    .latch(latch),
    .Timer_en(Timer_en),
    .busy(busy),
    .clear(clear),
    .Ram_inc(Ram_inc),
    .Periodreg_inc(Periodreg_inc)
);

endmodule
