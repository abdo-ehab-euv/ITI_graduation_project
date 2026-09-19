module feedback_memory_cartesian #(
    parameter N = 2
) (
    input  wire clk,
    input  wire rstn, clear,
    input  wire we,
    input  wire signed [(N-1):0] datain_re,
    input  wire signed [(N-1):0] datain_im,
    input  wire [1:0] address,
    output wire signed [(N-1):0] dataout_re,
    output wire signed [(N-1):0] dataout_im
);

reg signed [(N-1):0] mem_re [0:3];
reg signed [(N-1):0] mem_im [0:3];
integer i;


assign dataout_re = mem_re[address];
assign dataout_im = mem_im[address];

always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
        for (i = 0; i <= 3; i = i + 1) begin
            mem_re[i] <= {{ (N-1){1'b0} }, 1'b1};
            mem_im[i] <= {{ (N-1){1'b0} }, 1'b1};
        end
    end else if (clear) begin
        for (i = 0; i <= 3; i = i + 1) begin
            mem_re[i] <= {{ (N-1){1'b0} }, 1'b1};
            mem_im[i] <= {{ (N-1){1'b0} }, 1'b1};
        end
    end else if (we) begin

            mem_re[address] <= datain_re;
            mem_im[address] <= datain_im;

    end
end
endmodule
