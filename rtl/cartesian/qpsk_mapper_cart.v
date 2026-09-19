module dqpsk_mapper_cartesian #(
    parameter N = 2
) (
    input  wire I,
    input  wire Q,
    output reg signed [(N-1):0] QPSK_RE,
    output reg signed [(N-1):0] QPSK_IM
);

always @(*) begin
    QPSK_RE = {N{1'b0}};
    QPSK_IM = {N{1'b0}};
    case ({I,Q})
        2'b00: QPSK_RE = {N{1'b1}};
        2'b01: QPSK_IM = {{(N-1){1'b0}},1'b1};
        2'b10: QPSK_IM = {N{1'b1}};
        2'b11: QPSK_RE = {{(N-1){1'b0}},1'b1};
        default: begin
            QPSK_RE = {N{1'b0}};
            QPSK_IM = {N{1'b0}};
        end
    endcase
end

endmodule
