module feedback_memory_polar #(
    parameter N = 10
) (
    input clk,rstn,clear,we,
    input [(N-1) : 0] datain,
    input [1 : 0] address,
    output [(N-1) : 0] dataout
);
    reg [(N-1) : 0] mem [0 : 3];
    integer i;
    assign dataout = mem[address];

    always @(posedge clk or negedge rstn) begin
        if (!rstn || clear) begin
            for (i = 0;i<=3 ;i=i+1 ) begin
                mem[i] <= (1 << (N-3));
            end
        end
        else if(we) mem[address] <= datain;
    end
endmodule
