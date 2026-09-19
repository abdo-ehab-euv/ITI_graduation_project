module address_counter #(
    parameter N   = 10,
    parameter MAX = 5
) (
    input  wire           clk,
    input  wire           rstn,
    input  wire           clear,
    input  wire           enable,
    output reg  [N-1:0]   address
);


    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            address <= {N{1'b0}};
        end else if (clear) begin
            address <= {N{1'b0}};
        end else if (enable) begin
            if (address >= MAX)
                address <= {N{1'b0}};
            else
                address <= address + {{(N-1){1'b0}}, 1'b1};
        end
    end
endmodule
