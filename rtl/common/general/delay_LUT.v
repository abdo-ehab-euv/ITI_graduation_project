module delay_LUT (
    input [3:0] lut_addr,
    output [6:0] delay
);
    reg [6 : 0] mem [0 : 15];
initial begin
    $readmemb("dalay_LUT.mem", mem);
end

    assign delay = mem[lut_addr];

endmodule
