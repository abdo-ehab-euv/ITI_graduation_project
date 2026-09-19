


module complex_multiplier_c #(
    parameter WIDTH_1 = 2, WIDTH_2 = 5, OUT_WIDTH = 6
) (
    input  wire signed [WIDTH_1-1:0] a_real, a_imag,
    input  wire signed [WIDTH_2-1:0] b_real, b_imag,
    output wire signed [OUT_WIDTH-1:0] y_real, y_imag
);


    wire signed [(WIDTH_1+WIDTH_2)-1:0] mult_ac, mult_bd, mult_ad, mult_bc;
    wire signed [(WIDTH_1+WIDTH_2):0] P_real, P_imag;

    assign y_real = P_real [OUT_WIDTH-1 :0];
    assign y_imag = P_imag [OUT_WIDTH-1 :0];

    assign mult_ac = a_real * b_real;
    assign mult_bd = a_imag * b_imag;
    assign mult_ad = a_real * b_imag;
    assign mult_bc = a_imag * b_real;
    assign P_real  = mult_ac - mult_bd;
    assign P_imag  = mult_ad + mult_bc;

endmodule
