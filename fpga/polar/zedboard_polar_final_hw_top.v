`timescale 1ns / 1ps

module zedboard_polar_final_hw_top (
    input  wire       gclk_i,
    input  wire       reset_btn_i,
    input  wire       start_btn_i,
    input  wire       rate_i,
    output wire [7:0] led_o,
    output wire [5:0] tx_real_o,
    output wire [5:0] tx_imag_o
);

wire core_clk_mmcm_w;
wire core_clk_w;
wire clkfb_mmcm_w;
wire clkfb_w;
wire mmcm_locked_w;
wire rst_async_w;
wire rstn_core_w;
wire start_tx_w;
wire payload_we_w;
wire [6:0] payload_addr_w;
wire [7:0] payload_din_w;
wire system_busy_w;
wire len_err_w;
wire [9:0] final_ppdu_nibbles_w;

(* MARK_DEBUG = "TRUE", KEEP = "TRUE" *) wire [5:0] dac_real_polar_w;
(* MARK_DEBUG = "TRUE", KEEP = "TRUE" *) wire [5:0] dac_imag_polar_w;
(* MARK_DEBUG = "TRUE", KEEP = "TRUE" *) wire system_busy_debug_w;
(* MARK_DEBUG = "TRUE", KEEP = "TRUE" *) wire start_tx_debug_w;
(* MARK_DEBUG = "TRUE", KEEP = "TRUE" *) wire len_err_debug_w;
(* MARK_DEBUG = "TRUE", KEEP = "TRUE" *) wire [9:0] final_ppdu_nibbles_debug_w;

(* ASYNC_REG = "TRUE" *) reg [1:0] rst_sync_r;
(* ASYNC_REG = "TRUE" *) reg [1:0] start_sync_r;
(* ASYNC_REG = "TRUE" *) reg [1:0] rate_sync_r;

reg start_prev_r;
reg [1:0] payload_index_r;
(* MARK_DEBUG = "TRUE", KEEP = "TRUE" *) reg payload_loaded_r;
reg [23:0] heartbeat_r;
reg system_busy_prev_r;
reg packet_toggle_r;
reg tx_activity_seen_r;

assign rst_async_w = reset_btn_i | ~mmcm_locked_w;
assign rstn_core_w = rst_sync_r[1];

assign payload_we_w = ~payload_loaded_r;
assign payload_addr_w = {5'd0, payload_index_r};
assign payload_din_w = (payload_index_r == 2'd0) ? 8'hDE :
                       (payload_index_r == 2'd1) ? 8'hAD :
                       (payload_index_r == 2'd2) ? 8'hBE : 8'hEF;

assign start_tx_w = start_sync_r[1] & ~start_prev_r & payload_loaded_r & ~system_busy_w;

assign tx_real_o = dac_real_polar_w;
assign tx_imag_o = dac_imag_polar_w;

assign system_busy_debug_w = system_busy_w;
assign start_tx_debug_w = start_tx_w;
assign len_err_debug_w = len_err_w;
assign final_ppdu_nibbles_debug_w = final_ppdu_nibbles_w;

assign led_o[0] = mmcm_locked_w;
assign led_o[1] = payload_loaded_r;
assign led_o[2] = system_busy_w;
assign led_o[3] = len_err_w;
assign led_o[4] = rate_sync_r[1];
assign led_o[5] = tx_activity_seen_r;
assign led_o[6] = packet_toggle_r;
assign led_o[7] = heartbeat_r[23];

always @(posedge core_clk_w or posedge rst_async_w) begin
    if (rst_async_w)
        rst_sync_r <= 2'b00;
    else
        rst_sync_r <= {rst_sync_r[0], 1'b1};
end

always @(posedge core_clk_w or negedge rstn_core_w) begin
    if (!rstn_core_w) begin
        start_sync_r <= 2'b00;
        rate_sync_r <= 2'b00;
        start_prev_r <= 1'b0;
    end else begin
        start_sync_r <= {start_sync_r[0], start_btn_i};
        rate_sync_r <= {rate_sync_r[0], rate_i};
        start_prev_r <= start_sync_r[1];
    end
end

always @(posedge core_clk_w or negedge rstn_core_w) begin
    if (!rstn_core_w) begin
        payload_index_r <= 2'd0;
        payload_loaded_r <= 1'b0;
    end else if (!payload_loaded_r) begin
        if (payload_index_r == 2'd3)
            payload_loaded_r <= 1'b1;
        else
            payload_index_r <= payload_index_r + 2'd1;
    end
end

always @(posedge core_clk_w or negedge rstn_core_w) begin
    if (!rstn_core_w) begin
        heartbeat_r <= 24'd0;
        system_busy_prev_r <= 1'b0;
        packet_toggle_r <= 1'b0;
        tx_activity_seen_r <= 1'b0;
    end else begin
        heartbeat_r <= heartbeat_r + 24'd1;
        system_busy_prev_r <= system_busy_w;

        if (system_busy_prev_r && !system_busy_w)
            packet_toggle_r <= ~packet_toggle_r;

        if (start_tx_w)
            tx_activity_seen_r <= 1'b0;
        else if (system_busy_w && ((dac_real_polar_w != 6'd0) || (dac_imag_polar_w != 6'd0)))
            tx_activity_seen_r <= 1'b1;
    end
end

MMCME2_BASE #(
    .BANDWIDTH("OPTIMIZED"),
    .CLKFBOUT_MULT_F(8.000),
    .CLKIN1_PERIOD(10.000),
    .CLKOUT0_DIVIDE_F(25.000),
    .DIVCLK_DIVIDE(1),
    .STARTUP_WAIT("FALSE")
) u_mmcm (
    .CLKFBOUT(clkfb_mmcm_w),
    .CLKFBOUTB(),
    .CLKOUT0(core_clk_mmcm_w),
    .CLKOUT0B(),
    .CLKOUT1(),
    .CLKOUT1B(),
    .CLKOUT2(),
    .CLKOUT2B(),
    .CLKOUT3(),
    .CLKOUT3B(),
    .CLKOUT4(),
    .CLKOUT5(),
    .CLKOUT6(),
    .LOCKED(mmcm_locked_w),
    .CLKFBIN(clkfb_w),
    .CLKIN1(gclk_i),
    .PWRDWN(1'b0),
    .RST(reset_btn_i)
);

BUFG u_mmcm_fb_buf (
    .I(clkfb_mmcm_w),
    .O(clkfb_w)
);

BUFG u_core_clk_buf (
    .I(core_clk_mmcm_w),
    .O(core_clk_w)
);

CSS_Transmitter_Top u_css_tx (
    .clk(core_clk_w),
    .rstn(rstn_core_w),
    .start_Tx(start_tx_w),
    .rate(rate_sync_r[1]),
    .payloadLength(8'd4),
    .payload_we(payload_we_w),
    .payload_addr(payload_addr_w),
    .payload_din(payload_din_w),
    .DAC_RE_polar(dac_real_polar_w),
    .DAC_IM_polar(dac_imag_polar_w),
    .system_busy(system_busy_w),
    .len_err(len_err_w),
    .final_ppdu_nibbles(final_ppdu_nibbles_w)
);

endmodule
