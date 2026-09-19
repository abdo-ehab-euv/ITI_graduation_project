


module iq_demux (
    input  wire [11:0] bits_in,
    output wire [5:0]  i_bits,
    output wire [5:0]  q_bits
);
    genvar k;
    generate
        for (k = 0; k < 6; k = k + 1) begin : G_DEMUX
            assign i_bits[k] = bits_in[2*k];
            assign q_bits[k] = bits_in[2*k+1];
        end
    endgenerate
endmodule
