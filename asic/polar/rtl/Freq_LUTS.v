module Freq_LUT (
    input  wire [4:0] lut_addr,
    output reg        fc_sign,
    output reg        dfdt_sign
);
    reg [1:0] lut_word;

    always @(*) begin
        case (lut_addr)
            5'd0: lut_word = 2'b10;
            5'd1: lut_word = 2'b00;
            5'd2: lut_word = 2'b01;
            5'd3: lut_word = 2'b11;
            5'd4: lut_word = 2'b10;
            5'd5: lut_word = 2'b00;
            5'd6: lut_word = 2'b01;
            5'd7: lut_word = 2'b11;
            5'd8: lut_word = 2'b00;
            5'd9: lut_word = 2'b11;
            5'd10: lut_word = 2'b10;
            5'd11: lut_word = 2'b01;
            5'd12: lut_word = 2'b00;
            5'd13: lut_word = 2'b11;
            5'd14: lut_word = 2'b10;
            5'd15: lut_word = 2'b01;
            5'd16: lut_word = 2'b11;
            5'd17: lut_word = 2'b01;
            5'd18: lut_word = 2'b00;
            5'd19: lut_word = 2'b10;
            5'd20: lut_word = 2'b11;
            5'd21: lut_word = 2'b01;
            5'd22: lut_word = 2'b00;
            5'd23: lut_word = 2'b10;
            5'd24: lut_word = 2'b01;
            5'd25: lut_word = 2'b10;
            5'd26: lut_word = 2'b11;
            5'd27: lut_word = 2'b00;
            5'd28: lut_word = 2'b01;
            5'd29: lut_word = 2'b10;
            5'd30: lut_word = 2'b11;
            5'd31: lut_word = 2'b00;
            default: lut_word = 2'b00;
        endcase
    end
    always @(*) begin
        fc_sign   = lut_word[1];
        dfdt_sign = lut_word[0];
    end
endmodule
