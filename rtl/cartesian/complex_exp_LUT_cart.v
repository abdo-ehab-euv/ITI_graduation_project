module complex_exp_LUT_cart (
    input [11:0] sample_address,
    output [4:0] chirp_re,chirp_im
);
    reg [4 : 0] mem_re [0 : 1535];
    reg [4 : 0] mem_im [0 : 1535];
initial begin
    $readmemb("chirpSequence_re.mem", mem_re);
    $readmemb("chirpSequence_im.mem", mem_im);
end
    assign chirp_re = mem_re[sample_address];
    assign chirp_im = mem_im[sample_address];

endmodule
