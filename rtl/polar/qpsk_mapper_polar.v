module dqpsk_mapper_polar #(
    parameter N = 10
) (
    input  wire I,
    input  wire Q,
    output reg signed [(N-1) : 0] PHI
);
    always @(*) begin

        case ({I,Q})
            2'b00: PHI = 'b0;
            2'b01: PHI =  (1 << (N-2));
            2'b11: PHI =  (1 << (N-1));
            2'b10: PHI = -(1 << (N-2));
            default: PHI = 'b0;
        endcase
    end
endmodule
