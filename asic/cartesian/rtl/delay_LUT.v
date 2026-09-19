module delay_LUT (
    input  wire [3:0] lut_addr,
    output reg  [6:0] delay
);

    always @(*) begin
        case (lut_addr)
            4'd0: delay = 7'b0100110;
            4'd1: delay = 7'b0001010;
            4'd2: delay = 7'b0100110;
            4'd3: delay = 7'b1000110;
            4'd4: delay = 7'b0100110;
            4'd5: delay = 7'b0010100;
            4'd6: delay = 7'b0100110;
            4'd7: delay = 7'b0111100;
            4'd8: delay = 7'b0100110;
            4'd9: delay = 7'b0011110;
            4'd10: delay = 7'b0100110;
            4'd11: delay = 7'b0110010;
            4'd12: delay = 7'b0100110;
            4'd13: delay = 7'b0101000;
            4'd14: delay = 7'b0100110;
            4'd15: delay = 7'b0101000;
            default: delay = 7'd0;
        endcase
    end
endmodule
