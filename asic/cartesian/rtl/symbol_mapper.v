


module symbol_mapper (
    input  wire        rate,
    input  wire [5:0]  bits_in,
    output reg  [31:0] codeword
);
    reg [5:0] idx;
    reg [4:0] jv;
    integer   j;

    always @* begin
        codeword = 32'd0;
        if (rate) begin
            idx = {bits_in[0], bits_in[1], bits_in[2],
                   bits_in[3], bits_in[4], bits_in[5]};
            for (j = 0; j < 32; j = j + 1) begin
                jv          = j;
                codeword[j] = ~(^(idx[4:0] & jv)) ^ idx[5];
            end
        end else begin
            idx = {3'd0, bits_in[0], bits_in[1], bits_in[2]};
            for (j = 0; j < 4; j = j + 1) begin
                jv          = j;
                codeword[j] = ~(^(idx[1:0] & jv[1:0])) ^ idx[2];
            end
        end
    end
endmodule
