module Freq_LUT (
    input  [4:0] lut_addr,
    output fc_sign,dfdt_sign
);
    reg [1 : 0] mem [0 : 31];
    initial begin
        $readmemb("Freq_LUT.mem", mem);
    end

    assign {fc_sign,dfdt_sign} = mem[lut_addr];

endmodule
