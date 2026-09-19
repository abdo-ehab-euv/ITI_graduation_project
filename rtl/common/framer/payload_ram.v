


module payload_ram (
    input  wire       clk,
    input  wire       we,
    input  wire [6:0] waddr,
    input  wire [7:0] wdata,
    input  wire [6:0] raddr,
    output reg  [7:0] rdata
);
    reg [7:0] mem [0:127];

    always @(posedge clk) begin
        if (we)
            mem[waddr] <= wdata;
        rdata <= mem[raddr];
    end
endmodule
