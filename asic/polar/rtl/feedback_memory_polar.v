module feedback_memory_polar #(
    parameter N = 10
) (
    input  wire           clk,
    input  wire           rstn,
    input  wire           clear,
    input  wire           we,
    input  wire [N-1:0]   datain,
    input  wire [1:0]     address,
    output wire [N-1:0]   dataout
);
    reg [N-1:0] mem [0:3];
    integer i;

    assign dataout = mem[address];


    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            for (i = 0; i < 4; i = i + 1)
                mem[i] <= (1 << (N-3));
        end else if (clear) begin
            for (i = 0; i < 4; i = i + 1)
                mem[i] <= (1 << (N-3));
        end else if (we) begin
            mem[address] <= datain;
        end
    end
endmodule
