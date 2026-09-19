


module ppdu_mux (
    input  wire [3:0] shr_nib,
    input  wire [3:0] data_nib_i,
    input  wire [3:0] data_nib_q,
    input  wire       sel_shr,
    output wire [3:0] out_i,
    output wire [3:0] out_q
);
    assign out_i = sel_shr ? shr_nib : data_nib_i;
    assign out_q = sel_shr ? shr_nib : data_nib_q;
endmodule
