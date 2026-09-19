


module payload_ram_bank8x8 (
    input  wire       clk,
    input  wire       we,
    input  wire [2:0] waddr,
    input  wire [7:0] wdata,
    input  wire [2:0] raddr,
    output wire [7:0] rdata
);
    reg [7:0] mem [0:7];


    assign rdata = mem[raddr];

    always @(posedge clk) begin
        if (we)
            mem[waddr] <= wdata;
    end
endmodule

module payload_ram (
    input  wire       clk,
    input  wire       reset,
    input  wire       we,
    input  wire [6:0] waddr,
    input  wire [7:0] wdata,
    input  wire [6:0] raddr,
    output reg  [7:0] rdata
);


    reg       we_q;
    reg [6:0] waddr_q;
    reg [7:0] wdata_q;

    wire [15:0] bank_we;
    wire [7:0] bank_rdata0;
    wire [7:0] bank_rdata1;
    wire [7:0] bank_rdata2;
    wire [7:0] bank_rdata3;
    wire [7:0] bank_rdata4;
    wire [7:0] bank_rdata5;
    wire [7:0] bank_rdata6;
    wire [7:0] bank_rdata7;
    wire [7:0] bank_rdata8;
    wire [7:0] bank_rdata9;
    wire [7:0] bank_rdata10;
    wire [7:0] bank_rdata11;
    wire [7:0] bank_rdata12;
    wire [7:0] bank_rdata13;
    wire [7:0] bank_rdata14;
    wire [7:0] bank_rdata15;

    assign bank_we[0]  = we_q && (waddr_q[6:3] == 4'd0);
    assign bank_we[1]  = we_q && (waddr_q[6:3] == 4'd1);
    assign bank_we[2]  = we_q && (waddr_q[6:3] == 4'd2);
    assign bank_we[3]  = we_q && (waddr_q[6:3] == 4'd3);
    assign bank_we[4]  = we_q && (waddr_q[6:3] == 4'd4);
    assign bank_we[5]  = we_q && (waddr_q[6:3] == 4'd5);
    assign bank_we[6]  = we_q && (waddr_q[6:3] == 4'd6);
    assign bank_we[7]  = we_q && (waddr_q[6:3] == 4'd7);
    assign bank_we[8]  = we_q && (waddr_q[6:3] == 4'd8);
    assign bank_we[9]  = we_q && (waddr_q[6:3] == 4'd9);
    assign bank_we[10] = we_q && (waddr_q[6:3] == 4'd10);
    assign bank_we[11] = we_q && (waddr_q[6:3] == 4'd11);
    assign bank_we[12] = we_q && (waddr_q[6:3] == 4'd12);
    assign bank_we[13] = we_q && (waddr_q[6:3] == 4'd13);
    assign bank_we[14] = we_q && (waddr_q[6:3] == 4'd14);
    assign bank_we[15] = we_q && (waddr_q[6:3] == 4'd15);

    always @(posedge clk) begin
        if (reset) begin
            we_q    <= 1'b0;
            waddr_q <= 7'd0;
            wdata_q <= 8'd0;
            rdata   <= 8'd0;
        end else begin
            we_q <= we;
            if (we) begin
                waddr_q <= waddr;
                wdata_q <= wdata;
            end


            case (raddr[6:3])
                4'd0:  rdata <= bank_rdata0;
                4'd1:  rdata <= bank_rdata1;
                4'd2:  rdata <= bank_rdata2;
                4'd3:  rdata <= bank_rdata3;
                4'd4:  rdata <= bank_rdata4;
                4'd5:  rdata <= bank_rdata5;
                4'd6:  rdata <= bank_rdata6;
                4'd7:  rdata <= bank_rdata7;
                4'd8:  rdata <= bank_rdata8;
                4'd9:  rdata <= bank_rdata9;
                4'd10: rdata <= bank_rdata10;
                4'd11: rdata <= bank_rdata11;
                4'd12: rdata <= bank_rdata12;
                4'd13: rdata <= bank_rdata13;
                4'd14: rdata <= bank_rdata14;
                4'd15: rdata <= bank_rdata15;
                default: rdata <= 8'd0;
            endcase
        end
    end

    payload_ram_bank8x8 b00 (.clk(clk), .we(bank_we[0]),  .waddr(waddr_q[2:0]), .wdata(wdata_q), .raddr(raddr[2:0]), .rdata(bank_rdata0));
    payload_ram_bank8x8 b01 (.clk(clk), .we(bank_we[1]),  .waddr(waddr_q[2:0]), .wdata(wdata_q), .raddr(raddr[2:0]), .rdata(bank_rdata1));
    payload_ram_bank8x8 b02 (.clk(clk), .we(bank_we[2]),  .waddr(waddr_q[2:0]), .wdata(wdata_q), .raddr(raddr[2:0]), .rdata(bank_rdata2));
    payload_ram_bank8x8 b03 (.clk(clk), .we(bank_we[3]),  .waddr(waddr_q[2:0]), .wdata(wdata_q), .raddr(raddr[2:0]), .rdata(bank_rdata3));
    payload_ram_bank8x8 b04 (.clk(clk), .we(bank_we[4]),  .waddr(waddr_q[2:0]), .wdata(wdata_q), .raddr(raddr[2:0]), .rdata(bank_rdata4));
    payload_ram_bank8x8 b05 (.clk(clk), .we(bank_we[5]),  .waddr(waddr_q[2:0]), .wdata(wdata_q), .raddr(raddr[2:0]), .rdata(bank_rdata5));
    payload_ram_bank8x8 b06 (.clk(clk), .we(bank_we[6]),  .waddr(waddr_q[2:0]), .wdata(wdata_q), .raddr(raddr[2:0]), .rdata(bank_rdata6));
    payload_ram_bank8x8 b07 (.clk(clk), .we(bank_we[7]),  .waddr(waddr_q[2:0]), .wdata(wdata_q), .raddr(raddr[2:0]), .rdata(bank_rdata7));
    payload_ram_bank8x8 b08 (.clk(clk), .we(bank_we[8]),  .waddr(waddr_q[2:0]), .wdata(wdata_q), .raddr(raddr[2:0]), .rdata(bank_rdata8));
    payload_ram_bank8x8 b09 (.clk(clk), .we(bank_we[9]),  .waddr(waddr_q[2:0]), .wdata(wdata_q), .raddr(raddr[2:0]), .rdata(bank_rdata9));
    payload_ram_bank8x8 b10 (.clk(clk), .we(bank_we[10]), .waddr(waddr_q[2:0]), .wdata(wdata_q), .raddr(raddr[2:0]), .rdata(bank_rdata10));
    payload_ram_bank8x8 b11 (.clk(clk), .we(bank_we[11]), .waddr(waddr_q[2:0]), .wdata(wdata_q), .raddr(raddr[2:0]), .rdata(bank_rdata11));
    payload_ram_bank8x8 b12 (.clk(clk), .we(bank_we[12]), .waddr(waddr_q[2:0]), .wdata(wdata_q), .raddr(raddr[2:0]), .rdata(bank_rdata12));
    payload_ram_bank8x8 b13 (.clk(clk), .we(bank_we[13]), .waddr(waddr_q[2:0]), .wdata(wdata_q), .raddr(raddr[2:0]), .rdata(bank_rdata13));
    payload_ram_bank8x8 b14 (.clk(clk), .we(bank_we[14]), .waddr(waddr_q[2:0]), .wdata(wdata_q), .raddr(raddr[2:0]), .rdata(bank_rdata14));
    payload_ram_bank8x8 b15 (.clk(clk), .we(bank_we[15]), .waddr(waddr_q[2:0]), .wdata(wdata_q), .raddr(raddr[2:0]), .rdata(bank_rdata15));

endmodule
