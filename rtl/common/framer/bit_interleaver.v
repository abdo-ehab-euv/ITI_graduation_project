


module bit_interleaver (
    input  wire        clk,
    input  wire        reset,
    input  wire        clear,
    input  wire        hold_en,
    input  wire        rate,
    input  wire [31:0] cw_i,
    input  wire [31:0] cw_q,
    input  wire [3:0]  nib_idx,
    output wire [3:0]  nib_i,
    output wire [3:0]  nib_q
);
    reg  [31:0] hold_i;
    reg  [31:0] hold_q;

    always @(posedge clk) begin
        if (reset || clear) begin
            hold_i <= 32'd0;
            hold_q <= 32'd0;
        end else if (hold_en) begin
            hold_i <= cw_i;
            hold_q <= cw_q;
        end
    end

    wire [63:0] blk_i = {cw_i, hold_i};
    wire [63:0] blk_q = {cw_q, hold_q};
    wire [63:0] il_i;
    wire [63:0] il_q;

    genvar g;
    generate
        for (g = 0; g < 16; g = g + 1) begin : G_PERM
            localparam integer SRC = (g % 2) ? (g ^ 12) : g;
            assign il_i[4*g+3:4*g] = blk_i[4*SRC+3:4*SRC];
            assign il_q[4*g+3:4*g] = blk_q[4*SRC+3:4*SRC];
        end
    endgenerate

    wire [63:0] sel_i = il_i >> {nib_idx, 2'b00};
    wire [63:0] sel_q = il_q >> {nib_idx, 2'b00};

    assign nib_i = rate ? sel_i[3:0] : cw_i[3:0];
    assign nib_q = rate ? sel_q[3:0] : cw_q[3:0];
endmodule
