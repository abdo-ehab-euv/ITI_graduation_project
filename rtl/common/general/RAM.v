module bit_RAM #(
    parameter Depth = 5
) (
    input clk, rstn, we,
    input wire [($clog2(Depth)-1):0] r_address,
    input wire [(Depth-1):0]data_in,
    output data_out
);
    reg [Depth-1 : 0] mem;
    assign data_out = mem[r_address];

    always @(posedge clk or negedge rstn) begin
        if(~rstn) mem <= 'b0;
        else
          if (we) mem[Depth-1 : 0]<= data_in;
    end

endmodule
