module Modulation_FSM (
    input clk,rstn,Ttick,
    input frame_ready,
    input mem_adderss_ovf,
    output reg Ram_inc,Periodreg_inc,latch,
    output wire pause,Timer_en,busy,clear
);

reg [1:0] state_reg, state_next;
localparam idle = 2'b00, Sample = 2'b01, Wait = 2'b10;

always @(posedge clk or negedge rstn) begin
	if(~rstn) state_reg<=idle;
	else state_reg<=state_next;
end

always @(*) begin
    state_next = state_reg;
    latch         = 'b0;
    Ram_inc       = 'b0;
    Periodreg_inc = 'b0;

	case (state_reg)
		idle: begin
            if(frame_ready) begin
                state_next = Sample;
                latch        = 'b1;
                Ram_inc      = 'b1;
                end
        end

        Sample: begin
            if(Ttick) begin
                Ram_inc        = 'b1;
                if(mem_adderss_ovf) begin
                Periodreg_inc  = 'b1;
                state_next = Wait;
                end
                else latch = 'b1;
            end
        end

        Wait: begin
            if(Ttick) begin
                if(!frame_ready) state_next = idle;
                else begin state_next = Sample;
                    latch         = 'b1;
                    Ram_inc       = 'b1;
                    Periodreg_inc = 'b1;
                end
            end
        end


        default: state_next = idle;
    endcase
end

assign pause = (state_reg != Sample);
assign Timer_en  = (state_reg != idle);
assign clear     = (state_reg == idle) && !frame_ready;
assign busy      = (state_reg == Sample);

endmodule
