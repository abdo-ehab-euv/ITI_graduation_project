module complex_exp_LUT #(
    parameter N = 10,
    parameter M = 6
) (
    input wire clk,
    input wire rstn,
    input wire pause,
    input wire [(N-1) : 0] theta,
    output reg [(M-1) : 0] sin,
    output reg [(M-1) : 0] cos
);

    reg [(2*M-1) : 0] mem [0 : (1<<(N-2))-1];
    initial begin
        $readmemh("sincosLUT.mem", mem);
    end

    wire [(M-1) : 0] sinx, cosx;
    wire [(M-1) : 0] sinq, cosq;

    wire [(N-3) : 0] lut_addr;
    wire ssin, scos;


    assign lut_addr = theta[N-2] ? ~theta[(N-3):0] : theta[(N-3):0];

    assign {sinx, cosx} = mem[lut_addr];


    assign ssin = theta[N-1];
    assign scos = theta[N-1] ^ theta[N-2];


    twos_comp_gen #(M) sign_gen1 (
        .X(sinx),
        .sign(ssin),
        .OUT(sinq)
    );

    twos_comp_gen #(M) sign_gen2 (
        .X(cosx),
        .sign(scos),
        .OUT(cosq)
    );


    always @(posedge clk or negedge rstn) begin
        if (!rstn || pause) begin
            sin <= {M{1'b0}};
            cos <= {M{1'b0}};
        end else begin
            sin <= sinq;
            cos <= cosq;
        end
    end

endmodule
