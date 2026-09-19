module bit_RAM #(
    parameter Depth = 4
) (
    input  wire                     clk,
    input  wire                     rstn,
    input  wire                     we,
    input  wire [($clog2(Depth)-1):0] r_address,
    input  wire [(Depth-1):0]       data_in,
    output wire                     data_out
);
    reg [(Depth-1):0] mem;

    assign data_out = mem[r_address];

    always @(posedge clk or negedge rstn) begin
        if (!rstn)
            mem <= {Depth{1'b0}};
        else if (we)
            mem <= data_in;
    end
endmodule
