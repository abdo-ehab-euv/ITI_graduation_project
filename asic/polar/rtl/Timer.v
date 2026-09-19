module timer #(
    parameter N = 6
) (
    input  wire clk,
    input  wire rstn,
    input  wire enable,
    input  wire [(N-1) : 0] time_limit,
    output reg  trig
);
    reg [(N-1) : 0] count;

    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            count <= {N{1'b0}};
            trig  <= 1'b0;
        end
        else if (enable) begin
            if (count+1 >= time_limit) begin
                count <= {N{1'b0}};
                trig  <= 1'b1;
            end
            else begin
                count <= count + 1;
                trig  <= 1'b0;
            end
        end
        else begin
            count <= {N{1'b0}};
            trig <= 1'b0;
        end
    end

endmodule
