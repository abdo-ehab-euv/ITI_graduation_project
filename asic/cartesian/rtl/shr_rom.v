


module shr_rom (
    input  wire       rate,
    input  wire [4:0] idx,
    output reg  [3:0] nib,
    output wire [4:0] last_idx
);
    assign last_idx = rate ? 5'd23 : 5'd11;

    always @* begin
        if (rate) begin
            case (idx)
                5'd20:   nib = 4'b1110;
                5'd21:   nib = 4'b0101;
                5'd22:   nib = 4'b0100;
                5'd23:   nib = 4'b1100;
                default: nib = (idx < 5'd20) ? 4'b1111 : 4'b0000;
            endcase
        end else begin
            case (idx)
                5'd8:    nib = 4'b1110;
                5'd9:    nib = 4'b0010;
                5'd10:   nib = 4'b1001;
                5'd11:   nib = 4'b0011;
                default: nib = (idx < 5'd8) ? 4'b1111 : 4'b0000;
            endcase
        end
    end
endmodule
