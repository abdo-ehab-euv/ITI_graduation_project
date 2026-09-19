module integrator #(
    parameter N = 8
) (
    input  wire clk ,rstn,we,
    input  wire signed [(N-1):0] X0 , dxdt,
    output reg  signed [(N-1):0] OUT
);
    always @(posedge clk or negedge rstn) begin
        if(!rstn) OUT<= 'b0;
        else if (we) OUT<= X0;
        else OUT<= OUT+dxdt;
    end
endmodule
