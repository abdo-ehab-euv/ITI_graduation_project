module bit_accumulator (
    input  wire        clk,
    input  wire        reset,
    input  wire        clear,
    input  wire        preload,
    input  wire        load,
    input  wire        byte_vld,
    input  wire        consume,
    input  wire        rate,
    input  wire [6:0]  phr_len,
    input  wire [7:0]  byte_in,
    output wire [11:0] window
);
    reg  [23:0] acc;
    wire [7:0]  lane_byte = byte_vld ? byte_in : 8'd0;

    assign window = acc[11:0];

    always @(posedge clk) begin
        if (reset || clear) begin
            acc <= 24'd0;
        end else if (preload) begin
            acc <= {17'd0, phr_len};
        end else if (load) begin
            acc <= {lane_byte, acc[23:8]};
        end else if (consume) begin
            acc <= rate ? (acc >> 12) : (acc >> 6);
        end
    end
endmodule
