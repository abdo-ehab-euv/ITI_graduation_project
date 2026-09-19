module address_counter #(
    parameter N = 10,
    parameter MAX = 5
) (
    input  wire clk,
    input  wire rstn,clear,
    input  wire enable,
    output reg  [N-1 : 0] address
);
    always @(posedge clk or negedge rstn) begin
        if (!rstn||clear) begin
            address <= {N{1'b0}};
        end else if (enable) begin

            if (address >= MAX) begin
                address <= {N{1'b0}};
            end else begin
                address <= address + 1;
            end
        end
    end
endmodule
