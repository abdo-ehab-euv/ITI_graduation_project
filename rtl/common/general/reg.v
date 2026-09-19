module dreg #(
    parameter N = 8
) (
    input clk, rstn,
    input wire [N-1 : 0] data_in,
    output reg [N-1 : 0] dataout
);
    always @(posedge clk or negedge rstn) begin
        if(!rstn)   dataout <= {N{1'b0}};
        else        dataout <= data_in;
    end
endmodule
