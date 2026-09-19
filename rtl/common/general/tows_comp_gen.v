module twos_comp_gen #(parameter N = 8)(
    input [(N-1):0] X,
    input sign,
    output reg [(N-1):0] OUT
);

always @(*) begin
    if(!sign)   OUT = X;
    else OUT = -X;
end

endmodule
