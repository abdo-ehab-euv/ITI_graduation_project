


module ppdu_ctrl_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  HADDX1 U1_1_1 ( .A0(A[1]), .B0(A[0]), .C1(carry[2]), .SO(SUM[1]) );
  HADDX1 U1_1_2 ( .A0(A[2]), .B0(carry[2]), .C1(carry[3]), .SO(SUM[2]) );
  HADDX1 U1_1_3 ( .A0(A[3]), .B0(carry[3]), .C1(carry[4]), .SO(SUM[3]) );
  HADDX1 U1_1_4 ( .A0(A[4]), .B0(carry[4]), .C1(carry[5]), .SO(SUM[4]) );
  HADDX1 U1_1_5 ( .A0(A[5]), .B0(carry[5]), .C1(carry[6]), .SO(SUM[5]) );
  HADDX1 U1_1_6 ( .A0(A[6]), .B0(carry[6]), .C1(carry[7]), .SO(SUM[6]) );
  XOR2X1 U1 ( .IN1(carry[7]), .IN2(A[7]), .Q(SUM[7]) );
  INVX0 U2 ( .INP(A[0]), .ZN(SUM[0]) );
endmodule


module ppdu_ctrl_DW01_inc_2 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  HADDX1 U1_1_5 ( .A0(A[5]), .B0(carry[5]), .C1(carry[6]), .SO(SUM[5]) );
  HADDX1 U1_1_4 ( .A0(A[4]), .B0(carry[4]), .C1(carry[5]), .SO(SUM[4]) );
  HADDX1 U1_1_3 ( .A0(A[3]), .B0(carry[3]), .C1(carry[4]), .SO(SUM[3]) );
  HADDX1 U1_1_2 ( .A0(A[2]), .B0(carry[2]), .C1(carry[3]), .SO(SUM[2]) );
  HADDX1 U1_1_1 ( .A0(A[1]), .B0(A[0]), .C1(carry[2]), .SO(SUM[1]) );
  INVX0 U1 ( .INP(A[0]), .ZN(SUM[0]) );
  XOR2X1 U2 ( .IN1(carry[6]), .IN2(A[6]), .Q(SUM[6]) );
endmodule


module ppdu_ctrl_DW01_inc_3 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;

  wire   [9:2] carry;

  HADDX1 U1_1_8 ( .A0(A[8]), .B0(carry[8]), .C1(carry[9]), .SO(SUM[8]) );
  HADDX1 U1_1_7 ( .A0(A[7]), .B0(carry[7]), .C1(carry[8]), .SO(SUM[7]) );
  HADDX1 U1_1_6 ( .A0(A[6]), .B0(carry[6]), .C1(carry[7]), .SO(SUM[6]) );
  HADDX1 U1_1_5 ( .A0(A[5]), .B0(carry[5]), .C1(carry[6]), .SO(SUM[5]) );
  HADDX1 U1_1_4 ( .A0(A[4]), .B0(carry[4]), .C1(carry[5]), .SO(SUM[4]) );
  HADDX1 U1_1_3 ( .A0(A[3]), .B0(carry[3]), .C1(carry[4]), .SO(SUM[3]) );
  HADDX1 U1_1_2 ( .A0(A[2]), .B0(carry[2]), .C1(carry[3]), .SO(SUM[2]) );
  HADDX1 U1_1_1 ( .A0(A[1]), .B0(A[0]), .C1(carry[2]), .SO(SUM[1]) );
  XOR2X1 U1 ( .IN1(carry[9]), .IN2(A[9]), .Q(SUM[9]) );
  INVX0 U2 ( .INP(A[0]), .ZN(SUM[0]) );
endmodule


module ppdu_ctrl ( clk, reset, start_Tx, rate, payloadLength, shr_last,
        mod_busy, rate_q, len_q, ram_raddr, acc_clear, acc_preload, acc_load,
        acc_byte_vld, acc_consume, il_clear, il_hold_en, nib_idx, shr_idx,
        frame_ready, buf_sel_shr, ppdu_done, ppdu_nibbles, len_err, busy );
  input [7:0] payloadLength;
  input [4:0] shr_last;
  output [6:0] len_q;
  output [6:0] ram_raddr;
  output [3:0] nib_idx;
  output [4:0] shr_idx;
  output [9:0] ppdu_nibbles;
  input clk, reset, start_Tx, rate, mod_busy;
  output rate_q, acc_clear, acc_preload, acc_load, acc_byte_vld, acc_consume,
         il_clear, il_hold_en, frame_ready, buf_sel_shr, ppdu_done, len_err,
         busy;
  wire   n247, n248, start_prev, len_ok, phr_blk, half, N26, N28, busy_prev,
         N30, N31, N32, N33, N34, N35, N36, N37, win_0_, N66, N67, N68, N69,
         N70, N71, N72, N73, N78, N79, N80, N81, N82, N83, N84, N85, N86, N87,
         N88, N91, N92, N93, N94, N97, N98, N99, N100, N101, N102, N103, N104,
         n28, n32, n33, n39, n40, n41, n48, n49, n51, n52, n53, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157,
         n158, n159, n160, n161, n162, n163, n164, n165, n166, n167, n168,
         n169, n170, n171, n172, n173, n174, n175, n176, n177, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n29, n30, n31, n34, n35, n36, n37, n38,
         n42, n43, n44, n45, n46, n47, n50, n54, n55, n70, n96, n97, n178,
         n179, n180, n181, n182, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, n201,
         n202, n204, n205, n206, n207, n208, n209, n210, n211, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245;
  wire   [2:0] state;
  wire   [11:1] bits_left;
  wire   [11:0] left_next;
  wire   [7:0] byte_idx;
  wire   [9:0] wptr;
  wire   [1:0] load_cnt;
  wire   [4:2] add_229_carry;
  wire   [9:5] add_205_carry;
  wire   [11:2] sub_95_carry;

  DFFX1 busy_prev_reg ( .D(N30), .CLK(clk), .Q(busy_prev) );
  DFFX1 k_reg_0_ ( .D(n131), .CLK(clk), .Q(nib_idx[0]), .QN(n32) );
  DFFX1 k_reg_2_ ( .D(n129), .CLK(clk), .Q(nib_idx[2]), .QN(n188) );
  DFFX1 k_reg_3_ ( .D(n128), .CLK(clk), .Q(nib_idx[3]), .QN(n193) );
  DFFX1 bits_left_reg_0_ ( .D(n127), .CLK(clk), .Q(left_next[0]) );
  DFFX1 state_reg_1_ ( .D(n173), .CLK(clk), .Q(state[1]), .QN(n40) );
  DFFX1 start_prev_reg ( .D(n171), .CLK(clk), .Q(start_prev) );
  DFFX1 len_err_reg ( .D(n170), .CLK(clk), .Q(len_err) );
  DFFX1 half_reg ( .D(n172), .CLK(clk), .Q(half), .QN(n202) );
  DFFX1 k_reg_1_ ( .D(n130), .CLK(clk), .Q(nib_idx[1]), .QN(n201) );
  DFFX1 bits_left_reg_10_ ( .D(n117), .CLK(clk), .Q(bits_left[10]) );
  DFFX1 bits_left_reg_9_ ( .D(n118), .CLK(clk), .Q(bits_left[9]) );
  DFFX1 bits_left_reg_8_ ( .D(n119), .CLK(clk), .Q(bits_left[8]) );
  DFFX1 bits_left_reg_7_ ( .D(n120), .CLK(clk), .Q(bits_left[7]) );
  DFFX1 bits_left_reg_6_ ( .D(n121), .CLK(clk), .Q(bits_left[6]) );
  DFFX1 bits_left_reg_5_ ( .D(n122), .CLK(clk), .Q(bits_left[5]) );
  DFFX1 bits_left_reg_4_ ( .D(n123), .CLK(clk), .Q(bits_left[4]) );
  DFFX1 bits_left_reg_3_ ( .D(n124), .CLK(clk), .Q(bits_left[3]) );
  DFFX1 bits_left_reg_2_ ( .D(n125), .CLK(clk), .Q(bits_left[2]) );
  DFFX1 bits_left_reg_1_ ( .D(n126), .CLK(clk), .Q(bits_left[1]) );
  DFFX1 wptr_reg_0_ ( .D(n165), .CLK(clk), .Q(wptr[0]) );
  DFFX1 wptr_reg_1_ ( .D(n164), .CLK(clk), .Q(wptr[1]) );
  DFFX1 wptr_reg_2_ ( .D(n163), .CLK(clk), .Q(wptr[2]) );
  DFFX1 wptr_reg_3_ ( .D(n162), .CLK(clk), .Q(wptr[3]) );
  DFFX1 wptr_reg_4_ ( .D(n161), .CLK(clk), .Q(wptr[4]) );
  DFFX1 wptr_reg_5_ ( .D(n160), .CLK(clk), .Q(wptr[5]) );
  DFFX1 wptr_reg_6_ ( .D(n159), .CLK(clk), .Q(wptr[6]) );
  DFFX1 wptr_reg_7_ ( .D(n158), .CLK(clk), .Q(wptr[7]) );
  DFFX1 wptr_reg_8_ ( .D(n157), .CLK(clk), .Q(wptr[8]) );
  DFFX1 wptr_reg_9_ ( .D(n156), .CLK(clk), .Q(wptr[9]) );
  DFFX1 bits_left_reg_11_ ( .D(n116), .CLK(clk), .Q(bits_left[11]) );
  DFFX1 shr_cnt_reg_4_ ( .D(n136), .CLK(clk), .Q(shr_idx[4]) );
  DFFX1 shr_cnt_reg_0_ ( .D(n135), .CLK(clk), .Q(shr_idx[0]), .QN(n8) );
  DFFX1 shr_cnt_reg_1_ ( .D(n132), .CLK(clk), .Q(n247), .QN(n7) );
  DFFX1 shr_cnt_reg_2_ ( .D(n133), .CLK(clk), .Q(shr_idx[2]) );
  DFFX1 shr_cnt_reg_3_ ( .D(n134), .CLK(clk), .Q(shr_idx[3]) );
  DFFX1 byte_idx_reg_1_ ( .D(n144), .CLK(clk), .Q(byte_idx[1]), .QN(n50) );
  DFFX1 byte_idx_reg_2_ ( .D(n143), .CLK(clk), .Q(byte_idx[2]), .QN(n96) );
  DFFX1 byte_idx_reg_3_ ( .D(n142), .CLK(clk), .Q(byte_idx[3]), .QN(n55) );
  DFFX1 byte_idx_reg_4_ ( .D(n141), .CLK(clk), .Q(byte_idx[4]), .QN(n46) );
  DFFX1 byte_idx_reg_5_ ( .D(n140), .CLK(clk), .Q(byte_idx[5]), .QN(n42) );
  DFFX1 byte_idx_reg_6_ ( .D(n139), .CLK(clk), .Q(byte_idx[6]), .QN(n37) );
  DFFX1 byte_idx_reg_7_ ( .D(n138), .CLK(clk), .Q(byte_idx[7]) );
  DFFX1 load_cnt_reg_1_ ( .D(n169), .CLK(clk), .Q(load_cnt[1]) );
  DFFX1 load_cnt_reg_0_ ( .D(n168), .CLK(clk), .Q(load_cnt[0]), .QN(n28) );
  DFFX1 phr_blk_reg ( .D(n167), .CLK(clk), .Q(phr_blk) );
  DFFX1 ppdu_done_reg ( .D(n166), .CLK(clk), .Q(ppdu_done) );
  DFFX1 ppdu_nibbles_reg_9_ ( .D(n146), .CLK(clk), .Q(ppdu_nibbles[9]) );
  DFFX1 ppdu_nibbles_reg_8_ ( .D(n147), .CLK(clk), .Q(ppdu_nibbles[8]) );
  DFFX1 ppdu_nibbles_reg_7_ ( .D(n148), .CLK(clk), .Q(ppdu_nibbles[7]) );
  DFFX1 ppdu_nibbles_reg_6_ ( .D(n149), .CLK(clk), .Q(ppdu_nibbles[6]) );
  DFFX1 ppdu_nibbles_reg_5_ ( .D(n150), .CLK(clk), .Q(ppdu_nibbles[5]) );
  DFFX1 ppdu_nibbles_reg_4_ ( .D(n151), .CLK(clk), .Q(ppdu_nibbles[4]) );
  DFFX1 ppdu_nibbles_reg_3_ ( .D(n152), .CLK(clk), .Q(ppdu_nibbles[3]) );
  DFFX1 ppdu_nibbles_reg_2_ ( .D(n153), .CLK(clk), .Q(ppdu_nibbles[2]) );
  DFFX1 ppdu_nibbles_reg_1_ ( .D(n154), .CLK(clk), .Q(ppdu_nibbles[1]) );
  DFFX1 ppdu_nibbles_reg_0_ ( .D(n155), .CLK(clk), .Q(ppdu_nibbles[0]) );
  DFFX1 win_reg_0_ ( .D(n137), .CLK(clk), .Q(win_0_) );
  DFFX1 win_reg_1_ ( .D(n176), .CLK(clk), .QN(n33) );
  DFFX1 len_q_reg_6_ ( .D(n115), .CLK(clk), .Q(len_q[6]), .QN(n12) );
  DFFX1 len_q_reg_5_ ( .D(n114), .CLK(clk), .Q(len_q[5]), .QN(n3) );
  DFFX1 len_q_reg_4_ ( .D(n113), .CLK(clk), .Q(len_q[4]), .QN(n11) );
  DFFX1 len_q_reg_3_ ( .D(n112), .CLK(clk), .Q(len_q[3]), .QN(n4) );
  DFFX1 len_q_reg_2_ ( .D(n111), .CLK(clk), .Q(len_q[2]), .QN(n9) );
  DFFX1 len_q_reg_1_ ( .D(n110), .CLK(clk), .Q(len_q[1]) );
  DFFX1 len_q_reg_0_ ( .D(n109), .CLK(clk), .Q(len_q[0]), .QN(n10) );
  AO22X1 U83 ( .IN1(len_q[0]), .IN2(n206), .IN3(payloadLength[0]), .IN4(n48),
        .Q(n109) );
  AO22X1 U84 ( .IN1(len_q[1]), .IN2(n206), .IN3(payloadLength[1]), .IN4(n48),
        .Q(n110) );
  AO22X1 U85 ( .IN1(len_q[2]), .IN2(n206), .IN3(payloadLength[2]), .IN4(n48),
        .Q(n111) );
  AO22X1 U86 ( .IN1(len_q[3]), .IN2(n206), .IN3(payloadLength[3]), .IN4(n48),
        .Q(n112) );
  AO22X1 U87 ( .IN1(len_q[4]), .IN2(n205), .IN3(payloadLength[4]), .IN4(n48),
        .Q(n113) );
  AO22X1 U88 ( .IN1(len_q[5]), .IN2(n205), .IN3(payloadLength[5]), .IN4(n48),
        .Q(n114) );
  AO22X1 U89 ( .IN1(len_q[6]), .IN2(n205), .IN3(payloadLength[6]), .IN4(n48),
        .Q(n115) );
  AO222X1 U91 ( .IN1(N73), .IN2(n49), .IN3(left_next[10]), .IN4(n196), .IN5(
        bits_left[10]), .IN6(n210), .Q(n117) );
  AO222X1 U92 ( .IN1(N72), .IN2(n49), .IN3(left_next[9]), .IN4(n196), .IN5(
        bits_left[9]), .IN6(n211), .Q(n118) );
  AO222X1 U93 ( .IN1(N71), .IN2(n49), .IN3(left_next[8]), .IN4(n195), .IN5(
        bits_left[8]), .IN6(n210), .Q(n119) );
  AO222X1 U94 ( .IN1(N70), .IN2(n49), .IN3(left_next[7]), .IN4(n195), .IN5(
        bits_left[7]), .IN6(n211), .Q(n120) );
  AO222X1 U95 ( .IN1(N69), .IN2(n49), .IN3(left_next[6]), .IN4(n195), .IN5(
        bits_left[6]), .IN6(n210), .Q(n121) );
  AO222X1 U96 ( .IN1(N68), .IN2(n49), .IN3(left_next[5]), .IN4(n195), .IN5(
        bits_left[5]), .IN6(n211), .Q(n122) );
  AO222X1 U97 ( .IN1(N67), .IN2(n49), .IN3(left_next[4]), .IN4(n196), .IN5(
        bits_left[4]), .IN6(n209), .Q(n123) );
  AO222X1 U98 ( .IN1(N66), .IN2(n49), .IN3(left_next[3]), .IN4(n195), .IN5(
        bits_left[3]), .IN6(n209), .Q(n124) );
  AO22X1 U104 ( .IN1(n189), .IN2(n57), .IN3(n58), .IN4(n56), .Q(n129) );
  AO21X1 U105 ( .IN1(n56), .IN2(n59), .IN3(n60), .Q(n57) );
  AO22X1 U106 ( .IN1(nib_idx[1]), .IN2(n61), .IN3(n62), .IN4(n56), .Q(n130) );
  AO21X1 U107 ( .IN1(n56), .IN2(n32), .IN3(n60), .Q(n61) );
  AO22X1 U108 ( .IN1(n60), .IN2(nib_idx[0]), .IN3(n56), .IN4(n32), .Q(n131) );
  AO22X1 U110 ( .IN1(n247), .IN2(n16), .IN3(N91), .IN4(n65), .Q(n132) );
  AO22X1 U111 ( .IN1(shr_idx[2]), .IN2(n16), .IN3(N92), .IN4(n65), .Q(n133) );
  AO22X1 U112 ( .IN1(shr_idx[3]), .IN2(n16), .IN3(N93), .IN4(n65), .Q(n134) );
  AO22X1 U113 ( .IN1(shr_idx[0]), .IN2(n16), .IN3(n8), .IN4(n65), .Q(n135) );
  AO22X1 U114 ( .IN1(shr_idx[4]), .IN2(n16), .IN3(N94), .IN4(n65), .Q(n136) );
  AND3X1 U144 ( .IN1(n74), .IN2(n75), .IN3(n208), .Q(n73) );
  NAND3X0 U145 ( .IN1(n79), .IN2(n66), .IN3(n205), .QN(n75) );
  AO21X1 U146 ( .IN1(ppdu_done), .IN2(n81), .IN3(n72), .Q(n166) );
  AO22X1 U147 ( .IN1(n82), .IN2(phr_blk), .IN3(n83), .IN4(n239), .Q(n167) );
  AND2X1 U149 ( .IN1(n28), .IN2(n85), .Q(n84) );
  AO22X1 U150 ( .IN1(n69), .IN2(load_cnt[1]), .IN3(n86), .IN4(load_cnt[0]),
        .Q(n169) );
  AO21X1 U151 ( .IN1(len_err), .IN2(n81), .IN3(n88), .Q(n170) );
  AO22X1 U152 ( .IN1(start_prev), .IN2(n81), .IN3(n208), .IN4(start_Tx), .Q(
        n171) );
  AOI21X1 U154 ( .IN1(n53), .IN2(n19), .IN3(n5), .QN(n89) );
  AO222X1 U155 ( .IN1(n240), .IN2(n91), .IN3(n92), .IN4(n93), .IN5(n232),
        .IN6(n190), .Q(n173) );
  AO222X1 U157 ( .IN1(n233), .IN2(n92), .IN3(n94), .IN4(n208), .IN5(n232),
        .IN6(state[2]), .Q(n175) );
  AO21X1 U158 ( .IN1(n208), .IN2(n95), .IN3(reset), .Q(n91) );
  OAI21X1 U161 ( .IN1(n99), .IN2(n33), .IN3(n100), .QN(n176) );
  NAND4X0 U162 ( .IN1(win_0_), .IN2(n237), .IN3(n68), .IN4(n33), .QN(n100) );
  AO21X1 U163 ( .IN1(n53), .IN2(n98), .IN3(n239), .Q(n68) );
  AOI21X1 U164 ( .IN1(n101), .IN2(n102), .IN3(n233), .QN(n98) );
  AO22X1 U165 ( .IN1(N28), .IN2(n213), .IN3(n103), .IN4(n19), .Q(n93) );
  XNOR2X1 U166 ( .IN1(win_0_), .IN2(n104), .Q(n102) );
  XOR2X1 U167 ( .IN1(n33), .IN2(n105), .Q(n101) );
  NOR3X0 U169 ( .IN1(n78), .IN2(half), .IN3(n213), .QN(il_hold_en) );
  NAND3X0 U171 ( .IN1(n108), .IN2(n19), .IN3(half), .QN(n107) );
  NOR3X0 U177 ( .IN1(n180), .IN2(state[2]), .IN3(n40), .QN(acc_preload) );
  HADDX1 add_229_U1_1_1 ( .A0(n247), .B0(shr_idx[0]), .C1(add_229_carry[2]),
        .SO(N91) );
  HADDX1 add_229_U1_1_2 ( .A0(shr_idx[2]), .B0(add_229_carry[2]), .C1(
        add_229_carry[3]), .SO(N92) );
  HADDX1 add_229_U1_1_3 ( .A0(shr_idx[3]), .B0(add_229_carry[3]), .C1(
        add_229_carry[4]), .SO(N93) );
  FADDX1 sub_95_U2_3 ( .A(bits_left[3]), .B(n213), .CI(sub_95_carry[3]), .CO(
        sub_95_carry[4]), .S(left_next[3]) );
  DFFX1 state_reg_2_ ( .D(n175), .CLK(clk), .Q(state[2]), .QN(n39) );
  DFFX1 state_reg_0_ ( .D(n174), .CLK(clk), .Q(state[0]), .QN(n41) );
  DFFX1 rate_q_reg ( .D(n177), .CLK(clk), .Q(rate_q), .QN(n213) );
  DFFX2 byte_idx_reg_0_ ( .D(n145), .CLK(clk), .Q(byte_idx[0]), .QN(n204) );
  NBUFFX2 U3 ( .INP(n30), .Z(acc_load) );
  AO22X1 U4 ( .IN1(n35), .IN2(byte_idx[2]), .IN3(N33), .IN4(n30), .Q(
        ram_raddr[2]) );
  NBUFFX2 U5 ( .INP(n23), .Z(n36) );
  NAND2X0 U6 ( .IN1(N35), .IN2(n36), .QN(n45) );
  NAND2X0 U7 ( .IN1(byte_idx[3]), .IN2(n35), .QN(n1) );
  NAND2X0 U8 ( .IN1(N34), .IN2(n36), .QN(n2) );
  NAND2X1 U9 ( .IN1(n1), .IN2(n2), .QN(ram_raddr[3]) );
  AND3X1 U10 ( .IN1(state[1]), .IN2(state[0]), .IN3(n39), .Q(n31) );
  NBUFFX2 U11 ( .INP(n207), .Z(n208) );
  AO22X1 U12 ( .IN1(byte_idx[5]), .IN2(n24), .IN3(N36), .IN4(n34), .Q(
        ram_raddr[5]) );
  XNOR2X1 U13 ( .IN1(shr_last[4]), .IN2(shr_idx[4]), .Q(n227) );
  XNOR2X1 U14 ( .IN1(shr_last[2]), .IN2(shr_idx[2]), .Q(n185) );
  OA221X1 U15 ( .IN1(byte_idx[5]), .IN2(n3), .IN3(n47), .IN4(n11), .IN5(n222),
        .Q(n223) );
  AO221X1 U16 ( .IN1(n70), .IN2(n4), .IN3(byte_idx[4]), .IN4(n11), .IN5(n221),
        .Q(n222) );
  OA221X1 U17 ( .IN1(byte_idx[3]), .IN2(n4), .IN3(n97), .IN4(n9), .IN5(n220),
        .Q(n221) );
  NOR2X0 U18 ( .IN1(n106), .IN2(reset), .QN(n76) );
  NAND3X0 U19 ( .IN1(n40), .IN2(n191), .IN3(n180), .QN(n77) );
  NBUFFX2 U20 ( .INP(n76), .Z(n207) );
  OAI22X1 U21 ( .IN1(n228), .IN2(n230), .IN3(n247), .IN4(n228), .QN(n186) );
  NAND3X0 U22 ( .IN1(nib_idx[2]), .IN2(n244), .IN3(n194), .QN(n108) );
  NAND3X0 U23 ( .IN1(n40), .IN2(n191), .IN3(n41), .QN(busy) );
  AO221X1 U24 ( .IN1(n43), .IN2(n3), .IN3(byte_idx[6]), .IN4(n12), .IN5(n223),
        .Q(n224) );
  NOR4X0 U25 ( .IN1(n235), .IN2(n191), .IN3(n41), .IN4(n190), .QN(n72) );
  NBUFFX2 U26 ( .INP(n64), .Z(n16) );
  NBUFFX2 U27 ( .INP(n51), .Z(n209) );
  AND2X1 U28 ( .IN1(n237), .IN2(n91), .Q(n92) );
  AND2X1 U29 ( .IN1(n237), .IN2(n63), .Q(n56) );
  AO22X1 U30 ( .IN1(n206), .IN2(n19), .IN3(rate), .IN4(n48), .Q(n177) );
  AO22X1 U31 ( .IN1(n69), .IN2(n26), .IN3(N97), .IN4(n238), .Q(n145) );
  AO22X1 U32 ( .IN1(n231), .IN2(win_0_), .IN3(n67), .IN4(n237), .Q(n137) );
  AO22X1 U33 ( .IN1(ppdu_nibbles[0]), .IN2(n22), .IN3(wptr[0]), .IN4(n71), .Q(
        n155) );
  AO22X1 U34 ( .IN1(ppdu_nibbles[1]), .IN2(n22), .IN3(wptr[1]), .IN4(n71), .Q(
        n154) );
  AO22X1 U35 ( .IN1(ppdu_nibbles[2]), .IN2(n22), .IN3(wptr[2]), .IN4(n71), .Q(
        n153) );
  AO22X1 U36 ( .IN1(ppdu_nibbles[3]), .IN2(n22), .IN3(wptr[3]), .IN4(n71), .Q(
        n152) );
  AO22X1 U37 ( .IN1(ppdu_nibbles[4]), .IN2(n22), .IN3(wptr[4]), .IN4(n71), .Q(
        n151) );
  AO22X1 U38 ( .IN1(ppdu_nibbles[5]), .IN2(n22), .IN3(wptr[5]), .IN4(n71), .Q(
        n150) );
  AO22X1 U39 ( .IN1(ppdu_nibbles[6]), .IN2(n22), .IN3(wptr[6]), .IN4(n71), .Q(
        n149) );
  AO22X1 U40 ( .IN1(ppdu_nibbles[7]), .IN2(n22), .IN3(wptr[7]), .IN4(n71), .Q(
        n148) );
  AO22X1 U41 ( .IN1(ppdu_nibbles[8]), .IN2(n22), .IN3(wptr[8]), .IN4(n71), .Q(
        n147) );
  AO22X1 U42 ( .IN1(ppdu_nibbles[9]), .IN2(n22), .IN3(wptr[9]), .IN4(n71), .Q(
        n146) );
  AO22X1 U43 ( .IN1(load_cnt[0]), .IN2(n69), .IN3(n84), .IN4(n238), .Q(n168)
         );
  AO22X1 U44 ( .IN1(byte_idx[7]), .IN2(n69), .IN3(N104), .IN4(n18), .Q(n138)
         );
  AO22X1 U45 ( .IN1(n69), .IN2(n38), .IN3(N103), .IN4(n238), .Q(n139) );
  AO22X1 U46 ( .IN1(n69), .IN2(n43), .IN3(N102), .IN4(n238), .Q(n140) );
  AO22X1 U47 ( .IN1(n69), .IN2(n47), .IN3(N101), .IN4(n18), .Q(n141) );
  AO22X1 U48 ( .IN1(n69), .IN2(n70), .IN3(N100), .IN4(n238), .Q(n142) );
  AO22X1 U49 ( .IN1(n69), .IN2(n97), .IN3(N99), .IN4(n18), .Q(n143) );
  AO22X1 U50 ( .IN1(n69), .IN2(n54), .IN3(N98), .IN4(n238), .Q(n144) );
  AO22X1 U51 ( .IN1(n236), .IN2(wptr[9]), .IN3(N87), .IN4(n73), .Q(n156) );
  AO22X1 U52 ( .IN1(n236), .IN2(wptr[8]), .IN3(N86), .IN4(n73), .Q(n157) );
  AO22X1 U53 ( .IN1(n236), .IN2(wptr[7]), .IN3(N85), .IN4(n73), .Q(n158) );
  AO22X1 U54 ( .IN1(n236), .IN2(wptr[6]), .IN3(N84), .IN4(n73), .Q(n159) );
  AO22X1 U55 ( .IN1(n236), .IN2(wptr[5]), .IN3(N83), .IN4(n73), .Q(n160) );
  AO22X1 U56 ( .IN1(n236), .IN2(wptr[4]), .IN3(N82), .IN4(n73), .Q(n161) );
  AO22X1 U57 ( .IN1(n236), .IN2(wptr[3]), .IN3(N81), .IN4(n73), .Q(n162) );
  AO22X1 U58 ( .IN1(n236), .IN2(wptr[2]), .IN3(N80), .IN4(n73), .Q(n163) );
  AO22X1 U59 ( .IN1(n236), .IN2(wptr[1]), .IN3(N79), .IN4(n73), .Q(n164) );
  AO22X1 U60 ( .IN1(n236), .IN2(wptr[0]), .IN3(N78), .IN4(n73), .Q(n165) );
  AO22X1 U61 ( .IN1(n89), .IN2(half), .IN3(n90), .IN4(n237), .Q(n172) );
  NAND3X0 U62 ( .IN1(n189), .IN2(n244), .IN3(n56), .QN(n198) );
  OAI21X1 U63 ( .IN1(n57), .IN2(n56), .IN3(nib_idx[3]), .QN(n197) );
  OR2X1 U64 ( .IN1(il_clear), .IN2(reset), .Q(n5) );
  INVX0 U65 ( .INP(n87), .ZN(n238) );
  OR2X1 U66 ( .IN1(n52), .IN2(n209), .Q(n6) );
  NBUFFX2 U67 ( .INP(n190), .Z(n181) );
  NAND3X0 U68 ( .IN1(state[0]), .IN2(state[1]), .IN3(n39), .QN(n17) );
  NAND2X1 U69 ( .IN1(n29), .IN2(n27), .QN(ram_raddr[0]) );
  INVX0 U70 ( .INP(n20), .ZN(acc_clear) );
  OR4X1 U71 ( .IN1(n245), .IN2(payloadLength[7]), .IN3(busy), .IN4(start_prev),
        .Q(n20) );
  AO221X1 U72 ( .IN1(n83), .IN2(n91), .IN3(n232), .IN4(n180), .IN5(n92), .Q(
        n174) );
  NBUFFX2 U73 ( .INP(n248), .Z(frame_ready) );
  OR2X1 U74 ( .IN1(reset), .IN2(n72), .Q(n15) );
  NAND3X1 U75 ( .IN1(n41), .IN2(n40), .IN3(state[2]), .QN(n78) );
  AO22X1 U76 ( .IN1(byte_idx[6]), .IN2(n192), .IN3(N37), .IN4(n30), .Q(
        ram_raddr[6]) );
  INVX0 U77 ( .INP(n20), .ZN(il_clear) );
  INVX0 U78 ( .INP(n87), .ZN(n18) );
  OR2X1 U79 ( .IN1(n80), .IN2(n242), .Q(n248) );
  INVX0 U80 ( .INP(n213), .ZN(n19) );
  NAND2X1 U81 ( .IN1(n179), .IN2(n178), .QN(ram_raddr[1]) );
  INVX0 U82 ( .INP(n15), .ZN(n21) );
  INVX0 U90 ( .INP(n15), .ZN(n22) );
  INVX0 U99 ( .INP(n17), .ZN(n23) );
  INVX0 U100 ( .INP(n36), .ZN(n24) );
  INVX0 U101 ( .INP(byte_idx[0]), .ZN(n25) );
  INVX0 U102 ( .INP(n25), .ZN(n26) );
  NAND2X0 U103 ( .IN1(byte_idx[0]), .IN2(n17), .QN(n27) );
  NAND2X0 U109 ( .IN1(N31), .IN2(n23), .QN(n29) );
  NAND2X1 U115 ( .IN1(n45), .IN2(n44), .QN(ram_raddr[4]) );
  INVX0 U116 ( .INP(n24), .ZN(n30) );
  INVX0 U117 ( .INP(n192), .ZN(n34) );
  INVX0 U118 ( .INP(n31), .ZN(n35) );
  INVX0 U119 ( .INP(n37), .ZN(n38) );
  INVX0 U120 ( .INP(n42), .ZN(n43) );
  NAND2X0 U121 ( .IN1(byte_idx[4]), .IN2(n192), .QN(n44) );
  INVX0 U122 ( .INP(n46), .ZN(n47) );
  INVX0 U123 ( .INP(n50), .ZN(n54) );
  INVX0 U124 ( .INP(n55), .ZN(n70) );
  INVX0 U125 ( .INP(n96), .ZN(n97) );
  NAND2X0 U126 ( .IN1(n54), .IN2(n35), .QN(n178) );
  NAND2X0 U127 ( .IN1(N32), .IN2(n34), .QN(n179) );
  INVX0 U128 ( .INP(n41), .ZN(n180) );
  INVX0 U129 ( .INP(n204), .ZN(n182) );
  INVX0 U130 ( .INP(n7), .ZN(shr_idx[1]) );
  AND4X1 U131 ( .IN1(n184), .IN2(n185), .IN3(n186), .IN4(n187), .Q(N88) );
  AND2X1 U132 ( .IN1(n227), .IN2(n226), .Q(n184) );
  OAI22X1 U133 ( .IN1(shr_last[1]), .IN2(n229), .IN3(n229), .IN4(n7), .QN(n187) );
  INVX0 U134 ( .INP(n188), .ZN(n189) );
  INVX0 U135 ( .INP(n40), .ZN(n190) );
  INVX0 U136 ( .INP(state[2]), .ZN(n191) );
  INVX0 U137 ( .INP(n31), .ZN(n192) );
  INVX0 U138 ( .INP(n193), .ZN(n194) );
  INVX0 U139 ( .INP(n6), .ZN(n195) );
  INVX0 U140 ( .INP(n6), .ZN(n196) );
  NAND2X1 U141 ( .IN1(n197), .IN2(n198), .QN(n128) );
  NOR2X0 U142 ( .IN1(n234), .IN2(n209), .QN(n49) );
  NBUFFX2 U143 ( .INP(n51), .Z(n211) );
  NBUFFX2 U148 ( .INP(n51), .Z(n210) );
  NOR2X0 U153 ( .IN1(n5), .IN2(n18), .QN(n69) );
  INVX0 U156 ( .INP(n52), .ZN(n237) );
  NOR2X0 U159 ( .IN1(n5), .IN2(n237), .QN(n60) );
  INVX0 U160 ( .INP(n208), .ZN(n235) );
  INVX0 U168 ( .INP(n75), .ZN(n236) );
  NOR2X0 U170 ( .IN1(n235), .IN2(n205), .QN(n48) );
  INVX0 U172 ( .INP(n82), .ZN(n239) );
  NAND2X0 U173 ( .IN1(n242), .IN2(n207), .QN(n66) );
  INVX0 U174 ( .INP(n83), .ZN(n234) );
  INVX0 U175 ( .INP(mod_busy), .ZN(n241) );
  NOR2X0 U176 ( .IN1(n106), .IN2(n63), .QN(acc_consume) );
  OA21X1 U178 ( .IN1(n66), .IN2(N88), .IN3(n206), .Q(n64) );
  INVX0 U179 ( .INP(n59), .ZN(n244) );
  INVX0 U180 ( .INP(n5), .ZN(n205) );
  NOR2X0 U181 ( .IN1(n235), .IN2(n21), .QN(n71) );
  NAND2X0 U182 ( .IN1(n80), .IN2(n237), .QN(n79) );
  INVX0 U183 ( .INP(n5), .ZN(n206) );
  OA21X1 U184 ( .IN1(n87), .IN2(n85), .IN3(n206), .Q(n82) );
  INVX0 U185 ( .INP(n77), .ZN(buf_sel_shr) );
  INVX0 U186 ( .INP(n93), .ZN(n233) );
  NAND2X1 U187 ( .IN1(n243), .IN2(n107), .QN(n63) );
  INVX0 U188 ( .INP(payloadLength[0]), .ZN(N66) );
  OR2X1 U189 ( .IN1(n199), .IN2(n200), .Q(n95) );
  AO222X1 U190 ( .IN1(n180), .IN2(state[2]), .IN3(n242), .IN4(N88), .IN5(n41),
        .IN6(n181), .Q(n199) );
  OAI221X1 U191 ( .IN1(n35), .IN2(n85), .IN3(n98), .IN4(n63), .IN5(n20), .QN(
        n200) );
  INVX0 U192 ( .INP(n66), .ZN(n240) );
  NOR2X0 U193 ( .IN1(n189), .IN2(n59), .QN(n58) );
  NOR2X0 U194 ( .IN1(nib_idx[1]), .IN2(n32), .QN(n62) );
  NOR2X0 U195 ( .IN1(win_0_), .IN2(n231), .QN(n67) );
  INVX0 U196 ( .INP(n68), .ZN(n231) );
  OA21X1 U197 ( .IN1(win_0_), .IN2(n52), .IN3(n68), .Q(n99) );
  NOR2X0 U198 ( .IN1(half), .IN2(n89), .QN(n90) );
  OR2X1 U199 ( .IN1(n201), .IN2(n32), .Q(n59) );
  XNOR2X1 U200 ( .IN1(shr_last[3]), .IN2(shr_idx[3]), .Q(n226) );
  INVX0 U201 ( .INP(start_Tx), .ZN(n245) );
  OA21X1 U202 ( .IN1(busy_prev), .IN2(n241), .IN3(n248), .Q(n106) );
  OA21X1 U203 ( .IN1(n213), .IN2(half), .IN3(n243), .Q(n80) );
  NOR2X0 U204 ( .IN1(load_cnt[1]), .IN2(n87), .QN(n86) );
  NOR4X0 U205 ( .IN1(start_prev), .IN2(len_ok), .IN3(n245), .IN4(n234), .QN(
        n88) );
  NOR2X0 U206 ( .IN1(reset), .IN2(n207), .QN(n81) );
  OR2X1 U207 ( .IN1(N26), .IN2(n202), .Q(n103) );
  NOR2X0 U208 ( .IN1(phr_blk), .IN2(n19), .QN(n105) );
  NAND2X1 U209 ( .IN1(phr_blk), .IN2(n19), .QN(n104) );
  NOR2X0 U210 ( .IN1(reset), .IN2(n241), .QN(N30) );
  NAND2X1 U211 ( .IN1(load_cnt[1]), .IN2(n28), .QN(n85) );
  INVX0 U212 ( .INP(shr_last[1]), .ZN(n230) );
  NOR2X0 U213 ( .IN1(n5), .IN2(n53), .QN(n51) );
  NOR2X0 U214 ( .IN1(n63), .IN2(n52), .QN(n53) );
  NAND2X0 U215 ( .IN1(n77), .IN2(n78), .QN(n74) );
  INVX0 U216 ( .INP(n78), .ZN(n243) );
  NOR2X0 U217 ( .IN1(n235), .IN2(busy), .QN(n83) );
  INVX0 U218 ( .INP(n77), .ZN(n242) );
  NAND2X0 U219 ( .IN1(n76), .IN2(n243), .QN(n52) );
  INVX0 U220 ( .INP(n91), .ZN(n232) );
  NOR2X0 U221 ( .IN1(n66), .IN2(n64), .QN(n65) );
  OA21X1 U222 ( .IN1(acc_load), .IN2(acc_preload), .IN3(n91), .Q(n94) );
  NAND2X0 U223 ( .IN1(n207), .IN2(acc_load), .QN(n87) );
  AND2X1 U224 ( .IN1(add_205_carry[9]), .IN2(payloadLength[6]), .Q(N73) );
  XOR2X1 U225 ( .IN1(payloadLength[6]), .IN2(add_205_carry[9]), .Q(N72) );
  AND2X1 U226 ( .IN1(add_205_carry[8]), .IN2(payloadLength[5]), .Q(
        add_205_carry[9]) );
  XOR2X1 U227 ( .IN1(payloadLength[5]), .IN2(add_205_carry[8]), .Q(N71) );
  AND2X1 U228 ( .IN1(add_205_carry[7]), .IN2(payloadLength[4]), .Q(
        add_205_carry[8]) );
  XOR2X1 U229 ( .IN1(payloadLength[4]), .IN2(add_205_carry[7]), .Q(N70) );
  AND2X1 U230 ( .IN1(add_205_carry[6]), .IN2(payloadLength[3]), .Q(
        add_205_carry[7]) );
  XOR2X1 U231 ( .IN1(payloadLength[3]), .IN2(add_205_carry[6]), .Q(N69) );
  AND2X1 U232 ( .IN1(add_205_carry[5]), .IN2(payloadLength[2]), .Q(
        add_205_carry[6]) );
  XOR2X1 U233 ( .IN1(payloadLength[2]), .IN2(add_205_carry[5]), .Q(N68) );
  AND2X1 U234 ( .IN1(payloadLength[0]), .IN2(payloadLength[1]), .Q(
        add_205_carry[5]) );
  XOR2X1 U235 ( .IN1(payloadLength[1]), .IN2(payloadLength[0]), .Q(N67) );
  XNOR2X1 U236 ( .IN1(bits_left[11]), .IN2(sub_95_carry[11]), .Q(left_next[11]) );
  OR2X1 U237 ( .IN1(bits_left[10]), .IN2(sub_95_carry[10]), .Q(
        sub_95_carry[11]) );
  XNOR2X1 U238 ( .IN1(sub_95_carry[10]), .IN2(bits_left[10]), .Q(left_next[10]) );
  OR2X1 U239 ( .IN1(bits_left[9]), .IN2(sub_95_carry[9]), .Q(sub_95_carry[10])
         );
  XNOR2X1 U240 ( .IN1(sub_95_carry[9]), .IN2(bits_left[9]), .Q(left_next[9])
         );
  OR2X1 U241 ( .IN1(bits_left[8]), .IN2(sub_95_carry[8]), .Q(sub_95_carry[9])
         );
  XNOR2X1 U242 ( .IN1(sub_95_carry[8]), .IN2(bits_left[8]), .Q(left_next[8])
         );
  OR2X1 U243 ( .IN1(bits_left[7]), .IN2(sub_95_carry[7]), .Q(sub_95_carry[8])
         );
  XNOR2X1 U244 ( .IN1(sub_95_carry[7]), .IN2(bits_left[7]), .Q(left_next[7])
         );
  OR2X1 U245 ( .IN1(bits_left[6]), .IN2(sub_95_carry[6]), .Q(sub_95_carry[7])
         );
  XNOR2X1 U246 ( .IN1(sub_95_carry[6]), .IN2(bits_left[6]), .Q(left_next[6])
         );
  OR2X1 U247 ( .IN1(bits_left[5]), .IN2(sub_95_carry[5]), .Q(sub_95_carry[6])
         );
  XNOR2X1 U248 ( .IN1(sub_95_carry[5]), .IN2(bits_left[5]), .Q(left_next[5])
         );
  OR2X1 U249 ( .IN1(bits_left[4]), .IN2(sub_95_carry[4]), .Q(sub_95_carry[5])
         );
  XNOR2X1 U250 ( .IN1(sub_95_carry[4]), .IN2(bits_left[4]), .Q(left_next[4])
         );
  AND2X1 U251 ( .IN1(sub_95_carry[2]), .IN2(bits_left[2]), .Q(sub_95_carry[3])
         );
  XOR2X1 U252 ( .IN1(bits_left[2]), .IN2(sub_95_carry[2]), .Q(left_next[2]) );
  OR2X1 U253 ( .IN1(bits_left[1]), .IN2(n19), .Q(sub_95_carry[2]) );
  XNOR2X1 U254 ( .IN1(n19), .IN2(bits_left[1]), .Q(left_next[1]) );
  XOR2X1 U255 ( .IN1(add_229_carry[4]), .IN2(shr_idx[4]), .Q(N94) );
  INVX0 U256 ( .INP(left_next[11]), .ZN(N28) );
  OR3X1 U257 ( .IN1(left_next[9]), .IN2(left_next[8]), .IN3(left_next[7]), .Q(
        n214) );
  OR4X1 U258 ( .IN1(left_next[6]), .IN2(left_next[5]), .IN3(left_next[4]),
        .IN4(n214), .Q(n216) );
  OR3X1 U259 ( .IN1(left_next[3]), .IN2(left_next[2]), .IN3(left_next[1]), .Q(
        n215) );
  NOR4X0 U260 ( .IN1(n216), .IN2(n215), .IN3(left_next[10]), .IN4(left_next[0]), .QN(n217) );
  NOR2X0 U261 ( .IN1(left_next[11]), .IN2(n217), .QN(N26) );
  INVX0 U262 ( .INP(payloadLength[7]), .ZN(len_ok) );
  NOR2X0 U263 ( .IN1(n10), .IN2(byte_idx[0]), .QN(n219) );
  AND2X1 U264 ( .IN1(n50), .IN2(n219), .Q(n218) );
  OAI222X1 U265 ( .IN1(n219), .IN2(n50), .IN3(len_q[1]), .IN4(n218), .IN5(
        len_q[2]), .IN6(n96), .QN(n220) );
  OA21X1 U266 ( .IN1(n38), .IN2(n12), .IN3(n224), .Q(n225) );
  NOR2X0 U267 ( .IN1(byte_idx[7]), .IN2(n225), .QN(acc_byte_vld) );
  NOR2X0 U268 ( .IN1(n8), .IN2(shr_last[0]), .QN(n228) );
  AND2X1 U269 ( .IN1(shr_last[0]), .IN2(n8), .Q(n229) );
  AO22X1 U270 ( .IN1(left_next[11]), .IN2(n195), .IN3(bits_left[11]), .IN4(
        n211), .Q(n116) );
  AO22X1 U271 ( .IN1(left_next[1]), .IN2(n196), .IN3(bits_left[1]), .IN4(n210),
        .Q(n126) );
  AO221X1 U272 ( .IN1(bits_left[2]), .IN2(n210), .IN3(left_next[2]), .IN4(n196), .IN5(n49), .Q(n125) );
  AO22X1 U273 ( .IN1(left_next[0]), .IN2(n196), .IN3(left_next[0]), .IN4(n211),
        .Q(n127) );
  ppdu_ctrl_DW01_inc_0 add_246 ( .A({byte_idx[7], n38, n43, n47, n70, n97, n54,
        n26}), .SUM({N104, N103, N102, N101, N100, N99, N98, N97}) );
  ppdu_ctrl_DW01_inc_2 add_133 ( .A({byte_idx[6:1], n182}), .SUM({N37, N36,
        N35, N34, N33, N32, N31}) );
  ppdu_ctrl_DW01_inc_3 r149 ( .A(wptr), .SUM({N87, N86, N85, N84, N83, N82,
        N81, N80, N79, N78}) );
endmodule


module payload_ram_bank8x8_15 ( clk, we, waddr, wdata, raddr, rdata );
  input [2:0] waddr;
  input [7:0] wdata;
  input [2:0] raddr;
  output [7:0] rdata;
  input clk, we;
  wire   n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184;
  wire   [63:0] mem;

  DFFX1 mem_reg_0__7_ ( .D(n85), .CLK(clk), .Q(mem[63]) );
  DFFX1 mem_reg_0__6_ ( .D(n84), .CLK(clk), .Q(mem[62]) );
  DFFX1 mem_reg_0__5_ ( .D(n83), .CLK(clk), .Q(mem[61]) );
  DFFX1 mem_reg_0__4_ ( .D(n82), .CLK(clk), .Q(mem[60]) );
  DFFX1 mem_reg_0__3_ ( .D(n81), .CLK(clk), .Q(mem[59]) );
  DFFX1 mem_reg_0__2_ ( .D(n80), .CLK(clk), .Q(mem[58]) );
  DFFX1 mem_reg_0__1_ ( .D(n79), .CLK(clk), .Q(mem[57]) );
  DFFX1 mem_reg_0__0_ ( .D(n78), .CLK(clk), .Q(mem[56]) );
  DFFX1 mem_reg_1__7_ ( .D(n77), .CLK(clk), .Q(mem[55]) );
  DFFX1 mem_reg_1__6_ ( .D(n76), .CLK(clk), .Q(mem[54]) );
  DFFX1 mem_reg_1__5_ ( .D(n75), .CLK(clk), .Q(mem[53]) );
  DFFX1 mem_reg_1__4_ ( .D(n74), .CLK(clk), .Q(mem[52]) );
  DFFX1 mem_reg_1__3_ ( .D(n73), .CLK(clk), .Q(mem[51]) );
  DFFX1 mem_reg_1__2_ ( .D(n72), .CLK(clk), .Q(mem[50]) );
  DFFX1 mem_reg_1__1_ ( .D(n71), .CLK(clk), .Q(mem[49]) );
  DFFX1 mem_reg_1__0_ ( .D(n70), .CLK(clk), .Q(mem[48]) );
  DFFX1 mem_reg_2__7_ ( .D(n69), .CLK(clk), .Q(mem[47]) );
  DFFX1 mem_reg_2__6_ ( .D(n68), .CLK(clk), .Q(mem[46]) );
  DFFX1 mem_reg_2__5_ ( .D(n67), .CLK(clk), .Q(mem[45]) );
  DFFX1 mem_reg_2__4_ ( .D(n66), .CLK(clk), .Q(mem[44]) );
  DFFX1 mem_reg_2__3_ ( .D(n65), .CLK(clk), .Q(mem[43]) );
  DFFX1 mem_reg_2__2_ ( .D(n64), .CLK(clk), .Q(mem[42]) );
  DFFX1 mem_reg_2__1_ ( .D(n63), .CLK(clk), .Q(mem[41]) );
  DFFX1 mem_reg_2__0_ ( .D(n62), .CLK(clk), .Q(mem[40]) );
  DFFX1 mem_reg_3__7_ ( .D(n61), .CLK(clk), .Q(mem[39]) );
  DFFX1 mem_reg_3__6_ ( .D(n60), .CLK(clk), .Q(mem[38]) );
  DFFX1 mem_reg_3__5_ ( .D(n59), .CLK(clk), .Q(mem[37]) );
  DFFX1 mem_reg_3__4_ ( .D(n58), .CLK(clk), .Q(mem[36]) );
  DFFX1 mem_reg_3__3_ ( .D(n57), .CLK(clk), .Q(mem[35]) );
  DFFX1 mem_reg_3__2_ ( .D(n56), .CLK(clk), .Q(mem[34]) );
  DFFX1 mem_reg_3__1_ ( .D(n55), .CLK(clk), .Q(mem[33]) );
  DFFX1 mem_reg_3__0_ ( .D(n54), .CLK(clk), .Q(mem[32]) );
  DFFX1 mem_reg_4__7_ ( .D(n53), .CLK(clk), .Q(mem[31]) );
  DFFX1 mem_reg_4__6_ ( .D(n52), .CLK(clk), .Q(mem[30]) );
  DFFX1 mem_reg_4__5_ ( .D(n51), .CLK(clk), .Q(mem[29]) );
  DFFX1 mem_reg_4__4_ ( .D(n50), .CLK(clk), .Q(mem[28]) );
  DFFX1 mem_reg_4__3_ ( .D(n49), .CLK(clk), .Q(mem[27]) );
  DFFX1 mem_reg_4__2_ ( .D(n48), .CLK(clk), .Q(mem[26]) );
  DFFX1 mem_reg_4__1_ ( .D(n47), .CLK(clk), .Q(mem[25]) );
  DFFX1 mem_reg_4__0_ ( .D(n46), .CLK(clk), .Q(mem[24]) );
  DFFX1 mem_reg_5__7_ ( .D(n45), .CLK(clk), .Q(mem[23]) );
  DFFX1 mem_reg_5__6_ ( .D(n44), .CLK(clk), .Q(mem[22]) );
  DFFX1 mem_reg_5__5_ ( .D(n43), .CLK(clk), .Q(mem[21]) );
  DFFX1 mem_reg_5__4_ ( .D(n42), .CLK(clk), .Q(mem[20]) );
  DFFX1 mem_reg_5__3_ ( .D(n41), .CLK(clk), .Q(mem[19]) );
  DFFX1 mem_reg_5__2_ ( .D(n40), .CLK(clk), .Q(mem[18]) );
  DFFX1 mem_reg_5__1_ ( .D(n39), .CLK(clk), .Q(mem[17]) );
  DFFX1 mem_reg_5__0_ ( .D(n38), .CLK(clk), .Q(mem[16]) );
  DFFX1 mem_reg_6__7_ ( .D(n37), .CLK(clk), .Q(mem[15]) );
  DFFX1 mem_reg_6__6_ ( .D(n36), .CLK(clk), .Q(mem[14]) );
  DFFX1 mem_reg_6__5_ ( .D(n35), .CLK(clk), .Q(mem[13]) );
  DFFX1 mem_reg_6__4_ ( .D(n34), .CLK(clk), .Q(mem[12]) );
  DFFX1 mem_reg_6__3_ ( .D(n33), .CLK(clk), .Q(mem[11]) );
  DFFX1 mem_reg_6__2_ ( .D(n32), .CLK(clk), .Q(mem[10]) );
  DFFX1 mem_reg_6__1_ ( .D(n31), .CLK(clk), .Q(mem[9]) );
  DFFX1 mem_reg_6__0_ ( .D(n30), .CLK(clk), .Q(mem[8]) );
  DFFX1 mem_reg_7__7_ ( .D(n29), .CLK(clk), .Q(mem[7]) );
  DFFX1 mem_reg_7__6_ ( .D(n28), .CLK(clk), .Q(mem[6]) );
  DFFX1 mem_reg_7__5_ ( .D(n27), .CLK(clk), .Q(mem[5]) );
  DFFX1 mem_reg_7__4_ ( .D(n26), .CLK(clk), .Q(mem[4]) );
  DFFX1 mem_reg_7__3_ ( .D(n25), .CLK(clk), .Q(mem[3]) );
  DFFX1 mem_reg_7__2_ ( .D(n24), .CLK(clk), .Q(mem[2]) );
  DFFX1 mem_reg_7__1_ ( .D(n23), .CLK(clk), .Q(mem[1]) );
  DFFX1 mem_reg_7__0_ ( .D(n22), .CLK(clk), .Q(mem[0]) );
  AO22X1 U14 ( .IN1(n106), .IN2(n86), .IN3(mem[0]), .IN4(n176), .Q(n22) );
  AO22X1 U15 ( .IN1(n103), .IN2(n86), .IN3(mem[1]), .IN4(n176), .Q(n23) );
  AO22X1 U16 ( .IN1(n101), .IN2(n86), .IN3(mem[2]), .IN4(n176), .Q(n24) );
  AO22X1 U17 ( .IN1(n98), .IN2(n86), .IN3(mem[3]), .IN4(n176), .Q(n25) );
  AO22X1 U18 ( .IN1(n96), .IN2(n86), .IN3(mem[4]), .IN4(n176), .Q(n26) );
  AO22X1 U19 ( .IN1(n93), .IN2(n86), .IN3(mem[5]), .IN4(n175), .Q(n27) );
  AO22X1 U20 ( .IN1(n91), .IN2(n86), .IN3(mem[6]), .IN4(n175), .Q(n28) );
  AO22X1 U21 ( .IN1(n89), .IN2(n86), .IN3(mem[7]), .IN4(n175), .Q(n29) );
  AO22X1 U23 ( .IN1(n11), .IN2(n105), .IN3(mem[8]), .IN4(n174), .Q(n30) );
  AO22X1 U24 ( .IN1(n11), .IN2(n103), .IN3(mem[9]), .IN4(n174), .Q(n31) );
  AO22X1 U25 ( .IN1(n11), .IN2(n100), .IN3(mem[10]), .IN4(n174), .Q(n32) );
  AO22X1 U26 ( .IN1(n11), .IN2(n98), .IN3(mem[11]), .IN4(n174), .Q(n33) );
  AO22X1 U27 ( .IN1(n11), .IN2(n95), .IN3(mem[12]), .IN4(n174), .Q(n34) );
  AO22X1 U28 ( .IN1(n11), .IN2(n93), .IN3(mem[13]), .IN4(n173), .Q(n35) );
  AO22X1 U29 ( .IN1(n11), .IN2(n91), .IN3(mem[14]), .IN4(n173), .Q(n36) );
  AO22X1 U30 ( .IN1(n11), .IN2(n89), .IN3(mem[15]), .IN4(n173), .Q(n37) );
  AO22X1 U32 ( .IN1(n5), .IN2(n105), .IN3(mem[16]), .IN4(n172), .Q(n38) );
  AO22X1 U33 ( .IN1(n5), .IN2(n103), .IN3(mem[17]), .IN4(n172), .Q(n39) );
  AO22X1 U34 ( .IN1(n5), .IN2(n100), .IN3(mem[18]), .IN4(n172), .Q(n40) );
  AO22X1 U35 ( .IN1(n5), .IN2(n98), .IN3(mem[19]), .IN4(n172), .Q(n41) );
  AO22X1 U36 ( .IN1(n5), .IN2(n95), .IN3(mem[20]), .IN4(n172), .Q(n42) );
  AO22X1 U37 ( .IN1(n184), .IN2(n93), .IN3(mem[21]), .IN4(n171), .Q(n43) );
  AO22X1 U38 ( .IN1(n184), .IN2(n91), .IN3(mem[22]), .IN4(n171), .Q(n44) );
  AO22X1 U39 ( .IN1(n184), .IN2(n89), .IN3(mem[23]), .IN4(n171), .Q(n45) );
  AO22X1 U41 ( .IN1(n10), .IN2(n105), .IN3(mem[24]), .IN4(n170), .Q(n46) );
  AO22X1 U42 ( .IN1(n10), .IN2(n103), .IN3(mem[25]), .IN4(n170), .Q(n47) );
  AO22X1 U43 ( .IN1(n10), .IN2(n100), .IN3(mem[26]), .IN4(n170), .Q(n48) );
  AO22X1 U44 ( .IN1(n10), .IN2(n98), .IN3(mem[27]), .IN4(n170), .Q(n49) );
  AO22X1 U45 ( .IN1(n10), .IN2(n95), .IN3(mem[28]), .IN4(n170), .Q(n50) );
  AO22X1 U46 ( .IN1(n183), .IN2(n93), .IN3(mem[29]), .IN4(n169), .Q(n51) );
  AO22X1 U47 ( .IN1(n183), .IN2(n91), .IN3(mem[30]), .IN4(n169), .Q(n52) );
  AO22X1 U48 ( .IN1(n183), .IN2(n89), .IN3(mem[31]), .IN4(n169), .Q(n53) );
  AND2X1 U50 ( .IN1(we), .IN2(waddr[2]), .Q(n13) );
  AO22X1 U51 ( .IN1(n9), .IN2(n106), .IN3(mem[32]), .IN4(n168), .Q(n54) );
  AO22X1 U52 ( .IN1(n9), .IN2(n103), .IN3(mem[33]), .IN4(n168), .Q(n55) );
  AO22X1 U53 ( .IN1(n9), .IN2(n101), .IN3(mem[34]), .IN4(n168), .Q(n56) );
  AO22X1 U54 ( .IN1(n9), .IN2(n98), .IN3(mem[35]), .IN4(n168), .Q(n57) );
  AO22X1 U55 ( .IN1(n9), .IN2(n96), .IN3(mem[36]), .IN4(n168), .Q(n58) );
  AO22X1 U56 ( .IN1(n9), .IN2(n93), .IN3(mem[37]), .IN4(n167), .Q(n59) );
  AO22X1 U57 ( .IN1(n9), .IN2(n91), .IN3(mem[38]), .IN4(n167), .Q(n60) );
  AO22X1 U58 ( .IN1(n9), .IN2(n89), .IN3(mem[39]), .IN4(n167), .Q(n61) );
  AO22X1 U60 ( .IN1(n8), .IN2(n105), .IN3(mem[40]), .IN4(n166), .Q(n62) );
  AO22X1 U61 ( .IN1(n8), .IN2(n103), .IN3(mem[41]), .IN4(n166), .Q(n63) );
  AO22X1 U62 ( .IN1(n8), .IN2(n100), .IN3(mem[42]), .IN4(n166), .Q(n64) );
  AO22X1 U63 ( .IN1(n8), .IN2(n98), .IN3(mem[43]), .IN4(n166), .Q(n65) );
  AO22X1 U64 ( .IN1(n8), .IN2(n95), .IN3(mem[44]), .IN4(n166), .Q(n66) );
  AO22X1 U65 ( .IN1(n8), .IN2(n93), .IN3(mem[45]), .IN4(n165), .Q(n67) );
  AO22X1 U66 ( .IN1(n8), .IN2(n91), .IN3(mem[46]), .IN4(n165), .Q(n68) );
  AO22X1 U67 ( .IN1(n8), .IN2(n89), .IN3(mem[47]), .IN4(n165), .Q(n69) );
  AO22X1 U69 ( .IN1(n6), .IN2(n106), .IN3(mem[48]), .IN4(n164), .Q(n70) );
  AO22X1 U70 ( .IN1(n6), .IN2(n103), .IN3(mem[49]), .IN4(n164), .Q(n71) );
  AO22X1 U71 ( .IN1(n6), .IN2(n101), .IN3(mem[50]), .IN4(n164), .Q(n72) );
  AO22X1 U72 ( .IN1(n6), .IN2(n98), .IN3(mem[51]), .IN4(n164), .Q(n73) );
  AO22X1 U73 ( .IN1(n6), .IN2(n96), .IN3(mem[52]), .IN4(n164), .Q(n74) );
  AO22X1 U74 ( .IN1(n181), .IN2(n93), .IN3(mem[53]), .IN4(n163), .Q(n75) );
  AO22X1 U75 ( .IN1(n181), .IN2(n91), .IN3(mem[54]), .IN4(n163), .Q(n76) );
  AO22X1 U76 ( .IN1(n181), .IN2(n89), .IN3(mem[55]), .IN4(n163), .Q(n77) );
  AO22X1 U78 ( .IN1(n7), .IN2(n106), .IN3(mem[56]), .IN4(n162), .Q(n78) );
  AO22X1 U79 ( .IN1(n7), .IN2(wdata[1]), .IN3(mem[57]), .IN4(n162), .Q(n79) );
  AO22X1 U80 ( .IN1(n7), .IN2(n101), .IN3(mem[58]), .IN4(n162), .Q(n80) );
  AO22X1 U81 ( .IN1(n7), .IN2(wdata[3]), .IN3(mem[59]), .IN4(n162), .Q(n81) );
  AO22X1 U82 ( .IN1(n7), .IN2(n96), .IN3(mem[60]), .IN4(n162), .Q(n82) );
  AO22X1 U83 ( .IN1(n180), .IN2(n93), .IN3(mem[61]), .IN4(n161), .Q(n83) );
  AO22X1 U84 ( .IN1(n180), .IN2(n91), .IN3(mem[62]), .IN4(n161), .Q(n84) );
  AO22X1 U85 ( .IN1(n180), .IN2(n89), .IN3(mem[63]), .IN4(n161), .Q(n85) );
  AO22X2 U2 ( .IN1(n87), .IN2(n142), .IN3(n141), .IN4(n2), .Q(rdata[7]) );
  NBUFFX2 U3 ( .INP(n137), .Z(n160) );
  NBUFFX2 U4 ( .INP(n137), .Z(n150) );
  NBUFFX2 U5 ( .INP(n136), .Z(n158) );
  NBUFFX2 U6 ( .INP(n137), .Z(n151) );
  NBUFFX2 U7 ( .INP(n137), .Z(n159) );
  NAND3X1 U8 ( .IN1(n177), .IN2(n13), .IN3(waddr[1]), .QN(n12) );
  NAND3X1 U9 ( .IN1(n13), .IN2(n178), .IN3(waddr[1]), .QN(n14) );
  NAND3X0 U10 ( .IN1(n13), .IN2(n179), .IN3(n177), .QN(n15) );
  NAND3X0 U11 ( .IN1(n178), .IN2(n179), .IN3(n13), .QN(n16) );
  NAND3X0 U12 ( .IN1(n177), .IN2(n179), .IN3(n18), .QN(n20) );
  NAND3X0 U13 ( .IN1(n178), .IN2(n179), .IN3(n18), .QN(n21) );
  INVX0 U22 ( .INP(n145), .ZN(n1) );
  INVX0 U31 ( .INP(n1), .ZN(n2) );
  INVX0 U40 ( .INP(raddr[1]), .ZN(n3) );
  INVX0 U49 ( .INP(n3), .ZN(n4) );
  INVX0 U59 ( .INP(n15), .ZN(n5) );
  INVX0 U68 ( .INP(n20), .ZN(n6) );
  INVX0 U77 ( .INP(n21), .ZN(n7) );
  INVX0 U86 ( .INP(n19), .ZN(n8) );
  INVX0 U87 ( .INP(n17), .ZN(n9) );
  INVX0 U88 ( .INP(n16), .ZN(n10) );
  INVX0 U89 ( .INP(n14), .ZN(n11) );
  INVX0 U90 ( .INP(n12), .ZN(n86) );
  INVX0 U91 ( .INP(n145), .ZN(n87) );
  INVX0 U92 ( .INP(wdata[7]), .ZN(n88) );
  INVX0 U93 ( .INP(n88), .ZN(n89) );
  INVX0 U94 ( .INP(wdata[6]), .ZN(n90) );
  INVX0 U95 ( .INP(n90), .ZN(n91) );
  INVX0 U96 ( .INP(wdata[5]), .ZN(n92) );
  INVX0 U97 ( .INP(n92), .ZN(n93) );
  INVX0 U98 ( .INP(wdata[4]), .ZN(n94) );
  INVX0 U99 ( .INP(n94), .ZN(n95) );
  INVX0 U100 ( .INP(n94), .ZN(n96) );
  INVX0 U101 ( .INP(wdata[3]), .ZN(n97) );
  INVX0 U102 ( .INP(n97), .ZN(n98) );
  INVX0 U103 ( .INP(wdata[2]), .ZN(n99) );
  INVX0 U104 ( .INP(n99), .ZN(n100) );
  INVX0 U105 ( .INP(n99), .ZN(n101) );
  INVX0 U106 ( .INP(wdata[1]), .ZN(n102) );
  INVX0 U107 ( .INP(n102), .ZN(n103) );
  INVX0 U108 ( .INP(wdata[0]), .ZN(n104) );
  INVX0 U109 ( .INP(n104), .ZN(n105) );
  INVX0 U110 ( .INP(n104), .ZN(n106) );
  NBUFFX2 U111 ( .INP(n136), .Z(n157) );
  NBUFFX2 U112 ( .INP(n136), .Z(n152) );
  NBUFFX2 U113 ( .INP(n136), .Z(n153) );
  NAND3X4 U114 ( .IN1(waddr[1]), .IN2(n177), .IN3(n18), .QN(n17) );
  NAND3X4 U115 ( .IN1(waddr[1]), .IN2(n178), .IN3(n18), .QN(n19) );
  NBUFFX2 U116 ( .INP(n139), .Z(n149) );
  NBUFFX2 U117 ( .INP(n139), .Z(n148) );
  NBUFFX2 U118 ( .INP(n140), .Z(n146) );
  NBUFFX2 U119 ( .INP(n140), .Z(n147) );
  NBUFFX2 U120 ( .INP(n140), .Z(n155) );
  NBUFFX2 U121 ( .INP(n140), .Z(n154) );
  INVX0 U122 ( .INP(n171), .ZN(n184) );
  INVX0 U123 ( .INP(n163), .ZN(n181) );
  INVX0 U124 ( .INP(n169), .ZN(n183) );
  INVX0 U125 ( .INP(n161), .ZN(n180) );
  NBUFFX2 U126 ( .INP(n15), .Z(n171) );
  NBUFFX2 U127 ( .INP(n20), .Z(n163) );
  NBUFFX2 U128 ( .INP(n16), .Z(n169) );
  NBUFFX2 U129 ( .INP(n21), .Z(n161) );
  NBUFFX2 U130 ( .INP(n15), .Z(n172) );
  NBUFFX2 U131 ( .INP(n20), .Z(n164) );
  NBUFFX2 U132 ( .INP(n16), .Z(n170) );
  NBUFFX2 U133 ( .INP(n21), .Z(n162) );
  NBUFFX2 U134 ( .INP(n12), .Z(n175) );
  NBUFFX2 U135 ( .INP(n17), .Z(n167) );
  NBUFFX2 U136 ( .INP(n14), .Z(n173) );
  NBUFFX2 U137 ( .INP(n19), .Z(n165) );
  NBUFFX2 U138 ( .INP(n12), .Z(n176) );
  NBUFFX2 U139 ( .INP(n17), .Z(n168) );
  NBUFFX2 U140 ( .INP(n14), .Z(n174) );
  NBUFFX2 U141 ( .INP(n19), .Z(n166) );
  NOR2X0 U142 ( .IN1(n182), .IN2(waddr[2]), .QN(n18) );
  INVX0 U143 ( .INP(we), .ZN(n182) );
  AO22X1 U144 ( .IN1(mem[35]), .IN2(n150), .IN3(mem[51]), .IN4(n152), .Q(n119)
         );
  NOR2X0 U145 ( .IN1(n143), .IN2(n4), .QN(n140) );
  NOR2X0 U146 ( .IN1(n4), .IN2(n144), .QN(n136) );
  AO22X1 U147 ( .IN1(mem[32]), .IN2(n151), .IN3(mem[48]), .IN4(n153), .Q(n107)
         );
  AO221X1 U148 ( .IN1(mem[16]), .IN2(n147), .IN3(mem[0]), .IN4(n149), .IN5(
        n107), .Q(n110) );
  AO22X1 U149 ( .IN1(mem[40]), .IN2(n160), .IN3(mem[56]), .IN4(n158), .Q(n108)
         );
  AO221X1 U150 ( .IN1(mem[24]), .IN2(n147), .IN3(mem[8]), .IN4(n149), .IN5(
        n108), .Q(n109) );
  AO22X1 U151 ( .IN1(n110), .IN2(raddr[0]), .IN3(n109), .IN4(n145), .Q(
        rdata[0]) );
  AO22X1 U152 ( .IN1(mem[33]), .IN2(n151), .IN3(mem[49]), .IN4(n153), .Q(n111)
         );
  AO221X1 U153 ( .IN1(mem[17]), .IN2(n154), .IN3(mem[1]), .IN4(n149), .IN5(
        n111), .Q(n114) );
  AO22X1 U154 ( .IN1(mem[41]), .IN2(n159), .IN3(mem[57]), .IN4(n152), .Q(n112)
         );
  AO221X1 U155 ( .IN1(mem[25]), .IN2(n154), .IN3(mem[9]), .IN4(n149), .IN5(
        n112), .Q(n113) );
  AO22X1 U156 ( .IN1(n114), .IN2(n1), .IN3(n113), .IN4(n2), .Q(rdata[1]) );
  AO22X1 U157 ( .IN1(mem[34]), .IN2(n159), .IN3(mem[50]), .IN4(n157), .Q(n115)
         );
  AO221X1 U158 ( .IN1(mem[18]), .IN2(n146), .IN3(mem[2]), .IN4(n149), .IN5(
        n115), .Q(n118) );
  AO22X1 U159 ( .IN1(mem[42]), .IN2(n160), .IN3(mem[58]), .IN4(n153), .Q(n116)
         );
  AO221X1 U160 ( .IN1(mem[26]), .IN2(n146), .IN3(mem[10]), .IN4(n149), .IN5(
        n116), .Q(n117) );
  AO22X1 U161 ( .IN1(n118), .IN2(n87), .IN3(n117), .IN4(n145), .Q(rdata[2]) );
  AO221X1 U162 ( .IN1(mem[19]), .IN2(n155), .IN3(mem[3]), .IN4(n156), .IN5(
        n119), .Q(n122) );
  AO22X1 U163 ( .IN1(mem[43]), .IN2(n150), .IN3(mem[59]), .IN4(n157), .Q(n120)
         );
  AO221X1 U164 ( .IN1(mem[27]), .IN2(n155), .IN3(mem[11]), .IN4(n148), .IN5(
        n120), .Q(n121) );
  AO22X1 U165 ( .IN1(n122), .IN2(n87), .IN3(n121), .IN4(n145), .Q(rdata[3]) );
  AO22X1 U166 ( .IN1(mem[36]), .IN2(n159), .IN3(mem[52]), .IN4(n157), .Q(n123)
         );
  AO221X1 U167 ( .IN1(mem[20]), .IN2(n154), .IN3(mem[4]), .IN4(n156), .IN5(
        n123), .Q(n126) );
  AO22X1 U168 ( .IN1(mem[44]), .IN2(n160), .IN3(mem[60]), .IN4(n158), .Q(n124)
         );
  AO221X1 U169 ( .IN1(mem[28]), .IN2(n154), .IN3(mem[12]), .IN4(n148), .IN5(
        n124), .Q(n125) );
  AO22X1 U170 ( .IN1(n126), .IN2(n87), .IN3(n125), .IN4(n2), .Q(rdata[4]) );
  AO22X1 U171 ( .IN1(mem[37]), .IN2(n160), .IN3(mem[53]), .IN4(n158), .Q(n127)
         );
  AO221X1 U172 ( .IN1(mem[21]), .IN2(n147), .IN3(mem[5]), .IN4(n156), .IN5(
        n127), .Q(n130) );
  AO22X1 U173 ( .IN1(mem[45]), .IN2(n150), .IN3(mem[61]), .IN4(n152), .Q(n128)
         );
  AO221X1 U174 ( .IN1(mem[29]), .IN2(n146), .IN3(mem[13]), .IN4(n148), .IN5(
        n128), .Q(n129) );
  AO22X1 U175 ( .IN1(n130), .IN2(n87), .IN3(n129), .IN4(n2), .Q(rdata[5]) );
  AO22X1 U176 ( .IN1(mem[38]), .IN2(n150), .IN3(mem[54]), .IN4(n152), .Q(n131)
         );
  AO221X1 U177 ( .IN1(mem[22]), .IN2(n147), .IN3(mem[6]), .IN4(n156), .IN5(
        n131), .Q(n134) );
  AO22X1 U178 ( .IN1(mem[46]), .IN2(n151), .IN3(mem[62]), .IN4(n153), .Q(n132)
         );
  AO221X1 U179 ( .IN1(mem[30]), .IN2(n155), .IN3(mem[14]), .IN4(n148), .IN5(
        n132), .Q(n133) );
  AO22X1 U180 ( .IN1(n134), .IN2(n87), .IN3(n133), .IN4(n2), .Q(rdata[6]) );
  AO22X1 U181 ( .IN1(mem[39]), .IN2(n151), .IN3(mem[55]), .IN4(n158), .Q(n135)
         );
  AO221X1 U182 ( .IN1(mem[23]), .IN2(n155), .IN3(mem[7]), .IN4(n156), .IN5(
        n135), .Q(n142) );
  AO22X1 U183 ( .IN1(mem[47]), .IN2(n159), .IN3(mem[63]), .IN4(n157), .Q(n138)
         );
  AO221X1 U184 ( .IN1(mem[31]), .IN2(n146), .IN3(mem[15]), .IN4(n148), .IN5(
        n138), .Q(n141) );
  INVX0 U185 ( .INP(raddr[2]), .ZN(n143) );
  INVX0 U186 ( .INP(n143), .ZN(n144) );
  INVX0 U187 ( .INP(raddr[0]), .ZN(n145) );
  NOR2X0 U188 ( .IN1(n143), .IN2(n3), .QN(n139) );
  NOR2X0 U189 ( .IN1(n3), .IN2(n144), .QN(n137) );
  NOR2X0 U190 ( .IN1(n143), .IN2(n3), .QN(n156) );
  INVX0 U191 ( .INP(n178), .ZN(n177) );
  INVX0 U192 ( .INP(waddr[0]), .ZN(n178) );
  INVX0 U193 ( .INP(waddr[1]), .ZN(n179) );
endmodule


module payload_ram_bank8x8_14 ( clk, we, waddr, wdata, raddr, rdata );
  input [2:0] waddr;
  input [7:0] wdata;
  input [2:0] raddr;
  output [7:0] rdata;
  input clk, we;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246,
         n247, n248, n249, n250, n251, n252, n253, n254, n255, n256, n257,
         n258, n259, n260, n261, n262, n263, n264;
  wire   [63:0] mem;

  DFFX1 mem_reg_0__7_ ( .D(n191), .CLK(clk), .Q(mem[63]) );
  DFFX1 mem_reg_0__6_ ( .D(n192), .CLK(clk), .Q(mem[62]) );
  DFFX1 mem_reg_0__5_ ( .D(n193), .CLK(clk), .Q(mem[61]) );
  DFFX1 mem_reg_0__4_ ( .D(n194), .CLK(clk), .Q(mem[60]) );
  DFFX1 mem_reg_0__3_ ( .D(n195), .CLK(clk), .Q(mem[59]) );
  DFFX1 mem_reg_0__2_ ( .D(n196), .CLK(clk), .Q(mem[58]) );
  DFFX1 mem_reg_0__1_ ( .D(n197), .CLK(clk), .Q(mem[57]) );
  DFFX1 mem_reg_0__0_ ( .D(n198), .CLK(clk), .Q(mem[56]) );
  DFFX1 mem_reg_1__7_ ( .D(n199), .CLK(clk), .Q(mem[55]) );
  DFFX1 mem_reg_1__6_ ( .D(n200), .CLK(clk), .Q(mem[54]) );
  DFFX1 mem_reg_1__5_ ( .D(n201), .CLK(clk), .Q(mem[53]) );
  DFFX1 mem_reg_1__4_ ( .D(n202), .CLK(clk), .Q(mem[52]) );
  DFFX1 mem_reg_1__3_ ( .D(n203), .CLK(clk), .Q(mem[51]) );
  DFFX1 mem_reg_1__2_ ( .D(n204), .CLK(clk), .Q(mem[50]) );
  DFFX1 mem_reg_1__1_ ( .D(n205), .CLK(clk), .Q(mem[49]) );
  DFFX1 mem_reg_1__0_ ( .D(n206), .CLK(clk), .Q(mem[48]) );
  DFFX1 mem_reg_2__7_ ( .D(n207), .CLK(clk), .Q(mem[47]) );
  DFFX1 mem_reg_2__6_ ( .D(n208), .CLK(clk), .Q(mem[46]) );
  DFFX1 mem_reg_2__5_ ( .D(n209), .CLK(clk), .Q(mem[45]) );
  DFFX1 mem_reg_2__4_ ( .D(n210), .CLK(clk), .Q(mem[44]) );
  DFFX1 mem_reg_2__3_ ( .D(n211), .CLK(clk), .Q(mem[43]) );
  DFFX1 mem_reg_2__2_ ( .D(n212), .CLK(clk), .Q(mem[42]) );
  DFFX1 mem_reg_2__1_ ( .D(n213), .CLK(clk), .Q(mem[41]) );
  DFFX1 mem_reg_2__0_ ( .D(n214), .CLK(clk), .Q(mem[40]) );
  DFFX1 mem_reg_3__7_ ( .D(n215), .CLK(clk), .Q(mem[39]) );
  DFFX1 mem_reg_3__6_ ( .D(n216), .CLK(clk), .Q(mem[38]) );
  DFFX1 mem_reg_3__5_ ( .D(n217), .CLK(clk), .Q(mem[37]) );
  DFFX1 mem_reg_3__4_ ( .D(n218), .CLK(clk), .Q(mem[36]) );
  DFFX1 mem_reg_3__3_ ( .D(n219), .CLK(clk), .Q(mem[35]) );
  DFFX1 mem_reg_3__2_ ( .D(n220), .CLK(clk), .Q(mem[34]) );
  DFFX1 mem_reg_3__1_ ( .D(n221), .CLK(clk), .Q(mem[33]) );
  DFFX1 mem_reg_3__0_ ( .D(n222), .CLK(clk), .Q(mem[32]), .QN(n6) );
  DFFX1 mem_reg_4__7_ ( .D(n223), .CLK(clk), .Q(mem[31]) );
  DFFX1 mem_reg_4__6_ ( .D(n224), .CLK(clk), .Q(mem[30]) );
  DFFX1 mem_reg_4__5_ ( .D(n225), .CLK(clk), .Q(mem[29]) );
  DFFX1 mem_reg_4__4_ ( .D(n226), .CLK(clk), .Q(mem[28]) );
  DFFX1 mem_reg_4__3_ ( .D(n227), .CLK(clk), .Q(mem[27]) );
  DFFX1 mem_reg_4__2_ ( .D(n228), .CLK(clk), .Q(mem[26]) );
  DFFX1 mem_reg_4__1_ ( .D(n229), .CLK(clk), .Q(mem[25]) );
  DFFX1 mem_reg_4__0_ ( .D(n230), .CLK(clk), .Q(mem[24]) );
  DFFX1 mem_reg_5__7_ ( .D(n231), .CLK(clk), .Q(mem[23]) );
  DFFX1 mem_reg_5__6_ ( .D(n232), .CLK(clk), .Q(mem[22]) );
  DFFX1 mem_reg_5__5_ ( .D(n233), .CLK(clk), .Q(mem[21]) );
  DFFX1 mem_reg_5__4_ ( .D(n234), .CLK(clk), .Q(mem[20]) );
  DFFX1 mem_reg_5__3_ ( .D(n235), .CLK(clk), .Q(mem[19]) );
  DFFX1 mem_reg_5__2_ ( .D(n236), .CLK(clk), .Q(mem[18]) );
  DFFX1 mem_reg_5__1_ ( .D(n237), .CLK(clk), .Q(mem[17]) );
  DFFX1 mem_reg_5__0_ ( .D(n238), .CLK(clk), .Q(mem[16]) );
  DFFX1 mem_reg_6__7_ ( .D(n239), .CLK(clk), .Q(mem[15]) );
  DFFX1 mem_reg_6__6_ ( .D(n240), .CLK(clk), .Q(mem[14]) );
  DFFX1 mem_reg_6__5_ ( .D(n241), .CLK(clk), .Q(mem[13]) );
  DFFX1 mem_reg_6__4_ ( .D(n242), .CLK(clk), .Q(mem[12]) );
  DFFX1 mem_reg_6__3_ ( .D(n243), .CLK(clk), .Q(mem[11]) );
  DFFX1 mem_reg_6__2_ ( .D(n244), .CLK(clk), .Q(mem[10]) );
  DFFX1 mem_reg_6__1_ ( .D(n245), .CLK(clk), .Q(mem[9]) );
  DFFX1 mem_reg_6__0_ ( .D(n246), .CLK(clk), .Q(mem[8]) );
  DFFX1 mem_reg_7__7_ ( .D(n247), .CLK(clk), .Q(mem[7]) );
  DFFX1 mem_reg_7__6_ ( .D(n248), .CLK(clk), .Q(mem[6]) );
  DFFX1 mem_reg_7__5_ ( .D(n249), .CLK(clk), .Q(mem[5]) );
  DFFX1 mem_reg_7__4_ ( .D(n250), .CLK(clk), .Q(mem[4]) );
  DFFX1 mem_reg_7__3_ ( .D(n251), .CLK(clk), .Q(mem[3]) );
  DFFX1 mem_reg_7__2_ ( .D(n252), .CLK(clk), .Q(mem[2]) );
  DFFX1 mem_reg_7__1_ ( .D(n253), .CLK(clk), .Q(mem[1]) );
  DFFX1 mem_reg_7__0_ ( .D(n254), .CLK(clk), .Q(mem[0]) );
  AO22X1 U14 ( .IN1(wdata[0]), .IN2(n163), .IN3(mem[0]), .IN4(n179), .Q(n254)
         );
  AO22X1 U15 ( .IN1(wdata[1]), .IN2(n190), .IN3(mem[1]), .IN4(n179), .Q(n253)
         );
  AO22X1 U16 ( .IN1(wdata[2]), .IN2(n190), .IN3(mem[2]), .IN4(n179), .Q(n252)
         );
  AO22X1 U17 ( .IN1(wdata[3]), .IN2(n163), .IN3(mem[3]), .IN4(n179), .Q(n251)
         );
  AO22X1 U18 ( .IN1(wdata[4]), .IN2(n190), .IN3(mem[4]), .IN4(n179), .Q(n250)
         );
  AO22X1 U19 ( .IN1(wdata[5]), .IN2(n163), .IN3(mem[5]), .IN4(n178), .Q(n249)
         );
  AO22X1 U20 ( .IN1(wdata[6]), .IN2(n190), .IN3(mem[6]), .IN4(n178), .Q(n248)
         );
  AO22X1 U21 ( .IN1(wdata[7]), .IN2(n163), .IN3(mem[7]), .IN4(n178), .Q(n247)
         );
  AO22X1 U23 ( .IN1(n162), .IN2(wdata[0]), .IN3(mem[8]), .IN4(n177), .Q(n246)
         );
  AO22X1 U24 ( .IN1(n189), .IN2(wdata[1]), .IN3(mem[9]), .IN4(n177), .Q(n245)
         );
  AO22X1 U25 ( .IN1(n189), .IN2(wdata[2]), .IN3(mem[10]), .IN4(n177), .Q(n244)
         );
  AO22X1 U26 ( .IN1(n162), .IN2(wdata[3]), .IN3(mem[11]), .IN4(n177), .Q(n243)
         );
  AO22X1 U27 ( .IN1(n189), .IN2(wdata[4]), .IN3(mem[12]), .IN4(n177), .Q(n242)
         );
  AO22X1 U28 ( .IN1(n162), .IN2(wdata[5]), .IN3(mem[13]), .IN4(n176), .Q(n241)
         );
  AO22X1 U29 ( .IN1(n189), .IN2(n91), .IN3(mem[14]), .IN4(n176), .Q(n240) );
  AO22X1 U30 ( .IN1(n162), .IN2(wdata[7]), .IN3(mem[15]), .IN4(n176), .Q(n239)
         );
  AO22X1 U32 ( .IN1(n157), .IN2(n103), .IN3(mem[16]), .IN4(n175), .Q(n238) );
  AO22X1 U33 ( .IN1(n157), .IN2(n101), .IN3(mem[17]), .IN4(n175), .Q(n237) );
  AO22X1 U34 ( .IN1(n157), .IN2(n99), .IN3(mem[18]), .IN4(n175), .Q(n236) );
  AO22X1 U35 ( .IN1(n158), .IN2(n97), .IN3(mem[19]), .IN4(n175), .Q(n235) );
  AO22X1 U36 ( .IN1(n157), .IN2(n95), .IN3(mem[20]), .IN4(n175), .Q(n234) );
  AO22X1 U37 ( .IN1(n158), .IN2(n93), .IN3(mem[21]), .IN4(n174), .Q(n233) );
  AO22X1 U38 ( .IN1(n157), .IN2(n91), .IN3(mem[22]), .IN4(n174), .Q(n232) );
  AO22X1 U39 ( .IN1(n158), .IN2(n90), .IN3(mem[23]), .IN4(n174), .Q(n231) );
  AO22X1 U41 ( .IN1(n188), .IN2(n103), .IN3(mem[24]), .IN4(n173), .Q(n230) );
  AO22X1 U42 ( .IN1(n161), .IN2(n101), .IN3(mem[25]), .IN4(n173), .Q(n229) );
  AO22X1 U43 ( .IN1(n188), .IN2(n99), .IN3(mem[26]), .IN4(n173), .Q(n228) );
  AO22X1 U44 ( .IN1(n161), .IN2(n97), .IN3(mem[27]), .IN4(n173), .Q(n227) );
  AO22X1 U45 ( .IN1(n188), .IN2(n95), .IN3(mem[28]), .IN4(n173), .Q(n226) );
  AO22X1 U46 ( .IN1(n161), .IN2(n93), .IN3(mem[29]), .IN4(n172), .Q(n225) );
  AO22X1 U47 ( .IN1(n188), .IN2(n91), .IN3(mem[30]), .IN4(n172), .Q(n224) );
  AO22X1 U48 ( .IN1(n161), .IN2(n90), .IN3(mem[31]), .IN4(n172), .Q(n223) );
  AND2X1 U50 ( .IN1(we), .IN2(waddr[2]), .Q(n263) );
  AO22X1 U51 ( .IN1(n186), .IN2(n103), .IN3(mem[32]), .IN4(n171), .Q(n222) );
  AO22X1 U52 ( .IN1(n156), .IN2(n101), .IN3(mem[33]), .IN4(n171), .Q(n221) );
  AO22X1 U53 ( .IN1(n186), .IN2(n99), .IN3(mem[34]), .IN4(n171), .Q(n220) );
  AO22X1 U54 ( .IN1(n156), .IN2(n97), .IN3(mem[35]), .IN4(n171), .Q(n219) );
  AO22X1 U55 ( .IN1(n186), .IN2(n95), .IN3(mem[36]), .IN4(n171), .Q(n218) );
  AO22X1 U56 ( .IN1(n156), .IN2(n93), .IN3(mem[37]), .IN4(n170), .Q(n217) );
  AO22X1 U57 ( .IN1(n186), .IN2(n91), .IN3(mem[38]), .IN4(n170), .Q(n216) );
  AO22X1 U58 ( .IN1(n156), .IN2(n90), .IN3(mem[39]), .IN4(n170), .Q(n215) );
  AO22X1 U60 ( .IN1(n185), .IN2(n103), .IN3(mem[40]), .IN4(n169), .Q(n214) );
  AO22X1 U61 ( .IN1(n155), .IN2(n101), .IN3(mem[41]), .IN4(n169), .Q(n213) );
  AO22X1 U62 ( .IN1(n185), .IN2(n99), .IN3(mem[42]), .IN4(n169), .Q(n212) );
  AO22X1 U63 ( .IN1(n155), .IN2(n97), .IN3(mem[43]), .IN4(n169), .Q(n211) );
  AO22X1 U64 ( .IN1(n185), .IN2(n95), .IN3(mem[44]), .IN4(n169), .Q(n210) );
  AO22X1 U65 ( .IN1(n155), .IN2(n93), .IN3(mem[45]), .IN4(n168), .Q(n209) );
  AO22X1 U66 ( .IN1(n185), .IN2(n91), .IN3(mem[46]), .IN4(n168), .Q(n208) );
  AO22X1 U67 ( .IN1(n155), .IN2(n90), .IN3(mem[47]), .IN4(n168), .Q(n207) );
  AO22X1 U69 ( .IN1(n184), .IN2(n103), .IN3(mem[48]), .IN4(n167), .Q(n206) );
  AO22X1 U70 ( .IN1(n160), .IN2(n101), .IN3(mem[49]), .IN4(n167), .Q(n205) );
  AO22X1 U71 ( .IN1(n184), .IN2(n99), .IN3(mem[50]), .IN4(n167), .Q(n204) );
  AO22X1 U72 ( .IN1(n160), .IN2(n97), .IN3(mem[51]), .IN4(n167), .Q(n203) );
  AO22X1 U73 ( .IN1(n184), .IN2(n95), .IN3(mem[52]), .IN4(n167), .Q(n202) );
  AO22X1 U74 ( .IN1(n160), .IN2(n93), .IN3(mem[53]), .IN4(n166), .Q(n201) );
  AO22X1 U75 ( .IN1(n184), .IN2(n91), .IN3(mem[54]), .IN4(n166), .Q(n200) );
  AO22X1 U76 ( .IN1(n160), .IN2(n90), .IN3(mem[55]), .IN4(n166), .Q(n199) );
  AO22X1 U78 ( .IN1(n183), .IN2(n103), .IN3(mem[56]), .IN4(n165), .Q(n198) );
  AO22X1 U79 ( .IN1(n159), .IN2(n101), .IN3(mem[57]), .IN4(n165), .Q(n197) );
  AO22X1 U80 ( .IN1(n183), .IN2(n99), .IN3(mem[58]), .IN4(n165), .Q(n196) );
  AO22X1 U81 ( .IN1(n159), .IN2(n97), .IN3(mem[59]), .IN4(n165), .Q(n195) );
  AO22X1 U82 ( .IN1(n183), .IN2(n95), .IN3(mem[60]), .IN4(n165), .Q(n194) );
  AO22X1 U83 ( .IN1(n159), .IN2(n93), .IN3(mem[61]), .IN4(n164), .Q(n193) );
  AO22X1 U84 ( .IN1(n183), .IN2(n91), .IN3(mem[62]), .IN4(n164), .Q(n192) );
  AO22X1 U85 ( .IN1(n159), .IN2(n90), .IN3(mem[63]), .IN4(n164), .Q(n191) );
  NBUFFX2 U2 ( .INP(n87), .Z(n86) );
  NOR2X0 U3 ( .IN1(n86), .IN2(n140), .QN(n133) );
  NBUFFX2 U4 ( .INP(n132), .Z(n148) );
  NBUFFX2 U5 ( .INP(n132), .Z(n9) );
  NBUFFX2 U6 ( .INP(n132), .Z(n149) );
  NBUFFX2 U7 ( .INP(n133), .Z(n146) );
  NBUFFX2 U8 ( .INP(wdata[6]), .Z(n91) );
  NAND3X1 U9 ( .IN1(waddr[1]), .IN2(n181), .IN3(n258), .QN(n257) );
  NAND3X0 U10 ( .IN1(n181), .IN2(n182), .IN3(n258), .QN(n255) );
  NAND3X0 U11 ( .IN1(n180), .IN2(n182), .IN3(n258), .QN(n256) );
  NAND3X0 U12 ( .IN1(n181), .IN2(n182), .IN3(n263), .QN(n260) );
  NAND3X0 U13 ( .IN1(waddr[1]), .IN2(n180), .IN3(n258), .QN(n259) );
  NAND3X0 U22 ( .IN1(n180), .IN2(n263), .IN3(waddr[1]), .QN(n264) );
  AND2X1 U31 ( .IN1(n2), .IN2(n11), .Q(n1) );
  NAND2X0 U40 ( .IN1(mem[0]), .IN2(n145), .QN(n8) );
  NAND2X0 U49 ( .IN1(n88), .IN2(n3), .QN(n2) );
  NOR2X0 U59 ( .IN1(n140), .IN2(n6), .QN(n3) );
  NBUFFX4 U68 ( .INP(n136), .Z(n4) );
  NBUFFX4 U77 ( .INP(n136), .Z(n5) );
  NBUFFX4 U86 ( .INP(n136), .Z(n141) );
  NAND2X0 U87 ( .IN1(mem[16]), .IN2(n141), .QN(n7) );
  NAND3X0 U88 ( .IN1(n7), .IN2(n8), .IN3(n1), .QN(n106) );
  NBUFFX4 U89 ( .INP(n135), .Z(n145) );
  NBUFFX4 U90 ( .INP(n136), .Z(n142) );
  NBUFFX4 U91 ( .INP(n133), .Z(n147) );
  NBUFFX4 U92 ( .INP(n132), .Z(n10) );
  NAND2X0 U93 ( .IN1(mem[48]), .IN2(n148), .QN(n11) );
  INVX0 U94 ( .INP(raddr[1]), .ZN(n87) );
  INVX0 U95 ( .INP(n87), .ZN(n88) );
  INVX0 U96 ( .INP(wdata[7]), .ZN(n89) );
  INVX0 U97 ( .INP(n89), .ZN(n90) );
  INVX0 U98 ( .INP(wdata[5]), .ZN(n92) );
  INVX0 U99 ( .INP(n92), .ZN(n93) );
  INVX0 U100 ( .INP(wdata[4]), .ZN(n94) );
  INVX0 U101 ( .INP(n94), .ZN(n95) );
  INVX0 U102 ( .INP(wdata[3]), .ZN(n96) );
  INVX0 U103 ( .INP(n96), .ZN(n97) );
  INVX0 U104 ( .INP(wdata[2]), .ZN(n98) );
  INVX0 U105 ( .INP(n98), .ZN(n99) );
  INVX0 U106 ( .INP(wdata[1]), .ZN(n100) );
  INVX0 U107 ( .INP(n100), .ZN(n101) );
  INVX0 U108 ( .INP(wdata[0]), .ZN(n102) );
  INVX0 U109 ( .INP(n102), .ZN(n103) );
  NAND3X1 U110 ( .IN1(n263), .IN2(n181), .IN3(waddr[1]), .QN(n262) );
  INVX0 U111 ( .INP(n166), .ZN(n184) );
  INVX0 U112 ( .INP(n164), .ZN(n183) );
  INVX0 U113 ( .INP(n172), .ZN(n188) );
  NBUFFX2 U114 ( .INP(n135), .Z(n143) );
  NBUFFX2 U115 ( .INP(n135), .Z(n144) );
  INVX0 U116 ( .INP(n178), .ZN(n190) );
  INVX0 U117 ( .INP(n176), .ZN(n189) );
  NBUFFX2 U118 ( .INP(n261), .Z(n175) );
  INVX0 U119 ( .INP(n170), .ZN(n186) );
  INVX0 U120 ( .INP(n168), .ZN(n185) );
  NBUFFX2 U121 ( .INP(n256), .Z(n166) );
  NBUFFX2 U122 ( .INP(n255), .Z(n164) );
  NBUFFX2 U123 ( .INP(n260), .Z(n172) );
  NBUFFX2 U124 ( .INP(n261), .Z(n174) );
  NBUFFX2 U125 ( .INP(n260), .Z(n173) );
  NBUFFX2 U126 ( .INP(n256), .Z(n167) );
  NBUFFX2 U127 ( .INP(n255), .Z(n165) );
  NBUFFX2 U128 ( .INP(n264), .Z(n178) );
  NBUFFX2 U129 ( .INP(n264), .Z(n179) );
  NBUFFX2 U130 ( .INP(n262), .Z(n177) );
  NBUFFX2 U131 ( .INP(n262), .Z(n176) );
  NAND3X0 U132 ( .IN1(n263), .IN2(n182), .IN3(n180), .QN(n261) );
  NBUFFX2 U133 ( .INP(n259), .Z(n170) );
  NBUFFX2 U134 ( .INP(n257), .Z(n168) );
  NBUFFX2 U135 ( .INP(n259), .Z(n171) );
  NBUFFX2 U136 ( .INP(n257), .Z(n169) );
  NOR2X0 U137 ( .IN1(n187), .IN2(waddr[2]), .QN(n258) );
  INVX0 U138 ( .INP(we), .ZN(n187) );
  NOR2X0 U139 ( .IN1(n88), .IN2(n139), .QN(n136) );
  NOR2X0 U140 ( .IN1(n88), .IN2(n140), .QN(n132) );
  AO22X1 U141 ( .IN1(mem[40]), .IN2(n147), .IN3(mem[56]), .IN4(n149), .Q(n104)
         );
  AO221X1 U142 ( .IN1(mem[24]), .IN2(n141), .IN3(mem[8]), .IN4(n145), .IN5(
        n104), .Q(n105) );
  AO22X1 U143 ( .IN1(n106), .IN2(n152), .IN3(n105), .IN4(n151), .Q(rdata[0])
         );
  AO22X1 U144 ( .IN1(mem[33]), .IN2(n147), .IN3(mem[49]), .IN4(n10), .Q(n107)
         );
  AO221X1 U145 ( .IN1(mem[17]), .IN2(n4), .IN3(mem[1]), .IN4(n145), .IN5(n107),
        .Q(n110) );
  AO22X1 U146 ( .IN1(mem[41]), .IN2(n147), .IN3(mem[57]), .IN4(n10), .Q(n108)
         );
  AO221X1 U147 ( .IN1(mem[25]), .IN2(n142), .IN3(mem[9]), .IN4(n145), .IN5(
        n108), .Q(n109) );
  AO22X1 U148 ( .IN1(n110), .IN2(n153), .IN3(n109), .IN4(n151), .Q(rdata[1])
         );
  AO22X1 U149 ( .IN1(mem[34]), .IN2(n147), .IN3(mem[50]), .IN4(n9), .Q(n111)
         );
  AO221X1 U150 ( .IN1(mem[18]), .IN2(n5), .IN3(mem[2]), .IN4(n145), .IN5(n111),
        .Q(n114) );
  AO22X1 U151 ( .IN1(mem[42]), .IN2(n147), .IN3(mem[58]), .IN4(n9), .Q(n112)
         );
  AO221X1 U152 ( .IN1(mem[26]), .IN2(n4), .IN3(mem[10]), .IN4(n145), .IN5(n112), .Q(n113) );
  AO22X1 U153 ( .IN1(n114), .IN2(n152), .IN3(n113), .IN4(n151), .Q(rdata[2])
         );
  AO22X1 U154 ( .IN1(mem[35]), .IN2(n147), .IN3(mem[51]), .IN4(n149), .Q(n115)
         );
  AO221X1 U155 ( .IN1(mem[19]), .IN2(n142), .IN3(mem[3]), .IN4(n143), .IN5(
        n115), .Q(n118) );
  AO22X1 U156 ( .IN1(mem[43]), .IN2(n147), .IN3(mem[59]), .IN4(n149), .Q(n116)
         );
  AO221X1 U157 ( .IN1(mem[27]), .IN2(n5), .IN3(mem[11]), .IN4(n144), .IN5(n116), .Q(n117) );
  AO22X1 U158 ( .IN1(n118), .IN2(n152), .IN3(n117), .IN4(n150), .Q(rdata[3])
         );
  AO22X1 U159 ( .IN1(mem[36]), .IN2(n146), .IN3(mem[52]), .IN4(n148), .Q(n119)
         );
  AO221X1 U160 ( .IN1(mem[20]), .IN2(n4), .IN3(mem[4]), .IN4(n143), .IN5(n119),
        .Q(n122) );
  AO22X1 U161 ( .IN1(mem[44]), .IN2(n146), .IN3(mem[60]), .IN4(n148), .Q(n120)
         );
  AO221X1 U162 ( .IN1(mem[28]), .IN2(n142), .IN3(mem[12]), .IN4(n144), .IN5(
        n120), .Q(n121) );
  AO22X1 U163 ( .IN1(n122), .IN2(n152), .IN3(n121), .IN4(n150), .Q(rdata[4])
         );
  AO22X1 U164 ( .IN1(mem[37]), .IN2(n146), .IN3(mem[53]), .IN4(n148), .Q(n123)
         );
  AO221X1 U165 ( .IN1(mem[21]), .IN2(n5), .IN3(mem[5]), .IN4(n143), .IN5(n123),
        .Q(n126) );
  AO22X1 U166 ( .IN1(mem[45]), .IN2(n146), .IN3(mem[61]), .IN4(n10), .Q(n124)
         );
  AO221X1 U167 ( .IN1(mem[29]), .IN2(n5), .IN3(mem[13]), .IN4(n144), .IN5(n124), .Q(n125) );
  AO22X1 U168 ( .IN1(n126), .IN2(n153), .IN3(n125), .IN4(n150), .Q(rdata[5])
         );
  AO22X1 U169 ( .IN1(mem[38]), .IN2(n146), .IN3(mem[54]), .IN4(n10), .Q(n127)
         );
  AO221X1 U170 ( .IN1(mem[22]), .IN2(n141), .IN3(mem[6]), .IN4(n143), .IN5(
        n127), .Q(n130) );
  AO22X1 U171 ( .IN1(mem[46]), .IN2(n146), .IN3(mem[62]), .IN4(n9), .Q(n128)
         );
  AO221X1 U172 ( .IN1(mem[30]), .IN2(n142), .IN3(mem[14]), .IN4(n144), .IN5(
        n128), .Q(n129) );
  AO22X1 U173 ( .IN1(n130), .IN2(n152), .IN3(n129), .IN4(n151), .Q(rdata[6])
         );
  AO22X1 U174 ( .IN1(mem[39]), .IN2(n146), .IN3(mem[55]), .IN4(n9), .Q(n131)
         );
  AO221X1 U175 ( .IN1(mem[23]), .IN2(n141), .IN3(mem[7]), .IN4(n143), .IN5(
        n131), .Q(n138) );
  AO22X1 U176 ( .IN1(mem[47]), .IN2(n146), .IN3(mem[63]), .IN4(n149), .Q(n134)
         );
  AO221X1 U177 ( .IN1(mem[31]), .IN2(n4), .IN3(mem[15]), .IN4(n144), .IN5(n134), .Q(n137) );
  AO22X1 U178 ( .IN1(n152), .IN2(n138), .IN3(n137), .IN4(n150), .Q(rdata[7])
         );
  INVX0 U179 ( .INP(raddr[2]), .ZN(n139) );
  INVX0 U180 ( .INP(n139), .ZN(n140) );
  NOR2X0 U181 ( .IN1(n139), .IN2(n86), .QN(n135) );
  INVX0 U182 ( .INP(n153), .ZN(n150) );
  INVX0 U183 ( .INP(n153), .ZN(n151) );
  INVX0 U184 ( .INP(n154), .ZN(n152) );
  INVX0 U185 ( .INP(n154), .ZN(n153) );
  INVX0 U186 ( .INP(raddr[0]), .ZN(n154) );
  INVX0 U187 ( .INP(n168), .ZN(n155) );
  INVX0 U188 ( .INP(n170), .ZN(n156) );
  INVX0 U189 ( .INP(n261), .ZN(n157) );
  INVX0 U190 ( .INP(n174), .ZN(n158) );
  INVX0 U191 ( .INP(n164), .ZN(n159) );
  INVX0 U192 ( .INP(n166), .ZN(n160) );
  INVX0 U193 ( .INP(n172), .ZN(n161) );
  INVX0 U194 ( .INP(n176), .ZN(n162) );
  INVX0 U195 ( .INP(n178), .ZN(n163) );
  INVX0 U196 ( .INP(n181), .ZN(n180) );
  INVX0 U197 ( .INP(waddr[0]), .ZN(n181) );
  INVX0 U198 ( .INP(waddr[1]), .ZN(n182) );
endmodule


module payload_ram_bank8x8_13 ( clk, we, waddr, wdata, raddr, rdata );
  input [2:0] waddr;
  input [7:0] wdata;
  input [2:0] raddr;
  output [7:0] rdata;
  input clk, we;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235;
  wire   [63:0] mem;

  DFFX1 mem_reg_0__7_ ( .D(n162), .CLK(clk), .Q(mem[63]) );
  DFFX1 mem_reg_0__6_ ( .D(n163), .CLK(clk), .Q(mem[62]) );
  DFFX1 mem_reg_0__5_ ( .D(n164), .CLK(clk), .Q(mem[61]) );
  DFFX1 mem_reg_0__4_ ( .D(n165), .CLK(clk), .Q(mem[60]) );
  DFFX1 mem_reg_0__3_ ( .D(n166), .CLK(clk), .Q(mem[59]) );
  DFFX1 mem_reg_0__2_ ( .D(n167), .CLK(clk), .Q(mem[58]) );
  DFFX1 mem_reg_0__1_ ( .D(n168), .CLK(clk), .Q(mem[57]) );
  DFFX1 mem_reg_0__0_ ( .D(n169), .CLK(clk), .Q(mem[56]) );
  DFFX1 mem_reg_1__7_ ( .D(n170), .CLK(clk), .Q(mem[55]) );
  DFFX1 mem_reg_1__6_ ( .D(n171), .CLK(clk), .Q(mem[54]) );
  DFFX1 mem_reg_1__5_ ( .D(n172), .CLK(clk), .Q(mem[53]) );
  DFFX1 mem_reg_1__4_ ( .D(n173), .CLK(clk), .Q(mem[52]) );
  DFFX1 mem_reg_1__3_ ( .D(n174), .CLK(clk), .Q(mem[51]) );
  DFFX1 mem_reg_1__2_ ( .D(n175), .CLK(clk), .Q(mem[50]) );
  DFFX1 mem_reg_1__1_ ( .D(n176), .CLK(clk), .Q(mem[49]) );
  DFFX1 mem_reg_1__0_ ( .D(n177), .CLK(clk), .Q(mem[48]) );
  DFFX1 mem_reg_2__7_ ( .D(n178), .CLK(clk), .Q(mem[47]) );
  DFFX1 mem_reg_2__6_ ( .D(n179), .CLK(clk), .Q(mem[46]) );
  DFFX1 mem_reg_2__5_ ( .D(n180), .CLK(clk), .Q(mem[45]) );
  DFFX1 mem_reg_2__4_ ( .D(n181), .CLK(clk), .Q(mem[44]) );
  DFFX1 mem_reg_2__3_ ( .D(n182), .CLK(clk), .Q(mem[43]) );
  DFFX1 mem_reg_2__2_ ( .D(n183), .CLK(clk), .Q(mem[42]) );
  DFFX1 mem_reg_2__1_ ( .D(n184), .CLK(clk), .Q(mem[41]) );
  DFFX1 mem_reg_2__0_ ( .D(n185), .CLK(clk), .Q(mem[40]) );
  DFFX1 mem_reg_3__7_ ( .D(n186), .CLK(clk), .Q(mem[39]) );
  DFFX1 mem_reg_3__6_ ( .D(n187), .CLK(clk), .Q(mem[38]) );
  DFFX1 mem_reg_3__5_ ( .D(n188), .CLK(clk), .Q(mem[37]) );
  DFFX1 mem_reg_3__4_ ( .D(n189), .CLK(clk), .Q(mem[36]) );
  DFFX1 mem_reg_3__3_ ( .D(n190), .CLK(clk), .Q(mem[35]) );
  DFFX1 mem_reg_3__2_ ( .D(n191), .CLK(clk), .Q(mem[34]) );
  DFFX1 mem_reg_3__1_ ( .D(n192), .CLK(clk), .Q(mem[33]) );
  DFFX1 mem_reg_3__0_ ( .D(n193), .CLK(clk), .Q(mem[32]) );
  DFFX1 mem_reg_4__7_ ( .D(n194), .CLK(clk), .Q(mem[31]) );
  DFFX1 mem_reg_4__6_ ( .D(n195), .CLK(clk), .Q(mem[30]) );
  DFFX1 mem_reg_4__5_ ( .D(n196), .CLK(clk), .Q(mem[29]) );
  DFFX1 mem_reg_4__4_ ( .D(n197), .CLK(clk), .Q(mem[28]) );
  DFFX1 mem_reg_4__3_ ( .D(n198), .CLK(clk), .Q(mem[27]) );
  DFFX1 mem_reg_4__2_ ( .D(n199), .CLK(clk), .Q(mem[26]) );
  DFFX1 mem_reg_4__1_ ( .D(n200), .CLK(clk), .Q(mem[25]) );
  DFFX1 mem_reg_4__0_ ( .D(n201), .CLK(clk), .Q(mem[24]) );
  DFFX1 mem_reg_5__7_ ( .D(n202), .CLK(clk), .Q(mem[23]) );
  DFFX1 mem_reg_5__6_ ( .D(n203), .CLK(clk), .Q(mem[22]) );
  DFFX1 mem_reg_5__5_ ( .D(n204), .CLK(clk), .Q(mem[21]) );
  DFFX1 mem_reg_5__4_ ( .D(n205), .CLK(clk), .Q(mem[20]) );
  DFFX1 mem_reg_5__3_ ( .D(n206), .CLK(clk), .Q(mem[19]) );
  DFFX1 mem_reg_5__2_ ( .D(n207), .CLK(clk), .Q(mem[18]) );
  DFFX1 mem_reg_5__1_ ( .D(n208), .CLK(clk), .Q(mem[17]) );
  DFFX1 mem_reg_5__0_ ( .D(n209), .CLK(clk), .Q(mem[16]) );
  DFFX1 mem_reg_6__7_ ( .D(n210), .CLK(clk), .Q(mem[15]) );
  DFFX1 mem_reg_6__6_ ( .D(n211), .CLK(clk), .Q(mem[14]) );
  DFFX1 mem_reg_6__5_ ( .D(n212), .CLK(clk), .Q(mem[13]) );
  DFFX1 mem_reg_6__4_ ( .D(n213), .CLK(clk), .Q(mem[12]) );
  DFFX1 mem_reg_6__3_ ( .D(n214), .CLK(clk), .Q(mem[11]) );
  DFFX1 mem_reg_6__2_ ( .D(n215), .CLK(clk), .Q(mem[10]) );
  DFFX1 mem_reg_6__1_ ( .D(n216), .CLK(clk), .Q(mem[9]) );
  DFFX1 mem_reg_6__0_ ( .D(n217), .CLK(clk), .Q(mem[8]) );
  DFFX1 mem_reg_7__7_ ( .D(n218), .CLK(clk), .Q(mem[7]) );
  DFFX1 mem_reg_7__6_ ( .D(n219), .CLK(clk), .Q(mem[6]) );
  DFFX1 mem_reg_7__5_ ( .D(n220), .CLK(clk), .Q(mem[5]) );
  DFFX1 mem_reg_7__4_ ( .D(n221), .CLK(clk), .Q(mem[4]) );
  DFFX1 mem_reg_7__3_ ( .D(n222), .CLK(clk), .Q(mem[3]) );
  DFFX1 mem_reg_7__2_ ( .D(n223), .CLK(clk), .Q(mem[2]) );
  DFFX1 mem_reg_7__1_ ( .D(n224), .CLK(clk), .Q(mem[1]) );
  DFFX1 mem_reg_7__0_ ( .D(n225), .CLK(clk), .Q(mem[0]) );
  AO22X1 U14 ( .IN1(wdata[0]), .IN2(n161), .IN3(mem[0]), .IN4(n149), .Q(n225)
         );
  AO22X1 U15 ( .IN1(wdata[1]), .IN2(n161), .IN3(mem[1]), .IN4(n149), .Q(n224)
         );
  AO22X1 U16 ( .IN1(wdata[2]), .IN2(n161), .IN3(mem[2]), .IN4(n149), .Q(n223)
         );
  AO22X1 U17 ( .IN1(wdata[3]), .IN2(n161), .IN3(mem[3]), .IN4(n149), .Q(n222)
         );
  AO22X1 U18 ( .IN1(wdata[4]), .IN2(n161), .IN3(mem[4]), .IN4(n149), .Q(n221)
         );
  AO22X1 U19 ( .IN1(wdata[5]), .IN2(n161), .IN3(mem[5]), .IN4(n148), .Q(n220)
         );
  AO22X1 U20 ( .IN1(wdata[6]), .IN2(n161), .IN3(mem[6]), .IN4(n148), .Q(n219)
         );
  AO22X1 U21 ( .IN1(wdata[7]), .IN2(n161), .IN3(mem[7]), .IN4(n148), .Q(n218)
         );
  AO22X1 U23 ( .IN1(n160), .IN2(wdata[0]), .IN3(mem[8]), .IN4(n147), .Q(n217)
         );
  AO22X1 U24 ( .IN1(n160), .IN2(wdata[1]), .IN3(mem[9]), .IN4(n147), .Q(n216)
         );
  AO22X1 U25 ( .IN1(n160), .IN2(wdata[2]), .IN3(mem[10]), .IN4(n147), .Q(n215)
         );
  AO22X1 U26 ( .IN1(n160), .IN2(wdata[3]), .IN3(mem[11]), .IN4(n147), .Q(n214)
         );
  AO22X1 U27 ( .IN1(n160), .IN2(wdata[4]), .IN3(mem[12]), .IN4(n147), .Q(n213)
         );
  AO22X1 U28 ( .IN1(n160), .IN2(wdata[5]), .IN3(mem[13]), .IN4(n146), .Q(n212)
         );
  AO22X1 U29 ( .IN1(n160), .IN2(wdata[6]), .IN3(mem[14]), .IN4(n146), .Q(n211)
         );
  AO22X1 U30 ( .IN1(n160), .IN2(wdata[7]), .IN3(mem[15]), .IN4(n146), .Q(n210)
         );
  AO22X1 U32 ( .IN1(n159), .IN2(n8), .IN3(mem[16]), .IN4(n145), .Q(n209) );
  AO22X1 U33 ( .IN1(n159), .IN2(n10), .IN3(mem[17]), .IN4(n145), .Q(n208) );
  AO22X1 U34 ( .IN1(n159), .IN2(n7), .IN3(mem[18]), .IN4(n145), .Q(n207) );
  AO22X1 U35 ( .IN1(n159), .IN2(n9), .IN3(mem[19]), .IN4(n145), .Q(n206) );
  AO22X1 U36 ( .IN1(n159), .IN2(n6), .IN3(mem[20]), .IN4(n145), .Q(n205) );
  AO22X1 U37 ( .IN1(n159), .IN2(n4), .IN3(mem[21]), .IN4(n144), .Q(n204) );
  AO22X1 U38 ( .IN1(n159), .IN2(n5), .IN3(mem[22]), .IN4(n144), .Q(n203) );
  AO22X1 U39 ( .IN1(n159), .IN2(n3), .IN3(mem[23]), .IN4(n144), .Q(n202) );
  AO22X1 U41 ( .IN1(n158), .IN2(n8), .IN3(mem[24]), .IN4(n143), .Q(n201) );
  AO22X1 U42 ( .IN1(n158), .IN2(n10), .IN3(mem[25]), .IN4(n143), .Q(n200) );
  AO22X1 U43 ( .IN1(n158), .IN2(n7), .IN3(mem[26]), .IN4(n143), .Q(n199) );
  AO22X1 U44 ( .IN1(n158), .IN2(n9), .IN3(mem[27]), .IN4(n143), .Q(n198) );
  AO22X1 U45 ( .IN1(n158), .IN2(n6), .IN3(mem[28]), .IN4(n143), .Q(n197) );
  AO22X1 U46 ( .IN1(n158), .IN2(n4), .IN3(mem[29]), .IN4(n142), .Q(n196) );
  AO22X1 U47 ( .IN1(n158), .IN2(n5), .IN3(mem[30]), .IN4(n142), .Q(n195) );
  AO22X1 U48 ( .IN1(n158), .IN2(n3), .IN3(mem[31]), .IN4(n142), .Q(n194) );
  AND2X1 U50 ( .IN1(we), .IN2(waddr[2]), .Q(n234) );
  AO22X1 U51 ( .IN1(n156), .IN2(n8), .IN3(mem[32]), .IN4(n141), .Q(n193) );
  AO22X1 U52 ( .IN1(n156), .IN2(n10), .IN3(mem[33]), .IN4(n141), .Q(n192) );
  AO22X1 U53 ( .IN1(n156), .IN2(n7), .IN3(mem[34]), .IN4(n141), .Q(n191) );
  AO22X1 U54 ( .IN1(n156), .IN2(n9), .IN3(mem[35]), .IN4(n141), .Q(n190) );
  AO22X1 U55 ( .IN1(n156), .IN2(n6), .IN3(mem[36]), .IN4(n141), .Q(n189) );
  AO22X1 U56 ( .IN1(n156), .IN2(n4), .IN3(mem[37]), .IN4(n140), .Q(n188) );
  AO22X1 U57 ( .IN1(n156), .IN2(n5), .IN3(mem[38]), .IN4(n140), .Q(n187) );
  AO22X1 U58 ( .IN1(n156), .IN2(n3), .IN3(mem[39]), .IN4(n140), .Q(n186) );
  AO22X1 U60 ( .IN1(n155), .IN2(n8), .IN3(mem[40]), .IN4(n139), .Q(n185) );
  AO22X1 U61 ( .IN1(n155), .IN2(n10), .IN3(mem[41]), .IN4(n139), .Q(n184) );
  AO22X1 U62 ( .IN1(n155), .IN2(n7), .IN3(mem[42]), .IN4(n139), .Q(n183) );
  AO22X1 U63 ( .IN1(n155), .IN2(n9), .IN3(mem[43]), .IN4(n139), .Q(n182) );
  AO22X1 U64 ( .IN1(n155), .IN2(n6), .IN3(mem[44]), .IN4(n139), .Q(n181) );
  AO22X1 U65 ( .IN1(n155), .IN2(n4), .IN3(mem[45]), .IN4(n138), .Q(n180) );
  AO22X1 U66 ( .IN1(n155), .IN2(n5), .IN3(mem[46]), .IN4(n138), .Q(n179) );
  AO22X1 U67 ( .IN1(n155), .IN2(n3), .IN3(mem[47]), .IN4(n138), .Q(n178) );
  AO22X1 U69 ( .IN1(n154), .IN2(n8), .IN3(mem[48]), .IN4(n137), .Q(n177) );
  AO22X1 U70 ( .IN1(n154), .IN2(n10), .IN3(mem[49]), .IN4(n137), .Q(n176) );
  AO22X1 U71 ( .IN1(n154), .IN2(n7), .IN3(mem[50]), .IN4(n137), .Q(n175) );
  AO22X1 U72 ( .IN1(n154), .IN2(n9), .IN3(mem[51]), .IN4(n137), .Q(n174) );
  AO22X1 U73 ( .IN1(n154), .IN2(n6), .IN3(mem[52]), .IN4(n137), .Q(n173) );
  AO22X1 U74 ( .IN1(n154), .IN2(n4), .IN3(mem[53]), .IN4(n136), .Q(n172) );
  AO22X1 U75 ( .IN1(n154), .IN2(n5), .IN3(mem[54]), .IN4(n136), .Q(n171) );
  AO22X1 U76 ( .IN1(n154), .IN2(n3), .IN3(mem[55]), .IN4(n136), .Q(n170) );
  AO22X1 U78 ( .IN1(n153), .IN2(n8), .IN3(mem[56]), .IN4(n135), .Q(n169) );
  AO22X1 U79 ( .IN1(n153), .IN2(n10), .IN3(mem[57]), .IN4(n135), .Q(n168) );
  AO22X1 U80 ( .IN1(n153), .IN2(n7), .IN3(mem[58]), .IN4(n135), .Q(n167) );
  AO22X1 U81 ( .IN1(n153), .IN2(n9), .IN3(mem[59]), .IN4(n135), .Q(n166) );
  AO22X1 U82 ( .IN1(n153), .IN2(n6), .IN3(mem[60]), .IN4(n135), .Q(n165) );
  AO22X1 U83 ( .IN1(n153), .IN2(n4), .IN3(mem[61]), .IN4(n134), .Q(n164) );
  AO22X1 U84 ( .IN1(n153), .IN2(n5), .IN3(mem[62]), .IN4(n134), .Q(n163) );
  AO22X1 U85 ( .IN1(n153), .IN2(n3), .IN3(mem[63]), .IN4(n134), .Q(n162) );
  NBUFFX2 U2 ( .INP(n115), .Z(n129) );
  AO22X1 U3 ( .IN1(n104), .IN2(n133), .IN3(n103), .IN4(n2), .Q(rdata[4]) );
  AO22X1 U4 ( .IN1(n108), .IN2(n133), .IN3(n107), .IN4(n2), .Q(rdata[5]) );
  AO22X1 U5 ( .IN1(n112), .IN2(n133), .IN3(n111), .IN4(n2), .Q(rdata[6]) );
  AO22X1 U6 ( .IN1(n92), .IN2(n133), .IN3(n91), .IN4(n2), .Q(rdata[1]) );
  AO22X1 U7 ( .IN1(n96), .IN2(n133), .IN3(n95), .IN4(n2), .Q(rdata[2]) );
  AO22X1 U8 ( .IN1(n133), .IN2(n120), .IN3(n119), .IN4(n2), .Q(rdata[7]) );
  NBUFFX2 U9 ( .INP(n233), .Z(n147) );
  NBUFFX2 U10 ( .INP(n231), .Z(n143) );
  NBUFFX2 U11 ( .INP(n228), .Z(n139) );
  NBUFFX2 U12 ( .INP(n226), .Z(n135) );
  NBUFFX2 U13 ( .INP(n228), .Z(n138) );
  NBUFFX2 U22 ( .INP(n233), .Z(n146) );
  NBUFFX2 U31 ( .INP(n226), .Z(n134) );
  NAND3X0 U40 ( .IN1(n151), .IN2(n152), .IN3(n229), .QN(n226) );
  NBUFFX2 U49 ( .INP(n231), .Z(n142) );
  NAND3X0 U59 ( .IN1(n151), .IN2(n152), .IN3(n234), .QN(n231) );
  NAND3X0 U68 ( .IN1(n150), .IN2(n152), .IN3(n229), .QN(n227) );
  NAND3X0 U77 ( .IN1(n234), .IN2(n152), .IN3(n150), .QN(n232) );
  NAND3X1 U86 ( .IN1(waddr[1]), .IN2(n150), .IN3(n229), .QN(n230) );
  NOR2X0 U87 ( .IN1(n123), .IN2(n122), .QN(n1) );
  NBUFFX2 U88 ( .INP(n132), .Z(n2) );
  INVX0 U89 ( .INP(n132), .ZN(n133) );
  AO22X1 U90 ( .IN1(n100), .IN2(n133), .IN3(n99), .IN4(n2), .Q(rdata[3]) );
  NBUFFX2 U91 ( .INP(wdata[7]), .Z(n3) );
  NBUFFX2 U92 ( .INP(wdata[5]), .Z(n4) );
  NBUFFX2 U93 ( .INP(wdata[6]), .Z(n5) );
  NBUFFX2 U94 ( .INP(wdata[4]), .Z(n6) );
  NBUFFX2 U95 ( .INP(wdata[2]), .Z(n7) );
  NBUFFX2 U96 ( .INP(wdata[0]), .Z(n8) );
  NBUFFX2 U97 ( .INP(wdata[3]), .Z(n9) );
  NBUFFX2 U98 ( .INP(wdata[1]), .Z(n10) );
  NAND3X4 U99 ( .IN1(waddr[1]), .IN2(n151), .IN3(n229), .QN(n228) );
  NAND3X1 U100 ( .IN1(n150), .IN2(n234), .IN3(waddr[1]), .QN(n235) );
  NAND3X1 U101 ( .IN1(n234), .IN2(n151), .IN3(waddr[1]), .QN(n233) );
  INVX0 U102 ( .INP(n136), .ZN(n154) );
  INVX0 U103 ( .INP(n134), .ZN(n153) );
  INVX0 U104 ( .INP(n142), .ZN(n158) );
  INVX0 U105 ( .INP(n144), .ZN(n159) );
  INVX0 U106 ( .INP(n148), .ZN(n161) );
  INVX0 U107 ( .INP(n146), .ZN(n160) );
  NBUFFX2 U108 ( .INP(n232), .Z(n145) );
  NBUFFX2 U109 ( .INP(n227), .Z(n136) );
  NBUFFX2 U110 ( .INP(n232), .Z(n144) );
  NBUFFX2 U111 ( .INP(n227), .Z(n137) );
  NBUFFX2 U112 ( .INP(n114), .Z(n131) );
  NBUFFX2 U113 ( .INP(n114), .Z(n130) );
  NBUFFX2 U114 ( .INP(n118), .Z(n125) );
  NBUFFX2 U115 ( .INP(n118), .Z(n124) );
  NBUFFX2 U116 ( .INP(n235), .Z(n148) );
  NBUFFX2 U117 ( .INP(n235), .Z(n149) );
  NBUFFX2 U118 ( .INP(n230), .Z(n141) );
  NBUFFX2 U119 ( .INP(n230), .Z(n140) );
  NOR2X0 U120 ( .IN1(n157), .IN2(waddr[2]), .QN(n229) );
  INVX0 U121 ( .INP(we), .ZN(n157) );
  AO22X1 U122 ( .IN1(mem[41]), .IN2(n1), .IN3(mem[57]), .IN4(n130), .Q(n90) );
  AO22X1 U123 ( .IN1(mem[42]), .IN2(n1), .IN3(mem[58]), .IN4(n130), .Q(n94) );
  AO22X1 U124 ( .IN1(mem[43]), .IN2(n1), .IN3(mem[59]), .IN4(n130), .Q(n98) );
  AO22X1 U125 ( .IN1(mem[33]), .IN2(n1), .IN3(mem[49]), .IN4(n131), .Q(n89) );
  AO22X1 U126 ( .IN1(mem[34]), .IN2(n1), .IN3(mem[50]), .IN4(n131), .Q(n93) );
  AO22X1 U127 ( .IN1(mem[35]), .IN2(n1), .IN3(mem[51]), .IN4(n131), .Q(n97) );
  NOR2X0 U128 ( .IN1(n121), .IN2(raddr[1]), .QN(n118) );
  NOR2X0 U129 ( .IN1(raddr[1]), .IN2(n122), .QN(n114) );
  AO22X1 U130 ( .IN1(mem[32]), .IN2(n1), .IN3(mem[48]), .IN4(n131), .Q(n11) );
  AO221X1 U131 ( .IN1(mem[16]), .IN2(n125), .IN3(mem[0]), .IN4(n128), .IN5(n11), .Q(n88) );
  AO22X1 U132 ( .IN1(mem[40]), .IN2(n1), .IN3(mem[56]), .IN4(n130), .Q(n86) );
  AO221X1 U133 ( .IN1(mem[24]), .IN2(n124), .IN3(mem[8]), .IN4(n128), .IN5(n86), .Q(n87) );
  AO22X1 U134 ( .IN1(n88), .IN2(n133), .IN3(n87), .IN4(n2), .Q(rdata[0]) );
  AO221X1 U135 ( .IN1(mem[17]), .IN2(n125), .IN3(mem[1]), .IN4(n128), .IN5(n89), .Q(n92) );
  AO221X1 U136 ( .IN1(mem[25]), .IN2(n124), .IN3(mem[9]), .IN4(n128), .IN5(n90), .Q(n91) );
  AO221X1 U137 ( .IN1(mem[18]), .IN2(n125), .IN3(mem[2]), .IN4(n128), .IN5(n93), .Q(n96) );
  AO221X1 U138 ( .IN1(mem[26]), .IN2(n124), .IN3(mem[10]), .IN4(n128), .IN5(
        n94), .Q(n95) );
  AO221X1 U139 ( .IN1(mem[19]), .IN2(n125), .IN3(mem[3]), .IN4(n126), .IN5(n97), .Q(n100) );
  AO221X1 U140 ( .IN1(mem[27]), .IN2(n124), .IN3(mem[11]), .IN4(n127), .IN5(
        n98), .Q(n99) );
  AO22X1 U141 ( .IN1(mem[36]), .IN2(n129), .IN3(mem[52]), .IN4(n131), .Q(n101)
         );
  AO221X1 U142 ( .IN1(mem[20]), .IN2(n125), .IN3(mem[4]), .IN4(n126), .IN5(
        n101), .Q(n104) );
  AO22X1 U143 ( .IN1(mem[44]), .IN2(n129), .IN3(mem[60]), .IN4(n130), .Q(n102)
         );
  AO221X1 U144 ( .IN1(mem[28]), .IN2(n124), .IN3(mem[12]), .IN4(n127), .IN5(
        n102), .Q(n103) );
  AO22X1 U145 ( .IN1(mem[37]), .IN2(n129), .IN3(mem[53]), .IN4(n131), .Q(n105)
         );
  AO221X1 U146 ( .IN1(mem[21]), .IN2(n125), .IN3(mem[5]), .IN4(n126), .IN5(
        n105), .Q(n108) );
  AO22X1 U147 ( .IN1(mem[45]), .IN2(n129), .IN3(mem[61]), .IN4(n130), .Q(n106)
         );
  AO221X1 U148 ( .IN1(mem[29]), .IN2(n124), .IN3(mem[13]), .IN4(n127), .IN5(
        n106), .Q(n107) );
  AO22X1 U149 ( .IN1(mem[38]), .IN2(n129), .IN3(mem[54]), .IN4(n131), .Q(n109)
         );
  AO221X1 U150 ( .IN1(mem[22]), .IN2(n125), .IN3(mem[6]), .IN4(n126), .IN5(
        n109), .Q(n112) );
  AO22X1 U151 ( .IN1(mem[46]), .IN2(n129), .IN3(mem[62]), .IN4(n130), .Q(n110)
         );
  AO221X1 U152 ( .IN1(mem[30]), .IN2(n124), .IN3(mem[14]), .IN4(n127), .IN5(
        n110), .Q(n111) );
  AO22X1 U153 ( .IN1(mem[39]), .IN2(n129), .IN3(mem[55]), .IN4(n131), .Q(n113)
         );
  AO221X1 U154 ( .IN1(mem[23]), .IN2(n125), .IN3(mem[7]), .IN4(n126), .IN5(
        n113), .Q(n120) );
  AO22X1 U155 ( .IN1(mem[47]), .IN2(n129), .IN3(mem[63]), .IN4(n130), .Q(n116)
         );
  AO221X1 U156 ( .IN1(mem[31]), .IN2(n124), .IN3(mem[15]), .IN4(n127), .IN5(
        n116), .Q(n119) );
  INVX0 U157 ( .INP(raddr[2]), .ZN(n121) );
  INVX0 U158 ( .INP(n121), .ZN(n122) );
  INVX0 U159 ( .INP(raddr[1]), .ZN(n123) );
  NBUFFX2 U160 ( .INP(n117), .Z(n128) );
  NBUFFX2 U161 ( .INP(n117), .Z(n126) );
  NBUFFX2 U162 ( .INP(n117), .Z(n127) );
  NOR2X0 U163 ( .IN1(n123), .IN2(n122), .QN(n115) );
  NOR2X0 U164 ( .IN1(n121), .IN2(n123), .QN(n117) );
  INVX0 U165 ( .INP(n138), .ZN(n155) );
  INVX0 U166 ( .INP(n140), .ZN(n156) );
  INVX0 U167 ( .INP(raddr[0]), .ZN(n132) );
  INVX0 U168 ( .INP(n151), .ZN(n150) );
  INVX0 U169 ( .INP(waddr[0]), .ZN(n151) );
  INVX0 U170 ( .INP(waddr[1]), .ZN(n152) );
endmodule


module payload_ram_bank8x8_12 ( clk, we, waddr, wdata, raddr, rdata );
  input [2:0] waddr;
  input [7:0] wdata;
  input [2:0] raddr;
  output [7:0] rdata;
  input clk, we;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246,
         n247;
  wire   [63:0] mem;

  DFFX1 mem_reg_0__7_ ( .D(n174), .CLK(clk), .Q(mem[63]) );
  DFFX1 mem_reg_0__6_ ( .D(n175), .CLK(clk), .Q(mem[62]) );
  DFFX1 mem_reg_0__5_ ( .D(n176), .CLK(clk), .Q(mem[61]) );
  DFFX1 mem_reg_0__4_ ( .D(n177), .CLK(clk), .Q(mem[60]) );
  DFFX1 mem_reg_0__3_ ( .D(n178), .CLK(clk), .Q(mem[59]) );
  DFFX1 mem_reg_0__2_ ( .D(n179), .CLK(clk), .Q(mem[58]) );
  DFFX1 mem_reg_0__1_ ( .D(n180), .CLK(clk), .Q(mem[57]) );
  DFFX1 mem_reg_0__0_ ( .D(n181), .CLK(clk), .Q(mem[56]) );
  DFFX1 mem_reg_1__7_ ( .D(n182), .CLK(clk), .Q(mem[55]) );
  DFFX1 mem_reg_1__6_ ( .D(n183), .CLK(clk), .Q(mem[54]) );
  DFFX1 mem_reg_1__5_ ( .D(n184), .CLK(clk), .Q(mem[53]) );
  DFFX1 mem_reg_1__4_ ( .D(n185), .CLK(clk), .Q(mem[52]) );
  DFFX1 mem_reg_1__3_ ( .D(n186), .CLK(clk), .Q(mem[51]) );
  DFFX1 mem_reg_1__2_ ( .D(n187), .CLK(clk), .Q(mem[50]) );
  DFFX1 mem_reg_1__1_ ( .D(n188), .CLK(clk), .Q(mem[49]) );
  DFFX1 mem_reg_1__0_ ( .D(n189), .CLK(clk), .Q(mem[48]) );
  DFFX1 mem_reg_2__7_ ( .D(n190), .CLK(clk), .Q(mem[47]) );
  DFFX1 mem_reg_2__6_ ( .D(n191), .CLK(clk), .Q(mem[46]) );
  DFFX1 mem_reg_2__5_ ( .D(n192), .CLK(clk), .Q(mem[45]) );
  DFFX1 mem_reg_2__4_ ( .D(n193), .CLK(clk), .Q(mem[44]) );
  DFFX1 mem_reg_2__3_ ( .D(n194), .CLK(clk), .Q(mem[43]) );
  DFFX1 mem_reg_2__2_ ( .D(n195), .CLK(clk), .Q(mem[42]) );
  DFFX1 mem_reg_2__1_ ( .D(n196), .CLK(clk), .Q(mem[41]) );
  DFFX1 mem_reg_2__0_ ( .D(n197), .CLK(clk), .Q(mem[40]) );
  DFFX1 mem_reg_3__7_ ( .D(n198), .CLK(clk), .Q(mem[39]) );
  DFFX1 mem_reg_3__6_ ( .D(n199), .CLK(clk), .Q(mem[38]) );
  DFFX1 mem_reg_3__5_ ( .D(n200), .CLK(clk), .Q(mem[37]) );
  DFFX1 mem_reg_3__4_ ( .D(n201), .CLK(clk), .Q(mem[36]) );
  DFFX1 mem_reg_3__3_ ( .D(n202), .CLK(clk), .Q(mem[35]) );
  DFFX1 mem_reg_3__2_ ( .D(n203), .CLK(clk), .Q(mem[34]) );
  DFFX1 mem_reg_3__1_ ( .D(n204), .CLK(clk), .Q(mem[33]) );
  DFFX1 mem_reg_3__0_ ( .D(n205), .CLK(clk), .Q(mem[32]) );
  DFFX1 mem_reg_4__7_ ( .D(n206), .CLK(clk), .Q(mem[31]) );
  DFFX1 mem_reg_4__6_ ( .D(n207), .CLK(clk), .Q(mem[30]) );
  DFFX1 mem_reg_4__5_ ( .D(n208), .CLK(clk), .Q(mem[29]) );
  DFFX1 mem_reg_4__4_ ( .D(n209), .CLK(clk), .Q(mem[28]) );
  DFFX1 mem_reg_4__3_ ( .D(n210), .CLK(clk), .Q(mem[27]) );
  DFFX1 mem_reg_4__2_ ( .D(n211), .CLK(clk), .Q(mem[26]) );
  DFFX1 mem_reg_4__1_ ( .D(n212), .CLK(clk), .Q(mem[25]) );
  DFFX1 mem_reg_4__0_ ( .D(n213), .CLK(clk), .Q(mem[24]) );
  DFFX1 mem_reg_5__7_ ( .D(n214), .CLK(clk), .Q(mem[23]) );
  DFFX1 mem_reg_5__6_ ( .D(n215), .CLK(clk), .Q(mem[22]) );
  DFFX1 mem_reg_5__5_ ( .D(n216), .CLK(clk), .Q(mem[21]) );
  DFFX1 mem_reg_5__4_ ( .D(n217), .CLK(clk), .Q(mem[20]) );
  DFFX1 mem_reg_5__3_ ( .D(n218), .CLK(clk), .Q(mem[19]) );
  DFFX1 mem_reg_5__2_ ( .D(n219), .CLK(clk), .Q(mem[18]) );
  DFFX1 mem_reg_5__1_ ( .D(n220), .CLK(clk), .Q(mem[17]) );
  DFFX1 mem_reg_5__0_ ( .D(n221), .CLK(clk), .Q(mem[16]) );
  DFFX1 mem_reg_6__7_ ( .D(n222), .CLK(clk), .Q(mem[15]) );
  DFFX1 mem_reg_6__6_ ( .D(n223), .CLK(clk), .Q(mem[14]) );
  DFFX1 mem_reg_6__5_ ( .D(n224), .CLK(clk), .Q(mem[13]) );
  DFFX1 mem_reg_6__4_ ( .D(n225), .CLK(clk), .Q(mem[12]) );
  DFFX1 mem_reg_6__3_ ( .D(n226), .CLK(clk), .Q(mem[11]) );
  DFFX1 mem_reg_6__2_ ( .D(n227), .CLK(clk), .Q(mem[10]) );
  DFFX1 mem_reg_6__1_ ( .D(n228), .CLK(clk), .Q(mem[9]) );
  DFFX1 mem_reg_6__0_ ( .D(n229), .CLK(clk), .Q(mem[8]) );
  DFFX1 mem_reg_7__7_ ( .D(n230), .CLK(clk), .Q(mem[7]) );
  DFFX1 mem_reg_7__6_ ( .D(n231), .CLK(clk), .Q(mem[6]) );
  DFFX1 mem_reg_7__5_ ( .D(n232), .CLK(clk), .Q(mem[5]) );
  DFFX1 mem_reg_7__4_ ( .D(n233), .CLK(clk), .Q(mem[4]) );
  DFFX1 mem_reg_7__3_ ( .D(n234), .CLK(clk), .Q(mem[3]) );
  DFFX1 mem_reg_7__2_ ( .D(n235), .CLK(clk), .Q(mem[2]) );
  DFFX1 mem_reg_7__1_ ( .D(n236), .CLK(clk), .Q(mem[1]) );
  DFFX1 mem_reg_7__0_ ( .D(n237), .CLK(clk), .Q(mem[0]) );
  AO22X1 U14 ( .IN1(wdata[0]), .IN2(n148), .IN3(mem[0]), .IN4(n167), .Q(n237)
         );
  AO22X1 U15 ( .IN1(wdata[1]), .IN2(n148), .IN3(mem[1]), .IN4(n167), .Q(n236)
         );
  AO22X1 U16 ( .IN1(wdata[2]), .IN2(n148), .IN3(mem[2]), .IN4(n167), .Q(n235)
         );
  AO22X1 U17 ( .IN1(wdata[3]), .IN2(n148), .IN3(mem[3]), .IN4(n167), .Q(n234)
         );
  AO22X1 U18 ( .IN1(n90), .IN2(n148), .IN3(mem[4]), .IN4(n167), .Q(n233) );
  AO22X1 U19 ( .IN1(wdata[5]), .IN2(n148), .IN3(mem[5]), .IN4(n166), .Q(n232)
         );
  AO22X1 U20 ( .IN1(wdata[6]), .IN2(n148), .IN3(mem[6]), .IN4(n166), .Q(n231)
         );
  AO22X1 U21 ( .IN1(wdata[7]), .IN2(n148), .IN3(mem[7]), .IN4(n166), .Q(n230)
         );
  AO22X1 U23 ( .IN1(n147), .IN2(n92), .IN3(mem[8]), .IN4(n165), .Q(n229) );
  AO22X1 U24 ( .IN1(n147), .IN2(n89), .IN3(mem[9]), .IN4(n165), .Q(n228) );
  AO22X1 U25 ( .IN1(n147), .IN2(n91), .IN3(mem[10]), .IN4(n165), .Q(n227) );
  AO22X1 U26 ( .IN1(n147), .IN2(n88), .IN3(mem[11]), .IN4(n165), .Q(n226) );
  AO22X1 U27 ( .IN1(n147), .IN2(wdata[4]), .IN3(mem[12]), .IN4(n165), .Q(n225)
         );
  AO22X1 U28 ( .IN1(n147), .IN2(n9), .IN3(mem[13]), .IN4(n164), .Q(n224) );
  AO22X1 U29 ( .IN1(n147), .IN2(wdata[6]), .IN3(mem[14]), .IN4(n164), .Q(n223)
         );
  AO22X1 U30 ( .IN1(n147), .IN2(n8), .IN3(mem[15]), .IN4(n164), .Q(n222) );
  AO22X1 U32 ( .IN1(n173), .IN2(n92), .IN3(mem[16]), .IN4(n163), .Q(n221) );
  AO22X1 U33 ( .IN1(n173), .IN2(n89), .IN3(mem[17]), .IN4(n163), .Q(n220) );
  AO22X1 U34 ( .IN1(n173), .IN2(n91), .IN3(mem[18]), .IN4(n163), .Q(n219) );
  AO22X1 U35 ( .IN1(n173), .IN2(n88), .IN3(mem[19]), .IN4(n163), .Q(n218) );
  AO22X1 U36 ( .IN1(n173), .IN2(wdata[4]), .IN3(mem[20]), .IN4(n163), .Q(n217)
         );
  AO22X1 U37 ( .IN1(n173), .IN2(n9), .IN3(mem[21]), .IN4(n162), .Q(n216) );
  AO22X1 U38 ( .IN1(n173), .IN2(n87), .IN3(mem[22]), .IN4(n162), .Q(n215) );
  AO22X1 U39 ( .IN1(n173), .IN2(n8), .IN3(mem[23]), .IN4(n162), .Q(n214) );
  AO22X1 U41 ( .IN1(n149), .IN2(n92), .IN3(mem[24]), .IN4(n161), .Q(n213) );
  AO22X1 U42 ( .IN1(n149), .IN2(n89), .IN3(mem[25]), .IN4(n161), .Q(n212) );
  AO22X1 U43 ( .IN1(n149), .IN2(n91), .IN3(mem[26]), .IN4(n161), .Q(n211) );
  AO22X1 U44 ( .IN1(n149), .IN2(n88), .IN3(mem[27]), .IN4(n161), .Q(n210) );
  AO22X1 U45 ( .IN1(n149), .IN2(n90), .IN3(mem[28]), .IN4(n161), .Q(n209) );
  AO22X1 U46 ( .IN1(n149), .IN2(n9), .IN3(mem[29]), .IN4(n160), .Q(n208) );
  AO22X1 U47 ( .IN1(n149), .IN2(n87), .IN3(mem[30]), .IN4(n160), .Q(n207) );
  AO22X1 U48 ( .IN1(n149), .IN2(n8), .IN3(mem[31]), .IN4(n160), .Q(n206) );
  AND2X1 U50 ( .IN1(we), .IN2(waddr[2]), .Q(n246) );
  AO22X1 U51 ( .IN1(n151), .IN2(wdata[0]), .IN3(mem[32]), .IN4(n159), .Q(n205)
         );
  AO22X1 U52 ( .IN1(n151), .IN2(wdata[1]), .IN3(mem[33]), .IN4(n159), .Q(n204)
         );
  AO22X1 U53 ( .IN1(n151), .IN2(wdata[2]), .IN3(mem[34]), .IN4(n159), .Q(n203)
         );
  AO22X1 U54 ( .IN1(n151), .IN2(wdata[3]), .IN3(mem[35]), .IN4(n159), .Q(n202)
         );
  AO22X1 U55 ( .IN1(n151), .IN2(n90), .IN3(mem[36]), .IN4(n159), .Q(n201) );
  AO22X1 U56 ( .IN1(n151), .IN2(wdata[5]), .IN3(mem[37]), .IN4(n158), .Q(n200)
         );
  AO22X1 U57 ( .IN1(n151), .IN2(n87), .IN3(mem[38]), .IN4(n158), .Q(n199) );
  AO22X1 U58 ( .IN1(n151), .IN2(wdata[7]), .IN3(mem[39]), .IN4(n158), .Q(n198)
         );
  AO22X1 U60 ( .IN1(n150), .IN2(n92), .IN3(mem[40]), .IN4(n157), .Q(n197) );
  AO22X1 U61 ( .IN1(n150), .IN2(n89), .IN3(mem[41]), .IN4(n157), .Q(n196) );
  AO22X1 U62 ( .IN1(n150), .IN2(n91), .IN3(mem[42]), .IN4(n157), .Q(n195) );
  AO22X1 U63 ( .IN1(n150), .IN2(n88), .IN3(mem[43]), .IN4(n157), .Q(n194) );
  AO22X1 U64 ( .IN1(n150), .IN2(n90), .IN3(mem[44]), .IN4(n157), .Q(n193) );
  AO22X1 U65 ( .IN1(n150), .IN2(n9), .IN3(mem[45]), .IN4(n156), .Q(n192) );
  AO22X1 U66 ( .IN1(n150), .IN2(n87), .IN3(mem[46]), .IN4(n156), .Q(n191) );
  AO22X1 U67 ( .IN1(n150), .IN2(n8), .IN3(mem[47]), .IN4(n156), .Q(n190) );
  AO22X1 U69 ( .IN1(n171), .IN2(n92), .IN3(mem[48]), .IN4(n155), .Q(n189) );
  AO22X1 U70 ( .IN1(n171), .IN2(n89), .IN3(mem[49]), .IN4(n155), .Q(n188) );
  AO22X1 U71 ( .IN1(n171), .IN2(n91), .IN3(mem[50]), .IN4(n155), .Q(n187) );
  AO22X1 U72 ( .IN1(n171), .IN2(n88), .IN3(mem[51]), .IN4(n155), .Q(n186) );
  AO22X1 U73 ( .IN1(n171), .IN2(n90), .IN3(mem[52]), .IN4(n155), .Q(n185) );
  AO22X1 U74 ( .IN1(n171), .IN2(n9), .IN3(mem[53]), .IN4(n154), .Q(n184) );
  AO22X1 U75 ( .IN1(n171), .IN2(n87), .IN3(mem[54]), .IN4(n154), .Q(n183) );
  AO22X1 U76 ( .IN1(n171), .IN2(n8), .IN3(mem[55]), .IN4(n154), .Q(n182) );
  AO22X1 U78 ( .IN1(n170), .IN2(n92), .IN3(mem[56]), .IN4(n153), .Q(n181) );
  AO22X1 U79 ( .IN1(n170), .IN2(n89), .IN3(mem[57]), .IN4(n153), .Q(n180) );
  AO22X1 U80 ( .IN1(n170), .IN2(n91), .IN3(mem[58]), .IN4(n153), .Q(n179) );
  AO22X1 U81 ( .IN1(n170), .IN2(n88), .IN3(mem[59]), .IN4(n153), .Q(n178) );
  AO22X1 U82 ( .IN1(n170), .IN2(n90), .IN3(mem[60]), .IN4(n153), .Q(n177) );
  AO22X1 U83 ( .IN1(n170), .IN2(n9), .IN3(mem[61]), .IN4(n152), .Q(n176) );
  AO22X1 U84 ( .IN1(n170), .IN2(n87), .IN3(mem[62]), .IN4(n152), .Q(n175) );
  AO22X1 U85 ( .IN1(n170), .IN2(n8), .IN3(mem[63]), .IN4(n152), .Q(n174) );
  NAND2X0 U2 ( .IN1(n118), .IN2(n98), .QN(n1) );
  NAND2X2 U3 ( .IN1(n117), .IN2(n7), .QN(n2) );
  NAND2X0 U4 ( .IN1(n1), .IN2(n2), .QN(rdata[4]) );
  DELLN2X2 U5 ( .INP(n97), .Z(n7) );
  NAND2X0 U6 ( .IN1(n98), .IN2(n134), .QN(n3) );
  NAND2X0 U7 ( .IN1(n133), .IN2(n97), .QN(n4) );
  NAND2X0 U8 ( .IN1(n3), .IN2(n4), .QN(rdata[7]) );
  NAND2X0 U9 ( .IN1(n126), .IN2(n98), .QN(n5) );
  NAND2X0 U10 ( .IN1(n125), .IN2(n97), .QN(n6) );
  NAND2X0 U11 ( .IN1(n5), .IN2(n6), .QN(rdata[6]) );
  NBUFFX2 U12 ( .INP(n128), .Z(n94) );
  NBUFFX2 U13 ( .INP(n129), .Z(n96) );
  AND2X1 U22 ( .IN1(n137), .IN2(n135), .Q(n128) );
  NBUFFX2 U31 ( .INP(n129), .Z(n144) );
  AND2X1 U40 ( .IN1(n136), .IN2(n137), .Q(n132) );
  NBUFFX2 U49 ( .INP(n129), .Z(n95) );
  NBUFFX2 U59 ( .INP(n128), .Z(n93) );
  NBUFFX2 U68 ( .INP(n128), .Z(n146) );
  NBUFFX2 U77 ( .INP(n132), .Z(n139) );
  NBUFFX2 U86 ( .INP(n128), .Z(n145) );
  NBUFFX2 U87 ( .INP(n132), .Z(n11) );
  NBUFFX2 U88 ( .INP(n132), .Z(n10) );
  NBUFFX2 U89 ( .INP(n132), .Z(n138) );
  NBUFFX2 U90 ( .INP(n239), .Z(n155) );
  NBUFFX2 U91 ( .INP(n238), .Z(n152) );
  NBUFFX2 U92 ( .INP(n239), .Z(n154) );
  NAND3X0 U93 ( .IN1(n168), .IN2(n86), .IN3(n241), .QN(n239) );
  NAND3X0 U94 ( .IN1(n246), .IN2(n86), .IN3(n168), .QN(n244) );
  NBUFFX2 U95 ( .INP(n243), .Z(n160) );
  NAND3X0 U96 ( .IN1(n246), .IN2(n169), .IN3(waddr[1]), .QN(n245) );
  NAND3X0 U97 ( .IN1(n168), .IN2(n246), .IN3(waddr[1]), .QN(n247) );
  NAND3X0 U98 ( .IN1(waddr[1]), .IN2(n169), .IN3(n241), .QN(n240) );
  NAND3X0 U99 ( .IN1(waddr[1]), .IN2(n168), .IN3(n241), .QN(n242) );
  INVX0 U100 ( .INP(n97), .ZN(n98) );
  NBUFFX2 U101 ( .INP(wdata[7]), .Z(n8) );
  NBUFFX2 U102 ( .INP(wdata[5]), .Z(n9) );
  INVX0 U103 ( .INP(waddr[1]), .ZN(n86) );
  NBUFFX2 U104 ( .INP(wdata[6]), .Z(n87) );
  NBUFFX2 U105 ( .INP(wdata[3]), .Z(n88) );
  NBUFFX2 U106 ( .INP(wdata[1]), .Z(n89) );
  NBUFFX2 U107 ( .INP(wdata[4]), .Z(n90) );
  NBUFFX2 U108 ( .INP(wdata[2]), .Z(n91) );
  NBUFFX2 U109 ( .INP(wdata[0]), .Z(n92) );
  INVX0 U110 ( .INP(raddr[0]), .ZN(n97) );
  INVX0 U111 ( .INP(n154), .ZN(n171) );
  INVX0 U112 ( .INP(n152), .ZN(n170) );
  INVX0 U113 ( .INP(n162), .ZN(n173) );
  NBUFFX2 U114 ( .INP(n131), .Z(n142) );
  NBUFFX2 U115 ( .INP(n131), .Z(n140) );
  NBUFFX2 U116 ( .INP(n131), .Z(n141) );
  NBUFFX2 U117 ( .INP(n129), .Z(n143) );
  NBUFFX2 U118 ( .INP(n244), .Z(n163) );
  NBUFFX2 U119 ( .INP(n244), .Z(n162) );
  NBUFFX2 U120 ( .INP(n243), .Z(n161) );
  NBUFFX2 U121 ( .INP(n238), .Z(n153) );
  NOR2X0 U122 ( .IN1(n137), .IN2(n136), .QN(n129) );
  NBUFFX2 U123 ( .INP(n242), .Z(n159) );
  NBUFFX2 U124 ( .INP(n240), .Z(n157) );
  NBUFFX2 U125 ( .INP(n242), .Z(n158) );
  NBUFFX2 U126 ( .INP(n240), .Z(n156) );
  NAND3X0 U127 ( .IN1(n169), .IN2(n86), .IN3(n246), .QN(n243) );
  NAND3X0 U128 ( .IN1(n169), .IN2(n86), .IN3(n241), .QN(n238) );
  NBUFFX2 U129 ( .INP(n247), .Z(n166) );
  NBUFFX2 U130 ( .INP(n245), .Z(n164) );
  NBUFFX2 U131 ( .INP(n247), .Z(n167) );
  NBUFFX2 U132 ( .INP(n245), .Z(n165) );
  NOR2X0 U133 ( .IN1(n172), .IN2(waddr[2]), .QN(n241) );
  INVX0 U134 ( .INP(we), .ZN(n172) );
  AO22X1 U135 ( .IN1(mem[32]), .IN2(n144), .IN3(mem[48]), .IN4(n146), .Q(n99)
         );
  AO221X1 U136 ( .IN1(mem[16]), .IN2(n10), .IN3(mem[0]), .IN4(n142), .IN5(n99),
        .Q(n102) );
  AO22X1 U137 ( .IN1(mem[40]), .IN2(n144), .IN3(mem[56]), .IN4(n146), .Q(n100)
         );
  AO221X1 U138 ( .IN1(mem[24]), .IN2(n138), .IN3(mem[8]), .IN4(n142), .IN5(
        n100), .Q(n101) );
  AO22X1 U139 ( .IN1(n102), .IN2(n98), .IN3(n101), .IN4(n7), .Q(rdata[0]) );
  AO22X1 U140 ( .IN1(mem[33]), .IN2(n95), .IN3(mem[49]), .IN4(n93), .Q(n103)
         );
  AO221X1 U141 ( .IN1(mem[17]), .IN2(n10), .IN3(mem[1]), .IN4(n142), .IN5(n103), .Q(n106) );
  AO22X1 U142 ( .IN1(mem[41]), .IN2(n143), .IN3(mem[57]), .IN4(n145), .Q(n104)
         );
  AO221X1 U143 ( .IN1(mem[25]), .IN2(n138), .IN3(mem[9]), .IN4(n142), .IN5(
        n104), .Q(n105) );
  AO22X1 U144 ( .IN1(n106), .IN2(n98), .IN3(n105), .IN4(n7), .Q(rdata[1]) );
  AO22X1 U145 ( .IN1(mem[34]), .IN2(n96), .IN3(mem[50]), .IN4(n94), .Q(n107)
         );
  AO221X1 U146 ( .IN1(mem[18]), .IN2(n11), .IN3(mem[2]), .IN4(n142), .IN5(n107), .Q(n110) );
  AO22X1 U147 ( .IN1(mem[42]), .IN2(n95), .IN3(mem[58]), .IN4(n93), .Q(n108)
         );
  AO221X1 U148 ( .IN1(mem[26]), .IN2(n10), .IN3(mem[10]), .IN4(n142), .IN5(
        n108), .Q(n109) );
  AO22X1 U149 ( .IN1(n110), .IN2(n98), .IN3(n109), .IN4(n7), .Q(rdata[2]) );
  AO22X1 U150 ( .IN1(mem[35]), .IN2(n143), .IN3(mem[51]), .IN4(n146), .Q(n111)
         );
  AO221X1 U151 ( .IN1(mem[19]), .IN2(n138), .IN3(mem[3]), .IN4(n140), .IN5(
        n111), .Q(n114) );
  AO22X1 U152 ( .IN1(mem[43]), .IN2(n96), .IN3(mem[59]), .IN4(n94), .Q(n112)
         );
  AO221X1 U153 ( .IN1(mem[27]), .IN2(n11), .IN3(mem[11]), .IN4(n141), .IN5(
        n112), .Q(n113) );
  AO22X1 U154 ( .IN1(n114), .IN2(n98), .IN3(n113), .IN4(n7), .Q(rdata[3]) );
  AO22X1 U155 ( .IN1(mem[36]), .IN2(n95), .IN3(mem[52]), .IN4(n145), .Q(n115)
         );
  AO221X1 U156 ( .IN1(mem[20]), .IN2(n138), .IN3(mem[4]), .IN4(n140), .IN5(
        n115), .Q(n118) );
  AO22X1 U157 ( .IN1(mem[44]), .IN2(n143), .IN3(mem[60]), .IN4(n145), .Q(n116)
         );
  AO221X1 U158 ( .IN1(mem[28]), .IN2(n11), .IN3(mem[12]), .IN4(n141), .IN5(
        n116), .Q(n117) );
  AO22X1 U159 ( .IN1(mem[37]), .IN2(n96), .IN3(mem[53]), .IN4(n93), .Q(n119)
         );
  AO221X1 U160 ( .IN1(mem[21]), .IN2(n139), .IN3(mem[5]), .IN4(n140), .IN5(
        n119), .Q(n122) );
  AO22X1 U161 ( .IN1(mem[45]), .IN2(n95), .IN3(mem[61]), .IN4(n93), .Q(n120)
         );
  AO221X1 U162 ( .IN1(mem[29]), .IN2(n139), .IN3(mem[13]), .IN4(n141), .IN5(
        n120), .Q(n121) );
  AO22X1 U163 ( .IN1(n122), .IN2(n98), .IN3(n121), .IN4(n97), .Q(rdata[5]) );
  AO22X1 U164 ( .IN1(mem[38]), .IN2(n144), .IN3(mem[54]), .IN4(n94), .Q(n123)
         );
  AO221X1 U165 ( .IN1(mem[22]), .IN2(n139), .IN3(mem[6]), .IN4(n140), .IN5(
        n123), .Q(n126) );
  AO22X1 U166 ( .IN1(mem[46]), .IN2(n96), .IN3(mem[62]), .IN4(n94), .Q(n124)
         );
  AO221X1 U167 ( .IN1(mem[30]), .IN2(n139), .IN3(mem[14]), .IN4(n141), .IN5(
        n124), .Q(n125) );
  AO22X1 U168 ( .IN1(mem[39]), .IN2(n144), .IN3(mem[55]), .IN4(n146), .Q(n127)
         );
  AO221X1 U169 ( .IN1(mem[23]), .IN2(n11), .IN3(mem[7]), .IN4(n140), .IN5(n127), .Q(n134) );
  AO22X1 U170 ( .IN1(mem[47]), .IN2(n143), .IN3(mem[63]), .IN4(n145), .Q(n130)
         );
  AO221X1 U171 ( .IN1(mem[31]), .IN2(n10), .IN3(mem[15]), .IN4(n141), .IN5(
        n130), .Q(n133) );
  INVX0 U172 ( .INP(raddr[2]), .ZN(n135) );
  INVX0 U173 ( .INP(n135), .ZN(n136) );
  INVX0 U174 ( .INP(raddr[1]), .ZN(n137) );
  NOR2X0 U175 ( .IN1(n135), .IN2(n137), .QN(n131) );
  INVX0 U176 ( .INP(n164), .ZN(n147) );
  INVX0 U177 ( .INP(n166), .ZN(n148) );
  INVX0 U178 ( .INP(n160), .ZN(n149) );
  INVX0 U179 ( .INP(n156), .ZN(n150) );
  INVX0 U180 ( .INP(n158), .ZN(n151) );
  INVX0 U181 ( .INP(n169), .ZN(n168) );
  INVX0 U182 ( .INP(waddr[0]), .ZN(n169) );
endmodule


module payload_ram_bank8x8_11 ( clk, we, waddr, wdata, raddr, rdata );
  input [2:0] waddr;
  input [7:0] wdata;
  input [2:0] raddr;
  output [7:0] rdata;
  input clk, we;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239;
  wire   [63:0] mem;

  DFFX1 mem_reg_0__7_ ( .D(n166), .CLK(clk), .Q(mem[63]) );
  DFFX1 mem_reg_0__6_ ( .D(n167), .CLK(clk), .Q(mem[62]) );
  DFFX1 mem_reg_0__5_ ( .D(n168), .CLK(clk), .Q(mem[61]) );
  DFFX1 mem_reg_0__4_ ( .D(n169), .CLK(clk), .Q(mem[60]) );
  DFFX1 mem_reg_0__3_ ( .D(n170), .CLK(clk), .Q(mem[59]) );
  DFFX1 mem_reg_0__2_ ( .D(n171), .CLK(clk), .Q(mem[58]) );
  DFFX1 mem_reg_0__1_ ( .D(n172), .CLK(clk), .Q(mem[57]) );
  DFFX1 mem_reg_0__0_ ( .D(n173), .CLK(clk), .Q(mem[56]) );
  DFFX1 mem_reg_1__7_ ( .D(n174), .CLK(clk), .Q(mem[55]) );
  DFFX1 mem_reg_1__6_ ( .D(n175), .CLK(clk), .Q(mem[54]) );
  DFFX1 mem_reg_1__5_ ( .D(n176), .CLK(clk), .Q(mem[53]) );
  DFFX1 mem_reg_1__4_ ( .D(n177), .CLK(clk), .Q(mem[52]) );
  DFFX1 mem_reg_1__3_ ( .D(n178), .CLK(clk), .Q(mem[51]) );
  DFFX1 mem_reg_1__2_ ( .D(n179), .CLK(clk), .Q(mem[50]) );
  DFFX1 mem_reg_1__1_ ( .D(n180), .CLK(clk), .Q(mem[49]) );
  DFFX1 mem_reg_1__0_ ( .D(n181), .CLK(clk), .Q(mem[48]) );
  DFFX1 mem_reg_2__7_ ( .D(n182), .CLK(clk), .Q(mem[47]) );
  DFFX1 mem_reg_2__6_ ( .D(n183), .CLK(clk), .Q(mem[46]) );
  DFFX1 mem_reg_2__5_ ( .D(n184), .CLK(clk), .Q(mem[45]) );
  DFFX1 mem_reg_2__4_ ( .D(n185), .CLK(clk), .Q(mem[44]) );
  DFFX1 mem_reg_2__3_ ( .D(n186), .CLK(clk), .Q(mem[43]) );
  DFFX1 mem_reg_2__2_ ( .D(n187), .CLK(clk), .Q(mem[42]) );
  DFFX1 mem_reg_2__1_ ( .D(n188), .CLK(clk), .Q(mem[41]) );
  DFFX1 mem_reg_2__0_ ( .D(n189), .CLK(clk), .Q(mem[40]) );
  DFFX1 mem_reg_3__7_ ( .D(n190), .CLK(clk), .Q(mem[39]) );
  DFFX1 mem_reg_3__6_ ( .D(n191), .CLK(clk), .Q(mem[38]) );
  DFFX1 mem_reg_3__5_ ( .D(n192), .CLK(clk), .Q(mem[37]) );
  DFFX1 mem_reg_3__4_ ( .D(n193), .CLK(clk), .Q(mem[36]) );
  DFFX1 mem_reg_3__3_ ( .D(n194), .CLK(clk), .Q(mem[35]) );
  DFFX1 mem_reg_3__2_ ( .D(n195), .CLK(clk), .Q(mem[34]) );
  DFFX1 mem_reg_3__1_ ( .D(n196), .CLK(clk), .Q(mem[33]) );
  DFFX1 mem_reg_3__0_ ( .D(n197), .CLK(clk), .Q(mem[32]) );
  DFFX1 mem_reg_4__7_ ( .D(n198), .CLK(clk), .Q(mem[31]) );
  DFFX1 mem_reg_4__6_ ( .D(n199), .CLK(clk), .Q(mem[30]) );
  DFFX1 mem_reg_4__5_ ( .D(n200), .CLK(clk), .Q(mem[29]) );
  DFFX1 mem_reg_4__4_ ( .D(n201), .CLK(clk), .Q(mem[28]) );
  DFFX1 mem_reg_4__3_ ( .D(n202), .CLK(clk), .Q(mem[27]) );
  DFFX1 mem_reg_4__2_ ( .D(n203), .CLK(clk), .Q(mem[26]) );
  DFFX1 mem_reg_4__1_ ( .D(n204), .CLK(clk), .Q(mem[25]) );
  DFFX1 mem_reg_4__0_ ( .D(n205), .CLK(clk), .Q(mem[24]) );
  DFFX1 mem_reg_5__7_ ( .D(n206), .CLK(clk), .Q(mem[23]) );
  DFFX1 mem_reg_5__6_ ( .D(n207), .CLK(clk), .Q(mem[22]) );
  DFFX1 mem_reg_5__5_ ( .D(n208), .CLK(clk), .Q(mem[21]) );
  DFFX1 mem_reg_5__4_ ( .D(n209), .CLK(clk), .Q(mem[20]) );
  DFFX1 mem_reg_5__3_ ( .D(n210), .CLK(clk), .Q(mem[19]) );
  DFFX1 mem_reg_5__2_ ( .D(n211), .CLK(clk), .Q(mem[18]) );
  DFFX1 mem_reg_5__1_ ( .D(n212), .CLK(clk), .Q(mem[17]) );
  DFFX1 mem_reg_5__0_ ( .D(n213), .CLK(clk), .Q(mem[16]) );
  DFFX1 mem_reg_6__7_ ( .D(n214), .CLK(clk), .Q(mem[15]) );
  DFFX1 mem_reg_6__6_ ( .D(n215), .CLK(clk), .Q(mem[14]) );
  DFFX1 mem_reg_6__5_ ( .D(n216), .CLK(clk), .Q(mem[13]) );
  DFFX1 mem_reg_6__4_ ( .D(n217), .CLK(clk), .Q(mem[12]) );
  DFFX1 mem_reg_6__3_ ( .D(n218), .CLK(clk), .Q(mem[11]) );
  DFFX1 mem_reg_6__2_ ( .D(n219), .CLK(clk), .Q(mem[10]) );
  DFFX1 mem_reg_6__1_ ( .D(n220), .CLK(clk), .Q(mem[9]) );
  DFFX1 mem_reg_6__0_ ( .D(n221), .CLK(clk), .Q(mem[8]) );
  DFFX1 mem_reg_7__7_ ( .D(n222), .CLK(clk), .Q(mem[7]) );
  DFFX1 mem_reg_7__6_ ( .D(n223), .CLK(clk), .Q(mem[6]) );
  DFFX1 mem_reg_7__5_ ( .D(n224), .CLK(clk), .Q(mem[5]) );
  DFFX1 mem_reg_7__4_ ( .D(n225), .CLK(clk), .Q(mem[4]) );
  DFFX1 mem_reg_7__3_ ( .D(n226), .CLK(clk), .Q(mem[3]) );
  DFFX1 mem_reg_7__2_ ( .D(n227), .CLK(clk), .Q(mem[2]) );
  DFFX1 mem_reg_7__1_ ( .D(n228), .CLK(clk), .Q(mem[1]) );
  DFFX1 mem_reg_7__0_ ( .D(n229), .CLK(clk), .Q(mem[0]) );
  AO22X1 U14 ( .IN1(wdata[0]), .IN2(n89), .IN3(mem[0]), .IN4(n159), .Q(n229)
         );
  AO22X1 U15 ( .IN1(wdata[1]), .IN2(n89), .IN3(mem[1]), .IN4(n159), .Q(n228)
         );
  AO22X1 U16 ( .IN1(wdata[2]), .IN2(n89), .IN3(mem[2]), .IN4(n159), .Q(n227)
         );
  AO22X1 U17 ( .IN1(wdata[3]), .IN2(n89), .IN3(mem[3]), .IN4(n159), .Q(n226)
         );
  AO22X1 U18 ( .IN1(wdata[4]), .IN2(n89), .IN3(mem[4]), .IN4(n159), .Q(n225)
         );
  AO22X1 U19 ( .IN1(wdata[5]), .IN2(n89), .IN3(mem[5]), .IN4(n158), .Q(n224)
         );
  AO22X1 U20 ( .IN1(wdata[6]), .IN2(n89), .IN3(mem[6]), .IN4(n158), .Q(n223)
         );
  AO22X1 U21 ( .IN1(wdata[7]), .IN2(n89), .IN3(mem[7]), .IN4(n158), .Q(n222)
         );
  AO22X1 U23 ( .IN1(n165), .IN2(wdata[0]), .IN3(mem[8]), .IN4(n157), .Q(n221)
         );
  AO22X1 U24 ( .IN1(n165), .IN2(wdata[1]), .IN3(mem[9]), .IN4(n157), .Q(n220)
         );
  AO22X1 U25 ( .IN1(n165), .IN2(wdata[2]), .IN3(mem[10]), .IN4(n157), .Q(n219)
         );
  AO22X1 U26 ( .IN1(n165), .IN2(wdata[3]), .IN3(mem[11]), .IN4(n157), .Q(n218)
         );
  AO22X1 U27 ( .IN1(n165), .IN2(wdata[4]), .IN3(mem[12]), .IN4(n157), .Q(n217)
         );
  AO22X1 U28 ( .IN1(n165), .IN2(wdata[5]), .IN3(mem[13]), .IN4(n156), .Q(n216)
         );
  AO22X1 U29 ( .IN1(n165), .IN2(wdata[6]), .IN3(mem[14]), .IN4(n156), .Q(n215)
         );
  AO22X1 U30 ( .IN1(n165), .IN2(wdata[7]), .IN3(mem[15]), .IN4(n156), .Q(n214)
         );
  AO22X1 U32 ( .IN1(n95), .IN2(n86), .IN3(mem[16]), .IN4(n155), .Q(n213) );
  AO22X1 U33 ( .IN1(n95), .IN2(n88), .IN3(mem[17]), .IN4(n155), .Q(n212) );
  AO22X1 U34 ( .IN1(n95), .IN2(n11), .IN3(mem[18]), .IN4(n155), .Q(n211) );
  AO22X1 U35 ( .IN1(n95), .IN2(n87), .IN3(mem[19]), .IN4(n155), .Q(n210) );
  AO22X1 U36 ( .IN1(n95), .IN2(n10), .IN3(mem[20]), .IN4(n155), .Q(n209) );
  AO22X1 U37 ( .IN1(n95), .IN2(n3), .IN3(mem[21]), .IN4(n154), .Q(n208) );
  AO22X1 U38 ( .IN1(n95), .IN2(n9), .IN3(mem[22]), .IN4(n154), .Q(n207) );
  AO22X1 U39 ( .IN1(n95), .IN2(n2), .IN3(mem[23]), .IN4(n154), .Q(n206) );
  AO22X1 U41 ( .IN1(n93), .IN2(n86), .IN3(mem[24]), .IN4(n153), .Q(n205) );
  AO22X1 U42 ( .IN1(n93), .IN2(n88), .IN3(mem[25]), .IN4(n153), .Q(n204) );
  AO22X1 U43 ( .IN1(n93), .IN2(n11), .IN3(mem[26]), .IN4(n153), .Q(n203) );
  AO22X1 U44 ( .IN1(n93), .IN2(n87), .IN3(mem[27]), .IN4(n153), .Q(n202) );
  AO22X1 U45 ( .IN1(n93), .IN2(n10), .IN3(mem[28]), .IN4(n153), .Q(n201) );
  AO22X1 U46 ( .IN1(n93), .IN2(n3), .IN3(mem[29]), .IN4(n152), .Q(n200) );
  AO22X1 U47 ( .IN1(n93), .IN2(n9), .IN3(mem[30]), .IN4(n152), .Q(n199) );
  AO22X1 U48 ( .IN1(n93), .IN2(n2), .IN3(mem[31]), .IN4(n152), .Q(n198) );
  AND2X1 U50 ( .IN1(we), .IN2(waddr[2]), .Q(n238) );
  AO22X1 U51 ( .IN1(n163), .IN2(n86), .IN3(mem[32]), .IN4(n151), .Q(n197) );
  AO22X1 U52 ( .IN1(n163), .IN2(n88), .IN3(mem[33]), .IN4(n151), .Q(n196) );
  AO22X1 U53 ( .IN1(n163), .IN2(n11), .IN3(mem[34]), .IN4(n151), .Q(n195) );
  AO22X1 U54 ( .IN1(n163), .IN2(n87), .IN3(mem[35]), .IN4(n151), .Q(n194) );
  AO22X1 U55 ( .IN1(n163), .IN2(n10), .IN3(mem[36]), .IN4(n151), .Q(n193) );
  AO22X1 U56 ( .IN1(n163), .IN2(n3), .IN3(mem[37]), .IN4(n150), .Q(n192) );
  AO22X1 U57 ( .IN1(n163), .IN2(n9), .IN3(mem[38]), .IN4(n150), .Q(n191) );
  AO22X1 U58 ( .IN1(n163), .IN2(n2), .IN3(mem[39]), .IN4(n150), .Q(n190) );
  AO22X1 U60 ( .IN1(n162), .IN2(n86), .IN3(mem[40]), .IN4(n149), .Q(n189) );
  AO22X1 U61 ( .IN1(n162), .IN2(n88), .IN3(mem[41]), .IN4(n149), .Q(n188) );
  AO22X1 U62 ( .IN1(n162), .IN2(n11), .IN3(mem[42]), .IN4(n149), .Q(n187) );
  AO22X1 U63 ( .IN1(n162), .IN2(n87), .IN3(mem[43]), .IN4(n149), .Q(n186) );
  AO22X1 U64 ( .IN1(n162), .IN2(n10), .IN3(mem[44]), .IN4(n149), .Q(n185) );
  AO22X1 U65 ( .IN1(n162), .IN2(n3), .IN3(mem[45]), .IN4(n148), .Q(n184) );
  AO22X1 U66 ( .IN1(n162), .IN2(n9), .IN3(mem[46]), .IN4(n148), .Q(n183) );
  AO22X1 U67 ( .IN1(n162), .IN2(n2), .IN3(mem[47]), .IN4(n148), .Q(n182) );
  AO22X1 U69 ( .IN1(n94), .IN2(n86), .IN3(mem[48]), .IN4(n147), .Q(n181) );
  AO22X1 U70 ( .IN1(n94), .IN2(n88), .IN3(mem[49]), .IN4(n147), .Q(n180) );
  AO22X1 U71 ( .IN1(n94), .IN2(n11), .IN3(mem[50]), .IN4(n147), .Q(n179) );
  AO22X1 U72 ( .IN1(n94), .IN2(n87), .IN3(mem[51]), .IN4(n147), .Q(n178) );
  AO22X1 U73 ( .IN1(n94), .IN2(n10), .IN3(mem[52]), .IN4(n147), .Q(n177) );
  AO22X1 U74 ( .IN1(n94), .IN2(n3), .IN3(mem[53]), .IN4(n146), .Q(n176) );
  AO22X1 U75 ( .IN1(n94), .IN2(n9), .IN3(mem[54]), .IN4(n146), .Q(n175) );
  AO22X1 U76 ( .IN1(n94), .IN2(n2), .IN3(mem[55]), .IN4(n146), .Q(n174) );
  AO22X1 U78 ( .IN1(n92), .IN2(n86), .IN3(mem[56]), .IN4(n145), .Q(n173) );
  AO22X1 U79 ( .IN1(n92), .IN2(n88), .IN3(mem[57]), .IN4(n145), .Q(n172) );
  AO22X1 U80 ( .IN1(n92), .IN2(n11), .IN3(mem[58]), .IN4(n145), .Q(n171) );
  AO22X1 U81 ( .IN1(n92), .IN2(n87), .IN3(mem[59]), .IN4(n145), .Q(n170) );
  AO22X1 U82 ( .IN1(n92), .IN2(n10), .IN3(mem[60]), .IN4(n145), .Q(n169) );
  AO22X1 U83 ( .IN1(n92), .IN2(n3), .IN3(mem[61]), .IN4(n144), .Q(n168) );
  AO22X1 U84 ( .IN1(n92), .IN2(n9), .IN3(mem[62]), .IN4(n144), .Q(n167) );
  AO22X1 U85 ( .IN1(n92), .IN2(n2), .IN3(mem[63]), .IN4(n144), .Q(n166) );
  NOR2X0 U2 ( .IN1(n133), .IN2(n132), .QN(n125) );
  NBUFFX2 U3 ( .INP(n239), .Z(n159) );
  OAI22X1 U4 ( .IN1(n90), .IN2(n143), .IN3(n91), .IN4(n8), .QN(rdata[0]) );
  AOI221X1 U5 ( .IN1(mem[16]), .IN2(n135), .IN3(mem[0]), .IN4(n138), .IN5(n97),
        .QN(n90) );
  NAND3X1 U6 ( .IN1(n96), .IN2(n238), .IN3(waddr[1]), .QN(n239) );
  NAND3X0 U7 ( .IN1(n238), .IN2(n161), .IN3(n96), .QN(n236) );
  NBUFFX2 U8 ( .INP(waddr[0]), .Z(n96) );
  NAND3X1 U9 ( .IN1(waddr[1]), .IN2(n160), .IN3(n233), .QN(n232) );
  NAND3X1 U10 ( .IN1(waddr[1]), .IN2(n96), .IN3(n233), .QN(n234) );
  NBUFFX2 U11 ( .INP(n239), .Z(n158) );
  NAND3X0 U12 ( .IN1(n160), .IN2(n161), .IN3(n233), .QN(n230) );
  NAND3X0 U13 ( .IN1(n160), .IN2(n161), .IN3(n238), .QN(n235) );
  NAND3X0 U22 ( .IN1(n96), .IN2(n161), .IN3(n233), .QN(n231) );
  NAND3X0 U31 ( .IN1(n238), .IN2(n160), .IN3(waddr[1]), .QN(n237) );
  NBUFFX2 U40 ( .INP(raddr[0]), .Z(n8) );
  NBUFFX2 U49 ( .INP(raddr[0]), .Z(n1) );
  NBUFFX2 U59 ( .INP(wdata[7]), .Z(n2) );
  NBUFFX2 U68 ( .INP(wdata[5]), .Z(n3) );
  NAND2X0 U77 ( .IN1(n118), .IN2(n1), .QN(n4) );
  NAND2X0 U86 ( .IN1(n117), .IN2(n143), .QN(n5) );
  NAND2X0 U87 ( .IN1(n4), .IN2(n5), .QN(rdata[5]) );
  NAND2X0 U88 ( .IN1(n106), .IN2(n1), .QN(n6) );
  NAND2X0 U89 ( .IN1(n105), .IN2(n143), .QN(n7) );
  NAND2X0 U90 ( .IN1(n6), .IN2(n7), .QN(rdata[2]) );
  NBUFFX2 U91 ( .INP(wdata[6]), .Z(n9) );
  NBUFFX2 U92 ( .INP(wdata[4]), .Z(n10) );
  NBUFFX2 U93 ( .INP(wdata[2]), .Z(n11) );
  NBUFFX2 U94 ( .INP(wdata[0]), .Z(n86) );
  NBUFFX2 U95 ( .INP(wdata[3]), .Z(n87) );
  NBUFFX2 U96 ( .INP(wdata[1]), .Z(n88) );
  INVX0 U97 ( .INP(n239), .ZN(n89) );
  AOI221X1 U98 ( .IN1(mem[24]), .IN2(n134), .IN3(mem[8]), .IN4(n138), .IN5(n98), .QN(n91) );
  INVX0 U99 ( .INP(n230), .ZN(n92) );
  INVX0 U100 ( .INP(n235), .ZN(n93) );
  INVX0 U101 ( .INP(n231), .ZN(n94) );
  INVX0 U102 ( .INP(n236), .ZN(n95) );
  NBUFFX2 U103 ( .INP(n125), .Z(n140) );
  NBUFFX2 U104 ( .INP(n125), .Z(n139) );
  INVX0 U105 ( .INP(n150), .ZN(n163) );
  INVX0 U106 ( .INP(n148), .ZN(n162) );
  INVX0 U107 ( .INP(n156), .ZN(n165) );
  NBUFFX2 U108 ( .INP(n235), .Z(n152) );
  NBUFFX2 U109 ( .INP(n236), .Z(n154) );
  NBUFFX2 U110 ( .INP(n231), .Z(n146) );
  NBUFFX2 U111 ( .INP(n230), .Z(n144) );
  NBUFFX2 U112 ( .INP(n152), .Z(n153) );
  NBUFFX2 U113 ( .INP(n154), .Z(n155) );
  NBUFFX2 U114 ( .INP(n146), .Z(n147) );
  NBUFFX2 U115 ( .INP(n144), .Z(n145) );
  NBUFFX2 U116 ( .INP(n124), .Z(n142) );
  NBUFFX2 U117 ( .INP(n124), .Z(n141) );
  NBUFFX2 U118 ( .INP(n128), .Z(n135) );
  NBUFFX2 U119 ( .INP(n128), .Z(n134) );
  NBUFFX2 U120 ( .INP(n237), .Z(n156) );
  NBUFFX2 U121 ( .INP(n234), .Z(n150) );
  NBUFFX2 U122 ( .INP(n232), .Z(n148) );
  NBUFFX2 U123 ( .INP(n237), .Z(n157) );
  NBUFFX2 U124 ( .INP(n234), .Z(n151) );
  NBUFFX2 U125 ( .INP(n232), .Z(n149) );
  NOR2X0 U126 ( .IN1(n164), .IN2(waddr[2]), .QN(n233) );
  INVX0 U127 ( .INP(we), .ZN(n164) );
  NOR2X0 U128 ( .IN1(n131), .IN2(raddr[1]), .QN(n128) );
  NOR2X0 U129 ( .IN1(raddr[1]), .IN2(n132), .QN(n124) );
  AO22X1 U130 ( .IN1(mem[32]), .IN2(n140), .IN3(mem[48]), .IN4(n142), .Q(n97)
         );
  AO22X1 U131 ( .IN1(mem[40]), .IN2(n140), .IN3(mem[56]), .IN4(n141), .Q(n98)
         );
  AO22X1 U132 ( .IN1(mem[33]), .IN2(n140), .IN3(mem[49]), .IN4(n142), .Q(n99)
         );
  AO221X1 U133 ( .IN1(mem[17]), .IN2(n135), .IN3(mem[1]), .IN4(n138), .IN5(n99), .Q(n102) );
  AO22X1 U134 ( .IN1(mem[41]), .IN2(n140), .IN3(mem[57]), .IN4(n141), .Q(n100)
         );
  AO221X1 U135 ( .IN1(mem[25]), .IN2(n134), .IN3(mem[9]), .IN4(n138), .IN5(
        n100), .Q(n101) );
  AO22X1 U136 ( .IN1(n102), .IN2(n1), .IN3(n101), .IN4(n143), .Q(rdata[1]) );
  AO22X1 U137 ( .IN1(mem[34]), .IN2(n140), .IN3(mem[50]), .IN4(n142), .Q(n103)
         );
  AO221X1 U138 ( .IN1(mem[18]), .IN2(n135), .IN3(mem[2]), .IN4(n138), .IN5(
        n103), .Q(n106) );
  AO22X1 U139 ( .IN1(mem[42]), .IN2(n140), .IN3(mem[58]), .IN4(n141), .Q(n104)
         );
  AO221X1 U140 ( .IN1(mem[26]), .IN2(n134), .IN3(mem[10]), .IN4(n138), .IN5(
        n104), .Q(n105) );
  AO22X1 U141 ( .IN1(mem[35]), .IN2(n140), .IN3(mem[51]), .IN4(n142), .Q(n107)
         );
  AO221X1 U142 ( .IN1(mem[19]), .IN2(n135), .IN3(mem[3]), .IN4(n136), .IN5(
        n107), .Q(n110) );
  AO22X1 U143 ( .IN1(mem[43]), .IN2(n140), .IN3(mem[59]), .IN4(n141), .Q(n108)
         );
  AO221X1 U144 ( .IN1(mem[27]), .IN2(n134), .IN3(mem[11]), .IN4(n137), .IN5(
        n108), .Q(n109) );
  AO22X1 U145 ( .IN1(n110), .IN2(n1), .IN3(n109), .IN4(n143), .Q(rdata[3]) );
  AO22X1 U146 ( .IN1(mem[36]), .IN2(n139), .IN3(mem[52]), .IN4(n142), .Q(n111)
         );
  AO221X1 U147 ( .IN1(mem[20]), .IN2(n135), .IN3(mem[4]), .IN4(n136), .IN5(
        n111), .Q(n114) );
  AO22X1 U148 ( .IN1(mem[44]), .IN2(n139), .IN3(mem[60]), .IN4(n141), .Q(n112)
         );
  AO221X1 U149 ( .IN1(mem[28]), .IN2(n134), .IN3(mem[12]), .IN4(n137), .IN5(
        n112), .Q(n113) );
  AO22X1 U150 ( .IN1(n114), .IN2(n1), .IN3(n113), .IN4(n143), .Q(rdata[4]) );
  AO22X1 U151 ( .IN1(mem[37]), .IN2(n139), .IN3(mem[53]), .IN4(n142), .Q(n115)
         );
  AO221X1 U152 ( .IN1(mem[21]), .IN2(n135), .IN3(mem[5]), .IN4(n136), .IN5(
        n115), .Q(n118) );
  AO22X1 U153 ( .IN1(mem[45]), .IN2(n139), .IN3(mem[61]), .IN4(n141), .Q(n116)
         );
  AO221X1 U154 ( .IN1(mem[29]), .IN2(n134), .IN3(mem[13]), .IN4(n137), .IN5(
        n116), .Q(n117) );
  AO22X1 U155 ( .IN1(mem[38]), .IN2(n139), .IN3(mem[54]), .IN4(n142), .Q(n119)
         );
  AO221X1 U156 ( .IN1(mem[22]), .IN2(n135), .IN3(mem[6]), .IN4(n136), .IN5(
        n119), .Q(n122) );
  AO22X1 U157 ( .IN1(mem[46]), .IN2(n139), .IN3(mem[62]), .IN4(n141), .Q(n120)
         );
  AO221X1 U158 ( .IN1(mem[30]), .IN2(n134), .IN3(mem[14]), .IN4(n137), .IN5(
        n120), .Q(n121) );
  AO22X1 U159 ( .IN1(n122), .IN2(n1), .IN3(n121), .IN4(n143), .Q(rdata[6]) );
  AO22X1 U160 ( .IN1(mem[39]), .IN2(n139), .IN3(mem[55]), .IN4(n142), .Q(n123)
         );
  AO221X1 U161 ( .IN1(mem[23]), .IN2(n135), .IN3(mem[7]), .IN4(n136), .IN5(
        n123), .Q(n130) );
  AO22X1 U162 ( .IN1(mem[47]), .IN2(n139), .IN3(mem[63]), .IN4(n141), .Q(n126)
         );
  AO221X1 U163 ( .IN1(mem[31]), .IN2(n134), .IN3(mem[15]), .IN4(n137), .IN5(
        n126), .Q(n129) );
  AO22X1 U164 ( .IN1(raddr[0]), .IN2(n130), .IN3(n129), .IN4(n143), .Q(
        rdata[7]) );
  INVX0 U165 ( .INP(raddr[2]), .ZN(n131) );
  INVX0 U166 ( .INP(n131), .ZN(n132) );
  INVX0 U167 ( .INP(raddr[1]), .ZN(n133) );
  INVX0 U168 ( .INP(n8), .ZN(n143) );
  NOR2X0 U169 ( .IN1(n131), .IN2(n133), .QN(n127) );
  NBUFFX2 U170 ( .INP(n127), .Z(n138) );
  NBUFFX2 U171 ( .INP(n127), .Z(n136) );
  NBUFFX2 U172 ( .INP(n127), .Z(n137) );
  INVX0 U173 ( .INP(n96), .ZN(n160) );
  INVX0 U174 ( .INP(waddr[1]), .ZN(n161) );
endmodule


module payload_ram_bank8x8_10 ( clk, we, waddr, wdata, raddr, rdata );
  input [2:0] waddr;
  input [7:0] wdata;
  input [2:0] raddr;
  output [7:0] rdata;
  input clk, we;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246,
         n247, n248, n249, n250, n251, n252, n253;
  wire   [63:0] mem;

  DFFX1 mem_reg_0__7_ ( .D(n180), .CLK(clk), .Q(mem[63]) );
  DFFX1 mem_reg_0__6_ ( .D(n181), .CLK(clk), .Q(mem[62]) );
  DFFX1 mem_reg_0__5_ ( .D(n182), .CLK(clk), .Q(mem[61]) );
  DFFX1 mem_reg_0__4_ ( .D(n183), .CLK(clk), .Q(mem[60]) );
  DFFX1 mem_reg_0__3_ ( .D(n184), .CLK(clk), .Q(mem[59]) );
  DFFX1 mem_reg_0__2_ ( .D(n185), .CLK(clk), .Q(mem[58]) );
  DFFX1 mem_reg_0__1_ ( .D(n186), .CLK(clk), .Q(mem[57]) );
  DFFX1 mem_reg_0__0_ ( .D(n187), .CLK(clk), .Q(mem[56]) );
  DFFX1 mem_reg_1__7_ ( .D(n188), .CLK(clk), .Q(mem[55]) );
  DFFX1 mem_reg_1__6_ ( .D(n189), .CLK(clk), .Q(mem[54]) );
  DFFX1 mem_reg_1__5_ ( .D(n190), .CLK(clk), .Q(mem[53]) );
  DFFX1 mem_reg_1__4_ ( .D(n191), .CLK(clk), .Q(mem[52]) );
  DFFX1 mem_reg_1__3_ ( .D(n192), .CLK(clk), .Q(mem[51]) );
  DFFX1 mem_reg_1__2_ ( .D(n193), .CLK(clk), .Q(mem[50]) );
  DFFX1 mem_reg_1__1_ ( .D(n194), .CLK(clk), .Q(mem[49]) );
  DFFX1 mem_reg_1__0_ ( .D(n195), .CLK(clk), .Q(mem[48]) );
  DFFX1 mem_reg_2__7_ ( .D(n196), .CLK(clk), .Q(mem[47]) );
  DFFX1 mem_reg_2__6_ ( .D(n197), .CLK(clk), .Q(mem[46]) );
  DFFX1 mem_reg_2__5_ ( .D(n198), .CLK(clk), .Q(mem[45]) );
  DFFX1 mem_reg_2__4_ ( .D(n199), .CLK(clk), .Q(mem[44]) );
  DFFX1 mem_reg_2__3_ ( .D(n200), .CLK(clk), .Q(mem[43]) );
  DFFX1 mem_reg_2__2_ ( .D(n201), .CLK(clk), .Q(mem[42]) );
  DFFX1 mem_reg_2__1_ ( .D(n202), .CLK(clk), .Q(mem[41]) );
  DFFX1 mem_reg_2__0_ ( .D(n203), .CLK(clk), .Q(mem[40]) );
  DFFX1 mem_reg_3__7_ ( .D(n204), .CLK(clk), .Q(mem[39]) );
  DFFX1 mem_reg_3__6_ ( .D(n205), .CLK(clk), .Q(mem[38]) );
  DFFX1 mem_reg_3__5_ ( .D(n206), .CLK(clk), .Q(mem[37]) );
  DFFX1 mem_reg_3__4_ ( .D(n207), .CLK(clk), .Q(mem[36]) );
  DFFX1 mem_reg_3__3_ ( .D(n208), .CLK(clk), .Q(mem[35]) );
  DFFX1 mem_reg_3__2_ ( .D(n209), .CLK(clk), .Q(mem[34]) );
  DFFX1 mem_reg_3__1_ ( .D(n210), .CLK(clk), .Q(mem[33]) );
  DFFX1 mem_reg_3__0_ ( .D(n211), .CLK(clk), .Q(mem[32]) );
  DFFX1 mem_reg_4__7_ ( .D(n212), .CLK(clk), .Q(mem[31]) );
  DFFX1 mem_reg_4__6_ ( .D(n213), .CLK(clk), .Q(mem[30]) );
  DFFX1 mem_reg_4__5_ ( .D(n214), .CLK(clk), .Q(mem[29]) );
  DFFX1 mem_reg_4__4_ ( .D(n215), .CLK(clk), .Q(mem[28]) );
  DFFX1 mem_reg_4__3_ ( .D(n216), .CLK(clk), .Q(mem[27]) );
  DFFX1 mem_reg_4__2_ ( .D(n217), .CLK(clk), .Q(mem[26]) );
  DFFX1 mem_reg_4__1_ ( .D(n218), .CLK(clk), .Q(mem[25]) );
  DFFX1 mem_reg_4__0_ ( .D(n219), .CLK(clk), .Q(mem[24]) );
  DFFX1 mem_reg_5__7_ ( .D(n220), .CLK(clk), .Q(mem[23]) );
  DFFX1 mem_reg_5__6_ ( .D(n221), .CLK(clk), .Q(mem[22]) );
  DFFX1 mem_reg_5__5_ ( .D(n222), .CLK(clk), .Q(mem[21]) );
  DFFX1 mem_reg_5__4_ ( .D(n223), .CLK(clk), .Q(mem[20]) );
  DFFX1 mem_reg_5__3_ ( .D(n224), .CLK(clk), .Q(mem[19]) );
  DFFX1 mem_reg_5__2_ ( .D(n225), .CLK(clk), .Q(mem[18]) );
  DFFX1 mem_reg_5__1_ ( .D(n226), .CLK(clk), .Q(mem[17]) );
  DFFX1 mem_reg_5__0_ ( .D(n227), .CLK(clk), .Q(mem[16]) );
  DFFX1 mem_reg_6__7_ ( .D(n228), .CLK(clk), .Q(mem[15]) );
  DFFX1 mem_reg_6__6_ ( .D(n229), .CLK(clk), .Q(mem[14]) );
  DFFX1 mem_reg_6__5_ ( .D(n230), .CLK(clk), .Q(mem[13]) );
  DFFX1 mem_reg_6__4_ ( .D(n231), .CLK(clk), .Q(mem[12]) );
  DFFX1 mem_reg_6__3_ ( .D(n232), .CLK(clk), .Q(mem[11]) );
  DFFX1 mem_reg_6__2_ ( .D(n233), .CLK(clk), .Q(mem[10]) );
  DFFX1 mem_reg_6__1_ ( .D(n234), .CLK(clk), .Q(mem[9]) );
  DFFX1 mem_reg_6__0_ ( .D(n235), .CLK(clk), .Q(mem[8]) );
  DFFX1 mem_reg_7__7_ ( .D(n236), .CLK(clk), .Q(mem[7]) );
  DFFX1 mem_reg_7__6_ ( .D(n237), .CLK(clk), .Q(mem[6]) );
  DFFX1 mem_reg_7__5_ ( .D(n238), .CLK(clk), .Q(mem[5]) );
  DFFX1 mem_reg_7__4_ ( .D(n239), .CLK(clk), .Q(mem[4]) );
  DFFX1 mem_reg_7__3_ ( .D(n240), .CLK(clk), .Q(mem[3]) );
  DFFX1 mem_reg_7__2_ ( .D(n241), .CLK(clk), .Q(mem[2]) );
  DFFX1 mem_reg_7__1_ ( .D(n242), .CLK(clk), .Q(mem[1]) );
  DFFX1 mem_reg_7__0_ ( .D(n243), .CLK(clk), .Q(mem[0]) );
  AO22X1 U14 ( .IN1(wdata[0]), .IN2(n179), .IN3(mem[0]), .IN4(n168), .Q(n243)
         );
  AO22X1 U15 ( .IN1(wdata[1]), .IN2(n179), .IN3(mem[1]), .IN4(n168), .Q(n242)
         );
  AO22X1 U16 ( .IN1(wdata[2]), .IN2(n100), .IN3(mem[2]), .IN4(n168), .Q(n241)
         );
  AO22X1 U17 ( .IN1(wdata[3]), .IN2(n100), .IN3(mem[3]), .IN4(n168), .Q(n240)
         );
  AO22X1 U18 ( .IN1(wdata[4]), .IN2(n179), .IN3(mem[4]), .IN4(n168), .Q(n239)
         );
  AO22X1 U19 ( .IN1(wdata[5]), .IN2(n100), .IN3(mem[5]), .IN4(n167), .Q(n238)
         );
  AO22X1 U20 ( .IN1(wdata[6]), .IN2(n100), .IN3(mem[6]), .IN4(n167), .Q(n237)
         );
  AO22X1 U21 ( .IN1(wdata[7]), .IN2(n100), .IN3(mem[7]), .IN4(n167), .Q(n236)
         );
  AO22X1 U23 ( .IN1(n178), .IN2(wdata[0]), .IN3(mem[8]), .IN4(n166), .Q(n235)
         );
  AO22X1 U24 ( .IN1(n178), .IN2(wdata[1]), .IN3(mem[9]), .IN4(n166), .Q(n234)
         );
  AO22X1 U25 ( .IN1(n178), .IN2(wdata[2]), .IN3(mem[10]), .IN4(n166), .Q(n233)
         );
  AO22X1 U26 ( .IN1(n93), .IN2(wdata[3]), .IN3(mem[11]), .IN4(n166), .Q(n232)
         );
  AO22X1 U27 ( .IN1(n93), .IN2(wdata[4]), .IN3(mem[12]), .IN4(n166), .Q(n231)
         );
  AO22X1 U28 ( .IN1(n93), .IN2(wdata[5]), .IN3(mem[13]), .IN4(n165), .Q(n230)
         );
  AO22X1 U29 ( .IN1(n93), .IN2(wdata[6]), .IN3(mem[14]), .IN4(n165), .Q(n229)
         );
  AO22X1 U30 ( .IN1(n93), .IN2(wdata[7]), .IN3(mem[15]), .IN4(n165), .Q(n228)
         );
  AO22X1 U32 ( .IN1(n177), .IN2(n87), .IN3(mem[16]), .IN4(n164), .Q(n227) );
  AO22X1 U33 ( .IN1(n92), .IN2(n89), .IN3(mem[17]), .IN4(n164), .Q(n226) );
  AO22X1 U34 ( .IN1(n177), .IN2(n86), .IN3(mem[18]), .IN4(n164), .Q(n225) );
  AO22X1 U35 ( .IN1(n92), .IN2(n88), .IN3(mem[19]), .IN4(n164), .Q(n224) );
  AO22X1 U36 ( .IN1(n92), .IN2(n11), .IN3(mem[20]), .IN4(n164), .Q(n223) );
  AO22X1 U37 ( .IN1(n177), .IN2(n9), .IN3(mem[21]), .IN4(n163), .Q(n222) );
  AO22X1 U38 ( .IN1(n177), .IN2(n10), .IN3(mem[22]), .IN4(n163), .Q(n221) );
  AO22X1 U39 ( .IN1(n92), .IN2(n8), .IN3(mem[23]), .IN4(n163), .Q(n220) );
  AO22X1 U41 ( .IN1(n176), .IN2(n87), .IN3(mem[24]), .IN4(n162), .Q(n219) );
  AO22X1 U42 ( .IN1(n176), .IN2(n89), .IN3(mem[25]), .IN4(n162), .Q(n218) );
  AO22X1 U43 ( .IN1(n176), .IN2(n86), .IN3(mem[26]), .IN4(n162), .Q(n217) );
  AO22X1 U44 ( .IN1(n176), .IN2(n88), .IN3(mem[27]), .IN4(n162), .Q(n216) );
  AO22X1 U45 ( .IN1(n101), .IN2(n11), .IN3(mem[28]), .IN4(n162), .Q(n215) );
  AO22X1 U46 ( .IN1(n101), .IN2(n9), .IN3(mem[29]), .IN4(n161), .Q(n214) );
  AO22X1 U47 ( .IN1(n101), .IN2(n10), .IN3(mem[30]), .IN4(n161), .Q(n213) );
  AO22X1 U48 ( .IN1(n101), .IN2(n8), .IN3(mem[31]), .IN4(n161), .Q(n212) );
  AND2X1 U50 ( .IN1(we), .IN2(waddr[2]), .Q(n252) );
  AO22X1 U51 ( .IN1(n174), .IN2(n87), .IN3(mem[32]), .IN4(n160), .Q(n211) );
  AO22X1 U52 ( .IN1(n174), .IN2(n89), .IN3(mem[33]), .IN4(n160), .Q(n210) );
  AO22X1 U53 ( .IN1(n174), .IN2(n86), .IN3(mem[34]), .IN4(n160), .Q(n209) );
  AO22X1 U54 ( .IN1(n95), .IN2(n88), .IN3(mem[35]), .IN4(n160), .Q(n208) );
  AO22X1 U55 ( .IN1(n95), .IN2(n11), .IN3(mem[36]), .IN4(n160), .Q(n207) );
  AO22X1 U56 ( .IN1(n95), .IN2(n9), .IN3(mem[37]), .IN4(n159), .Q(n206) );
  AO22X1 U57 ( .IN1(n95), .IN2(n10), .IN3(mem[38]), .IN4(n159), .Q(n205) );
  AO22X1 U58 ( .IN1(n95), .IN2(n8), .IN3(mem[39]), .IN4(n159), .Q(n204) );
  AO22X1 U60 ( .IN1(n173), .IN2(n87), .IN3(mem[40]), .IN4(n158), .Q(n203) );
  AO22X1 U61 ( .IN1(n173), .IN2(n89), .IN3(mem[41]), .IN4(n158), .Q(n202) );
  AO22X1 U62 ( .IN1(n173), .IN2(n86), .IN3(mem[42]), .IN4(n158), .Q(n201) );
  AO22X1 U63 ( .IN1(n94), .IN2(n88), .IN3(mem[43]), .IN4(n158), .Q(n200) );
  AO22X1 U64 ( .IN1(n94), .IN2(n11), .IN3(mem[44]), .IN4(n158), .Q(n199) );
  AO22X1 U65 ( .IN1(n94), .IN2(n9), .IN3(mem[45]), .IN4(n157), .Q(n198) );
  AO22X1 U66 ( .IN1(n94), .IN2(n10), .IN3(mem[46]), .IN4(n157), .Q(n197) );
  AO22X1 U67 ( .IN1(n94), .IN2(n8), .IN3(mem[47]), .IN4(n157), .Q(n196) );
  AO22X1 U69 ( .IN1(n172), .IN2(n87), .IN3(mem[48]), .IN4(n156), .Q(n195) );
  AO22X1 U70 ( .IN1(n172), .IN2(n89), .IN3(mem[49]), .IN4(n156), .Q(n194) );
  AO22X1 U71 ( .IN1(n172), .IN2(n86), .IN3(mem[50]), .IN4(n156), .Q(n193) );
  AO22X1 U72 ( .IN1(n172), .IN2(n88), .IN3(mem[51]), .IN4(n156), .Q(n192) );
  AO22X1 U73 ( .IN1(n103), .IN2(n11), .IN3(mem[52]), .IN4(n156), .Q(n191) );
  AO22X1 U74 ( .IN1(n103), .IN2(n9), .IN3(mem[53]), .IN4(n155), .Q(n190) );
  AO22X1 U75 ( .IN1(n103), .IN2(n10), .IN3(mem[54]), .IN4(n155), .Q(n189) );
  AO22X1 U76 ( .IN1(n103), .IN2(n8), .IN3(mem[55]), .IN4(n155), .Q(n188) );
  AO22X1 U78 ( .IN1(n171), .IN2(n87), .IN3(mem[56]), .IN4(n154), .Q(n187) );
  AO22X1 U79 ( .IN1(n171), .IN2(n89), .IN3(mem[57]), .IN4(n154), .Q(n186) );
  AO22X1 U80 ( .IN1(n171), .IN2(n86), .IN3(mem[58]), .IN4(n154), .Q(n185) );
  AO22X1 U81 ( .IN1(n171), .IN2(n88), .IN3(mem[59]), .IN4(n154), .Q(n184) );
  AO22X1 U82 ( .IN1(n102), .IN2(n11), .IN3(mem[60]), .IN4(n154), .Q(n183) );
  AO22X1 U83 ( .IN1(n102), .IN2(n9), .IN3(mem[61]), .IN4(n153), .Q(n182) );
  AO22X1 U84 ( .IN1(n102), .IN2(n10), .IN3(mem[62]), .IN4(n153), .Q(n181) );
  AO22X1 U85 ( .IN1(n102), .IN2(n8), .IN3(mem[63]), .IN4(n153), .Q(n180) );
  NBUFFX2 U2 ( .INP(n152), .Z(n7) );
  NAND3X0 U3 ( .IN1(n169), .IN2(n252), .IN3(n99), .QN(n253) );
  NAND3X0 U4 ( .IN1(n252), .IN2(n170), .IN3(n99), .QN(n251) );
  NAND3X0 U5 ( .IN1(n252), .IN2(n98), .IN3(n169), .QN(n250) );
  NAND3X0 U6 ( .IN1(n170), .IN2(n98), .IN3(n252), .QN(n249) );
  NAND3X0 U7 ( .IN1(n99), .IN2(n169), .IN3(n247), .QN(n248) );
  NAND3X0 U8 ( .IN1(n99), .IN2(n170), .IN3(n247), .QN(n246) );
  NAND3X0 U9 ( .IN1(n169), .IN2(n98), .IN3(n247), .QN(n245) );
  NAND3X0 U10 ( .IN1(n170), .IN2(n98), .IN3(n247), .QN(n244) );
  NBUFFX2 U11 ( .INP(n134), .Z(n148) );
  NBUFFX2 U12 ( .INP(n133), .Z(n6) );
  NBUFFX2 U13 ( .INP(n137), .Z(n2) );
  NBUFFX2 U22 ( .INP(n134), .Z(n4) );
  NBUFFX2 U31 ( .INP(n133), .Z(n5) );
  NBUFFX2 U40 ( .INP(n137), .Z(n1) );
  NBUFFX2 U49 ( .INP(n134), .Z(n3) );
  NBUFFX2 U59 ( .INP(n137), .Z(n142) );
  NBUFFX2 U68 ( .INP(n133), .Z(n150) );
  NBUFFX2 U77 ( .INP(n134), .Z(n147) );
  NBUFFX2 U86 ( .INP(n137), .Z(n143) );
  NBUFFX2 U87 ( .INP(n163), .Z(n164) );
  NBUFFX2 U88 ( .INP(n249), .Z(n162) );
  NBUFFX2 U89 ( .INP(n249), .Z(n161) );
  NBUFFX2 U90 ( .INP(n245), .Z(n156) );
  NBUFFX2 U91 ( .INP(n245), .Z(n155) );
  NBUFFX2 U92 ( .INP(n244), .Z(n154) );
  NBUFFX2 U93 ( .INP(n244), .Z(n153) );
  NBUFFX2 U94 ( .INP(wdata[7]), .Z(n8) );
  NBUFFX2 U95 ( .INP(wdata[5]), .Z(n9) );
  NBUFFX2 U96 ( .INP(wdata[6]), .Z(n10) );
  NBUFFX2 U97 ( .INP(wdata[4]), .Z(n11) );
  NBUFFX2 U98 ( .INP(wdata[2]), .Z(n86) );
  NBUFFX2 U99 ( .INP(wdata[0]), .Z(n87) );
  NBUFFX2 U100 ( .INP(wdata[3]), .Z(n88) );
  NBUFFX2 U101 ( .INP(wdata[1]), .Z(n89) );
  NBUFFX2 U102 ( .INP(raddr[0]), .Z(n90) );
  INVX0 U103 ( .INP(n177), .ZN(n91) );
  INVX0 U104 ( .INP(n91), .ZN(n92) );
  INVX0 U105 ( .INP(n251), .ZN(n93) );
  INVX0 U106 ( .INP(n246), .ZN(n94) );
  INVX0 U107 ( .INP(n248), .ZN(n95) );
  INVX0 U108 ( .INP(n90), .ZN(n96) );
  INVX0 U109 ( .INP(n90), .ZN(n97) );
  INVX0 U110 ( .INP(waddr[1]), .ZN(n98) );
  INVX0 U111 ( .INP(n98), .ZN(n99) );
  INVX0 U112 ( .INP(n253), .ZN(n100) );
  INVX0 U113 ( .INP(n249), .ZN(n101) );
  INVX0 U114 ( .INP(n244), .ZN(n102) );
  INVX0 U115 ( .INP(n245), .ZN(n103) );
  NBUFFX2 U116 ( .INP(n136), .Z(n144) );
  NBUFFX2 U117 ( .INP(n136), .Z(n145) );
  INVX0 U118 ( .INP(n161), .ZN(n176) );
  INVX0 U119 ( .INP(n250), .ZN(n177) );
  INVX0 U120 ( .INP(n155), .ZN(n172) );
  INVX0 U121 ( .INP(n153), .ZN(n171) );
  NBUFFX2 U122 ( .INP(n133), .Z(n149) );
  NBUFFX2 U123 ( .INP(n136), .Z(n146) );
  INVX0 U124 ( .INP(n167), .ZN(n179) );
  INVX0 U125 ( .INP(n159), .ZN(n174) );
  INVX0 U126 ( .INP(n157), .ZN(n173) );
  INVX0 U127 ( .INP(n165), .ZN(n178) );
  NBUFFX2 U128 ( .INP(n250), .Z(n163) );
  NBUFFX2 U129 ( .INP(n251), .Z(n165) );
  NBUFFX2 U130 ( .INP(n253), .Z(n167) );
  NBUFFX2 U131 ( .INP(n248), .Z(n159) );
  NBUFFX2 U132 ( .INP(n246), .Z(n157) );
  NBUFFX2 U133 ( .INP(n253), .Z(n168) );
  NBUFFX2 U134 ( .INP(n251), .Z(n166) );
  NBUFFX2 U135 ( .INP(n248), .Z(n160) );
  NBUFFX2 U136 ( .INP(n246), .Z(n158) );
  NOR2X0 U137 ( .IN1(n175), .IN2(waddr[2]), .QN(n247) );
  INVX0 U138 ( .INP(we), .ZN(n175) );
  NOR2X0 U139 ( .IN1(n151), .IN2(n140), .QN(n137) );
  NOR2X0 U140 ( .IN1(n151), .IN2(n141), .QN(n133) );
  AO22X1 U141 ( .IN1(mem[32]), .IN2(n148), .IN3(mem[48]), .IN4(n150), .Q(n104)
         );
  AO221X1 U142 ( .IN1(mem[16]), .IN2(n143), .IN3(mem[0]), .IN4(n146), .IN5(
        n104), .Q(n107) );
  AO22X1 U143 ( .IN1(mem[40]), .IN2(n147), .IN3(mem[56]), .IN4(n149), .Q(n105)
         );
  AO221X1 U144 ( .IN1(mem[24]), .IN2(n142), .IN3(mem[8]), .IN4(n146), .IN5(
        n105), .Q(n106) );
  AO22X1 U145 ( .IN1(n107), .IN2(raddr[0]), .IN3(n106), .IN4(n97), .Q(rdata[0]) );
  AO22X1 U146 ( .IN1(mem[33]), .IN2(n148), .IN3(mem[49]), .IN4(n150), .Q(n108)
         );
  AO221X1 U147 ( .IN1(mem[17]), .IN2(n143), .IN3(mem[1]), .IN4(n146), .IN5(
        n108), .Q(n111) );
  AO22X1 U148 ( .IN1(mem[41]), .IN2(n3), .IN3(mem[57]), .IN4(n5), .Q(n109) );
  AO221X1 U149 ( .IN1(mem[25]), .IN2(n1), .IN3(mem[9]), .IN4(n146), .IN5(n109),
        .Q(n110) );
  AO22X1 U150 ( .IN1(n111), .IN2(raddr[0]), .IN3(n110), .IN4(n96), .Q(rdata[1]) );
  AO22X1 U151 ( .IN1(mem[34]), .IN2(n147), .IN3(mem[50]), .IN4(n149), .Q(n112)
         );
  AO221X1 U152 ( .IN1(mem[18]), .IN2(n142), .IN3(mem[2]), .IN4(n146), .IN5(
        n112), .Q(n115) );
  AO22X1 U153 ( .IN1(mem[42]), .IN2(n4), .IN3(mem[58]), .IN4(n6), .Q(n113) );
  AO221X1 U154 ( .IN1(mem[26]), .IN2(n2), .IN3(mem[10]), .IN4(n146), .IN5(n113), .Q(n114) );
  AO22X1 U155 ( .IN1(n115), .IN2(n90), .IN3(n114), .IN4(n96), .Q(rdata[2]) );
  AO22X1 U156 ( .IN1(mem[35]), .IN2(n148), .IN3(mem[51]), .IN4(n149), .Q(n116)
         );
  AO221X1 U157 ( .IN1(mem[19]), .IN2(n2), .IN3(mem[3]), .IN4(n144), .IN5(n116),
        .Q(n119) );
  AO22X1 U158 ( .IN1(mem[43]), .IN2(n148), .IN3(mem[59]), .IN4(n6), .Q(n117)
         );
  AO221X1 U159 ( .IN1(mem[27]), .IN2(n2), .IN3(mem[11]), .IN4(n145), .IN5(n117), .Q(n118) );
  AO22X1 U160 ( .IN1(n119), .IN2(n90), .IN3(n118), .IN4(n96), .Q(rdata[3]) );
  AO22X1 U161 ( .IN1(mem[36]), .IN2(n4), .IN3(mem[52]), .IN4(n150), .Q(n120)
         );
  AO221X1 U162 ( .IN1(mem[20]), .IN2(n1), .IN3(mem[4]), .IN4(n144), .IN5(n120),
        .Q(n123) );
  AO22X1 U163 ( .IN1(mem[44]), .IN2(n4), .IN3(mem[60]), .IN4(n5), .Q(n121) );
  AO221X1 U164 ( .IN1(mem[28]), .IN2(n1), .IN3(mem[12]), .IN4(n145), .IN5(n121), .Q(n122) );
  AO22X1 U165 ( .IN1(n123), .IN2(n90), .IN3(n122), .IN4(n96), .Q(rdata[4]) );
  AO22X1 U166 ( .IN1(mem[37]), .IN2(n3), .IN3(mem[53]), .IN4(n6), .Q(n124) );
  AO221X1 U167 ( .IN1(mem[21]), .IN2(n142), .IN3(mem[5]), .IN4(n144), .IN5(
        n124), .Q(n127) );
  AO22X1 U168 ( .IN1(mem[45]), .IN2(n3), .IN3(mem[61]), .IN4(n149), .Q(n125)
         );
  AO221X1 U169 ( .IN1(mem[29]), .IN2(n142), .IN3(mem[13]), .IN4(n145), .IN5(
        n125), .Q(n126) );
  AO22X1 U170 ( .IN1(n127), .IN2(n90), .IN3(n126), .IN4(n97), .Q(rdata[5]) );
  AO22X1 U171 ( .IN1(mem[38]), .IN2(n147), .IN3(mem[54]), .IN4(n5), .Q(n128)
         );
  AO221X1 U172 ( .IN1(mem[22]), .IN2(n143), .IN3(mem[6]), .IN4(n144), .IN5(
        n128), .Q(n131) );
  AO22X1 U173 ( .IN1(mem[46]), .IN2(n147), .IN3(mem[62]), .IN4(n150), .Q(n129)
         );
  AO221X1 U174 ( .IN1(mem[30]), .IN2(n143), .IN3(mem[14]), .IN4(n145), .IN5(
        n129), .Q(n130) );
  AO22X1 U175 ( .IN1(n131), .IN2(n90), .IN3(n130), .IN4(n96), .Q(rdata[6]) );
  AO22X1 U176 ( .IN1(mem[39]), .IN2(n3), .IN3(mem[55]), .IN4(n5), .Q(n132) );
  AO221X1 U177 ( .IN1(mem[23]), .IN2(n1), .IN3(mem[7]), .IN4(n144), .IN5(n132),
        .Q(n139) );
  AO22X1 U178 ( .IN1(mem[47]), .IN2(n4), .IN3(mem[63]), .IN4(n6), .Q(n135) );
  AO221X1 U179 ( .IN1(mem[31]), .IN2(n2), .IN3(mem[15]), .IN4(n145), .IN5(n135), .Q(n138) );
  AO22X1 U180 ( .IN1(n90), .IN2(n139), .IN3(n138), .IN4(n97), .Q(rdata[7]) );
  INVX0 U181 ( .INP(raddr[2]), .ZN(n140) );
  INVX0 U182 ( .INP(n140), .ZN(n141) );
  INVX0 U183 ( .INP(n152), .ZN(n151) );
  INVX0 U184 ( .INP(raddr[1]), .ZN(n152) );
  NOR2X0 U185 ( .IN1(n140), .IN2(n7), .QN(n136) );
  NOR2X0 U186 ( .IN1(n7), .IN2(n141), .QN(n134) );
  INVX0 U187 ( .INP(n170), .ZN(n169) );
  INVX0 U188 ( .INP(waddr[0]), .ZN(n170) );
endmodule


module payload_ram_bank8x8_9 ( clk, we, waddr, wdata, raddr, rdata );
  input [2:0] waddr;
  input [7:0] wdata;
  input [2:0] raddr;
  output [7:0] rdata;
  input clk, we;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245;
  wire   [63:0] mem;

  DFFX1 mem_reg_0__7_ ( .D(n172), .CLK(clk), .Q(mem[63]) );
  DFFX1 mem_reg_0__6_ ( .D(n173), .CLK(clk), .Q(mem[62]) );
  DFFX1 mem_reg_0__5_ ( .D(n174), .CLK(clk), .Q(mem[61]) );
  DFFX1 mem_reg_0__4_ ( .D(n175), .CLK(clk), .Q(mem[60]) );
  DFFX1 mem_reg_0__3_ ( .D(n176), .CLK(clk), .Q(mem[59]) );
  DFFX1 mem_reg_0__2_ ( .D(n177), .CLK(clk), .Q(mem[58]) );
  DFFX1 mem_reg_0__1_ ( .D(n178), .CLK(clk), .Q(mem[57]) );
  DFFX1 mem_reg_0__0_ ( .D(n179), .CLK(clk), .Q(mem[56]) );
  DFFX1 mem_reg_1__7_ ( .D(n180), .CLK(clk), .Q(mem[55]) );
  DFFX1 mem_reg_1__6_ ( .D(n181), .CLK(clk), .Q(mem[54]) );
  DFFX1 mem_reg_1__5_ ( .D(n182), .CLK(clk), .Q(mem[53]) );
  DFFX1 mem_reg_1__4_ ( .D(n183), .CLK(clk), .Q(mem[52]) );
  DFFX1 mem_reg_1__3_ ( .D(n184), .CLK(clk), .Q(mem[51]) );
  DFFX1 mem_reg_1__2_ ( .D(n185), .CLK(clk), .Q(mem[50]) );
  DFFX1 mem_reg_1__1_ ( .D(n186), .CLK(clk), .Q(mem[49]) );
  DFFX1 mem_reg_1__0_ ( .D(n187), .CLK(clk), .Q(mem[48]) );
  DFFX1 mem_reg_2__7_ ( .D(n188), .CLK(clk), .Q(mem[47]) );
  DFFX1 mem_reg_2__6_ ( .D(n189), .CLK(clk), .Q(mem[46]) );
  DFFX1 mem_reg_2__5_ ( .D(n190), .CLK(clk), .Q(mem[45]) );
  DFFX1 mem_reg_2__4_ ( .D(n191), .CLK(clk), .Q(mem[44]) );
  DFFX1 mem_reg_2__3_ ( .D(n192), .CLK(clk), .Q(mem[43]) );
  DFFX1 mem_reg_2__2_ ( .D(n193), .CLK(clk), .Q(mem[42]) );
  DFFX1 mem_reg_2__1_ ( .D(n194), .CLK(clk), .Q(mem[41]) );
  DFFX1 mem_reg_2__0_ ( .D(n195), .CLK(clk), .Q(mem[40]) );
  DFFX1 mem_reg_3__7_ ( .D(n196), .CLK(clk), .Q(mem[39]) );
  DFFX1 mem_reg_3__6_ ( .D(n197), .CLK(clk), .Q(mem[38]) );
  DFFX1 mem_reg_3__5_ ( .D(n198), .CLK(clk), .Q(mem[37]) );
  DFFX1 mem_reg_3__4_ ( .D(n199), .CLK(clk), .Q(mem[36]) );
  DFFX1 mem_reg_3__3_ ( .D(n200), .CLK(clk), .Q(mem[35]) );
  DFFX1 mem_reg_3__2_ ( .D(n201), .CLK(clk), .Q(mem[34]) );
  DFFX1 mem_reg_3__1_ ( .D(n202), .CLK(clk), .Q(mem[33]) );
  DFFX1 mem_reg_3__0_ ( .D(n203), .CLK(clk), .Q(mem[32]) );
  DFFX1 mem_reg_4__7_ ( .D(n204), .CLK(clk), .Q(mem[31]) );
  DFFX1 mem_reg_4__6_ ( .D(n205), .CLK(clk), .Q(mem[30]) );
  DFFX1 mem_reg_4__5_ ( .D(n206), .CLK(clk), .Q(mem[29]) );
  DFFX1 mem_reg_4__4_ ( .D(n207), .CLK(clk), .Q(mem[28]) );
  DFFX1 mem_reg_4__3_ ( .D(n208), .CLK(clk), .Q(mem[27]) );
  DFFX1 mem_reg_4__2_ ( .D(n209), .CLK(clk), .Q(mem[26]) );
  DFFX1 mem_reg_4__1_ ( .D(n210), .CLK(clk), .Q(mem[25]) );
  DFFX1 mem_reg_4__0_ ( .D(n211), .CLK(clk), .Q(mem[24]) );
  DFFX1 mem_reg_5__7_ ( .D(n212), .CLK(clk), .Q(mem[23]) );
  DFFX1 mem_reg_5__6_ ( .D(n213), .CLK(clk), .Q(mem[22]) );
  DFFX1 mem_reg_5__5_ ( .D(n214), .CLK(clk), .Q(mem[21]) );
  DFFX1 mem_reg_5__4_ ( .D(n215), .CLK(clk), .Q(mem[20]) );
  DFFX1 mem_reg_5__3_ ( .D(n216), .CLK(clk), .Q(mem[19]) );
  DFFX1 mem_reg_5__2_ ( .D(n217), .CLK(clk), .Q(mem[18]) );
  DFFX1 mem_reg_5__1_ ( .D(n218), .CLK(clk), .Q(mem[17]) );
  DFFX1 mem_reg_5__0_ ( .D(n219), .CLK(clk), .Q(mem[16]) );
  DFFX1 mem_reg_6__7_ ( .D(n220), .CLK(clk), .Q(mem[15]) );
  DFFX1 mem_reg_6__6_ ( .D(n221), .CLK(clk), .Q(mem[14]) );
  DFFX1 mem_reg_6__5_ ( .D(n222), .CLK(clk), .Q(mem[13]) );
  DFFX1 mem_reg_6__4_ ( .D(n223), .CLK(clk), .Q(mem[12]) );
  DFFX1 mem_reg_6__3_ ( .D(n224), .CLK(clk), .Q(mem[11]) );
  DFFX1 mem_reg_6__2_ ( .D(n225), .CLK(clk), .Q(mem[10]) );
  DFFX1 mem_reg_6__1_ ( .D(n226), .CLK(clk), .Q(mem[9]) );
  DFFX1 mem_reg_6__0_ ( .D(n227), .CLK(clk), .Q(mem[8]) );
  DFFX1 mem_reg_7__7_ ( .D(n228), .CLK(clk), .Q(mem[7]) );
  DFFX1 mem_reg_7__6_ ( .D(n229), .CLK(clk), .Q(mem[6]) );
  DFFX1 mem_reg_7__5_ ( .D(n230), .CLK(clk), .Q(mem[5]) );
  DFFX1 mem_reg_7__4_ ( .D(n231), .CLK(clk), .Q(mem[4]) );
  DFFX1 mem_reg_7__3_ ( .D(n232), .CLK(clk), .Q(mem[3]) );
  DFFX1 mem_reg_7__2_ ( .D(n233), .CLK(clk), .Q(mem[2]) );
  DFFX1 mem_reg_7__1_ ( .D(n234), .CLK(clk), .Q(mem[1]) );
  DFFX1 mem_reg_7__0_ ( .D(n235), .CLK(clk), .Q(mem[0]) );
  AO22X1 U14 ( .IN1(n92), .IN2(n171), .IN3(mem[0]), .IN4(n165), .Q(n235) );
  AO22X1 U15 ( .IN1(wdata[1]), .IN2(n171), .IN3(mem[1]), .IN4(n165), .Q(n234)
         );
  AO22X1 U16 ( .IN1(n91), .IN2(n171), .IN3(mem[2]), .IN4(n165), .Q(n233) );
  AO22X1 U17 ( .IN1(wdata[3]), .IN2(n171), .IN3(mem[3]), .IN4(n165), .Q(n232)
         );
  AO22X1 U18 ( .IN1(n3), .IN2(n102), .IN3(mem[4]), .IN4(n165), .Q(n231) );
  AO22X1 U19 ( .IN1(wdata[5]), .IN2(n102), .IN3(mem[5]), .IN4(n164), .Q(n230)
         );
  AO22X1 U20 ( .IN1(n88), .IN2(n102), .IN3(mem[6]), .IN4(n164), .Q(n229) );
  AO22X1 U21 ( .IN1(wdata[7]), .IN2(n102), .IN3(mem[7]), .IN4(n164), .Q(n228)
         );
  AO22X1 U23 ( .IN1(n89), .IN2(n92), .IN3(mem[8]), .IN4(n163), .Q(n227) );
  AO22X1 U24 ( .IN1(n89), .IN2(wdata[1]), .IN3(mem[9]), .IN4(n163), .Q(n226)
         );
  AO22X1 U25 ( .IN1(n89), .IN2(n91), .IN3(mem[10]), .IN4(n163), .Q(n225) );
  AO22X1 U26 ( .IN1(n89), .IN2(wdata[3]), .IN3(mem[11]), .IN4(n163), .Q(n224)
         );
  AO22X1 U27 ( .IN1(n89), .IN2(n3), .IN3(mem[12]), .IN4(n163), .Q(n223) );
  AO22X1 U28 ( .IN1(n89), .IN2(wdata[5]), .IN3(mem[13]), .IN4(n162), .Q(n222)
         );
  AO22X1 U29 ( .IN1(n89), .IN2(n88), .IN3(mem[14]), .IN4(n162), .Q(n221) );
  AO22X1 U30 ( .IN1(n89), .IN2(wdata[7]), .IN3(mem[15]), .IN4(n162), .Q(n220)
         );
  AO22X1 U32 ( .IN1(n86), .IN2(wdata[0]), .IN3(mem[16]), .IN4(n161), .Q(n219)
         );
  AO22X1 U33 ( .IN1(n86), .IN2(n8), .IN3(mem[17]), .IN4(n161), .Q(n218) );
  AO22X1 U34 ( .IN1(n86), .IN2(wdata[2]), .IN3(mem[18]), .IN4(n161), .Q(n217)
         );
  AO22X1 U35 ( .IN1(n86), .IN2(n7), .IN3(mem[19]), .IN4(n161), .Q(n216) );
  AO22X1 U36 ( .IN1(n86), .IN2(n3), .IN3(mem[20]), .IN4(n161), .Q(n215) );
  AO22X1 U37 ( .IN1(n86), .IN2(n5), .IN3(mem[21]), .IN4(n160), .Q(n214) );
  AO22X1 U38 ( .IN1(n86), .IN2(n88), .IN3(mem[22]), .IN4(n160), .Q(n213) );
  AO22X1 U39 ( .IN1(n86), .IN2(n4), .IN3(mem[23]), .IN4(n160), .Q(n212) );
  AO22X1 U41 ( .IN1(n10), .IN2(n92), .IN3(mem[24]), .IN4(n159), .Q(n211) );
  AO22X1 U42 ( .IN1(n10), .IN2(n8), .IN3(mem[25]), .IN4(n159), .Q(n210) );
  AO22X1 U43 ( .IN1(n10), .IN2(n91), .IN3(mem[26]), .IN4(n159), .Q(n209) );
  AO22X1 U44 ( .IN1(n10), .IN2(n7), .IN3(mem[27]), .IN4(n159), .Q(n208) );
  AO22X1 U45 ( .IN1(n10), .IN2(n3), .IN3(mem[28]), .IN4(n159), .Q(n207) );
  AO22X1 U46 ( .IN1(n10), .IN2(n5), .IN3(mem[29]), .IN4(n158), .Q(n206) );
  AO22X1 U47 ( .IN1(n10), .IN2(n88), .IN3(mem[30]), .IN4(n158), .Q(n205) );
  AO22X1 U48 ( .IN1(n10), .IN2(n4), .IN3(mem[31]), .IN4(n158), .Q(n204) );
  AND2X1 U50 ( .IN1(we), .IN2(waddr[2]), .Q(n244) );
  AO22X1 U51 ( .IN1(n169), .IN2(n92), .IN3(mem[32]), .IN4(n157), .Q(n203) );
  AO22X1 U52 ( .IN1(n90), .IN2(n8), .IN3(mem[33]), .IN4(n157), .Q(n202) );
  AO22X1 U53 ( .IN1(n90), .IN2(n91), .IN3(mem[34]), .IN4(n157), .Q(n201) );
  AO22X1 U54 ( .IN1(n90), .IN2(n7), .IN3(mem[35]), .IN4(n157), .Q(n200) );
  AO22X1 U55 ( .IN1(n90), .IN2(n3), .IN3(mem[36]), .IN4(n157), .Q(n199) );
  AO22X1 U56 ( .IN1(n169), .IN2(n5), .IN3(mem[37]), .IN4(n156), .Q(n198) );
  AO22X1 U57 ( .IN1(n90), .IN2(n88), .IN3(mem[38]), .IN4(n156), .Q(n197) );
  AO22X1 U58 ( .IN1(n169), .IN2(n4), .IN3(mem[39]), .IN4(n156), .Q(n196) );
  AO22X1 U60 ( .IN1(n6), .IN2(n92), .IN3(mem[40]), .IN4(n155), .Q(n195) );
  AO22X1 U61 ( .IN1(n6), .IN2(n8), .IN3(mem[41]), .IN4(n155), .Q(n194) );
  AO22X1 U62 ( .IN1(n6), .IN2(n91), .IN3(mem[42]), .IN4(n155), .Q(n193) );
  AO22X1 U63 ( .IN1(n6), .IN2(n7), .IN3(mem[43]), .IN4(n155), .Q(n192) );
  AO22X1 U64 ( .IN1(n6), .IN2(wdata[4]), .IN3(mem[44]), .IN4(n155), .Q(n191)
         );
  AO22X1 U65 ( .IN1(n6), .IN2(n5), .IN3(mem[45]), .IN4(n154), .Q(n190) );
  AO22X1 U66 ( .IN1(n6), .IN2(n88), .IN3(mem[46]), .IN4(n154), .Q(n189) );
  AO22X1 U67 ( .IN1(n6), .IN2(n4), .IN3(mem[47]), .IN4(n154), .Q(n188) );
  AO22X1 U69 ( .IN1(n11), .IN2(wdata[0]), .IN3(mem[48]), .IN4(n153), .Q(n187)
         );
  AO22X1 U70 ( .IN1(n11), .IN2(n8), .IN3(mem[49]), .IN4(n153), .Q(n186) );
  AO22X1 U71 ( .IN1(n11), .IN2(wdata[2]), .IN3(mem[50]), .IN4(n153), .Q(n185)
         );
  AO22X1 U72 ( .IN1(n11), .IN2(n7), .IN3(mem[51]), .IN4(n153), .Q(n184) );
  AO22X1 U73 ( .IN1(n11), .IN2(n3), .IN3(mem[52]), .IN4(n153), .Q(n183) );
  AO22X1 U74 ( .IN1(n11), .IN2(n5), .IN3(mem[53]), .IN4(n152), .Q(n182) );
  AO22X1 U75 ( .IN1(n11), .IN2(n88), .IN3(mem[54]), .IN4(n152), .Q(n181) );
  AO22X1 U76 ( .IN1(n11), .IN2(n4), .IN3(mem[55]), .IN4(n152), .Q(n180) );
  AO22X1 U78 ( .IN1(n9), .IN2(n92), .IN3(mem[56]), .IN4(n151), .Q(n179) );
  AO22X1 U79 ( .IN1(n9), .IN2(n8), .IN3(mem[57]), .IN4(n151), .Q(n178) );
  AO22X1 U80 ( .IN1(n9), .IN2(n91), .IN3(mem[58]), .IN4(n151), .Q(n177) );
  AO22X1 U81 ( .IN1(n9), .IN2(n7), .IN3(mem[59]), .IN4(n151), .Q(n176) );
  AO22X1 U82 ( .IN1(n9), .IN2(wdata[4]), .IN3(mem[60]), .IN4(n151), .Q(n175)
         );
  AO22X1 U83 ( .IN1(n9), .IN2(n5), .IN3(mem[61]), .IN4(n150), .Q(n174) );
  AO22X1 U84 ( .IN1(n9), .IN2(n88), .IN3(mem[62]), .IN4(n150), .Q(n173) );
  AO22X1 U85 ( .IN1(n9), .IN2(n4), .IN3(mem[63]), .IN4(n150), .Q(n172) );
  NBUFFX4 U2 ( .INP(n128), .Z(n148) );
  NBUFFX4 U3 ( .INP(n128), .Z(n149) );
  NBUFFX4 U4 ( .INP(n128), .Z(n134) );
  NBUFFX2 U5 ( .INP(n125), .Z(n147) );
  NBUFFX2 U6 ( .INP(n124), .Z(n145) );
  OAI22X1 U7 ( .IN1(n98), .IN2(n142), .IN3(n99), .IN4(n93), .QN(rdata[0]) );
  AOI221X1 U8 ( .IN1(mem[24]), .IN2(n134), .IN3(mem[8]), .IN4(n1), .IN5(n104),
        .QN(n99) );
  AOI221X1 U9 ( .IN1(mem[16]), .IN2(n148), .IN3(mem[0]), .IN4(n1), .IN5(n103),
        .QN(n98) );
  AOI221X1 U10 ( .IN1(mem[17]), .IN2(n149), .IN3(mem[1]), .IN4(n1), .IN5(n105),
        .QN(n100) );
  AOI221X1 U11 ( .IN1(mem[18]), .IN2(n148), .IN3(mem[2]), .IN4(n1), .IN5(n107),
        .QN(n96) );
  NBUFFX2 U12 ( .INP(n243), .Z(n163) );
  NBUFFX2 U13 ( .INP(n241), .Z(n158) );
  NBUFFX2 U22 ( .INP(n238), .Z(n155) );
  NBUFFX4 U31 ( .INP(n237), .Z(n152) );
  NBUFFX2 U40 ( .INP(n236), .Z(n150) );
  OAI22X1 U49 ( .IN1(n94), .IN2(n142), .IN3(n95), .IN4(n93), .QN(rdata[3]) );
  NAND3X1 U59 ( .IN1(n166), .IN2(n168), .IN3(n239), .QN(n237) );
  NBUFFX2 U68 ( .INP(n238), .Z(n154) );
  NBUFFX2 U77 ( .INP(n243), .Z(n162) );
  NAND3X0 U86 ( .IN1(n244), .IN2(n168), .IN3(n166), .QN(n242) );
  NAND3X0 U87 ( .IN1(n167), .IN2(n168), .IN3(n244), .QN(n241) );
  NAND3X0 U88 ( .IN1(waddr[1]), .IN2(n167), .IN3(n239), .QN(n238) );
  NAND3X0 U89 ( .IN1(n167), .IN2(n168), .IN3(n239), .QN(n236) );
  NOR2X0 U90 ( .IN1(n131), .IN2(n133), .QN(n1) );
  DELLN1X2 U91 ( .INP(n128), .Z(n135) );
  NBUFFX4 U92 ( .INP(n127), .Z(n136) );
  DELLN1X2 U93 ( .INP(n125), .Z(n146) );
  DELLN1X2 U94 ( .INP(n125), .Z(n137) );
  DELLN1X2 U95 ( .INP(n125), .Z(n138) );
  INVX0 U96 ( .INP(n133), .ZN(n2) );
  NBUFFX2 U97 ( .INP(wdata[4]), .Z(n3) );
  NBUFFX2 U98 ( .INP(wdata[7]), .Z(n4) );
  NBUFFX2 U99 ( .INP(wdata[5]), .Z(n5) );
  INVX0 U100 ( .INP(n238), .ZN(n6) );
  NBUFFX2 U101 ( .INP(wdata[3]), .Z(n7) );
  NBUFFX2 U102 ( .INP(wdata[1]), .Z(n8) );
  INVX0 U103 ( .INP(n236), .ZN(n9) );
  INVX0 U104 ( .INP(n241), .ZN(n10) );
  INVX0 U105 ( .INP(n237), .ZN(n11) );
  INVX0 U106 ( .INP(n242), .ZN(n86) );
  INVX0 U107 ( .INP(wdata[6]), .ZN(n87) );
  INVX0 U108 ( .INP(n87), .ZN(n88) );
  INVX0 U109 ( .INP(n243), .ZN(n89) );
  INVX0 U110 ( .INP(n240), .ZN(n90) );
  NAND3X4 U111 ( .IN1(waddr[1]), .IN2(n166), .IN3(n239), .QN(n240) );
  NBUFFX2 U112 ( .INP(wdata[2]), .Z(n91) );
  NBUFFX2 U113 ( .INP(wdata[0]), .Z(n92) );
  INVX0 U114 ( .INP(n142), .ZN(n93) );
  OAI22X2 U115 ( .IN1(n96), .IN2(n142), .IN3(n97), .IN4(n93), .QN(rdata[2]) );
  OAI22X2 U116 ( .IN1(n100), .IN2(n142), .IN3(n101), .IN4(n93), .QN(rdata[1])
         );
  INVX0 U117 ( .INP(n142), .ZN(n141) );
  AOI221X1 U118 ( .IN1(mem[19]), .IN2(n135), .IN3(mem[3]), .IN4(n143), .IN5(
        n109), .QN(n94) );
  AOI221X1 U119 ( .IN1(mem[27]), .IN2(n134), .IN3(mem[11]), .IN4(n136), .IN5(
        n110), .QN(n95) );
  AOI221X1 U120 ( .IN1(mem[26]), .IN2(n148), .IN3(mem[10]), .IN4(n1), .IN5(
        n108), .QN(n97) );
  AOI221X2 U121 ( .IN1(mem[25]), .IN2(n149), .IN3(mem[9]), .IN4(n1), .IN5(n106), .QN(n101) );
  INVX0 U122 ( .INP(n245), .ZN(n102) );
  NBUFFX2 U123 ( .INP(n124), .Z(n144) );
  NBUFFX2 U124 ( .INP(n124), .Z(n140) );
  NAND3X1 U125 ( .IN1(n166), .IN2(n244), .IN3(waddr[1]), .QN(n245) );
  NAND3X1 U126 ( .IN1(n244), .IN2(n167), .IN3(waddr[1]), .QN(n243) );
  INVX0 U127 ( .INP(n164), .ZN(n171) );
  INVX0 U128 ( .INP(n156), .ZN(n169) );
  NBUFFX2 U129 ( .INP(n242), .Z(n160) );
  NBUFFX2 U130 ( .INP(n158), .Z(n159) );
  NBUFFX2 U131 ( .INP(n160), .Z(n161) );
  NBUFFX2 U132 ( .INP(n152), .Z(n153) );
  NBUFFX2 U133 ( .INP(n150), .Z(n151) );
  NBUFFX2 U134 ( .INP(n245), .Z(n164) );
  NBUFFX2 U135 ( .INP(n240), .Z(n156) );
  NBUFFX2 U136 ( .INP(n245), .Z(n165) );
  NBUFFX2 U137 ( .INP(n240), .Z(n157) );
  NOR2X0 U138 ( .IN1(n170), .IN2(waddr[2]), .QN(n239) );
  INVX0 U139 ( .INP(we), .ZN(n170) );
  NOR2X0 U140 ( .IN1(n131), .IN2(n2), .QN(n128) );
  NOR2X0 U141 ( .IN1(raddr[1]), .IN2(n132), .QN(n124) );
  AO22X1 U142 ( .IN1(mem[32]), .IN2(n137), .IN3(mem[48]), .IN4(n139), .Q(n103)
         );
  AO22X1 U143 ( .IN1(mem[40]), .IN2(n146), .IN3(mem[56]), .IN4(n144), .Q(n104)
         );
  AO22X1 U144 ( .IN1(mem[33]), .IN2(n137), .IN3(mem[49]), .IN4(n139), .Q(n105)
         );
  AO22X1 U145 ( .IN1(mem[41]), .IN2(n146), .IN3(mem[57]), .IN4(n144), .Q(n106)
         );
  AO22X1 U146 ( .IN1(mem[34]), .IN2(n138), .IN3(mem[50]), .IN4(n140), .Q(n107)
         );
  AO22X1 U147 ( .IN1(mem[42]), .IN2(n147), .IN3(mem[58]), .IN4(n145), .Q(n108)
         );
  AO22X1 U148 ( .IN1(mem[35]), .IN2(n146), .IN3(mem[51]), .IN4(n144), .Q(n109)
         );
  AO22X1 U149 ( .IN1(mem[43]), .IN2(n137), .IN3(mem[59]), .IN4(n139), .Q(n110)
         );
  AO22X1 U150 ( .IN1(mem[36]), .IN2(n147), .IN3(mem[52]), .IN4(n145), .Q(n111)
         );
  AO221X1 U151 ( .IN1(mem[20]), .IN2(n135), .IN3(mem[4]), .IN4(n143), .IN5(
        n111), .Q(n114) );
  AO22X1 U152 ( .IN1(mem[44]), .IN2(n138), .IN3(mem[60]), .IN4(n140), .Q(n112)
         );
  AO221X1 U153 ( .IN1(mem[28]), .IN2(n149), .IN3(mem[12]), .IN4(n136), .IN5(
        n112), .Q(n113) );
  AO22X1 U154 ( .IN1(n114), .IN2(n141), .IN3(n113), .IN4(n142), .Q(rdata[4])
         );
  AO22X1 U155 ( .IN1(mem[37]), .IN2(n137), .IN3(mem[53]), .IN4(n139), .Q(n115)
         );
  AO221X1 U156 ( .IN1(mem[21]), .IN2(n135), .IN3(mem[5]), .IN4(n143), .IN5(
        n115), .Q(n118) );
  AO22X1 U157 ( .IN1(mem[45]), .IN2(n146), .IN3(mem[61]), .IN4(n144), .Q(n116)
         );
  AO221X1 U158 ( .IN1(mem[29]), .IN2(n148), .IN3(mem[13]), .IN4(n136), .IN5(
        n116), .Q(n117) );
  AO22X1 U159 ( .IN1(n118), .IN2(n93), .IN3(n117), .IN4(n142), .Q(rdata[5]) );
  AO22X1 U160 ( .IN1(mem[38]), .IN2(n138), .IN3(mem[54]), .IN4(n140), .Q(n119)
         );
  AO221X1 U161 ( .IN1(mem[22]), .IN2(n135), .IN3(mem[6]), .IN4(n143), .IN5(
        n119), .Q(n122) );
  AO22X1 U162 ( .IN1(mem[46]), .IN2(n147), .IN3(mem[62]), .IN4(n145), .Q(n120)
         );
  AO221X1 U163 ( .IN1(mem[30]), .IN2(n134), .IN3(mem[14]), .IN4(n136), .IN5(
        n120), .Q(n121) );
  AO22X1 U164 ( .IN1(n122), .IN2(n141), .IN3(n121), .IN4(n142), .Q(rdata[6])
         );
  AO22X1 U165 ( .IN1(mem[39]), .IN2(n138), .IN3(mem[55]), .IN4(n140), .Q(n123)
         );
  AO221X1 U166 ( .IN1(mem[23]), .IN2(n134), .IN3(mem[7]), .IN4(n143), .IN5(
        n123), .Q(n130) );
  AO22X1 U167 ( .IN1(mem[47]), .IN2(n147), .IN3(mem[63]), .IN4(n145), .Q(n126)
         );
  AO221X1 U168 ( .IN1(mem[31]), .IN2(n149), .IN3(mem[15]), .IN4(n136), .IN5(
        n126), .Q(n129) );
  AO22X1 U169 ( .IN1(n130), .IN2(n141), .IN3(n129), .IN4(n142), .Q(rdata[7])
         );
  INVX0 U170 ( .INP(raddr[2]), .ZN(n131) );
  INVX0 U171 ( .INP(n131), .ZN(n132) );
  INVX0 U172 ( .INP(raddr[1]), .ZN(n133) );
  INVX0 U173 ( .INP(raddr[0]), .ZN(n142) );
  NOR2X0 U174 ( .IN1(n131), .IN2(n133), .QN(n127) );
  NBUFFX2 U175 ( .INP(n124), .Z(n139) );
  NOR2X0 U176 ( .IN1(n133), .IN2(n132), .QN(n125) );
  NOR2X0 U177 ( .IN1(n131), .IN2(n133), .QN(n143) );
  INVX0 U178 ( .INP(n167), .ZN(n166) );
  INVX0 U179 ( .INP(waddr[0]), .ZN(n167) );
  INVX0 U180 ( .INP(waddr[1]), .ZN(n168) );
endmodule


module payload_ram_bank8x8_8 ( clk, we, waddr, wdata, raddr, rdata );
  input [2:0] waddr;
  input [7:0] wdata;
  input [2:0] raddr;
  output [7:0] rdata;
  input clk, we;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243;
  wire   [63:0] mem;

  DFFX1 mem_reg_0__7_ ( .D(n170), .CLK(clk), .Q(mem[63]) );
  DFFX1 mem_reg_0__6_ ( .D(n171), .CLK(clk), .Q(mem[62]) );
  DFFX1 mem_reg_0__5_ ( .D(n172), .CLK(clk), .Q(mem[61]) );
  DFFX1 mem_reg_0__4_ ( .D(n173), .CLK(clk), .Q(mem[60]) );
  DFFX1 mem_reg_0__3_ ( .D(n174), .CLK(clk), .Q(mem[59]) );
  DFFX1 mem_reg_0__2_ ( .D(n175), .CLK(clk), .Q(mem[58]) );
  DFFX1 mem_reg_0__1_ ( .D(n176), .CLK(clk), .Q(mem[57]) );
  DFFX1 mem_reg_0__0_ ( .D(n177), .CLK(clk), .Q(mem[56]) );
  DFFX1 mem_reg_1__7_ ( .D(n178), .CLK(clk), .Q(mem[55]) );
  DFFX1 mem_reg_1__6_ ( .D(n179), .CLK(clk), .Q(mem[54]) );
  DFFX1 mem_reg_1__5_ ( .D(n180), .CLK(clk), .Q(mem[53]) );
  DFFX1 mem_reg_1__4_ ( .D(n181), .CLK(clk), .Q(mem[52]) );
  DFFX1 mem_reg_1__3_ ( .D(n182), .CLK(clk), .Q(mem[51]) );
  DFFX1 mem_reg_1__2_ ( .D(n183), .CLK(clk), .Q(mem[50]) );
  DFFX1 mem_reg_1__1_ ( .D(n184), .CLK(clk), .Q(mem[49]) );
  DFFX1 mem_reg_1__0_ ( .D(n185), .CLK(clk), .Q(mem[48]) );
  DFFX1 mem_reg_2__7_ ( .D(n186), .CLK(clk), .Q(mem[47]) );
  DFFX1 mem_reg_2__6_ ( .D(n187), .CLK(clk), .Q(mem[46]) );
  DFFX1 mem_reg_2__5_ ( .D(n188), .CLK(clk), .Q(mem[45]) );
  DFFX1 mem_reg_2__4_ ( .D(n189), .CLK(clk), .Q(mem[44]) );
  DFFX1 mem_reg_2__3_ ( .D(n190), .CLK(clk), .Q(mem[43]) );
  DFFX1 mem_reg_2__2_ ( .D(n191), .CLK(clk), .Q(mem[42]) );
  DFFX1 mem_reg_2__1_ ( .D(n192), .CLK(clk), .Q(mem[41]) );
  DFFX1 mem_reg_2__0_ ( .D(n193), .CLK(clk), .Q(mem[40]) );
  DFFX1 mem_reg_3__7_ ( .D(n194), .CLK(clk), .Q(mem[39]) );
  DFFX1 mem_reg_3__6_ ( .D(n195), .CLK(clk), .Q(mem[38]) );
  DFFX1 mem_reg_3__5_ ( .D(n196), .CLK(clk), .Q(mem[37]) );
  DFFX1 mem_reg_3__4_ ( .D(n197), .CLK(clk), .Q(mem[36]) );
  DFFX1 mem_reg_3__3_ ( .D(n198), .CLK(clk), .Q(mem[35]) );
  DFFX1 mem_reg_3__2_ ( .D(n199), .CLK(clk), .Q(mem[34]) );
  DFFX1 mem_reg_3__1_ ( .D(n200), .CLK(clk), .Q(mem[33]) );
  DFFX1 mem_reg_3__0_ ( .D(n201), .CLK(clk), .Q(mem[32]) );
  DFFX1 mem_reg_4__7_ ( .D(n202), .CLK(clk), .Q(mem[31]) );
  DFFX1 mem_reg_4__6_ ( .D(n203), .CLK(clk), .Q(mem[30]) );
  DFFX1 mem_reg_4__5_ ( .D(n204), .CLK(clk), .Q(mem[29]) );
  DFFX1 mem_reg_4__4_ ( .D(n205), .CLK(clk), .Q(mem[28]) );
  DFFX1 mem_reg_4__3_ ( .D(n206), .CLK(clk), .Q(mem[27]) );
  DFFX1 mem_reg_4__2_ ( .D(n207), .CLK(clk), .Q(mem[26]) );
  DFFX1 mem_reg_4__1_ ( .D(n208), .CLK(clk), .Q(mem[25]) );
  DFFX1 mem_reg_4__0_ ( .D(n209), .CLK(clk), .Q(mem[24]) );
  DFFX1 mem_reg_5__7_ ( .D(n210), .CLK(clk), .Q(mem[23]) );
  DFFX1 mem_reg_5__6_ ( .D(n211), .CLK(clk), .Q(mem[22]) );
  DFFX1 mem_reg_5__5_ ( .D(n212), .CLK(clk), .Q(mem[21]) );
  DFFX1 mem_reg_5__4_ ( .D(n213), .CLK(clk), .Q(mem[20]) );
  DFFX1 mem_reg_5__3_ ( .D(n214), .CLK(clk), .Q(mem[19]) );
  DFFX1 mem_reg_5__2_ ( .D(n215), .CLK(clk), .Q(mem[18]) );
  DFFX1 mem_reg_5__1_ ( .D(n216), .CLK(clk), .Q(mem[17]) );
  DFFX1 mem_reg_5__0_ ( .D(n217), .CLK(clk), .Q(mem[16]) );
  DFFX1 mem_reg_6__7_ ( .D(n218), .CLK(clk), .Q(mem[15]) );
  DFFX1 mem_reg_6__6_ ( .D(n219), .CLK(clk), .Q(mem[14]) );
  DFFX1 mem_reg_6__5_ ( .D(n220), .CLK(clk), .Q(mem[13]) );
  DFFX1 mem_reg_6__4_ ( .D(n221), .CLK(clk), .Q(mem[12]) );
  DFFX1 mem_reg_6__3_ ( .D(n222), .CLK(clk), .Q(mem[11]) );
  DFFX1 mem_reg_6__2_ ( .D(n223), .CLK(clk), .Q(mem[10]) );
  DFFX1 mem_reg_6__1_ ( .D(n224), .CLK(clk), .Q(mem[9]) );
  DFFX1 mem_reg_6__0_ ( .D(n225), .CLK(clk), .Q(mem[8]) );
  DFFX1 mem_reg_7__7_ ( .D(n226), .CLK(clk), .Q(mem[7]) );
  DFFX1 mem_reg_7__6_ ( .D(n227), .CLK(clk), .Q(mem[6]) );
  DFFX1 mem_reg_7__5_ ( .D(n228), .CLK(clk), .Q(mem[5]) );
  DFFX1 mem_reg_7__4_ ( .D(n229), .CLK(clk), .Q(mem[4]) );
  DFFX1 mem_reg_7__3_ ( .D(n230), .CLK(clk), .Q(mem[3]) );
  DFFX1 mem_reg_7__2_ ( .D(n231), .CLK(clk), .Q(mem[2]) );
  DFFX1 mem_reg_7__1_ ( .D(n232), .CLK(clk), .Q(mem[1]) );
  DFFX1 mem_reg_7__0_ ( .D(n233), .CLK(clk), .Q(mem[0]) );
  AO22X1 U14 ( .IN1(n148), .IN2(n11), .IN3(mem[0]), .IN4(n164), .Q(n233) );
  AO22X1 U15 ( .IN1(n146), .IN2(n11), .IN3(mem[1]), .IN4(n164), .Q(n232) );
  AO22X1 U16 ( .IN1(n144), .IN2(n11), .IN3(mem[2]), .IN4(n164), .Q(n231) );
  AO22X1 U17 ( .IN1(n142), .IN2(n11), .IN3(mem[3]), .IN4(n164), .Q(n230) );
  AO22X1 U18 ( .IN1(wdata[4]), .IN2(n11), .IN3(mem[4]), .IN4(n164), .Q(n229)
         );
  AO22X1 U19 ( .IN1(wdata[5]), .IN2(n11), .IN3(mem[5]), .IN4(n163), .Q(n228)
         );
  AO22X1 U20 ( .IN1(wdata[6]), .IN2(n11), .IN3(mem[6]), .IN4(n163), .Q(n227)
         );
  AO22X1 U21 ( .IN1(wdata[7]), .IN2(n11), .IN3(mem[7]), .IN4(n163), .Q(n226)
         );
  AO22X1 U23 ( .IN1(n8), .IN2(n148), .IN3(mem[8]), .IN4(n162), .Q(n225) );
  AO22X1 U24 ( .IN1(n8), .IN2(n146), .IN3(mem[9]), .IN4(n162), .Q(n224) );
  AO22X1 U25 ( .IN1(n8), .IN2(n144), .IN3(mem[10]), .IN4(n162), .Q(n223) );
  AO22X1 U26 ( .IN1(n8), .IN2(n142), .IN3(mem[11]), .IN4(n162), .Q(n222) );
  AO22X1 U27 ( .IN1(n8), .IN2(wdata[4]), .IN3(mem[12]), .IN4(n162), .Q(n221)
         );
  AO22X1 U28 ( .IN1(n8), .IN2(wdata[5]), .IN3(mem[13]), .IN4(n161), .Q(n220)
         );
  AO22X1 U29 ( .IN1(n8), .IN2(wdata[6]), .IN3(mem[14]), .IN4(n161), .Q(n219)
         );
  AO22X1 U30 ( .IN1(n8), .IN2(wdata[7]), .IN3(mem[15]), .IN4(n161), .Q(n218)
         );
  AO22X1 U32 ( .IN1(n88), .IN2(n148), .IN3(mem[16]), .IN4(n160), .Q(n217) );
  AO22X1 U33 ( .IN1(n88), .IN2(n146), .IN3(mem[17]), .IN4(n160), .Q(n216) );
  AO22X1 U34 ( .IN1(n88), .IN2(n144), .IN3(mem[18]), .IN4(n160), .Q(n215) );
  AO22X1 U35 ( .IN1(n88), .IN2(n142), .IN3(mem[19]), .IN4(n160), .Q(n214) );
  AO22X1 U36 ( .IN1(n88), .IN2(n3), .IN3(mem[20]), .IN4(n160), .Q(n213) );
  AO22X1 U37 ( .IN1(n88), .IN2(n2), .IN3(mem[21]), .IN4(n159), .Q(n212) );
  AO22X1 U38 ( .IN1(n88), .IN2(n4), .IN3(mem[22]), .IN4(n159), .Q(n211) );
  AO22X1 U39 ( .IN1(n88), .IN2(n1), .IN3(mem[23]), .IN4(n159), .Q(n210) );
  AO22X1 U41 ( .IN1(n87), .IN2(n148), .IN3(mem[24]), .IN4(n158), .Q(n209) );
  AO22X1 U42 ( .IN1(n87), .IN2(n146), .IN3(mem[25]), .IN4(n158), .Q(n208) );
  AO22X1 U43 ( .IN1(n87), .IN2(n144), .IN3(mem[26]), .IN4(n158), .Q(n207) );
  AO22X1 U44 ( .IN1(n87), .IN2(n142), .IN3(mem[27]), .IN4(n158), .Q(n206) );
  AO22X1 U45 ( .IN1(n87), .IN2(n3), .IN3(mem[28]), .IN4(n158), .Q(n205) );
  AO22X1 U46 ( .IN1(n87), .IN2(n2), .IN3(mem[29]), .IN4(n157), .Q(n204) );
  AO22X1 U47 ( .IN1(n87), .IN2(n4), .IN3(mem[30]), .IN4(n157), .Q(n203) );
  AO22X1 U48 ( .IN1(n87), .IN2(n1), .IN3(mem[31]), .IN4(n157), .Q(n202) );
  AND2X1 U50 ( .IN1(we), .IN2(waddr[2]), .Q(n242) );
  AO22X1 U51 ( .IN1(n10), .IN2(n148), .IN3(mem[32]), .IN4(n156), .Q(n201) );
  AO22X1 U52 ( .IN1(n10), .IN2(n146), .IN3(mem[33]), .IN4(n156), .Q(n200) );
  AO22X1 U53 ( .IN1(n10), .IN2(n144), .IN3(mem[34]), .IN4(n156), .Q(n199) );
  AO22X1 U54 ( .IN1(n10), .IN2(n142), .IN3(mem[35]), .IN4(n156), .Q(n198) );
  AO22X1 U55 ( .IN1(n10), .IN2(n3), .IN3(mem[36]), .IN4(n156), .Q(n197) );
  AO22X1 U56 ( .IN1(n10), .IN2(n2), .IN3(mem[37]), .IN4(n155), .Q(n196) );
  AO22X1 U57 ( .IN1(n10), .IN2(n4), .IN3(mem[38]), .IN4(n155), .Q(n195) );
  AO22X1 U58 ( .IN1(n10), .IN2(n1), .IN3(mem[39]), .IN4(n155), .Q(n194) );
  AO22X1 U60 ( .IN1(n9), .IN2(n148), .IN3(mem[40]), .IN4(n154), .Q(n193) );
  AO22X1 U61 ( .IN1(n9), .IN2(n146), .IN3(mem[41]), .IN4(n154), .Q(n192) );
  AO22X1 U62 ( .IN1(n9), .IN2(n144), .IN3(mem[42]), .IN4(n154), .Q(n191) );
  AO22X1 U63 ( .IN1(n9), .IN2(n142), .IN3(mem[43]), .IN4(n154), .Q(n190) );
  AO22X1 U64 ( .IN1(n9), .IN2(n3), .IN3(mem[44]), .IN4(n154), .Q(n189) );
  AO22X1 U65 ( .IN1(n9), .IN2(n2), .IN3(mem[45]), .IN4(n153), .Q(n188) );
  AO22X1 U66 ( .IN1(n9), .IN2(n4), .IN3(mem[46]), .IN4(n153), .Q(n187) );
  AO22X1 U67 ( .IN1(n9), .IN2(n1), .IN3(mem[47]), .IN4(n153), .Q(n186) );
  AO22X1 U69 ( .IN1(n86), .IN2(n148), .IN3(mem[48]), .IN4(n152), .Q(n185) );
  AO22X1 U70 ( .IN1(n86), .IN2(n146), .IN3(mem[49]), .IN4(n7), .Q(n184) );
  AO22X1 U71 ( .IN1(n86), .IN2(n144), .IN3(mem[50]), .IN4(n7), .Q(n183) );
  AO22X1 U72 ( .IN1(n86), .IN2(n142), .IN3(mem[51]), .IN4(n7), .Q(n182) );
  AO22X1 U73 ( .IN1(n86), .IN2(n3), .IN3(mem[52]), .IN4(n152), .Q(n181) );
  AO22X1 U74 ( .IN1(n86), .IN2(n2), .IN3(mem[53]), .IN4(n151), .Q(n180) );
  AO22X1 U75 ( .IN1(n86), .IN2(n4), .IN3(mem[54]), .IN4(n151), .Q(n179) );
  AO22X1 U76 ( .IN1(n86), .IN2(n1), .IN3(mem[55]), .IN4(n151), .Q(n178) );
  AO22X1 U78 ( .IN1(n168), .IN2(n148), .IN3(mem[56]), .IN4(n150), .Q(n177) );
  AO22X1 U79 ( .IN1(n168), .IN2(n146), .IN3(mem[57]), .IN4(n150), .Q(n176) );
  AO22X1 U80 ( .IN1(n168), .IN2(n144), .IN3(mem[58]), .IN4(n150), .Q(n175) );
  AO22X1 U81 ( .IN1(n168), .IN2(n142), .IN3(mem[59]), .IN4(n150), .Q(n174) );
  AO22X1 U82 ( .IN1(n168), .IN2(n3), .IN3(mem[60]), .IN4(n150), .Q(n173) );
  AO22X1 U83 ( .IN1(n168), .IN2(n2), .IN3(mem[61]), .IN4(n149), .Q(n172) );
  AO22X1 U84 ( .IN1(n168), .IN2(n4), .IN3(mem[62]), .IN4(n149), .Q(n171) );
  AO22X1 U85 ( .IN1(n168), .IN2(n1), .IN3(mem[63]), .IN4(n149), .Q(n170) );
  NBUFFX4 U2 ( .INP(n122), .Z(n130) );
  NBUFFX4 U3 ( .INP(n122), .Z(n129) );
  NBUFFX2 U4 ( .INP(n119), .Z(n135) );
  NBUFFX2 U5 ( .INP(n119), .Z(n140) );
  NBUFFX2 U6 ( .INP(n119), .Z(n134) );
  NBUFFX2 U7 ( .INP(n119), .Z(n139) );
  NAND3X0 U8 ( .IN1(n242), .IN2(n167), .IN3(n165), .QN(n240) );
  NAND3X0 U9 ( .IN1(n166), .IN2(n167), .IN3(n242), .QN(n239) );
  NAND3X1 U10 ( .IN1(waddr[1]), .IN2(n165), .IN3(n237), .QN(n238) );
  NAND3X1 U11 ( .IN1(waddr[1]), .IN2(n166), .IN3(n237), .QN(n236) );
  NAND3X0 U12 ( .IN1(n165), .IN2(n167), .IN3(n237), .QN(n235) );
  NBUFFX2 U13 ( .INP(n152), .Z(n7) );
  NBUFFX2 U22 ( .INP(n235), .Z(n152) );
  NBUFFX2 U31 ( .INP(n234), .Z(n149) );
  NBUFFX2 U40 ( .INP(n234), .Z(n150) );
  NBUFFX2 U49 ( .INP(n235), .Z(n151) );
  NBUFFX2 U59 ( .INP(wdata[7]), .Z(n1) );
  NBUFFX2 U68 ( .INP(wdata[5]), .Z(n2) );
  NBUFFX2 U77 ( .INP(wdata[4]), .Z(n3) );
  NBUFFX2 U86 ( .INP(wdata[6]), .Z(n4) );
  AO22X1 U87 ( .IN1(n92), .IN2(n6), .IN3(n91), .IN4(n128), .Q(rdata[0]) );
  DELLN1X2 U88 ( .INP(raddr[0]), .Z(n6) );
  INVX0 U89 ( .INP(n128), .ZN(n5) );
  INVX0 U90 ( .INP(n241), .ZN(n8) );
  INVX0 U91 ( .INP(n236), .ZN(n9) );
  INVX0 U92 ( .INP(n238), .ZN(n10) );
  INVX0 U93 ( .INP(n243), .ZN(n11) );
  INVX0 U94 ( .INP(n235), .ZN(n86) );
  INVX0 U95 ( .INP(n239), .ZN(n87) );
  INVX0 U96 ( .INP(n240), .ZN(n88) );
  NBUFFX2 U97 ( .INP(n121), .Z(n133) );
  NBUFFX2 U98 ( .INP(n118), .Z(n137) );
  NBUFFX2 U99 ( .INP(n118), .Z(n138) );
  NBUFFX2 U100 ( .INP(n118), .Z(n136) );
  DELLN1X2 U101 ( .INP(n121), .Z(n131) );
  DELLN1X2 U102 ( .INP(n121), .Z(n132) );
  NAND3X1 U103 ( .IN1(n165), .IN2(n242), .IN3(waddr[1]), .QN(n243) );
  NAND3X1 U104 ( .IN1(n242), .IN2(n166), .IN3(waddr[1]), .QN(n241) );
  INVX0 U105 ( .INP(n149), .ZN(n168) );
  NBUFFX2 U106 ( .INP(n240), .Z(n159) );
  NBUFFX2 U107 ( .INP(n239), .Z(n157) );
  NBUFFX2 U108 ( .INP(n240), .Z(n160) );
  NBUFFX2 U109 ( .INP(n239), .Z(n158) );
  NAND3X0 U110 ( .IN1(n166), .IN2(n167), .IN3(n237), .QN(n234) );
  NBUFFX2 U111 ( .INP(n241), .Z(n161) );
  NBUFFX2 U112 ( .INP(n238), .Z(n155) );
  NBUFFX2 U113 ( .INP(n236), .Z(n153) );
  NBUFFX2 U114 ( .INP(n243), .Z(n163) );
  NBUFFX2 U115 ( .INP(n241), .Z(n162) );
  NBUFFX2 U116 ( .INP(n238), .Z(n156) );
  NBUFFX2 U117 ( .INP(n236), .Z(n154) );
  NBUFFX2 U118 ( .INP(n243), .Z(n164) );
  NOR2X0 U119 ( .IN1(n169), .IN2(waddr[2]), .QN(n237) );
  INVX0 U120 ( .INP(we), .ZN(n169) );
  AO22X1 U121 ( .IN1(mem[39]), .IN2(n140), .IN3(mem[55]), .IN4(n138), .Q(n117)
         );
  NOR2X0 U122 ( .IN1(n125), .IN2(raddr[1]), .QN(n122) );
  NOR2X0 U123 ( .IN1(raddr[1]), .IN2(n126), .QN(n118) );
  AO22X1 U124 ( .IN1(mem[32]), .IN2(n135), .IN3(mem[48]), .IN4(n137), .Q(n89)
         );
  AO221X1 U125 ( .IN1(mem[16]), .IN2(n130), .IN3(mem[0]), .IN4(n133), .IN5(n89), .Q(n92) );
  AO22X1 U126 ( .IN1(mem[40]), .IN2(n135), .IN3(mem[56]), .IN4(n137), .Q(n90)
         );
  AO221X1 U127 ( .IN1(mem[24]), .IN2(n129), .IN3(mem[8]), .IN4(n133), .IN5(n90), .Q(n91) );
  AO22X1 U128 ( .IN1(mem[33]), .IN2(n140), .IN3(mem[49]), .IN4(n136), .Q(n93)
         );
  AO221X1 U129 ( .IN1(mem[17]), .IN2(n130), .IN3(mem[1]), .IN4(n133), .IN5(n93), .Q(n96) );
  AO221X1 U130 ( .IN1(mem[25]), .IN2(n129), .IN3(mem[9]), .IN4(n133), .IN5(n94), .Q(n95) );
  AO22X1 U131 ( .IN1(n96), .IN2(n6), .IN3(n95), .IN4(n128), .Q(rdata[1]) );
  AO22X1 U132 ( .IN1(mem[34]), .IN2(n135), .IN3(mem[50]), .IN4(n136), .Q(n97)
         );
  AO221X1 U133 ( .IN1(mem[18]), .IN2(n130), .IN3(mem[2]), .IN4(n133), .IN5(n97), .Q(n100) );
  AO22X1 U134 ( .IN1(mem[42]), .IN2(n135), .IN3(mem[58]), .IN4(n138), .Q(n98)
         );
  AO221X1 U135 ( .IN1(mem[26]), .IN2(n129), .IN3(mem[10]), .IN4(n133), .IN5(
        n98), .Q(n99) );
  AO22X1 U136 ( .IN1(n100), .IN2(n6), .IN3(n99), .IN4(n128), .Q(rdata[2]) );
  AO22X1 U137 ( .IN1(mem[35]), .IN2(n134), .IN3(mem[51]), .IN4(n136), .Q(n101)
         );
  AO221X1 U138 ( .IN1(mem[19]), .IN2(n130), .IN3(mem[3]), .IN4(n131), .IN5(
        n101), .Q(n104) );
  AO22X1 U139 ( .IN1(mem[43]), .IN2(n134), .IN3(mem[59]), .IN4(n138), .Q(n102)
         );
  AO221X1 U140 ( .IN1(mem[27]), .IN2(n129), .IN3(mem[11]), .IN4(n132), .IN5(
        n102), .Q(n103) );
  AO22X1 U141 ( .IN1(n104), .IN2(n5), .IN3(n103), .IN4(n128), .Q(rdata[3]) );
  AO22X1 U142 ( .IN1(mem[36]), .IN2(n134), .IN3(mem[52]), .IN4(n136), .Q(n105)
         );
  AO221X1 U143 ( .IN1(mem[20]), .IN2(n130), .IN3(mem[4]), .IN4(n131), .IN5(
        n105), .Q(n108) );
  AO22X1 U144 ( .IN1(mem[44]), .IN2(n139), .IN3(mem[60]), .IN4(n137), .Q(n106)
         );
  AO221X1 U145 ( .IN1(mem[28]), .IN2(n129), .IN3(mem[12]), .IN4(n132), .IN5(
        n106), .Q(n107) );
  AO22X1 U146 ( .IN1(n108), .IN2(n5), .IN3(n107), .IN4(n128), .Q(rdata[4]) );
  AO221X1 U147 ( .IN1(mem[21]), .IN2(n130), .IN3(mem[5]), .IN4(n131), .IN5(
        n109), .Q(n112) );
  AO22X1 U148 ( .IN1(mem[45]), .IN2(n140), .IN3(mem[61]), .IN4(n138), .Q(n110)
         );
  AO221X1 U149 ( .IN1(mem[29]), .IN2(n129), .IN3(mem[13]), .IN4(n132), .IN5(
        n110), .Q(n111) );
  AO22X1 U150 ( .IN1(n112), .IN2(n5), .IN3(n111), .IN4(n128), .Q(rdata[5]) );
  AO221X1 U151 ( .IN1(mem[22]), .IN2(n130), .IN3(mem[6]), .IN4(n131), .IN5(
        n113), .Q(n116) );
  AO22X1 U152 ( .IN1(mem[46]), .IN2(n139), .IN3(mem[62]), .IN4(n137), .Q(n114)
         );
  AO221X1 U153 ( .IN1(mem[30]), .IN2(n129), .IN3(mem[14]), .IN4(n132), .IN5(
        n114), .Q(n115) );
  AO22X1 U154 ( .IN1(n116), .IN2(n5), .IN3(n115), .IN4(n128), .Q(rdata[6]) );
  AO221X1 U155 ( .IN1(mem[23]), .IN2(n130), .IN3(mem[7]), .IN4(n131), .IN5(
        n117), .Q(n124) );
  AO22X1 U156 ( .IN1(mem[47]), .IN2(n140), .IN3(mem[63]), .IN4(n138), .Q(n120)
         );
  AO221X1 U157 ( .IN1(mem[31]), .IN2(n129), .IN3(mem[15]), .IN4(n132), .IN5(
        n120), .Q(n123) );
  AO22X1 U158 ( .IN1(n5), .IN2(n124), .IN3(n123), .IN4(n128), .Q(rdata[7]) );
  INVX0 U159 ( .INP(raddr[2]), .ZN(n125) );
  INVX0 U160 ( .INP(n125), .ZN(n126) );
  INVX0 U161 ( .INP(raddr[1]), .ZN(n127) );
  INVX0 U162 ( .INP(n6), .ZN(n128) );
  NOR2X0 U163 ( .IN1(n125), .IN2(n127), .QN(n121) );
  NOR2X0 U164 ( .IN1(n127), .IN2(n126), .QN(n119) );
  AO22X1 U165 ( .IN1(mem[37]), .IN2(n139), .IN3(mem[53]), .IN4(n136), .Q(n109)
         );
  AO22X1 U166 ( .IN1(mem[38]), .IN2(n134), .IN3(mem[54]), .IN4(n136), .Q(n113)
         );
  AO22X1 U167 ( .IN1(mem[41]), .IN2(n139), .IN3(mem[57]), .IN4(n137), .Q(n94)
         );
  INVX0 U168 ( .INP(wdata[3]), .ZN(n141) );
  INVX0 U169 ( .INP(n141), .ZN(n142) );
  INVX0 U170 ( .INP(wdata[2]), .ZN(n143) );
  INVX0 U171 ( .INP(n143), .ZN(n144) );
  INVX0 U172 ( .INP(wdata[1]), .ZN(n145) );
  INVX0 U173 ( .INP(n145), .ZN(n146) );
  INVX0 U174 ( .INP(wdata[0]), .ZN(n147) );
  INVX0 U175 ( .INP(n147), .ZN(n148) );
  INVX0 U176 ( .INP(n166), .ZN(n165) );
  INVX0 U177 ( .INP(waddr[0]), .ZN(n166) );
  INVX0 U178 ( .INP(waddr[1]), .ZN(n167) );
endmodule


module payload_ram_bank8x8_7 ( clk, we, waddr, wdata, raddr, rdata );
  input [2:0] waddr;
  input [7:0] wdata;
  input [2:0] raddr;
  output [7:0] rdata;
  input clk, we;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246,
         n247;
  wire   [63:0] mem;

  DFFX1 mem_reg_0__7_ ( .D(n174), .CLK(clk), .Q(mem[63]) );
  DFFX1 mem_reg_0__6_ ( .D(n175), .CLK(clk), .Q(mem[62]) );
  DFFX1 mem_reg_0__5_ ( .D(n176), .CLK(clk), .Q(mem[61]) );
  DFFX1 mem_reg_0__4_ ( .D(n177), .CLK(clk), .Q(mem[60]) );
  DFFX1 mem_reg_0__3_ ( .D(n178), .CLK(clk), .Q(mem[59]) );
  DFFX1 mem_reg_0__2_ ( .D(n179), .CLK(clk), .Q(mem[58]) );
  DFFX1 mem_reg_0__1_ ( .D(n180), .CLK(clk), .Q(mem[57]) );
  DFFX1 mem_reg_0__0_ ( .D(n181), .CLK(clk), .Q(mem[56]) );
  DFFX1 mem_reg_1__7_ ( .D(n182), .CLK(clk), .Q(mem[55]) );
  DFFX1 mem_reg_1__6_ ( .D(n183), .CLK(clk), .Q(mem[54]) );
  DFFX1 mem_reg_1__5_ ( .D(n184), .CLK(clk), .Q(mem[53]) );
  DFFX1 mem_reg_1__4_ ( .D(n185), .CLK(clk), .Q(mem[52]) );
  DFFX1 mem_reg_1__3_ ( .D(n186), .CLK(clk), .Q(mem[51]) );
  DFFX1 mem_reg_1__2_ ( .D(n187), .CLK(clk), .Q(mem[50]) );
  DFFX1 mem_reg_1__1_ ( .D(n188), .CLK(clk), .Q(mem[49]) );
  DFFX1 mem_reg_1__0_ ( .D(n189), .CLK(clk), .Q(mem[48]) );
  DFFX1 mem_reg_2__7_ ( .D(n190), .CLK(clk), .Q(mem[47]) );
  DFFX1 mem_reg_2__6_ ( .D(n191), .CLK(clk), .Q(mem[46]) );
  DFFX1 mem_reg_2__5_ ( .D(n192), .CLK(clk), .Q(mem[45]) );
  DFFX1 mem_reg_2__4_ ( .D(n193), .CLK(clk), .Q(mem[44]) );
  DFFX1 mem_reg_2__3_ ( .D(n194), .CLK(clk), .Q(mem[43]) );
  DFFX1 mem_reg_2__2_ ( .D(n195), .CLK(clk), .Q(mem[42]) );
  DFFX1 mem_reg_2__1_ ( .D(n196), .CLK(clk), .Q(mem[41]) );
  DFFX1 mem_reg_2__0_ ( .D(n197), .CLK(clk), .Q(mem[40]) );
  DFFX1 mem_reg_3__7_ ( .D(n198), .CLK(clk), .Q(mem[39]) );
  DFFX1 mem_reg_3__6_ ( .D(n199), .CLK(clk), .Q(mem[38]) );
  DFFX1 mem_reg_3__5_ ( .D(n200), .CLK(clk), .Q(mem[37]) );
  DFFX1 mem_reg_3__4_ ( .D(n201), .CLK(clk), .Q(mem[36]) );
  DFFX1 mem_reg_3__3_ ( .D(n202), .CLK(clk), .Q(mem[35]) );
  DFFX1 mem_reg_3__2_ ( .D(n203), .CLK(clk), .Q(mem[34]) );
  DFFX1 mem_reg_3__1_ ( .D(n204), .CLK(clk), .Q(mem[33]) );
  DFFX1 mem_reg_3__0_ ( .D(n205), .CLK(clk), .Q(mem[32]) );
  DFFX1 mem_reg_4__7_ ( .D(n206), .CLK(clk), .Q(mem[31]) );
  DFFX1 mem_reg_4__6_ ( .D(n207), .CLK(clk), .Q(mem[30]) );
  DFFX1 mem_reg_4__5_ ( .D(n208), .CLK(clk), .Q(mem[29]) );
  DFFX1 mem_reg_4__4_ ( .D(n209), .CLK(clk), .Q(mem[28]) );
  DFFX1 mem_reg_4__3_ ( .D(n210), .CLK(clk), .Q(mem[27]) );
  DFFX1 mem_reg_4__2_ ( .D(n211), .CLK(clk), .Q(mem[26]) );
  DFFX1 mem_reg_4__1_ ( .D(n212), .CLK(clk), .Q(mem[25]) );
  DFFX1 mem_reg_4__0_ ( .D(n213), .CLK(clk), .Q(mem[24]) );
  DFFX1 mem_reg_5__7_ ( .D(n214), .CLK(clk), .Q(mem[23]) );
  DFFX1 mem_reg_5__6_ ( .D(n215), .CLK(clk), .Q(mem[22]) );
  DFFX1 mem_reg_5__5_ ( .D(n216), .CLK(clk), .Q(mem[21]) );
  DFFX1 mem_reg_5__4_ ( .D(n217), .CLK(clk), .Q(mem[20]) );
  DFFX1 mem_reg_5__3_ ( .D(n218), .CLK(clk), .Q(mem[19]) );
  DFFX1 mem_reg_5__2_ ( .D(n219), .CLK(clk), .Q(mem[18]) );
  DFFX1 mem_reg_5__1_ ( .D(n220), .CLK(clk), .Q(mem[17]) );
  DFFX1 mem_reg_5__0_ ( .D(n221), .CLK(clk), .Q(mem[16]) );
  DFFX1 mem_reg_6__7_ ( .D(n222), .CLK(clk), .Q(mem[15]) );
  DFFX1 mem_reg_6__6_ ( .D(n223), .CLK(clk), .Q(mem[14]) );
  DFFX1 mem_reg_6__5_ ( .D(n224), .CLK(clk), .Q(mem[13]) );
  DFFX1 mem_reg_6__4_ ( .D(n225), .CLK(clk), .Q(mem[12]) );
  DFFX1 mem_reg_6__3_ ( .D(n226), .CLK(clk), .Q(mem[11]) );
  DFFX1 mem_reg_6__2_ ( .D(n227), .CLK(clk), .Q(mem[10]) );
  DFFX1 mem_reg_6__1_ ( .D(n228), .CLK(clk), .Q(mem[9]) );
  DFFX1 mem_reg_6__0_ ( .D(n229), .CLK(clk), .Q(mem[8]) );
  DFFX1 mem_reg_7__7_ ( .D(n230), .CLK(clk), .Q(mem[7]) );
  DFFX1 mem_reg_7__6_ ( .D(n231), .CLK(clk), .Q(mem[6]) );
  DFFX1 mem_reg_7__5_ ( .D(n232), .CLK(clk), .Q(mem[5]) );
  DFFX1 mem_reg_7__4_ ( .D(n233), .CLK(clk), .Q(mem[4]) );
  DFFX1 mem_reg_7__3_ ( .D(n234), .CLK(clk), .Q(mem[3]) );
  DFFX1 mem_reg_7__2_ ( .D(n235), .CLK(clk), .Q(mem[2]) );
  DFFX1 mem_reg_7__1_ ( .D(n236), .CLK(clk), .Q(mem[1]) );
  DFFX1 mem_reg_7__0_ ( .D(n237), .CLK(clk), .Q(mem[0]) );
  AO22X1 U14 ( .IN1(wdata[0]), .IN2(n89), .IN3(mem[0]), .IN4(n170), .Q(n237)
         );
  AO22X1 U15 ( .IN1(wdata[1]), .IN2(n89), .IN3(mem[1]), .IN4(n170), .Q(n236)
         );
  AO22X1 U16 ( .IN1(wdata[2]), .IN2(n89), .IN3(mem[2]), .IN4(n170), .Q(n235)
         );
  AO22X1 U17 ( .IN1(wdata[3]), .IN2(n89), .IN3(mem[3]), .IN4(n170), .Q(n234)
         );
  AO22X1 U18 ( .IN1(n101), .IN2(n89), .IN3(mem[4]), .IN4(n170), .Q(n233) );
  AO22X1 U19 ( .IN1(n99), .IN2(n89), .IN3(mem[5]), .IN4(n169), .Q(n232) );
  AO22X1 U20 ( .IN1(n97), .IN2(n89), .IN3(mem[6]), .IN4(n169), .Q(n231) );
  AO22X1 U21 ( .IN1(n95), .IN2(n89), .IN3(mem[7]), .IN4(n169), .Q(n230) );
  AO22X1 U23 ( .IN1(n9), .IN2(n109), .IN3(mem[8]), .IN4(n168), .Q(n229) );
  AO22X1 U24 ( .IN1(n9), .IN2(n107), .IN3(mem[9]), .IN4(n168), .Q(n228) );
  AO22X1 U25 ( .IN1(n9), .IN2(n105), .IN3(mem[10]), .IN4(n168), .Q(n227) );
  AO22X1 U26 ( .IN1(n9), .IN2(n103), .IN3(mem[11]), .IN4(n168), .Q(n226) );
  AO22X1 U27 ( .IN1(n9), .IN2(n101), .IN3(mem[12]), .IN4(n168), .Q(n225) );
  AO22X1 U28 ( .IN1(n9), .IN2(n99), .IN3(mem[13]), .IN4(n167), .Q(n224) );
  AO22X1 U29 ( .IN1(n9), .IN2(n97), .IN3(mem[14]), .IN4(n167), .Q(n223) );
  AO22X1 U30 ( .IN1(n9), .IN2(n95), .IN3(mem[15]), .IN4(n167), .Q(n222) );
  AO22X1 U32 ( .IN1(n87), .IN2(n109), .IN3(mem[16]), .IN4(n166), .Q(n221) );
  AO22X1 U33 ( .IN1(n87), .IN2(n107), .IN3(mem[17]), .IN4(n166), .Q(n220) );
  AO22X1 U34 ( .IN1(n87), .IN2(n105), .IN3(mem[18]), .IN4(n166), .Q(n219) );
  AO22X1 U35 ( .IN1(n87), .IN2(n103), .IN3(mem[19]), .IN4(n166), .Q(n218) );
  AO22X1 U36 ( .IN1(n87), .IN2(n101), .IN3(mem[20]), .IN4(n166), .Q(n217) );
  AO22X1 U37 ( .IN1(n87), .IN2(n99), .IN3(mem[21]), .IN4(n165), .Q(n216) );
  AO22X1 U38 ( .IN1(n87), .IN2(n97), .IN3(mem[22]), .IN4(n165), .Q(n215) );
  AO22X1 U39 ( .IN1(n87), .IN2(n95), .IN3(mem[23]), .IN4(n165), .Q(n214) );
  AO22X1 U41 ( .IN1(n10), .IN2(wdata[0]), .IN3(mem[24]), .IN4(n164), .Q(n213)
         );
  AO22X1 U42 ( .IN1(n10), .IN2(wdata[1]), .IN3(mem[25]), .IN4(n164), .Q(n212)
         );
  AO22X1 U43 ( .IN1(n10), .IN2(wdata[2]), .IN3(mem[26]), .IN4(n164), .Q(n211)
         );
  AO22X1 U44 ( .IN1(n10), .IN2(wdata[3]), .IN3(mem[27]), .IN4(n164), .Q(n210)
         );
  AO22X1 U45 ( .IN1(n10), .IN2(n101), .IN3(mem[28]), .IN4(n164), .Q(n209) );
  AO22X1 U46 ( .IN1(n10), .IN2(n99), .IN3(mem[29]), .IN4(n163), .Q(n208) );
  AO22X1 U47 ( .IN1(n10), .IN2(n97), .IN3(mem[30]), .IN4(n163), .Q(n207) );
  AO22X1 U48 ( .IN1(n10), .IN2(n95), .IN3(mem[31]), .IN4(n163), .Q(n206) );
  AND2X1 U50 ( .IN1(we), .IN2(waddr[2]), .Q(n246) );
  AO22X1 U51 ( .IN1(n88), .IN2(n109), .IN3(mem[32]), .IN4(n162), .Q(n205) );
  AO22X1 U52 ( .IN1(n88), .IN2(n107), .IN3(mem[33]), .IN4(n162), .Q(n204) );
  AO22X1 U53 ( .IN1(n88), .IN2(n105), .IN3(mem[34]), .IN4(n162), .Q(n203) );
  AO22X1 U54 ( .IN1(n88), .IN2(n103), .IN3(mem[35]), .IN4(n162), .Q(n202) );
  AO22X1 U55 ( .IN1(n88), .IN2(n101), .IN3(mem[36]), .IN4(n162), .Q(n201) );
  AO22X1 U56 ( .IN1(n88), .IN2(n99), .IN3(mem[37]), .IN4(n161), .Q(n200) );
  AO22X1 U57 ( .IN1(n88), .IN2(n97), .IN3(mem[38]), .IN4(n161), .Q(n199) );
  AO22X1 U58 ( .IN1(n88), .IN2(n95), .IN3(mem[39]), .IN4(n161), .Q(n198) );
  AO22X1 U60 ( .IN1(n86), .IN2(n109), .IN3(mem[40]), .IN4(n160), .Q(n197) );
  AO22X1 U61 ( .IN1(n86), .IN2(n107), .IN3(mem[41]), .IN4(n160), .Q(n196) );
  AO22X1 U62 ( .IN1(n86), .IN2(n105), .IN3(mem[42]), .IN4(n160), .Q(n195) );
  AO22X1 U63 ( .IN1(n86), .IN2(n103), .IN3(mem[43]), .IN4(n160), .Q(n194) );
  AO22X1 U64 ( .IN1(n86), .IN2(n101), .IN3(mem[44]), .IN4(n160), .Q(n193) );
  AO22X1 U65 ( .IN1(n86), .IN2(n99), .IN3(mem[45]), .IN4(n159), .Q(n192) );
  AO22X1 U66 ( .IN1(n86), .IN2(n97), .IN3(mem[46]), .IN4(n159), .Q(n191) );
  AO22X1 U67 ( .IN1(n86), .IN2(n95), .IN3(mem[47]), .IN4(n159), .Q(n190) );
  AO22X1 U69 ( .IN1(n11), .IN2(n109), .IN3(mem[48]), .IN4(n158), .Q(n189) );
  AO22X1 U70 ( .IN1(n11), .IN2(n107), .IN3(mem[49]), .IN4(n158), .Q(n188) );
  AO22X1 U71 ( .IN1(n11), .IN2(n105), .IN3(mem[50]), .IN4(n158), .Q(n187) );
  AO22X1 U72 ( .IN1(n11), .IN2(n103), .IN3(mem[51]), .IN4(n158), .Q(n186) );
  AO22X1 U73 ( .IN1(n11), .IN2(n101), .IN3(mem[52]), .IN4(n158), .Q(n185) );
  AO22X1 U74 ( .IN1(n11), .IN2(n99), .IN3(mem[53]), .IN4(n157), .Q(n184) );
  AO22X1 U75 ( .IN1(n11), .IN2(n97), .IN3(mem[54]), .IN4(n157), .Q(n183) );
  AO22X1 U76 ( .IN1(n11), .IN2(n95), .IN3(mem[55]), .IN4(n157), .Q(n182) );
  AO22X1 U78 ( .IN1(n8), .IN2(n109), .IN3(mem[56]), .IN4(n156), .Q(n181) );
  AO22X1 U79 ( .IN1(n8), .IN2(n107), .IN3(mem[57]), .IN4(n156), .Q(n180) );
  AO22X1 U80 ( .IN1(n8), .IN2(n105), .IN3(mem[58]), .IN4(n156), .Q(n179) );
  AO22X1 U81 ( .IN1(n8), .IN2(n103), .IN3(mem[59]), .IN4(n156), .Q(n178) );
  AO22X1 U82 ( .IN1(n8), .IN2(n101), .IN3(mem[60]), .IN4(n156), .Q(n177) );
  AO22X1 U83 ( .IN1(n8), .IN2(n99), .IN3(mem[61]), .IN4(n155), .Q(n176) );
  AO22X1 U84 ( .IN1(n8), .IN2(n97), .IN3(mem[62]), .IN4(n155), .Q(n175) );
  AO22X1 U85 ( .IN1(n8), .IN2(n95), .IN3(mem[63]), .IN4(n155), .Q(n174) );
  AO22X2 U2 ( .IN1(mem[34]), .IN2(n3), .IN3(mem[50]), .IN4(n153), .Q(n116) );
  AO22X2 U3 ( .IN1(mem[39]), .IN2(n151), .IN3(mem[55]), .IN4(n153), .Q(n136)
         );
  AO22X2 U4 ( .IN1(mem[36]), .IN2(n151), .IN3(mem[52]), .IN4(n153), .Q(n124)
         );
  NBUFFX4 U5 ( .INP(n137), .Z(n153) );
  NBUFFX4 U6 ( .INP(n137), .Z(n152) );
  OAI22X1 U7 ( .IN1(n91), .IN2(n1), .IN3(n92), .IN4(n5), .QN(rdata[0]) );
  AO22X1 U8 ( .IN1(n123), .IN2(n90), .IN3(n122), .IN4(n2), .Q(rdata[3]) );
  AO22X1 U9 ( .IN1(n135), .IN2(n90), .IN3(n134), .IN4(n2), .Q(rdata[6]) );
  AO22X1 U10 ( .IN1(n90), .IN2(n143), .IN3(n142), .IN4(n2), .Q(rdata[7]) );
  NAND3X0 U11 ( .IN1(n171), .IN2(n246), .IN3(waddr[1]), .QN(n247) );
  NAND3X0 U12 ( .IN1(n246), .IN2(n172), .IN3(waddr[1]), .QN(n245) );
  NAND3X0 U13 ( .IN1(n246), .IN2(n93), .IN3(n171), .QN(n244) );
  NAND3X0 U22 ( .IN1(n172), .IN2(n93), .IN3(n246), .QN(n243) );
  NAND3X0 U31 ( .IN1(waddr[1]), .IN2(n171), .IN3(n241), .QN(n242) );
  NAND3X0 U40 ( .IN1(waddr[1]), .IN2(n172), .IN3(n241), .QN(n240) );
  NAND3X0 U49 ( .IN1(n171), .IN2(n93), .IN3(n241), .QN(n239) );
  NAND3X0 U59 ( .IN1(n172), .IN2(n93), .IN3(n241), .QN(n238) );
  AO22X1 U68 ( .IN1(n119), .IN2(n90), .IN3(n118), .IN4(n2), .Q(rdata[2]) );
  AO22X1 U77 ( .IN1(n131), .IN2(n90), .IN3(n130), .IN4(n2), .Q(rdata[5]) );
  NBUFFX2 U86 ( .INP(n245), .Z(n168) );
  NBUFFX2 U87 ( .INP(n243), .Z(n164) );
  NBUFFX2 U88 ( .INP(n240), .Z(n160) );
  NBUFFX2 U89 ( .INP(n238), .Z(n156) );
  AO22X1 U90 ( .IN1(n127), .IN2(n90), .IN3(n126), .IN4(n2), .Q(rdata[4]) );
  NBUFFX2 U91 ( .INP(n4), .Z(n1) );
  NBUFFX2 U92 ( .INP(n4), .Z(n2) );
  NBUFFX2 U93 ( .INP(n245), .Z(n167) );
  NBUFFX2 U94 ( .INP(n240), .Z(n159) );
  NBUFFX2 U95 ( .INP(n244), .Z(n165) );
  NBUFFX2 U96 ( .INP(n239), .Z(n157) );
  NBUFFX2 U97 ( .INP(n238), .Z(n155) );
  NBUFFX2 U98 ( .INP(n243), .Z(n163) );
  AOI221X1 U99 ( .IN1(mem[16]), .IN2(n154), .IN3(mem[0]), .IN4(n150), .IN5(
        n110), .QN(n91) );
  NOR2X0 U100 ( .IN1(n6), .IN2(n145), .QN(n3) );
  INVX0 U101 ( .INP(raddr[0]), .ZN(n4) );
  INVX0 U102 ( .INP(n1), .ZN(n5) );
  INVX0 U103 ( .INP(raddr[1]), .ZN(n6) );
  INVX0 U104 ( .INP(n6), .ZN(n7) );
  NBUFFX4 U105 ( .INP(n138), .Z(n151) );
  INVX0 U106 ( .INP(n238), .ZN(n8) );
  INVX0 U107 ( .INP(n245), .ZN(n9) );
  INVX0 U108 ( .INP(n243), .ZN(n10) );
  INVX0 U109 ( .INP(n239), .ZN(n11) );
  INVX0 U110 ( .INP(n240), .ZN(n86) );
  INVX0 U111 ( .INP(n244), .ZN(n87) );
  INVX0 U112 ( .INP(n242), .ZN(n88) );
  INVX0 U113 ( .INP(n247), .ZN(n89) );
  NBUFFX2 U114 ( .INP(n5), .Z(n90) );
  AOI221X1 U115 ( .IN1(mem[24]), .IN2(n146), .IN3(mem[8]), .IN4(n150), .IN5(
        n111), .QN(n92) );
  INVX0 U116 ( .INP(waddr[1]), .ZN(n93) );
  INVX0 U117 ( .INP(wdata[7]), .ZN(n94) );
  INVX0 U118 ( .INP(n94), .ZN(n95) );
  INVX0 U119 ( .INP(wdata[6]), .ZN(n96) );
  INVX0 U120 ( .INP(n96), .ZN(n97) );
  INVX0 U121 ( .INP(wdata[5]), .ZN(n98) );
  INVX0 U122 ( .INP(n98), .ZN(n99) );
  INVX0 U123 ( .INP(wdata[4]), .ZN(n100) );
  INVX0 U124 ( .INP(n100), .ZN(n101) );
  INVX0 U125 ( .INP(wdata[3]), .ZN(n102) );
  INVX0 U126 ( .INP(n102), .ZN(n103) );
  INVX0 U127 ( .INP(wdata[2]), .ZN(n104) );
  INVX0 U128 ( .INP(n104), .ZN(n105) );
  INVX0 U129 ( .INP(wdata[1]), .ZN(n106) );
  INVX0 U130 ( .INP(n106), .ZN(n107) );
  INVX0 U131 ( .INP(wdata[0]), .ZN(n108) );
  INVX0 U132 ( .INP(n108), .ZN(n109) );
  NBUFFX2 U133 ( .INP(n244), .Z(n166) );
  NBUFFX2 U134 ( .INP(n239), .Z(n158) );
  NBUFFX2 U135 ( .INP(n141), .Z(n147) );
  NBUFFX2 U136 ( .INP(n141), .Z(n146) );
  NBUFFX2 U137 ( .INP(n141), .Z(n154) );
  NBUFFX2 U138 ( .INP(n247), .Z(n169) );
  NBUFFX2 U139 ( .INP(n242), .Z(n161) );
  NBUFFX2 U140 ( .INP(n247), .Z(n170) );
  NBUFFX2 U141 ( .INP(n242), .Z(n162) );
  NOR2X0 U142 ( .IN1(n173), .IN2(waddr[2]), .QN(n241) );
  INVX0 U143 ( .INP(we), .ZN(n173) );
  NOR2X0 U144 ( .IN1(n144), .IN2(n7), .QN(n141) );
  NOR2X0 U145 ( .IN1(n7), .IN2(n145), .QN(n137) );
  AO22X1 U146 ( .IN1(mem[32]), .IN2(n3), .IN3(mem[48]), .IN4(n153), .Q(n110)
         );
  AO22X1 U147 ( .IN1(mem[40]), .IN2(n3), .IN3(mem[56]), .IN4(n152), .Q(n111)
         );
  AO22X1 U148 ( .IN1(mem[33]), .IN2(n3), .IN3(mem[49]), .IN4(n153), .Q(n112)
         );
  AO221X1 U149 ( .IN1(mem[17]), .IN2(n147), .IN3(mem[1]), .IN4(n150), .IN5(
        n112), .Q(n115) );
  AO22X1 U150 ( .IN1(mem[41]), .IN2(n3), .IN3(mem[57]), .IN4(n152), .Q(n113)
         );
  AO221X1 U151 ( .IN1(mem[25]), .IN2(n146), .IN3(mem[9]), .IN4(n150), .IN5(
        n113), .Q(n114) );
  AO22X1 U152 ( .IN1(n115), .IN2(n5), .IN3(n114), .IN4(n2), .Q(rdata[1]) );
  AO221X1 U153 ( .IN1(mem[18]), .IN2(n147), .IN3(mem[2]), .IN4(n150), .IN5(
        n116), .Q(n119) );
  AO22X1 U154 ( .IN1(mem[42]), .IN2(n3), .IN3(mem[58]), .IN4(n152), .Q(n117)
         );
  AO221X1 U155 ( .IN1(mem[26]), .IN2(n154), .IN3(mem[10]), .IN4(n150), .IN5(
        n117), .Q(n118) );
  AO22X1 U156 ( .IN1(mem[35]), .IN2(n3), .IN3(mem[51]), .IN4(n153), .Q(n120)
         );
  AO221X1 U157 ( .IN1(mem[19]), .IN2(n147), .IN3(mem[3]), .IN4(n148), .IN5(
        n120), .Q(n123) );
  AO22X1 U158 ( .IN1(mem[43]), .IN2(n3), .IN3(mem[59]), .IN4(n152), .Q(n121)
         );
  AO221X1 U159 ( .IN1(mem[27]), .IN2(n146), .IN3(mem[11]), .IN4(n149), .IN5(
        n121), .Q(n122) );
  AO221X1 U160 ( .IN1(mem[20]), .IN2(n147), .IN3(mem[4]), .IN4(n148), .IN5(
        n124), .Q(n127) );
  AO22X1 U161 ( .IN1(mem[44]), .IN2(n151), .IN3(mem[60]), .IN4(n152), .Q(n125)
         );
  AO221X1 U162 ( .IN1(mem[28]), .IN2(n154), .IN3(mem[12]), .IN4(n149), .IN5(
        n125), .Q(n126) );
  AO22X1 U163 ( .IN1(mem[37]), .IN2(n151), .IN3(mem[53]), .IN4(n153), .Q(n128)
         );
  AO221X1 U164 ( .IN1(mem[21]), .IN2(n147), .IN3(mem[5]), .IN4(n148), .IN5(
        n128), .Q(n131) );
  AO22X1 U165 ( .IN1(mem[45]), .IN2(n151), .IN3(mem[61]), .IN4(n152), .Q(n129)
         );
  AO221X1 U166 ( .IN1(mem[29]), .IN2(n146), .IN3(mem[13]), .IN4(n149), .IN5(
        n129), .Q(n130) );
  AO22X1 U167 ( .IN1(mem[38]), .IN2(n151), .IN3(mem[54]), .IN4(n153), .Q(n132)
         );
  AO221X1 U168 ( .IN1(mem[22]), .IN2(n147), .IN3(mem[6]), .IN4(n148), .IN5(
        n132), .Q(n135) );
  AO22X1 U169 ( .IN1(mem[46]), .IN2(n151), .IN3(mem[62]), .IN4(n152), .Q(n133)
         );
  AO221X1 U170 ( .IN1(mem[30]), .IN2(n154), .IN3(mem[14]), .IN4(n149), .IN5(
        n133), .Q(n134) );
  AO221X1 U171 ( .IN1(mem[23]), .IN2(n154), .IN3(mem[7]), .IN4(n148), .IN5(
        n136), .Q(n143) );
  AO22X1 U172 ( .IN1(mem[47]), .IN2(n151), .IN3(mem[63]), .IN4(n152), .Q(n139)
         );
  AO221X1 U173 ( .IN1(mem[31]), .IN2(n146), .IN3(mem[15]), .IN4(n149), .IN5(
        n139), .Q(n142) );
  INVX0 U174 ( .INP(raddr[2]), .ZN(n144) );
  INVX0 U175 ( .INP(n144), .ZN(n145) );
  NOR2X0 U176 ( .IN1(n6), .IN2(n144), .QN(n140) );
  NBUFFX2 U177 ( .INP(n140), .Z(n150) );
  NBUFFX2 U178 ( .INP(n140), .Z(n148) );
  NBUFFX2 U179 ( .INP(n140), .Z(n149) );
  NOR2X0 U180 ( .IN1(n6), .IN2(n145), .QN(n138) );
  INVX0 U181 ( .INP(n172), .ZN(n171) );
  INVX0 U182 ( .INP(waddr[0]), .ZN(n172) );
endmodule


module payload_ram_bank8x8_6 ( clk, we, waddr, wdata, raddr, rdata );
  input [2:0] waddr;
  input [7:0] wdata;
  input [2:0] raddr;
  output [7:0] rdata;
  input clk, we;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n244;
  wire   [63:0] mem;

  DFFX1 mem_reg_0__7_ ( .D(n171), .CLK(clk), .Q(mem[63]) );
  DFFX1 mem_reg_0__6_ ( .D(n172), .CLK(clk), .Q(mem[62]) );
  DFFX1 mem_reg_0__5_ ( .D(n173), .CLK(clk), .Q(mem[61]) );
  DFFX1 mem_reg_0__4_ ( .D(n174), .CLK(clk), .Q(mem[60]) );
  DFFX1 mem_reg_0__3_ ( .D(n175), .CLK(clk), .Q(mem[59]) );
  DFFX1 mem_reg_0__2_ ( .D(n176), .CLK(clk), .Q(mem[58]) );
  DFFX1 mem_reg_0__1_ ( .D(n177), .CLK(clk), .Q(mem[57]) );
  DFFX1 mem_reg_0__0_ ( .D(n178), .CLK(clk), .Q(mem[56]) );
  DFFX1 mem_reg_1__7_ ( .D(n179), .CLK(clk), .Q(mem[55]) );
  DFFX1 mem_reg_1__6_ ( .D(n180), .CLK(clk), .Q(mem[54]) );
  DFFX1 mem_reg_1__5_ ( .D(n181), .CLK(clk), .Q(mem[53]) );
  DFFX1 mem_reg_1__4_ ( .D(n182), .CLK(clk), .Q(mem[52]) );
  DFFX1 mem_reg_1__3_ ( .D(n183), .CLK(clk), .Q(mem[51]) );
  DFFX1 mem_reg_1__2_ ( .D(n184), .CLK(clk), .Q(mem[50]) );
  DFFX1 mem_reg_1__1_ ( .D(n185), .CLK(clk), .Q(mem[49]) );
  DFFX1 mem_reg_1__0_ ( .D(n186), .CLK(clk), .Q(mem[48]) );
  DFFX1 mem_reg_2__7_ ( .D(n187), .CLK(clk), .Q(mem[47]) );
  DFFX1 mem_reg_2__6_ ( .D(n188), .CLK(clk), .Q(mem[46]) );
  DFFX1 mem_reg_2__5_ ( .D(n189), .CLK(clk), .Q(mem[45]) );
  DFFX1 mem_reg_2__4_ ( .D(n190), .CLK(clk), .Q(mem[44]) );
  DFFX1 mem_reg_2__3_ ( .D(n191), .CLK(clk), .Q(mem[43]) );
  DFFX1 mem_reg_2__2_ ( .D(n192), .CLK(clk), .Q(mem[42]) );
  DFFX1 mem_reg_2__1_ ( .D(n193), .CLK(clk), .Q(mem[41]) );
  DFFX1 mem_reg_2__0_ ( .D(n194), .CLK(clk), .Q(mem[40]) );
  DFFX1 mem_reg_3__7_ ( .D(n195), .CLK(clk), .Q(mem[39]) );
  DFFX1 mem_reg_3__6_ ( .D(n196), .CLK(clk), .Q(mem[38]) );
  DFFX1 mem_reg_3__5_ ( .D(n197), .CLK(clk), .Q(mem[37]) );
  DFFX1 mem_reg_3__4_ ( .D(n198), .CLK(clk), .Q(mem[36]) );
  DFFX1 mem_reg_3__3_ ( .D(n199), .CLK(clk), .Q(mem[35]) );
  DFFX1 mem_reg_3__2_ ( .D(n200), .CLK(clk), .Q(mem[34]) );
  DFFX1 mem_reg_3__1_ ( .D(n201), .CLK(clk), .Q(mem[33]) );
  DFFX1 mem_reg_3__0_ ( .D(n202), .CLK(clk), .Q(mem[32]) );
  DFFX1 mem_reg_4__7_ ( .D(n203), .CLK(clk), .Q(mem[31]) );
  DFFX1 mem_reg_4__6_ ( .D(n204), .CLK(clk), .Q(mem[30]) );
  DFFX1 mem_reg_4__5_ ( .D(n205), .CLK(clk), .Q(mem[29]) );
  DFFX1 mem_reg_4__4_ ( .D(n206), .CLK(clk), .Q(mem[28]) );
  DFFX1 mem_reg_4__3_ ( .D(n207), .CLK(clk), .Q(mem[27]) );
  DFFX1 mem_reg_4__2_ ( .D(n208), .CLK(clk), .Q(mem[26]) );
  DFFX1 mem_reg_4__1_ ( .D(n209), .CLK(clk), .Q(mem[25]) );
  DFFX1 mem_reg_4__0_ ( .D(n210), .CLK(clk), .Q(mem[24]) );
  DFFX1 mem_reg_5__7_ ( .D(n211), .CLK(clk), .Q(mem[23]) );
  DFFX1 mem_reg_5__6_ ( .D(n212), .CLK(clk), .Q(mem[22]) );
  DFFX1 mem_reg_5__5_ ( .D(n213), .CLK(clk), .Q(mem[21]) );
  DFFX1 mem_reg_5__4_ ( .D(n214), .CLK(clk), .Q(mem[20]) );
  DFFX1 mem_reg_5__3_ ( .D(n215), .CLK(clk), .Q(mem[19]) );
  DFFX1 mem_reg_5__2_ ( .D(n216), .CLK(clk), .Q(mem[18]) );
  DFFX1 mem_reg_5__1_ ( .D(n217), .CLK(clk), .Q(mem[17]) );
  DFFX1 mem_reg_5__0_ ( .D(n218), .CLK(clk), .Q(mem[16]) );
  DFFX1 mem_reg_6__7_ ( .D(n219), .CLK(clk), .Q(mem[15]) );
  DFFX1 mem_reg_6__6_ ( .D(n220), .CLK(clk), .Q(mem[14]) );
  DFFX1 mem_reg_6__5_ ( .D(n221), .CLK(clk), .Q(mem[13]) );
  DFFX1 mem_reg_6__4_ ( .D(n222), .CLK(clk), .Q(mem[12]) );
  DFFX1 mem_reg_6__3_ ( .D(n223), .CLK(clk), .Q(mem[11]) );
  DFFX1 mem_reg_6__2_ ( .D(n224), .CLK(clk), .Q(mem[10]) );
  DFFX1 mem_reg_6__1_ ( .D(n225), .CLK(clk), .Q(mem[9]) );
  DFFX1 mem_reg_6__0_ ( .D(n226), .CLK(clk), .Q(mem[8]) );
  DFFX1 mem_reg_7__7_ ( .D(n227), .CLK(clk), .Q(mem[7]) );
  DFFX1 mem_reg_7__6_ ( .D(n228), .CLK(clk), .Q(mem[6]) );
  DFFX1 mem_reg_7__5_ ( .D(n229), .CLK(clk), .Q(mem[5]) );
  DFFX1 mem_reg_7__4_ ( .D(n230), .CLK(clk), .Q(mem[4]) );
  DFFX1 mem_reg_7__3_ ( .D(n231), .CLK(clk), .Q(mem[3]) );
  DFFX1 mem_reg_7__2_ ( .D(n232), .CLK(clk), .Q(mem[2]) );
  DFFX1 mem_reg_7__1_ ( .D(n233), .CLK(clk), .Q(mem[1]) );
  DFFX1 mem_reg_7__0_ ( .D(n234), .CLK(clk), .Q(mem[0]) );
  AO22X1 U14 ( .IN1(wdata[0]), .IN2(n170), .IN3(mem[0]), .IN4(n161), .Q(n234)
         );
  AO22X1 U15 ( .IN1(wdata[1]), .IN2(n170), .IN3(mem[1]), .IN4(n161), .Q(n233)
         );
  AO22X1 U16 ( .IN1(wdata[2]), .IN2(n170), .IN3(mem[2]), .IN4(n161), .Q(n232)
         );
  AO22X1 U17 ( .IN1(wdata[3]), .IN2(n170), .IN3(mem[3]), .IN4(n161), .Q(n231)
         );
  AO22X1 U18 ( .IN1(wdata[4]), .IN2(n170), .IN3(mem[4]), .IN4(n161), .Q(n230)
         );
  AO22X1 U19 ( .IN1(wdata[5]), .IN2(n170), .IN3(mem[5]), .IN4(n160), .Q(n229)
         );
  AO22X1 U20 ( .IN1(wdata[6]), .IN2(n170), .IN3(mem[6]), .IN4(n160), .Q(n228)
         );
  AO22X1 U21 ( .IN1(wdata[7]), .IN2(n170), .IN3(mem[7]), .IN4(n160), .Q(n227)
         );
  AO22X1 U23 ( .IN1(n169), .IN2(wdata[0]), .IN3(mem[8]), .IN4(n159), .Q(n226)
         );
  AO22X1 U24 ( .IN1(n169), .IN2(wdata[1]), .IN3(mem[9]), .IN4(n159), .Q(n225)
         );
  AO22X1 U25 ( .IN1(n169), .IN2(wdata[2]), .IN3(mem[10]), .IN4(n159), .Q(n224)
         );
  AO22X1 U26 ( .IN1(n169), .IN2(wdata[3]), .IN3(mem[11]), .IN4(n159), .Q(n223)
         );
  AO22X1 U27 ( .IN1(n169), .IN2(wdata[4]), .IN3(mem[12]), .IN4(n159), .Q(n222)
         );
  AO22X1 U28 ( .IN1(n169), .IN2(wdata[5]), .IN3(mem[13]), .IN4(n158), .Q(n221)
         );
  AO22X1 U29 ( .IN1(n169), .IN2(wdata[6]), .IN3(mem[14]), .IN4(n158), .Q(n220)
         );
  AO22X1 U30 ( .IN1(n169), .IN2(wdata[7]), .IN3(mem[15]), .IN4(n158), .Q(n219)
         );
  AO22X1 U32 ( .IN1(n99), .IN2(n95), .IN3(mem[16]), .IN4(n157), .Q(n218) );
  AO22X1 U33 ( .IN1(n99), .IN2(n97), .IN3(mem[17]), .IN4(n157), .Q(n217) );
  AO22X1 U34 ( .IN1(n99), .IN2(n94), .IN3(mem[18]), .IN4(n157), .Q(n216) );
  AO22X1 U35 ( .IN1(n99), .IN2(n96), .IN3(mem[19]), .IN4(n157), .Q(n215) );
  AO22X1 U36 ( .IN1(n99), .IN2(n93), .IN3(mem[20]), .IN4(n157), .Q(n214) );
  AO22X1 U37 ( .IN1(n99), .IN2(n89), .IN3(mem[21]), .IN4(n156), .Q(n213) );
  AO22X1 U38 ( .IN1(n99), .IN2(n92), .IN3(mem[22]), .IN4(n156), .Q(n212) );
  AO22X1 U39 ( .IN1(n99), .IN2(n88), .IN3(mem[23]), .IN4(n156), .Q(n211) );
  AO22X1 U41 ( .IN1(n7), .IN2(n95), .IN3(mem[24]), .IN4(n155), .Q(n210) );
  AO22X1 U42 ( .IN1(n6), .IN2(n97), .IN3(mem[25]), .IN4(n155), .Q(n209) );
  AO22X1 U43 ( .IN1(n7), .IN2(n94), .IN3(mem[26]), .IN4(n155), .Q(n208) );
  AO22X1 U44 ( .IN1(n7), .IN2(n96), .IN3(mem[27]), .IN4(n155), .Q(n207) );
  AO22X1 U45 ( .IN1(n6), .IN2(n93), .IN3(mem[28]), .IN4(n155), .Q(n206) );
  AO22X1 U46 ( .IN1(n6), .IN2(n89), .IN3(mem[29]), .IN4(n154), .Q(n205) );
  AO22X1 U47 ( .IN1(n7), .IN2(n92), .IN3(mem[30]), .IN4(n154), .Q(n204) );
  AO22X1 U48 ( .IN1(n6), .IN2(n88), .IN3(mem[31]), .IN4(n154), .Q(n203) );
  AND2X1 U50 ( .IN1(we), .IN2(waddr[2]), .Q(n243) );
  AO22X1 U51 ( .IN1(n102), .IN2(n95), .IN3(mem[32]), .IN4(n153), .Q(n202) );
  AO22X1 U52 ( .IN1(n102), .IN2(n97), .IN3(mem[33]), .IN4(n153), .Q(n201) );
  AO22X1 U53 ( .IN1(n102), .IN2(n94), .IN3(mem[34]), .IN4(n153), .Q(n200) );
  AO22X1 U54 ( .IN1(n102), .IN2(n96), .IN3(mem[35]), .IN4(n153), .Q(n199) );
  AO22X1 U55 ( .IN1(n102), .IN2(n93), .IN3(mem[36]), .IN4(n153), .Q(n198) );
  AO22X1 U56 ( .IN1(n102), .IN2(n89), .IN3(mem[37]), .IN4(n152), .Q(n197) );
  AO22X1 U57 ( .IN1(n102), .IN2(n92), .IN3(mem[38]), .IN4(n152), .Q(n196) );
  AO22X1 U58 ( .IN1(n102), .IN2(n88), .IN3(mem[39]), .IN4(n152), .Q(n195) );
  AO22X1 U60 ( .IN1(n166), .IN2(n95), .IN3(mem[40]), .IN4(n151), .Q(n194) );
  AO22X1 U61 ( .IN1(n166), .IN2(n97), .IN3(mem[41]), .IN4(n151), .Q(n193) );
  AO22X1 U62 ( .IN1(n166), .IN2(n94), .IN3(mem[42]), .IN4(n151), .Q(n192) );
  AO22X1 U63 ( .IN1(n166), .IN2(n96), .IN3(mem[43]), .IN4(n151), .Q(n191) );
  AO22X1 U64 ( .IN1(n166), .IN2(n93), .IN3(mem[44]), .IN4(n151), .Q(n190) );
  AO22X1 U65 ( .IN1(n166), .IN2(n89), .IN3(mem[45]), .IN4(n150), .Q(n189) );
  AO22X1 U66 ( .IN1(n166), .IN2(n92), .IN3(mem[46]), .IN4(n150), .Q(n188) );
  AO22X1 U67 ( .IN1(n166), .IN2(n88), .IN3(mem[47]), .IN4(n150), .Q(n187) );
  AO22X1 U69 ( .IN1(n98), .IN2(n95), .IN3(mem[48]), .IN4(n149), .Q(n186) );
  AO22X1 U70 ( .IN1(n98), .IN2(n97), .IN3(mem[49]), .IN4(n149), .Q(n185) );
  AO22X1 U71 ( .IN1(n98), .IN2(n94), .IN3(mem[50]), .IN4(n149), .Q(n184) );
  AO22X1 U72 ( .IN1(n98), .IN2(n96), .IN3(mem[51]), .IN4(n149), .Q(n183) );
  AO22X1 U73 ( .IN1(n98), .IN2(n93), .IN3(mem[52]), .IN4(n149), .Q(n182) );
  AO22X1 U74 ( .IN1(n98), .IN2(n89), .IN3(mem[53]), .IN4(n148), .Q(n181) );
  AO22X1 U75 ( .IN1(n98), .IN2(n92), .IN3(mem[54]), .IN4(n148), .Q(n180) );
  AO22X1 U76 ( .IN1(n98), .IN2(n88), .IN3(mem[55]), .IN4(n148), .Q(n179) );
  AO22X1 U78 ( .IN1(n165), .IN2(n95), .IN3(mem[56]), .IN4(n147), .Q(n178) );
  AO22X1 U79 ( .IN1(n165), .IN2(n97), .IN3(mem[57]), .IN4(n147), .Q(n177) );
  AO22X1 U80 ( .IN1(n165), .IN2(n94), .IN3(mem[58]), .IN4(n147), .Q(n176) );
  AO22X1 U81 ( .IN1(n165), .IN2(n96), .IN3(mem[59]), .IN4(n147), .Q(n175) );
  AO22X1 U82 ( .IN1(n165), .IN2(n93), .IN3(mem[60]), .IN4(n147), .Q(n174) );
  AO22X1 U83 ( .IN1(n165), .IN2(n89), .IN3(mem[61]), .IN4(n146), .Q(n173) );
  AO22X1 U84 ( .IN1(n165), .IN2(n92), .IN3(mem[62]), .IN4(n146), .Q(n172) );
  AO22X1 U85 ( .IN1(n165), .IN2(n88), .IN3(mem[63]), .IN4(n146), .Q(n171) );
  NAND2X0 U2 ( .IN1(n8), .IN2(n134), .QN(n1) );
  NBUFFX4 U3 ( .INP(n100), .Z(n8) );
  NAND2X0 U4 ( .IN1(n2), .IN2(n1), .QN(rdata[7]) );
  NAND2X0 U5 ( .IN1(n133), .IN2(n9), .QN(n2) );
  NAND2X2 U6 ( .IN1(n124), .IN2(n100), .QN(n3) );
  NAND2X0 U7 ( .IN1(n123), .IN2(n9), .QN(n4) );
  NAND2X0 U8 ( .IN1(n3), .IN2(n4), .QN(rdata[5]) );
  NBUFFX2 U9 ( .INP(n131), .Z(n140) );
  NAND3X1 U10 ( .IN1(n162), .IN2(n243), .IN3(waddr[1]), .QN(n244) );
  NAND3X0 U11 ( .IN1(n243), .IN2(n164), .IN3(n162), .QN(n241) );
  NAND3X0 U12 ( .IN1(n163), .IN2(n164), .IN3(n238), .QN(n235) );
  AOI221X1 U13 ( .IN1(mem[16]), .IN2(n139), .IN3(mem[0]), .IN4(n142), .IN5(
        n103), .QN(n86) );
  NBUFFX2 U22 ( .INP(n244), .Z(n161) );
  NBUFFX2 U31 ( .INP(n242), .Z(n159) );
  NBUFFX2 U40 ( .INP(n242), .Z(n158) );
  NBUFFX2 U49 ( .INP(n241), .Z(n156) );
  NBUFFX2 U59 ( .INP(n240), .Z(n155) );
  NBUFFX2 U68 ( .INP(n240), .Z(n154) );
  NBUFFX2 U77 ( .INP(n239), .Z(n153) );
  NBUFFX2 U86 ( .INP(n237), .Z(n151) );
  NBUFFX2 U87 ( .INP(n237), .Z(n150) );
  NBUFFX2 U88 ( .INP(n236), .Z(n148) );
  AO22X1 U89 ( .IN1(n120), .IN2(n8), .IN3(n119), .IN4(n9), .Q(rdata[4]) );
  INVX0 U90 ( .INP(n168), .ZN(n5) );
  INVX0 U91 ( .INP(n5), .ZN(n6) );
  INVX0 U92 ( .INP(n5), .ZN(n7) );
  NBUFFX2 U93 ( .INP(n235), .Z(n146) );
  NAND3X0 U94 ( .IN1(n163), .IN2(n164), .IN3(n243), .QN(n240) );
  NBUFFX2 U95 ( .INP(n244), .Z(n160) );
  NBUFFX2 U96 ( .INP(n239), .Z(n152) );
  NAND3X0 U97 ( .IN1(n162), .IN2(n164), .IN3(n238), .QN(n236) );
  NAND3X1 U98 ( .IN1(n243), .IN2(n163), .IN3(waddr[1]), .QN(n242) );
  NAND3X0 U99 ( .IN1(waddr[1]), .IN2(n163), .IN3(n238), .QN(n237) );
  NBUFFX4 U100 ( .INP(n137), .Z(n9) );
  OAI22X1 U101 ( .IN1(n10), .IN2(n137), .IN3(n11), .IN4(n100), .QN(rdata[6])
         );
  AOI221X1 U102 ( .IN1(mem[22]), .IN2(n139), .IN3(mem[6]), .IN4(n140), .IN5(
        n125), .QN(n10) );
  AOI221X1 U103 ( .IN1(mem[30]), .IN2(n138), .IN3(mem[14]), .IN4(n141), .IN5(
        n126), .QN(n11) );
  OAI22X1 U104 ( .IN1(n86), .IN2(n9), .IN3(n87), .IN4(n8), .QN(rdata[0]) );
  AOI221X1 U105 ( .IN1(mem[24]), .IN2(n138), .IN3(mem[8]), .IN4(n142), .IN5(
        n104), .QN(n87) );
  AO22X2 U106 ( .IN1(n116), .IN2(n8), .IN3(n115), .IN4(n9), .Q(rdata[3]) );
  NBUFFX2 U107 ( .INP(wdata[7]), .Z(n88) );
  NBUFFX2 U108 ( .INP(wdata[5]), .Z(n89) );
  INVX0 U109 ( .INP(raddr[1]), .ZN(n90) );
  INVX0 U110 ( .INP(n90), .ZN(n91) );
  NBUFFX2 U111 ( .INP(wdata[6]), .Z(n92) );
  NBUFFX2 U112 ( .INP(wdata[4]), .Z(n93) );
  NBUFFX2 U113 ( .INP(wdata[2]), .Z(n94) );
  NBUFFX2 U114 ( .INP(wdata[0]), .Z(n95) );
  NBUFFX2 U115 ( .INP(wdata[3]), .Z(n96) );
  NBUFFX2 U116 ( .INP(wdata[1]), .Z(n97) );
  NAND3X1 U117 ( .IN1(waddr[1]), .IN2(n162), .IN3(n238), .QN(n239) );
  INVX0 U118 ( .INP(n236), .ZN(n98) );
  INVX0 U119 ( .INP(n241), .ZN(n99) );
  INVX0 U120 ( .INP(n137), .ZN(n100) );
  NOR2X0 U121 ( .IN1(n90), .IN2(n136), .QN(n101) );
  INVX0 U122 ( .INP(n239), .ZN(n102) );
  NBUFFX2 U123 ( .INP(n129), .Z(n143) );
  NBUFFX2 U124 ( .INP(n131), .Z(n142) );
  NBUFFX2 U125 ( .INP(n132), .Z(n139) );
  NBUFFX2 U126 ( .INP(n132), .Z(n138) );
  DELLN1X2 U127 ( .INP(n131), .Z(n141) );
  INVX0 U128 ( .INP(n154), .ZN(n168) );
  INVX0 U129 ( .INP(n235), .ZN(n165) );
  INVX0 U130 ( .INP(n244), .ZN(n170) );
  INVX0 U131 ( .INP(n150), .ZN(n166) );
  INVX0 U132 ( .INP(n158), .ZN(n169) );
  NBUFFX2 U133 ( .INP(n156), .Z(n157) );
  NBUFFX2 U134 ( .INP(n148), .Z(n149) );
  NBUFFX2 U135 ( .INP(n146), .Z(n147) );
  NBUFFX2 U136 ( .INP(n128), .Z(n145) );
  NBUFFX2 U137 ( .INP(n128), .Z(n144) );
  NOR2X0 U138 ( .IN1(n167), .IN2(waddr[2]), .QN(n238) );
  INVX0 U139 ( .INP(we), .ZN(n167) );
  NOR2X0 U140 ( .IN1(n135), .IN2(n91), .QN(n132) );
  NOR2X0 U141 ( .IN1(n91), .IN2(n136), .QN(n128) );
  AO22X1 U142 ( .IN1(mem[32]), .IN2(n101), .IN3(mem[48]), .IN4(n145), .Q(n103)
         );
  AO22X1 U143 ( .IN1(mem[40]), .IN2(n101), .IN3(mem[56]), .IN4(n144), .Q(n104)
         );
  AO22X1 U144 ( .IN1(mem[33]), .IN2(n101), .IN3(mem[49]), .IN4(n145), .Q(n105)
         );
  AO221X1 U145 ( .IN1(mem[17]), .IN2(n139), .IN3(mem[1]), .IN4(n142), .IN5(
        n105), .Q(n108) );
  AO22X1 U146 ( .IN1(mem[41]), .IN2(n101), .IN3(mem[57]), .IN4(n144), .Q(n106)
         );
  AO221X1 U147 ( .IN1(mem[25]), .IN2(n138), .IN3(mem[9]), .IN4(n142), .IN5(
        n106), .Q(n107) );
  AO22X1 U148 ( .IN1(n108), .IN2(raddr[0]), .IN3(n107), .IN4(n137), .Q(
        rdata[1]) );
  AO22X1 U149 ( .IN1(mem[34]), .IN2(n101), .IN3(mem[50]), .IN4(n145), .Q(n109)
         );
  AO221X1 U150 ( .IN1(mem[18]), .IN2(n139), .IN3(mem[2]), .IN4(n142), .IN5(
        n109), .Q(n112) );
  AO22X1 U151 ( .IN1(mem[42]), .IN2(n101), .IN3(mem[58]), .IN4(n144), .Q(n110)
         );
  AO221X1 U152 ( .IN1(mem[26]), .IN2(n138), .IN3(mem[10]), .IN4(n142), .IN5(
        n110), .Q(n111) );
  AO22X1 U153 ( .IN1(n112), .IN2(raddr[0]), .IN3(n111), .IN4(n9), .Q(rdata[2])
         );
  AO22X1 U154 ( .IN1(mem[35]), .IN2(n101), .IN3(mem[51]), .IN4(n145), .Q(n113)
         );
  AO221X1 U155 ( .IN1(mem[19]), .IN2(n139), .IN3(mem[3]), .IN4(n140), .IN5(
        n113), .Q(n116) );
  AO22X1 U156 ( .IN1(mem[43]), .IN2(n101), .IN3(mem[59]), .IN4(n144), .Q(n114)
         );
  AO221X1 U157 ( .IN1(mem[27]), .IN2(n138), .IN3(mem[11]), .IN4(n141), .IN5(
        n114), .Q(n115) );
  AO22X1 U158 ( .IN1(mem[36]), .IN2(n143), .IN3(mem[52]), .IN4(n145), .Q(n117)
         );
  AO221X1 U159 ( .IN1(mem[20]), .IN2(n139), .IN3(mem[4]), .IN4(n140), .IN5(
        n117), .Q(n120) );
  AO22X1 U160 ( .IN1(mem[44]), .IN2(n143), .IN3(mem[60]), .IN4(n144), .Q(n118)
         );
  AO221X1 U161 ( .IN1(mem[28]), .IN2(n138), .IN3(mem[12]), .IN4(n141), .IN5(
        n118), .Q(n119) );
  AO22X1 U162 ( .IN1(mem[37]), .IN2(n143), .IN3(mem[53]), .IN4(n145), .Q(n121)
         );
  AO221X1 U163 ( .IN1(mem[21]), .IN2(n139), .IN3(mem[5]), .IN4(n140), .IN5(
        n121), .Q(n124) );
  AO22X1 U164 ( .IN1(mem[45]), .IN2(n143), .IN3(mem[61]), .IN4(n144), .Q(n122)
         );
  AO221X1 U165 ( .IN1(mem[29]), .IN2(n138), .IN3(mem[13]), .IN4(n141), .IN5(
        n122), .Q(n123) );
  AO22X1 U166 ( .IN1(mem[38]), .IN2(n143), .IN3(mem[54]), .IN4(n145), .Q(n125)
         );
  AO22X1 U167 ( .IN1(mem[46]), .IN2(n143), .IN3(mem[62]), .IN4(n144), .Q(n126)
         );
  AO22X1 U168 ( .IN1(mem[39]), .IN2(n143), .IN3(mem[55]), .IN4(n145), .Q(n127)
         );
  AO221X1 U169 ( .IN1(mem[23]), .IN2(n139), .IN3(mem[7]), .IN4(n140), .IN5(
        n127), .Q(n134) );
  AO22X1 U170 ( .IN1(mem[47]), .IN2(n143), .IN3(mem[63]), .IN4(n144), .Q(n130)
         );
  AO221X1 U171 ( .IN1(mem[31]), .IN2(n138), .IN3(mem[15]), .IN4(n141), .IN5(
        n130), .Q(n133) );
  INVX0 U172 ( .INP(raddr[2]), .ZN(n135) );
  INVX0 U173 ( .INP(n135), .ZN(n136) );
  INVX0 U174 ( .INP(raddr[0]), .ZN(n137) );
  NOR2X0 U175 ( .IN1(n135), .IN2(n90), .QN(n131) );
  NOR2X0 U176 ( .IN1(n90), .IN2(n136), .QN(n129) );
  INVX0 U177 ( .INP(n163), .ZN(n162) );
  INVX0 U178 ( .INP(waddr[0]), .ZN(n163) );
  INVX0 U179 ( .INP(waddr[1]), .ZN(n164) );
endmodule


module payload_ram_bank8x8_5 ( clk, we, waddr, wdata, raddr, rdata );
  input [2:0] waddr;
  input [7:0] wdata;
  input [2:0] raddr;
  output [7:0] rdata;
  input clk, we;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241;
  wire   [63:0] mem;

  DFFX1 mem_reg_0__7_ ( .D(n168), .CLK(clk), .Q(mem[63]) );
  DFFX1 mem_reg_0__6_ ( .D(n169), .CLK(clk), .Q(mem[62]) );
  DFFX1 mem_reg_0__5_ ( .D(n170), .CLK(clk), .Q(mem[61]) );
  DFFX1 mem_reg_0__4_ ( .D(n171), .CLK(clk), .Q(mem[60]) );
  DFFX1 mem_reg_0__3_ ( .D(n172), .CLK(clk), .Q(mem[59]) );
  DFFX1 mem_reg_0__2_ ( .D(n173), .CLK(clk), .Q(mem[58]) );
  DFFX1 mem_reg_0__1_ ( .D(n174), .CLK(clk), .Q(mem[57]) );
  DFFX1 mem_reg_0__0_ ( .D(n175), .CLK(clk), .Q(mem[56]) );
  DFFX1 mem_reg_1__7_ ( .D(n176), .CLK(clk), .Q(mem[55]) );
  DFFX1 mem_reg_1__6_ ( .D(n177), .CLK(clk), .Q(mem[54]) );
  DFFX1 mem_reg_1__5_ ( .D(n178), .CLK(clk), .Q(mem[53]) );
  DFFX1 mem_reg_1__4_ ( .D(n179), .CLK(clk), .Q(mem[52]) );
  DFFX1 mem_reg_1__3_ ( .D(n180), .CLK(clk), .Q(mem[51]) );
  DFFX1 mem_reg_1__2_ ( .D(n181), .CLK(clk), .Q(mem[50]) );
  DFFX1 mem_reg_1__1_ ( .D(n182), .CLK(clk), .Q(mem[49]) );
  DFFX1 mem_reg_1__0_ ( .D(n183), .CLK(clk), .Q(mem[48]) );
  DFFX1 mem_reg_2__7_ ( .D(n184), .CLK(clk), .Q(mem[47]) );
  DFFX1 mem_reg_2__6_ ( .D(n185), .CLK(clk), .Q(mem[46]) );
  DFFX1 mem_reg_2__5_ ( .D(n186), .CLK(clk), .Q(mem[45]) );
  DFFX1 mem_reg_2__4_ ( .D(n187), .CLK(clk), .Q(mem[44]) );
  DFFX1 mem_reg_2__3_ ( .D(n188), .CLK(clk), .Q(mem[43]) );
  DFFX1 mem_reg_2__2_ ( .D(n189), .CLK(clk), .Q(mem[42]) );
  DFFX1 mem_reg_2__1_ ( .D(n190), .CLK(clk), .Q(mem[41]) );
  DFFX1 mem_reg_2__0_ ( .D(n191), .CLK(clk), .Q(mem[40]) );
  DFFX1 mem_reg_3__7_ ( .D(n192), .CLK(clk), .Q(mem[39]) );
  DFFX1 mem_reg_3__6_ ( .D(n193), .CLK(clk), .Q(mem[38]) );
  DFFX1 mem_reg_3__5_ ( .D(n194), .CLK(clk), .Q(mem[37]) );
  DFFX1 mem_reg_3__4_ ( .D(n195), .CLK(clk), .Q(mem[36]) );
  DFFX1 mem_reg_3__3_ ( .D(n196), .CLK(clk), .Q(mem[35]) );
  DFFX1 mem_reg_3__2_ ( .D(n197), .CLK(clk), .Q(mem[34]) );
  DFFX1 mem_reg_3__1_ ( .D(n198), .CLK(clk), .Q(mem[33]) );
  DFFX1 mem_reg_3__0_ ( .D(n199), .CLK(clk), .Q(mem[32]) );
  DFFX1 mem_reg_4__7_ ( .D(n200), .CLK(clk), .Q(mem[31]) );
  DFFX1 mem_reg_4__6_ ( .D(n201), .CLK(clk), .Q(mem[30]) );
  DFFX1 mem_reg_4__5_ ( .D(n202), .CLK(clk), .Q(mem[29]) );
  DFFX1 mem_reg_4__4_ ( .D(n203), .CLK(clk), .Q(mem[28]) );
  DFFX1 mem_reg_4__3_ ( .D(n204), .CLK(clk), .Q(mem[27]) );
  DFFX1 mem_reg_4__2_ ( .D(n205), .CLK(clk), .Q(mem[26]) );
  DFFX1 mem_reg_4__1_ ( .D(n206), .CLK(clk), .Q(mem[25]) );
  DFFX1 mem_reg_4__0_ ( .D(n207), .CLK(clk), .Q(mem[24]) );
  DFFX1 mem_reg_5__7_ ( .D(n208), .CLK(clk), .Q(mem[23]) );
  DFFX1 mem_reg_5__6_ ( .D(n209), .CLK(clk), .Q(mem[22]) );
  DFFX1 mem_reg_5__5_ ( .D(n210), .CLK(clk), .Q(mem[21]) );
  DFFX1 mem_reg_5__4_ ( .D(n211), .CLK(clk), .Q(mem[20]) );
  DFFX1 mem_reg_5__3_ ( .D(n212), .CLK(clk), .Q(mem[19]) );
  DFFX1 mem_reg_5__2_ ( .D(n213), .CLK(clk), .Q(mem[18]) );
  DFFX1 mem_reg_5__1_ ( .D(n214), .CLK(clk), .Q(mem[17]) );
  DFFX1 mem_reg_5__0_ ( .D(n215), .CLK(clk), .Q(mem[16]) );
  DFFX1 mem_reg_6__7_ ( .D(n216), .CLK(clk), .Q(mem[15]) );
  DFFX1 mem_reg_6__6_ ( .D(n217), .CLK(clk), .Q(mem[14]) );
  DFFX1 mem_reg_6__5_ ( .D(n218), .CLK(clk), .Q(mem[13]) );
  DFFX1 mem_reg_6__4_ ( .D(n219), .CLK(clk), .Q(mem[12]) );
  DFFX1 mem_reg_6__3_ ( .D(n220), .CLK(clk), .Q(mem[11]) );
  DFFX1 mem_reg_6__2_ ( .D(n221), .CLK(clk), .Q(mem[10]) );
  DFFX1 mem_reg_6__1_ ( .D(n222), .CLK(clk), .Q(mem[9]) );
  DFFX1 mem_reg_6__0_ ( .D(n223), .CLK(clk), .Q(mem[8]) );
  DFFX1 mem_reg_7__7_ ( .D(n224), .CLK(clk), .Q(mem[7]) );
  DFFX1 mem_reg_7__6_ ( .D(n225), .CLK(clk), .Q(mem[6]) );
  DFFX1 mem_reg_7__5_ ( .D(n226), .CLK(clk), .Q(mem[5]) );
  DFFX1 mem_reg_7__4_ ( .D(n227), .CLK(clk), .Q(mem[4]) );
  DFFX1 mem_reg_7__3_ ( .D(n228), .CLK(clk), .Q(mem[3]) );
  DFFX1 mem_reg_7__2_ ( .D(n229), .CLK(clk), .Q(mem[2]) );
  DFFX1 mem_reg_7__1_ ( .D(n230), .CLK(clk), .Q(mem[1]) );
  DFFX1 mem_reg_7__0_ ( .D(n231), .CLK(clk), .Q(mem[0]) );
  AO22X1 U14 ( .IN1(wdata[0]), .IN2(n4), .IN3(mem[0]), .IN4(n160), .Q(n231) );
  AO22X1 U15 ( .IN1(wdata[1]), .IN2(n4), .IN3(mem[1]), .IN4(n160), .Q(n230) );
  AO22X1 U16 ( .IN1(wdata[2]), .IN2(n4), .IN3(mem[2]), .IN4(n160), .Q(n229) );
  AO22X1 U17 ( .IN1(wdata[3]), .IN2(n4), .IN3(mem[3]), .IN4(n160), .Q(n228) );
  AO22X1 U18 ( .IN1(wdata[4]), .IN2(n4), .IN3(mem[4]), .IN4(n160), .Q(n227) );
  AO22X1 U19 ( .IN1(wdata[5]), .IN2(n4), .IN3(mem[5]), .IN4(n159), .Q(n226) );
  AO22X1 U20 ( .IN1(wdata[6]), .IN2(n4), .IN3(mem[6]), .IN4(n159), .Q(n225) );
  AO22X1 U21 ( .IN1(wdata[7]), .IN2(n4), .IN3(mem[7]), .IN4(n159), .Q(n224) );
  AO22X1 U23 ( .IN1(n3), .IN2(n88), .IN3(mem[8]), .IN4(n158), .Q(n223) );
  AO22X1 U24 ( .IN1(n3), .IN2(n10), .IN3(mem[9]), .IN4(n158), .Q(n222) );
  AO22X1 U25 ( .IN1(n3), .IN2(n87), .IN3(mem[10]), .IN4(n158), .Q(n221) );
  AO22X1 U26 ( .IN1(n3), .IN2(n9), .IN3(mem[11]), .IN4(n158), .Q(n220) );
  AO22X1 U27 ( .IN1(n3), .IN2(n11), .IN3(mem[12]), .IN4(n158), .Q(n219) );
  AO22X1 U28 ( .IN1(n3), .IN2(n8), .IN3(mem[13]), .IN4(n157), .Q(n218) );
  AO22X1 U29 ( .IN1(n3), .IN2(n86), .IN3(mem[14]), .IN4(n157), .Q(n217) );
  AO22X1 U30 ( .IN1(n3), .IN2(n7), .IN3(mem[15]), .IN4(n157), .Q(n216) );
  AO22X1 U32 ( .IN1(n167), .IN2(n88), .IN3(mem[16]), .IN4(n156), .Q(n215) );
  AO22X1 U33 ( .IN1(n167), .IN2(wdata[1]), .IN3(mem[17]), .IN4(n156), .Q(n214)
         );
  AO22X1 U34 ( .IN1(n167), .IN2(n87), .IN3(mem[18]), .IN4(n156), .Q(n213) );
  AO22X1 U35 ( .IN1(n167), .IN2(wdata[3]), .IN3(mem[19]), .IN4(n156), .Q(n212)
         );
  AO22X1 U36 ( .IN1(n167), .IN2(wdata[4]), .IN3(mem[20]), .IN4(n156), .Q(n211)
         );
  AO22X1 U37 ( .IN1(n167), .IN2(wdata[5]), .IN3(mem[21]), .IN4(n155), .Q(n210)
         );
  AO22X1 U38 ( .IN1(n167), .IN2(wdata[6]), .IN3(mem[22]), .IN4(n155), .Q(n209)
         );
  AO22X1 U39 ( .IN1(n167), .IN2(wdata[7]), .IN3(mem[23]), .IN4(n155), .Q(n208)
         );
  AO22X1 U41 ( .IN1(n166), .IN2(n88), .IN3(mem[24]), .IN4(n154), .Q(n207) );
  AO22X1 U42 ( .IN1(n166), .IN2(n10), .IN3(mem[25]), .IN4(n154), .Q(n206) );
  AO22X1 U43 ( .IN1(n166), .IN2(n87), .IN3(mem[26]), .IN4(n154), .Q(n205) );
  AO22X1 U44 ( .IN1(n166), .IN2(n9), .IN3(mem[27]), .IN4(n154), .Q(n204) );
  AO22X1 U45 ( .IN1(n166), .IN2(n11), .IN3(mem[28]), .IN4(n154), .Q(n203) );
  AO22X1 U46 ( .IN1(n166), .IN2(n8), .IN3(mem[29]), .IN4(n153), .Q(n202) );
  AO22X1 U47 ( .IN1(n166), .IN2(n86), .IN3(mem[30]), .IN4(n153), .Q(n201) );
  AO22X1 U48 ( .IN1(n166), .IN2(n7), .IN3(mem[31]), .IN4(n153), .Q(n200) );
  AND2X1 U50 ( .IN1(we), .IN2(waddr[2]), .Q(n240) );
  AO22X1 U51 ( .IN1(n1), .IN2(n88), .IN3(mem[32]), .IN4(n152), .Q(n199) );
  AO22X1 U52 ( .IN1(n1), .IN2(n10), .IN3(mem[33]), .IN4(n152), .Q(n198) );
  AO22X1 U53 ( .IN1(n1), .IN2(n87), .IN3(mem[34]), .IN4(n152), .Q(n197) );
  AO22X1 U54 ( .IN1(n1), .IN2(n9), .IN3(mem[35]), .IN4(n152), .Q(n196) );
  AO22X1 U55 ( .IN1(n1), .IN2(n11), .IN3(mem[36]), .IN4(n152), .Q(n195) );
  AO22X1 U56 ( .IN1(n1), .IN2(n8), .IN3(mem[37]), .IN4(n151), .Q(n194) );
  AO22X1 U57 ( .IN1(n1), .IN2(n86), .IN3(mem[38]), .IN4(n151), .Q(n193) );
  AO22X1 U58 ( .IN1(n1), .IN2(n7), .IN3(mem[39]), .IN4(n151), .Q(n192) );
  AO22X1 U60 ( .IN1(n2), .IN2(n88), .IN3(mem[40]), .IN4(n150), .Q(n191) );
  AO22X1 U61 ( .IN1(n2), .IN2(n10), .IN3(mem[41]), .IN4(n150), .Q(n190) );
  AO22X1 U62 ( .IN1(n2), .IN2(n87), .IN3(mem[42]), .IN4(n150), .Q(n189) );
  AO22X1 U63 ( .IN1(n2), .IN2(n9), .IN3(mem[43]), .IN4(n150), .Q(n188) );
  AO22X1 U64 ( .IN1(n2), .IN2(n11), .IN3(mem[44]), .IN4(n150), .Q(n187) );
  AO22X1 U65 ( .IN1(n2), .IN2(n8), .IN3(mem[45]), .IN4(n149), .Q(n186) );
  AO22X1 U66 ( .IN1(n2), .IN2(n86), .IN3(mem[46]), .IN4(n149), .Q(n185) );
  AO22X1 U67 ( .IN1(n2), .IN2(n7), .IN3(mem[47]), .IN4(n149), .Q(n184) );
  AO22X1 U69 ( .IN1(n164), .IN2(n88), .IN3(mem[48]), .IN4(n148), .Q(n183) );
  AO22X1 U70 ( .IN1(n164), .IN2(n10), .IN3(mem[49]), .IN4(n148), .Q(n182) );
  AO22X1 U71 ( .IN1(n164), .IN2(n87), .IN3(mem[50]), .IN4(n148), .Q(n181) );
  AO22X1 U72 ( .IN1(n164), .IN2(n9), .IN3(mem[51]), .IN4(n148), .Q(n180) );
  AO22X1 U73 ( .IN1(n164), .IN2(n11), .IN3(mem[52]), .IN4(n148), .Q(n179) );
  AO22X1 U74 ( .IN1(n164), .IN2(n8), .IN3(mem[53]), .IN4(n147), .Q(n178) );
  AO22X1 U75 ( .IN1(n164), .IN2(n86), .IN3(mem[54]), .IN4(n147), .Q(n177) );
  AO22X1 U76 ( .IN1(n164), .IN2(n7), .IN3(mem[55]), .IN4(n147), .Q(n176) );
  AO22X1 U78 ( .IN1(n163), .IN2(n88), .IN3(mem[56]), .IN4(n146), .Q(n175) );
  AO22X1 U79 ( .IN1(n163), .IN2(n10), .IN3(mem[57]), .IN4(n146), .Q(n174) );
  AO22X1 U80 ( .IN1(n163), .IN2(n87), .IN3(mem[58]), .IN4(n146), .Q(n173) );
  AO22X1 U81 ( .IN1(n163), .IN2(n9), .IN3(mem[59]), .IN4(n146), .Q(n172) );
  AO22X1 U82 ( .IN1(n163), .IN2(n11), .IN3(mem[60]), .IN4(n146), .Q(n171) );
  AO22X1 U83 ( .IN1(n163), .IN2(n8), .IN3(mem[61]), .IN4(n145), .Q(n170) );
  AO22X1 U84 ( .IN1(n163), .IN2(n86), .IN3(mem[62]), .IN4(n145), .Q(n169) );
  AO22X1 U85 ( .IN1(n163), .IN2(n7), .IN3(mem[63]), .IN4(n145), .Q(n168) );
  NBUFFX2 U2 ( .INP(n122), .Z(n140) );
  NBUFFX2 U3 ( .INP(n123), .Z(n138) );
  NBUFFX2 U4 ( .INP(n125), .Z(n135) );
  NBUFFX2 U5 ( .INP(n125), .Z(n136) );
  NAND3X0 U6 ( .IN1(n161), .IN2(n240), .IN3(n90), .QN(n241) );
  NAND3X0 U7 ( .IN1(n240), .IN2(n162), .IN3(n90), .QN(n239) );
  NAND3X0 U8 ( .IN1(n240), .IN2(n89), .IN3(n161), .QN(n238) );
  NAND3X0 U9 ( .IN1(n162), .IN2(n89), .IN3(n240), .QN(n237) );
  NAND3X0 U10 ( .IN1(n90), .IN2(n161), .IN3(n235), .QN(n236) );
  NAND3X0 U11 ( .IN1(n90), .IN2(n162), .IN3(n235), .QN(n234) );
  NAND3X0 U12 ( .IN1(n161), .IN2(n89), .IN3(n235), .QN(n233) );
  NAND3X0 U13 ( .IN1(n162), .IN2(n89), .IN3(n235), .QN(n232) );
  NBUFFX2 U22 ( .INP(n239), .Z(n158) );
  NBUFFX2 U31 ( .INP(n237), .Z(n153) );
  NBUFFX2 U40 ( .INP(n234), .Z(n150) );
  NBUFFX2 U49 ( .INP(n232), .Z(n145) );
  NBUFFX2 U59 ( .INP(n239), .Z(n157) );
  NBUFFX2 U68 ( .INP(n234), .Z(n149) );
  NBUFFX2 U77 ( .INP(raddr[1]), .Z(n5) );
  INVX0 U86 ( .INP(n236), .ZN(n1) );
  INVX0 U87 ( .INP(n234), .ZN(n2) );
  INVX0 U88 ( .INP(n239), .ZN(n3) );
  INVX0 U89 ( .INP(n241), .ZN(n4) );
  AND2X1 U90 ( .IN1(n130), .IN2(n131), .Q(n126) );
  NOR2X0 U91 ( .IN1(n131), .IN2(n130), .QN(n6) );
  NBUFFX2 U92 ( .INP(wdata[7]), .Z(n7) );
  NBUFFX2 U93 ( .INP(wdata[5]), .Z(n8) );
  NBUFFX2 U94 ( .INP(wdata[3]), .Z(n9) );
  NBUFFX2 U95 ( .INP(wdata[1]), .Z(n10) );
  NBUFFX2 U96 ( .INP(wdata[4]), .Z(n11) );
  NBUFFX2 U97 ( .INP(wdata[6]), .Z(n86) );
  NBUFFX2 U98 ( .INP(wdata[2]), .Z(n87) );
  NBUFFX2 U99 ( .INP(wdata[0]), .Z(n88) );
  INVX0 U100 ( .INP(waddr[1]), .ZN(n89) );
  INVX0 U101 ( .INP(n89), .ZN(n90) );
  NAND2X0 U102 ( .IN1(mem[33]), .IN2(n6), .QN(n91) );
  NAND2X0 U103 ( .IN1(mem[49]), .IN2(n140), .QN(n92) );
  NAND2X1 U104 ( .IN1(n91), .IN2(n92), .QN(n97) );
  NBUFFX2 U105 ( .INP(n126), .Z(n134) );
  NBUFFX2 U106 ( .INP(n126), .Z(n133) );
  NBUFFX2 U107 ( .INP(n122), .Z(n144) );
  NBUFFX2 U108 ( .INP(n122), .Z(n143) );
  INVX0 U109 ( .INP(n237), .ZN(n166) );
  INVX0 U110 ( .INP(n238), .ZN(n167) );
  INVX0 U111 ( .INP(n233), .ZN(n164) );
  INVX0 U112 ( .INP(n232), .ZN(n163) );
  NBUFFX2 U113 ( .INP(n125), .Z(n137) );
  NBUFFX2 U114 ( .INP(n238), .Z(n155) );
  NBUFFX2 U115 ( .INP(n233), .Z(n147) );
  NBUFFX2 U116 ( .INP(n153), .Z(n154) );
  NBUFFX2 U117 ( .INP(n155), .Z(n156) );
  NBUFFX2 U118 ( .INP(n147), .Z(n148) );
  NBUFFX2 U119 ( .INP(n145), .Z(n146) );
  NBUFFX2 U120 ( .INP(n241), .Z(n159) );
  NBUFFX2 U121 ( .INP(n236), .Z(n151) );
  NBUFFX2 U122 ( .INP(n241), .Z(n160) );
  NBUFFX2 U123 ( .INP(n236), .Z(n152) );
  NOR2X0 U124 ( .IN1(n165), .IN2(waddr[2]), .QN(n235) );
  INVX0 U125 ( .INP(we), .ZN(n165) );
  AO22X1 U126 ( .IN1(mem[45]), .IN2(n138), .IN3(mem[61]), .IN4(n143), .Q(n114)
         );
  AO22X1 U127 ( .IN1(mem[44]), .IN2(n138), .IN3(mem[60]), .IN4(n144), .Q(n110)
         );
  AO22X1 U128 ( .IN1(mem[47]), .IN2(n138), .IN3(mem[63]), .IN4(n144), .Q(n124)
         );
  NOR2X0 U129 ( .IN1(n5), .IN2(n130), .QN(n122) );
  AO22X1 U130 ( .IN1(mem[32]), .IN2(n6), .IN3(mem[48]), .IN4(n139), .Q(n93) );
  AO221X1 U131 ( .IN1(mem[16]), .IN2(n134), .IN3(mem[0]), .IN4(n137), .IN5(n93), .Q(n96) );
  AO22X1 U132 ( .IN1(mem[40]), .IN2(n6), .IN3(mem[56]), .IN4(n139), .Q(n94) );
  AO221X1 U133 ( .IN1(mem[24]), .IN2(n133), .IN3(mem[8]), .IN4(n137), .IN5(n94), .Q(n95) );
  AO22X1 U134 ( .IN1(n96), .IN2(n141), .IN3(n95), .IN4(n132), .Q(rdata[0]) );
  AO221X1 U135 ( .IN1(mem[17]), .IN2(n134), .IN3(mem[1]), .IN4(n137), .IN5(n97), .Q(n100) );
  AO22X1 U136 ( .IN1(mem[41]), .IN2(n6), .IN3(mem[57]), .IN4(n144), .Q(n98) );
  AO221X1 U137 ( .IN1(mem[25]), .IN2(n133), .IN3(mem[9]), .IN4(n137), .IN5(n98), .Q(n99) );
  AO22X1 U138 ( .IN1(n100), .IN2(n141), .IN3(n99), .IN4(n132), .Q(rdata[1]) );
  AO22X1 U139 ( .IN1(mem[34]), .IN2(n6), .IN3(mem[50]), .IN4(n140), .Q(n101)
         );
  AO221X1 U140 ( .IN1(mem[18]), .IN2(n134), .IN3(mem[2]), .IN4(n137), .IN5(
        n101), .Q(n104) );
  AO22X1 U141 ( .IN1(mem[42]), .IN2(n6), .IN3(mem[58]), .IN4(n143), .Q(n102)
         );
  AO221X1 U142 ( .IN1(mem[26]), .IN2(n133), .IN3(mem[10]), .IN4(n137), .IN5(
        n102), .Q(n103) );
  AO22X1 U143 ( .IN1(n104), .IN2(n141), .IN3(n103), .IN4(n132), .Q(rdata[2])
         );
  AO22X1 U144 ( .IN1(mem[35]), .IN2(n6), .IN3(mem[51]), .IN4(n140), .Q(n105)
         );
  AO221X1 U145 ( .IN1(mem[19]), .IN2(n134), .IN3(mem[3]), .IN4(n135), .IN5(
        n105), .Q(n108) );
  AO22X1 U146 ( .IN1(mem[43]), .IN2(n6), .IN3(mem[59]), .IN4(n139), .Q(n106)
         );
  AO221X1 U147 ( .IN1(mem[27]), .IN2(n133), .IN3(mem[11]), .IN4(n136), .IN5(
        n106), .Q(n107) );
  AO22X1 U148 ( .IN1(n108), .IN2(n141), .IN3(n107), .IN4(n132), .Q(rdata[3])
         );
  AO221X1 U149 ( .IN1(mem[20]), .IN2(n134), .IN3(mem[4]), .IN4(n135), .IN5(
        n109), .Q(n112) );
  AO221X1 U150 ( .IN1(mem[28]), .IN2(n133), .IN3(mem[12]), .IN4(n136), .IN5(
        n110), .Q(n111) );
  AO22X1 U151 ( .IN1(n112), .IN2(n141), .IN3(n111), .IN4(n132), .Q(rdata[4])
         );
  AO221X1 U152 ( .IN1(mem[21]), .IN2(n134), .IN3(mem[5]), .IN4(n135), .IN5(
        n113), .Q(n116) );
  AO221X1 U153 ( .IN1(mem[29]), .IN2(n133), .IN3(mem[13]), .IN4(n136), .IN5(
        n114), .Q(n115) );
  AO22X1 U154 ( .IN1(n116), .IN2(n141), .IN3(n115), .IN4(n132), .Q(rdata[5])
         );
  AO221X1 U155 ( .IN1(mem[22]), .IN2(n134), .IN3(mem[6]), .IN4(n135), .IN5(
        n117), .Q(n120) );
  AO221X1 U156 ( .IN1(mem[30]), .IN2(n133), .IN3(mem[14]), .IN4(n136), .IN5(
        n118), .Q(n119) );
  AO22X1 U157 ( .IN1(n120), .IN2(n141), .IN3(n119), .IN4(n132), .Q(rdata[6])
         );
  AO221X1 U158 ( .IN1(mem[23]), .IN2(n134), .IN3(mem[7]), .IN4(n135), .IN5(
        n121), .Q(n128) );
  AO221X1 U159 ( .IN1(mem[31]), .IN2(n133), .IN3(mem[15]), .IN4(n136), .IN5(
        n124), .Q(n127) );
  AO22X1 U160 ( .IN1(n141), .IN2(n128), .IN3(n127), .IN4(n132), .Q(rdata[7])
         );
  INVX0 U161 ( .INP(raddr[2]), .ZN(n129) );
  INVX0 U162 ( .INP(n129), .ZN(n130) );
  INVX0 U163 ( .INP(n5), .ZN(n131) );
  INVX0 U164 ( .INP(raddr[0]), .ZN(n132) );
  NOR2X0 U165 ( .IN1(n129), .IN2(n131), .QN(n125) );
  INVX0 U166 ( .INP(n142), .ZN(n141) );
  INVX0 U167 ( .INP(raddr[0]), .ZN(n142) );
  NOR2X0 U168 ( .IN1(n130), .IN2(n131), .QN(n123) );
  NBUFFX2 U169 ( .INP(n122), .Z(n139) );
  AO22X1 U170 ( .IN1(mem[39]), .IN2(n138), .IN3(mem[55]), .IN4(n143), .Q(n121)
         );
  AO22X1 U171 ( .IN1(mem[38]), .IN2(n138), .IN3(mem[54]), .IN4(n140), .Q(n117)
         );
  AO22X1 U172 ( .IN1(mem[37]), .IN2(n138), .IN3(mem[53]), .IN4(n143), .Q(n113)
         );
  AO22X1 U173 ( .IN1(mem[36]), .IN2(n138), .IN3(mem[52]), .IN4(n139), .Q(n109)
         );
  AO22X1 U174 ( .IN1(mem[46]), .IN2(n138), .IN3(mem[62]), .IN4(n144), .Q(n118)
         );
  INVX0 U175 ( .INP(n162), .ZN(n161) );
  INVX0 U176 ( .INP(waddr[0]), .ZN(n162) );
endmodule


module payload_ram_bank8x8_4 ( clk, we, waddr, wdata, raddr, rdata );
  input [2:0] waddr;
  input [7:0] wdata;
  input [2:0] raddr;
  output [7:0] rdata;
  input clk, we;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246,
         n247, n248, n249;
  wire   [63:0] mem;

  DFFX1 mem_reg_0__7_ ( .D(n176), .CLK(clk), .Q(mem[63]) );
  DFFX1 mem_reg_0__6_ ( .D(n177), .CLK(clk), .Q(mem[62]) );
  DFFX1 mem_reg_0__5_ ( .D(n178), .CLK(clk), .Q(mem[61]) );
  DFFX1 mem_reg_0__4_ ( .D(n179), .CLK(clk), .Q(mem[60]) );
  DFFX1 mem_reg_0__3_ ( .D(n180), .CLK(clk), .Q(mem[59]) );
  DFFX1 mem_reg_0__2_ ( .D(n181), .CLK(clk), .Q(mem[58]) );
  DFFX1 mem_reg_0__1_ ( .D(n182), .CLK(clk), .Q(mem[57]) );
  DFFX1 mem_reg_0__0_ ( .D(n183), .CLK(clk), .Q(mem[56]) );
  DFFX1 mem_reg_1__7_ ( .D(n184), .CLK(clk), .Q(mem[55]) );
  DFFX1 mem_reg_1__6_ ( .D(n185), .CLK(clk), .Q(mem[54]) );
  DFFX1 mem_reg_1__5_ ( .D(n186), .CLK(clk), .Q(mem[53]) );
  DFFX1 mem_reg_1__4_ ( .D(n187), .CLK(clk), .Q(mem[52]) );
  DFFX1 mem_reg_1__3_ ( .D(n188), .CLK(clk), .Q(mem[51]) );
  DFFX1 mem_reg_1__2_ ( .D(n189), .CLK(clk), .Q(mem[50]) );
  DFFX1 mem_reg_1__1_ ( .D(n190), .CLK(clk), .Q(mem[49]) );
  DFFX1 mem_reg_1__0_ ( .D(n191), .CLK(clk), .Q(mem[48]) );
  DFFX1 mem_reg_2__7_ ( .D(n192), .CLK(clk), .Q(mem[47]) );
  DFFX1 mem_reg_2__6_ ( .D(n193), .CLK(clk), .Q(mem[46]) );
  DFFX1 mem_reg_2__5_ ( .D(n194), .CLK(clk), .Q(mem[45]) );
  DFFX1 mem_reg_2__4_ ( .D(n195), .CLK(clk), .Q(mem[44]) );
  DFFX1 mem_reg_2__3_ ( .D(n196), .CLK(clk), .Q(mem[43]) );
  DFFX1 mem_reg_2__2_ ( .D(n197), .CLK(clk), .Q(mem[42]) );
  DFFX1 mem_reg_2__1_ ( .D(n198), .CLK(clk), .Q(mem[41]) );
  DFFX1 mem_reg_2__0_ ( .D(n199), .CLK(clk), .Q(mem[40]) );
  DFFX1 mem_reg_3__7_ ( .D(n200), .CLK(clk), .Q(mem[39]) );
  DFFX1 mem_reg_3__6_ ( .D(n201), .CLK(clk), .Q(mem[38]) );
  DFFX1 mem_reg_3__5_ ( .D(n202), .CLK(clk), .Q(mem[37]) );
  DFFX1 mem_reg_3__4_ ( .D(n203), .CLK(clk), .Q(mem[36]) );
  DFFX1 mem_reg_3__3_ ( .D(n204), .CLK(clk), .Q(mem[35]) );
  DFFX1 mem_reg_3__2_ ( .D(n205), .CLK(clk), .Q(mem[34]) );
  DFFX1 mem_reg_3__1_ ( .D(n206), .CLK(clk), .Q(mem[33]) );
  DFFX1 mem_reg_3__0_ ( .D(n207), .CLK(clk), .Q(mem[32]) );
  DFFX1 mem_reg_4__7_ ( .D(n208), .CLK(clk), .Q(mem[31]) );
  DFFX1 mem_reg_4__6_ ( .D(n209), .CLK(clk), .Q(mem[30]) );
  DFFX1 mem_reg_4__5_ ( .D(n210), .CLK(clk), .Q(mem[29]) );
  DFFX1 mem_reg_4__4_ ( .D(n211), .CLK(clk), .Q(mem[28]) );
  DFFX1 mem_reg_4__3_ ( .D(n212), .CLK(clk), .Q(mem[27]) );
  DFFX1 mem_reg_4__2_ ( .D(n213), .CLK(clk), .Q(mem[26]) );
  DFFX1 mem_reg_4__1_ ( .D(n214), .CLK(clk), .Q(mem[25]) );
  DFFX1 mem_reg_4__0_ ( .D(n215), .CLK(clk), .Q(mem[24]) );
  DFFX1 mem_reg_5__7_ ( .D(n216), .CLK(clk), .Q(mem[23]) );
  DFFX1 mem_reg_5__6_ ( .D(n217), .CLK(clk), .Q(mem[22]) );
  DFFX1 mem_reg_5__5_ ( .D(n218), .CLK(clk), .Q(mem[21]) );
  DFFX1 mem_reg_5__4_ ( .D(n219), .CLK(clk), .Q(mem[20]) );
  DFFX1 mem_reg_5__3_ ( .D(n220), .CLK(clk), .Q(mem[19]) );
  DFFX1 mem_reg_5__2_ ( .D(n221), .CLK(clk), .Q(mem[18]) );
  DFFX1 mem_reg_5__1_ ( .D(n222), .CLK(clk), .Q(mem[17]) );
  DFFX1 mem_reg_5__0_ ( .D(n223), .CLK(clk), .Q(mem[16]) );
  DFFX1 mem_reg_6__7_ ( .D(n224), .CLK(clk), .Q(mem[15]) );
  DFFX1 mem_reg_6__6_ ( .D(n225), .CLK(clk), .Q(mem[14]) );
  DFFX1 mem_reg_6__5_ ( .D(n226), .CLK(clk), .Q(mem[13]) );
  DFFX1 mem_reg_6__4_ ( .D(n227), .CLK(clk), .Q(mem[12]) );
  DFFX1 mem_reg_6__3_ ( .D(n228), .CLK(clk), .Q(mem[11]) );
  DFFX1 mem_reg_6__2_ ( .D(n229), .CLK(clk), .Q(mem[10]) );
  DFFX1 mem_reg_6__1_ ( .D(n230), .CLK(clk), .Q(mem[9]) );
  DFFX1 mem_reg_6__0_ ( .D(n231), .CLK(clk), .Q(mem[8]) );
  DFFX1 mem_reg_7__7_ ( .D(n232), .CLK(clk), .Q(mem[7]) );
  DFFX1 mem_reg_7__6_ ( .D(n233), .CLK(clk), .Q(mem[6]) );
  DFFX1 mem_reg_7__5_ ( .D(n234), .CLK(clk), .Q(mem[5]) );
  DFFX1 mem_reg_7__4_ ( .D(n235), .CLK(clk), .Q(mem[4]) );
  DFFX1 mem_reg_7__3_ ( .D(n236), .CLK(clk), .Q(mem[3]) );
  DFFX1 mem_reg_7__2_ ( .D(n237), .CLK(clk), .Q(mem[2]) );
  DFFX1 mem_reg_7__1_ ( .D(n238), .CLK(clk), .Q(mem[1]) );
  DFFX1 mem_reg_7__0_ ( .D(n239), .CLK(clk), .Q(mem[0]) );
  AO22X1 U14 ( .IN1(n99), .IN2(n4), .IN3(mem[0]), .IN4(n167), .Q(n239) );
  AO22X1 U15 ( .IN1(n97), .IN2(n4), .IN3(mem[1]), .IN4(n167), .Q(n238) );
  AO22X1 U16 ( .IN1(n95), .IN2(n4), .IN3(mem[2]), .IN4(n167), .Q(n237) );
  AO22X1 U17 ( .IN1(n93), .IN2(n4), .IN3(mem[3]), .IN4(n167), .Q(n236) );
  AO22X1 U18 ( .IN1(n91), .IN2(n4), .IN3(mem[4]), .IN4(n167), .Q(n235) );
  AO22X1 U19 ( .IN1(n89), .IN2(n4), .IN3(mem[5]), .IN4(n166), .Q(n234) );
  AO22X1 U20 ( .IN1(wdata[6]), .IN2(n4), .IN3(mem[6]), .IN4(n166), .Q(n233) );
  AO22X1 U21 ( .IN1(n87), .IN2(n4), .IN3(mem[7]), .IN4(n166), .Q(n232) );
  AO22X1 U23 ( .IN1(n3), .IN2(n99), .IN3(mem[8]), .IN4(n165), .Q(n231) );
  AO22X1 U24 ( .IN1(n3), .IN2(n97), .IN3(mem[9]), .IN4(n165), .Q(n230) );
  AO22X1 U25 ( .IN1(n3), .IN2(n95), .IN3(mem[10]), .IN4(n165), .Q(n229) );
  AO22X1 U26 ( .IN1(n3), .IN2(n93), .IN3(mem[11]), .IN4(n165), .Q(n228) );
  AO22X1 U27 ( .IN1(n3), .IN2(n91), .IN3(mem[12]), .IN4(n165), .Q(n227) );
  AO22X1 U28 ( .IN1(n3), .IN2(n89), .IN3(mem[13]), .IN4(n164), .Q(n226) );
  AO22X1 U29 ( .IN1(n3), .IN2(wdata[6]), .IN3(mem[14]), .IN4(n164), .Q(n225)
         );
  AO22X1 U30 ( .IN1(n3), .IN2(n87), .IN3(mem[15]), .IN4(n164), .Q(n224) );
  AO22X1 U32 ( .IN1(n175), .IN2(n99), .IN3(mem[16]), .IN4(n163), .Q(n223) );
  AO22X1 U33 ( .IN1(n175), .IN2(n97), .IN3(mem[17]), .IN4(n163), .Q(n222) );
  AO22X1 U34 ( .IN1(n175), .IN2(n95), .IN3(mem[18]), .IN4(n163), .Q(n221) );
  AO22X1 U35 ( .IN1(n175), .IN2(n93), .IN3(mem[19]), .IN4(n163), .Q(n220) );
  AO22X1 U36 ( .IN1(n175), .IN2(n91), .IN3(mem[20]), .IN4(n163), .Q(n219) );
  AO22X1 U37 ( .IN1(n175), .IN2(n89), .IN3(mem[21]), .IN4(n162), .Q(n218) );
  AO22X1 U38 ( .IN1(n175), .IN2(n101), .IN3(mem[22]), .IN4(n162), .Q(n217) );
  AO22X1 U39 ( .IN1(n175), .IN2(n87), .IN3(mem[23]), .IN4(n162), .Q(n216) );
  AO22X1 U41 ( .IN1(n174), .IN2(wdata[0]), .IN3(mem[24]), .IN4(n161), .Q(n215)
         );
  AO22X1 U42 ( .IN1(n174), .IN2(wdata[1]), .IN3(mem[25]), .IN4(n161), .Q(n214)
         );
  AO22X1 U43 ( .IN1(n174), .IN2(wdata[2]), .IN3(mem[26]), .IN4(n161), .Q(n213)
         );
  AO22X1 U44 ( .IN1(n174), .IN2(wdata[3]), .IN3(mem[27]), .IN4(n161), .Q(n212)
         );
  AO22X1 U45 ( .IN1(n174), .IN2(n91), .IN3(mem[28]), .IN4(n161), .Q(n211) );
  AO22X1 U46 ( .IN1(n174), .IN2(n89), .IN3(mem[29]), .IN4(n160), .Q(n210) );
  AO22X1 U47 ( .IN1(n174), .IN2(n101), .IN3(mem[30]), .IN4(n160), .Q(n209) );
  AO22X1 U48 ( .IN1(n174), .IN2(n87), .IN3(mem[31]), .IN4(n160), .Q(n208) );
  AND2X1 U50 ( .IN1(we), .IN2(waddr[2]), .Q(n248) );
  AO22X1 U51 ( .IN1(n172), .IN2(n99), .IN3(mem[32]), .IN4(n159), .Q(n207) );
  AO22X1 U52 ( .IN1(n172), .IN2(n97), .IN3(mem[33]), .IN4(n159), .Q(n206) );
  AO22X1 U53 ( .IN1(n172), .IN2(n95), .IN3(mem[34]), .IN4(n159), .Q(n205) );
  AO22X1 U54 ( .IN1(n172), .IN2(n93), .IN3(mem[35]), .IN4(n159), .Q(n204) );
  AO22X1 U55 ( .IN1(n172), .IN2(n91), .IN3(mem[36]), .IN4(n159), .Q(n203) );
  AO22X1 U56 ( .IN1(n172), .IN2(n89), .IN3(mem[37]), .IN4(n158), .Q(n202) );
  AO22X1 U57 ( .IN1(n172), .IN2(n101), .IN3(mem[38]), .IN4(n158), .Q(n201) );
  AO22X1 U58 ( .IN1(n172), .IN2(n87), .IN3(mem[39]), .IN4(n158), .Q(n200) );
  AO22X1 U60 ( .IN1(n171), .IN2(n99), .IN3(mem[40]), .IN4(n157), .Q(n199) );
  AO22X1 U61 ( .IN1(n171), .IN2(n97), .IN3(mem[41]), .IN4(n157), .Q(n198) );
  AO22X1 U62 ( .IN1(n171), .IN2(n95), .IN3(mem[42]), .IN4(n157), .Q(n197) );
  AO22X1 U63 ( .IN1(n171), .IN2(n93), .IN3(mem[43]), .IN4(n157), .Q(n196) );
  AO22X1 U64 ( .IN1(n171), .IN2(n91), .IN3(mem[44]), .IN4(n157), .Q(n195) );
  AO22X1 U65 ( .IN1(n171), .IN2(n89), .IN3(mem[45]), .IN4(n156), .Q(n194) );
  AO22X1 U66 ( .IN1(n171), .IN2(n101), .IN3(mem[46]), .IN4(n156), .Q(n193) );
  AO22X1 U67 ( .IN1(n171), .IN2(n87), .IN3(mem[47]), .IN4(n156), .Q(n192) );
  AO22X1 U69 ( .IN1(n2), .IN2(n99), .IN3(mem[48]), .IN4(n155), .Q(n191) );
  AO22X1 U70 ( .IN1(n2), .IN2(n97), .IN3(mem[49]), .IN4(n155), .Q(n190) );
  AO22X1 U71 ( .IN1(n2), .IN2(n95), .IN3(mem[50]), .IN4(n155), .Q(n189) );
  AO22X1 U72 ( .IN1(n2), .IN2(n93), .IN3(mem[51]), .IN4(n155), .Q(n188) );
  AO22X1 U73 ( .IN1(n2), .IN2(n91), .IN3(mem[52]), .IN4(n155), .Q(n187) );
  AO22X1 U74 ( .IN1(n2), .IN2(n89), .IN3(mem[53]), .IN4(n154), .Q(n186) );
  AO22X1 U75 ( .IN1(n2), .IN2(n101), .IN3(mem[54]), .IN4(n154), .Q(n185) );
  AO22X1 U76 ( .IN1(n2), .IN2(n87), .IN3(mem[55]), .IN4(n154), .Q(n184) );
  AO22X1 U78 ( .IN1(n1), .IN2(n99), .IN3(mem[56]), .IN4(n153), .Q(n183) );
  AO22X1 U79 ( .IN1(n1), .IN2(n97), .IN3(mem[57]), .IN4(n153), .Q(n182) );
  AO22X1 U80 ( .IN1(n1), .IN2(n95), .IN3(mem[58]), .IN4(n153), .Q(n181) );
  AO22X1 U81 ( .IN1(n1), .IN2(n93), .IN3(mem[59]), .IN4(n153), .Q(n180) );
  AO22X1 U82 ( .IN1(n1), .IN2(n91), .IN3(mem[60]), .IN4(n153), .Q(n179) );
  AO22X1 U83 ( .IN1(n1), .IN2(n89), .IN3(mem[61]), .IN4(n152), .Q(n178) );
  AO22X1 U84 ( .IN1(n1), .IN2(n101), .IN3(mem[62]), .IN4(n152), .Q(n177) );
  AO22X1 U85 ( .IN1(n1), .IN2(n87), .IN3(mem[63]), .IN4(n152), .Q(n176) );
  NBUFFX2 U2 ( .INP(n10), .Z(n11) );
  NBUFFX2 U3 ( .INP(n132), .Z(n147) );
  NBUFFX2 U4 ( .INP(n132), .Z(n7) );
  NBUFFX2 U5 ( .INP(n132), .Z(n8) );
  NBUFFX2 U6 ( .INP(n131), .Z(n150) );
  NBUFFX2 U7 ( .INP(n132), .Z(n146) );
  NBUFFX2 U8 ( .INP(n134), .Z(n143) );
  NBUFFX2 U9 ( .INP(n134), .Z(n144) );
  NAND3X1 U10 ( .IN1(n168), .IN2(n248), .IN3(waddr[1]), .QN(n249) );
  NAND3X1 U11 ( .IN1(n248), .IN2(n169), .IN3(waddr[1]), .QN(n247) );
  NBUFFX2 U12 ( .INP(n246), .Z(n163) );
  NBUFFX2 U13 ( .INP(n246), .Z(n162) );
  NBUFFX2 U22 ( .INP(n245), .Z(n161) );
  NBUFFX2 U31 ( .INP(n245), .Z(n160) );
  INVX0 U40 ( .INP(n169), .ZN(n168) );
  NAND3X0 U49 ( .IN1(n168), .IN2(n170), .IN3(n243), .QN(n241) );
  NBUFFX2 U59 ( .INP(n249), .Z(n166) );
  NAND3X0 U68 ( .IN1(waddr[1]), .IN2(n169), .IN3(n243), .QN(n242) );
  NAND3X0 U77 ( .IN1(n248), .IN2(n170), .IN3(n168), .QN(n246) );
  NAND3X0 U86 ( .IN1(n169), .IN2(n170), .IN3(n248), .QN(n245) );
  NAND3X0 U87 ( .IN1(waddr[1]), .IN2(n168), .IN3(n243), .QN(n244) );
  NAND3X0 U88 ( .IN1(n169), .IN2(n170), .IN3(n243), .QN(n240) );
  INVX0 U89 ( .INP(n240), .ZN(n1) );
  INVX0 U90 ( .INP(n241), .ZN(n2) );
  INVX0 U91 ( .INP(n247), .ZN(n3) );
  INVX0 U92 ( .INP(n249), .ZN(n4) );
  INVX0 U93 ( .INP(raddr[1]), .ZN(n5) );
  INVX0 U94 ( .INP(n5), .ZN(n6) );
  INVX0 U95 ( .INP(raddr[0]), .ZN(n9) );
  INVX0 U96 ( .INP(n9), .ZN(n10) );
  INVX0 U97 ( .INP(wdata[7]), .ZN(n86) );
  INVX0 U98 ( .INP(n86), .ZN(n87) );
  INVX0 U99 ( .INP(wdata[5]), .ZN(n88) );
  INVX0 U100 ( .INP(n88), .ZN(n89) );
  INVX0 U101 ( .INP(wdata[4]), .ZN(n90) );
  INVX0 U102 ( .INP(n90), .ZN(n91) );
  INVX0 U103 ( .INP(wdata[3]), .ZN(n92) );
  INVX0 U104 ( .INP(n92), .ZN(n93) );
  INVX0 U105 ( .INP(wdata[2]), .ZN(n94) );
  INVX0 U106 ( .INP(n94), .ZN(n95) );
  INVX0 U107 ( .INP(wdata[1]), .ZN(n96) );
  INVX0 U108 ( .INP(n96), .ZN(n97) );
  INVX0 U109 ( .INP(wdata[0]), .ZN(n98) );
  INVX0 U110 ( .INP(n98), .ZN(n99) );
  INVX0 U111 ( .INP(wdata[6]), .ZN(n100) );
  INVX0 U112 ( .INP(n100), .ZN(n101) );
  NBUFFX2 U113 ( .INP(n135), .Z(n142) );
  NBUFFX2 U114 ( .INP(n135), .Z(n141) );
  NBUFFX2 U115 ( .INP(n131), .Z(n151) );
  NBUFFX2 U116 ( .INP(n131), .Z(n149) );
  NBUFFX2 U117 ( .INP(n131), .Z(n148) );
  INVX0 U118 ( .INP(n160), .ZN(n174) );
  INVX0 U119 ( .INP(n162), .ZN(n175) );
  NBUFFX2 U120 ( .INP(n134), .Z(n145) );
  INVX0 U121 ( .INP(n158), .ZN(n172) );
  INVX0 U122 ( .INP(n156), .ZN(n171) );
  NBUFFX2 U123 ( .INP(n241), .Z(n154) );
  NBUFFX2 U124 ( .INP(n240), .Z(n152) );
  NBUFFX2 U125 ( .INP(n154), .Z(n155) );
  NBUFFX2 U126 ( .INP(n152), .Z(n153) );
  NBUFFX2 U127 ( .INP(n247), .Z(n164) );
  NBUFFX2 U128 ( .INP(n244), .Z(n158) );
  NBUFFX2 U129 ( .INP(n242), .Z(n156) );
  NBUFFX2 U130 ( .INP(n249), .Z(n167) );
  NBUFFX2 U131 ( .INP(n247), .Z(n165) );
  NBUFFX2 U132 ( .INP(n244), .Z(n159) );
  NBUFFX2 U133 ( .INP(n242), .Z(n157) );
  NOR2X0 U134 ( .IN1(n173), .IN2(waddr[2]), .QN(n243) );
  INVX0 U135 ( .INP(we), .ZN(n173) );
  AO22X1 U136 ( .IN1(mem[47]), .IN2(n146), .IN3(mem[63]), .IN4(n151), .Q(n133)
         );
  AO22X1 U137 ( .IN1(mem[44]), .IN2(n8), .IN3(mem[60]), .IN4(n150), .Q(n119)
         );
  AO22X1 U138 ( .IN1(mem[39]), .IN2(n147), .IN3(mem[55]), .IN4(n151), .Q(n130)
         );
  AO22X1 U139 ( .IN1(mem[36]), .IN2(n147), .IN3(mem[52]), .IN4(n150), .Q(n118)
         );
  AO22X1 U140 ( .IN1(mem[45]), .IN2(n7), .IN3(mem[61]), .IN4(n150), .Q(n123)
         );
  NOR2X0 U141 ( .IN1(n138), .IN2(n6), .QN(n135) );
  NOR2X0 U142 ( .IN1(n6), .IN2(n139), .QN(n131) );
  AO22X1 U143 ( .IN1(mem[32]), .IN2(n147), .IN3(mem[48]), .IN4(n149), .Q(n102)
         );
  AO221X1 U144 ( .IN1(mem[16]), .IN2(n142), .IN3(mem[0]), .IN4(n145), .IN5(
        n102), .Q(n105) );
  AO22X1 U145 ( .IN1(mem[40]), .IN2(n7), .IN3(mem[56]), .IN4(n149), .Q(n103)
         );
  AO221X1 U146 ( .IN1(mem[24]), .IN2(n141), .IN3(mem[8]), .IN4(n145), .IN5(
        n103), .Q(n104) );
  AO22X1 U147 ( .IN1(n105), .IN2(n11), .IN3(n104), .IN4(n140), .Q(rdata[0]) );
  AO22X1 U148 ( .IN1(mem[33]), .IN2(n8), .IN3(mem[49]), .IN4(n151), .Q(n106)
         );
  AO221X1 U149 ( .IN1(mem[17]), .IN2(n142), .IN3(mem[1]), .IN4(n145), .IN5(
        n106), .Q(n109) );
  AO22X1 U150 ( .IN1(mem[41]), .IN2(n146), .IN3(mem[57]), .IN4(n148), .Q(n107)
         );
  AO221X1 U151 ( .IN1(mem[25]), .IN2(n141), .IN3(mem[9]), .IN4(n145), .IN5(
        n107), .Q(n108) );
  AO22X1 U152 ( .IN1(n109), .IN2(n11), .IN3(n108), .IN4(n140), .Q(rdata[1]) );
  AO22X1 U153 ( .IN1(mem[34]), .IN2(n146), .IN3(mem[50]), .IN4(n148), .Q(n110)
         );
  AO221X1 U154 ( .IN1(mem[18]), .IN2(n142), .IN3(mem[2]), .IN4(n145), .IN5(
        n110), .Q(n113) );
  AO22X1 U155 ( .IN1(mem[42]), .IN2(n7), .IN3(mem[58]), .IN4(n149), .Q(n111)
         );
  AO221X1 U156 ( .IN1(mem[26]), .IN2(n141), .IN3(mem[10]), .IN4(n145), .IN5(
        n111), .Q(n112) );
  AO22X1 U157 ( .IN1(n113), .IN2(n11), .IN3(n112), .IN4(n140), .Q(rdata[2]) );
  AO22X1 U158 ( .IN1(mem[35]), .IN2(n7), .IN3(mem[51]), .IN4(n149), .Q(n114)
         );
  AO221X1 U159 ( .IN1(mem[19]), .IN2(n142), .IN3(mem[3]), .IN4(n143), .IN5(
        n114), .Q(n117) );
  AO22X1 U160 ( .IN1(mem[43]), .IN2(n8), .IN3(mem[59]), .IN4(n150), .Q(n115)
         );
  AO221X1 U161 ( .IN1(mem[27]), .IN2(n141), .IN3(mem[11]), .IN4(n144), .IN5(
        n115), .Q(n116) );
  AO22X1 U162 ( .IN1(n117), .IN2(n11), .IN3(n116), .IN4(n140), .Q(rdata[3]) );
  AO221X1 U163 ( .IN1(mem[20]), .IN2(n142), .IN3(mem[4]), .IN4(n143), .IN5(
        n118), .Q(n121) );
  AO221X1 U164 ( .IN1(mem[28]), .IN2(n141), .IN3(mem[12]), .IN4(n144), .IN5(
        n119), .Q(n120) );
  AO22X1 U165 ( .IN1(n121), .IN2(n11), .IN3(n120), .IN4(n140), .Q(rdata[4]) );
  AO22X1 U166 ( .IN1(mem[37]), .IN2(n8), .IN3(mem[53]), .IN4(n148), .Q(n122)
         );
  AO221X1 U167 ( .IN1(mem[21]), .IN2(n142), .IN3(mem[5]), .IN4(n143), .IN5(
        n122), .Q(n125) );
  AO221X1 U168 ( .IN1(mem[29]), .IN2(n141), .IN3(mem[13]), .IN4(n144), .IN5(
        n123), .Q(n124) );
  AO22X1 U169 ( .IN1(n125), .IN2(n11), .IN3(n124), .IN4(n140), .Q(rdata[5]) );
  AO22X1 U170 ( .IN1(mem[38]), .IN2(n147), .IN3(mem[54]), .IN4(n151), .Q(n126)
         );
  AO221X1 U171 ( .IN1(mem[22]), .IN2(n142), .IN3(mem[6]), .IN4(n143), .IN5(
        n126), .Q(n129) );
  AO221X1 U172 ( .IN1(mem[30]), .IN2(n141), .IN3(mem[14]), .IN4(n144), .IN5(
        n127), .Q(n128) );
  AO22X1 U173 ( .IN1(n129), .IN2(n11), .IN3(n128), .IN4(n140), .Q(rdata[6]) );
  AO221X1 U174 ( .IN1(mem[23]), .IN2(n142), .IN3(mem[7]), .IN4(n143), .IN5(
        n130), .Q(n137) );
  AO221X1 U175 ( .IN1(mem[31]), .IN2(n141), .IN3(mem[15]), .IN4(n144), .IN5(
        n133), .Q(n136) );
  AO22X1 U176 ( .IN1(n11), .IN2(n137), .IN3(n136), .IN4(n140), .Q(rdata[7]) );
  INVX0 U177 ( .INP(raddr[2]), .ZN(n138) );
  INVX0 U178 ( .INP(n138), .ZN(n139) );
  INVX0 U179 ( .INP(n10), .ZN(n140) );
  NOR2X0 U180 ( .IN1(n138), .IN2(n5), .QN(n134) );
  NOR2X0 U181 ( .IN1(n5), .IN2(n139), .QN(n132) );
  AO22X1 U182 ( .IN1(mem[46]), .IN2(n146), .IN3(mem[62]), .IN4(n148), .Q(n127)
         );
  INVX0 U183 ( .INP(waddr[0]), .ZN(n169) );
  INVX0 U184 ( .INP(waddr[1]), .ZN(n170) );
endmodule


module payload_ram_bank8x8_3 ( clk, we, waddr, wdata, raddr, rdata );
  input [2:0] waddr;
  input [7:0] wdata;
  input [2:0] raddr;
  output [7:0] rdata;
  input clk, we;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236;
  wire   [63:0] mem;

  DFFX1 mem_reg_0__7_ ( .D(n163), .CLK(clk), .Q(mem[63]) );
  DFFX1 mem_reg_0__6_ ( .D(n164), .CLK(clk), .Q(mem[62]) );
  DFFX1 mem_reg_0__5_ ( .D(n165), .CLK(clk), .Q(mem[61]) );
  DFFX1 mem_reg_0__4_ ( .D(n166), .CLK(clk), .Q(mem[60]) );
  DFFX1 mem_reg_0__3_ ( .D(n167), .CLK(clk), .Q(mem[59]) );
  DFFX1 mem_reg_0__2_ ( .D(n168), .CLK(clk), .Q(mem[58]) );
  DFFX1 mem_reg_0__1_ ( .D(n169), .CLK(clk), .Q(mem[57]) );
  DFFX1 mem_reg_0__0_ ( .D(n170), .CLK(clk), .Q(mem[56]) );
  DFFX1 mem_reg_1__7_ ( .D(n171), .CLK(clk), .Q(mem[55]) );
  DFFX1 mem_reg_1__6_ ( .D(n172), .CLK(clk), .Q(mem[54]) );
  DFFX1 mem_reg_1__5_ ( .D(n173), .CLK(clk), .Q(mem[53]) );
  DFFX1 mem_reg_1__4_ ( .D(n174), .CLK(clk), .Q(mem[52]) );
  DFFX1 mem_reg_1__3_ ( .D(n175), .CLK(clk), .Q(mem[51]) );
  DFFX1 mem_reg_1__2_ ( .D(n176), .CLK(clk), .Q(mem[50]) );
  DFFX1 mem_reg_1__1_ ( .D(n177), .CLK(clk), .Q(mem[49]) );
  DFFX1 mem_reg_1__0_ ( .D(n178), .CLK(clk), .Q(mem[48]) );
  DFFX1 mem_reg_2__7_ ( .D(n179), .CLK(clk), .Q(mem[47]) );
  DFFX1 mem_reg_2__6_ ( .D(n180), .CLK(clk), .Q(mem[46]) );
  DFFX1 mem_reg_2__5_ ( .D(n181), .CLK(clk), .Q(mem[45]) );
  DFFX1 mem_reg_2__4_ ( .D(n182), .CLK(clk), .Q(mem[44]) );
  DFFX1 mem_reg_2__3_ ( .D(n183), .CLK(clk), .Q(mem[43]) );
  DFFX1 mem_reg_2__2_ ( .D(n184), .CLK(clk), .Q(mem[42]) );
  DFFX1 mem_reg_2__1_ ( .D(n185), .CLK(clk), .Q(mem[41]) );
  DFFX1 mem_reg_2__0_ ( .D(n186), .CLK(clk), .Q(mem[40]) );
  DFFX1 mem_reg_3__7_ ( .D(n187), .CLK(clk), .Q(mem[39]) );
  DFFX1 mem_reg_3__6_ ( .D(n188), .CLK(clk), .Q(mem[38]) );
  DFFX1 mem_reg_3__5_ ( .D(n189), .CLK(clk), .Q(mem[37]) );
  DFFX1 mem_reg_3__4_ ( .D(n190), .CLK(clk), .Q(mem[36]) );
  DFFX1 mem_reg_3__3_ ( .D(n191), .CLK(clk), .Q(mem[35]) );
  DFFX1 mem_reg_3__2_ ( .D(n192), .CLK(clk), .Q(mem[34]) );
  DFFX1 mem_reg_3__1_ ( .D(n193), .CLK(clk), .Q(mem[33]) );
  DFFX1 mem_reg_3__0_ ( .D(n194), .CLK(clk), .Q(mem[32]) );
  DFFX1 mem_reg_4__7_ ( .D(n195), .CLK(clk), .Q(mem[31]) );
  DFFX1 mem_reg_4__6_ ( .D(n196), .CLK(clk), .Q(mem[30]) );
  DFFX1 mem_reg_4__5_ ( .D(n197), .CLK(clk), .Q(mem[29]) );
  DFFX1 mem_reg_4__4_ ( .D(n198), .CLK(clk), .Q(mem[28]) );
  DFFX1 mem_reg_4__3_ ( .D(n199), .CLK(clk), .Q(mem[27]) );
  DFFX1 mem_reg_4__2_ ( .D(n200), .CLK(clk), .Q(mem[26]) );
  DFFX1 mem_reg_4__1_ ( .D(n201), .CLK(clk), .Q(mem[25]) );
  DFFX1 mem_reg_4__0_ ( .D(n202), .CLK(clk), .Q(mem[24]) );
  DFFX1 mem_reg_5__7_ ( .D(n203), .CLK(clk), .Q(mem[23]) );
  DFFX1 mem_reg_5__6_ ( .D(n204), .CLK(clk), .Q(mem[22]) );
  DFFX1 mem_reg_5__5_ ( .D(n205), .CLK(clk), .Q(mem[21]) );
  DFFX1 mem_reg_5__4_ ( .D(n206), .CLK(clk), .Q(mem[20]) );
  DFFX1 mem_reg_5__3_ ( .D(n207), .CLK(clk), .Q(mem[19]) );
  DFFX1 mem_reg_5__2_ ( .D(n208), .CLK(clk), .Q(mem[18]) );
  DFFX1 mem_reg_5__1_ ( .D(n209), .CLK(clk), .Q(mem[17]) );
  DFFX1 mem_reg_5__0_ ( .D(n210), .CLK(clk), .Q(mem[16]) );
  DFFX1 mem_reg_6__7_ ( .D(n211), .CLK(clk), .Q(mem[15]) );
  DFFX1 mem_reg_6__6_ ( .D(n212), .CLK(clk), .Q(mem[14]) );
  DFFX1 mem_reg_6__5_ ( .D(n213), .CLK(clk), .Q(mem[13]) );
  DFFX1 mem_reg_6__4_ ( .D(n214), .CLK(clk), .Q(mem[12]) );
  DFFX1 mem_reg_6__3_ ( .D(n215), .CLK(clk), .Q(mem[11]) );
  DFFX1 mem_reg_6__2_ ( .D(n216), .CLK(clk), .Q(mem[10]) );
  DFFX1 mem_reg_6__1_ ( .D(n217), .CLK(clk), .Q(mem[9]) );
  DFFX1 mem_reg_6__0_ ( .D(n218), .CLK(clk), .Q(mem[8]) );
  DFFX1 mem_reg_7__7_ ( .D(n219), .CLK(clk), .Q(mem[7]) );
  DFFX1 mem_reg_7__6_ ( .D(n220), .CLK(clk), .Q(mem[6]) );
  DFFX1 mem_reg_7__5_ ( .D(n221), .CLK(clk), .Q(mem[5]) );
  DFFX1 mem_reg_7__4_ ( .D(n222), .CLK(clk), .Q(mem[4]) );
  DFFX1 mem_reg_7__3_ ( .D(n223), .CLK(clk), .Q(mem[3]) );
  DFFX1 mem_reg_7__2_ ( .D(n224), .CLK(clk), .Q(mem[2]) );
  DFFX1 mem_reg_7__1_ ( .D(n225), .CLK(clk), .Q(mem[1]) );
  DFFX1 mem_reg_7__0_ ( .D(n226), .CLK(clk), .Q(mem[0]) );
  AO22X1 U14 ( .IN1(wdata[0]), .IN2(n162), .IN3(mem[0]), .IN4(n150), .Q(n226)
         );
  AO22X1 U15 ( .IN1(wdata[1]), .IN2(n162), .IN3(mem[1]), .IN4(n150), .Q(n225)
         );
  AO22X1 U16 ( .IN1(wdata[2]), .IN2(n162), .IN3(mem[2]), .IN4(n150), .Q(n224)
         );
  AO22X1 U17 ( .IN1(wdata[3]), .IN2(n162), .IN3(mem[3]), .IN4(n150), .Q(n223)
         );
  AO22X1 U18 ( .IN1(wdata[4]), .IN2(n162), .IN3(mem[4]), .IN4(n150), .Q(n222)
         );
  AO22X1 U19 ( .IN1(wdata[5]), .IN2(n162), .IN3(mem[5]), .IN4(n149), .Q(n221)
         );
  AO22X1 U20 ( .IN1(wdata[6]), .IN2(n162), .IN3(mem[6]), .IN4(n149), .Q(n220)
         );
  AO22X1 U21 ( .IN1(wdata[7]), .IN2(n162), .IN3(mem[7]), .IN4(n149), .Q(n219)
         );
  AO22X1 U23 ( .IN1(n161), .IN2(n10), .IN3(mem[8]), .IN4(n148), .Q(n218) );
  AO22X1 U24 ( .IN1(n161), .IN2(wdata[1]), .IN3(mem[9]), .IN4(n148), .Q(n217)
         );
  AO22X1 U25 ( .IN1(n161), .IN2(n9), .IN3(mem[10]), .IN4(n148), .Q(n216) );
  AO22X1 U26 ( .IN1(n161), .IN2(wdata[3]), .IN3(mem[11]), .IN4(n148), .Q(n215)
         );
  AO22X1 U27 ( .IN1(n161), .IN2(wdata[4]), .IN3(mem[12]), .IN4(n148), .Q(n214)
         );
  AO22X1 U28 ( .IN1(n161), .IN2(n4), .IN3(mem[13]), .IN4(n147), .Q(n213) );
  AO22X1 U29 ( .IN1(n161), .IN2(n8), .IN3(mem[14]), .IN4(n147), .Q(n212) );
  AO22X1 U30 ( .IN1(n161), .IN2(n3), .IN3(mem[15]), .IN4(n147), .Q(n211) );
  AO22X1 U32 ( .IN1(n160), .IN2(n10), .IN3(mem[16]), .IN4(n146), .Q(n210) );
  AO22X1 U33 ( .IN1(n160), .IN2(n6), .IN3(mem[17]), .IN4(n146), .Q(n209) );
  AO22X1 U34 ( .IN1(n160), .IN2(n9), .IN3(mem[18]), .IN4(n146), .Q(n208) );
  AO22X1 U35 ( .IN1(n160), .IN2(n5), .IN3(mem[19]), .IN4(n146), .Q(n207) );
  AO22X1 U36 ( .IN1(n160), .IN2(n7), .IN3(mem[20]), .IN4(n146), .Q(n206) );
  AO22X1 U37 ( .IN1(n160), .IN2(n4), .IN3(mem[21]), .IN4(n145), .Q(n205) );
  AO22X1 U38 ( .IN1(n160), .IN2(n8), .IN3(mem[22]), .IN4(n145), .Q(n204) );
  AO22X1 U39 ( .IN1(n160), .IN2(n3), .IN3(mem[23]), .IN4(n145), .Q(n203) );
  AO22X1 U41 ( .IN1(n159), .IN2(n10), .IN3(mem[24]), .IN4(n144), .Q(n202) );
  AO22X1 U42 ( .IN1(n159), .IN2(n6), .IN3(mem[25]), .IN4(n144), .Q(n201) );
  AO22X1 U43 ( .IN1(n159), .IN2(n9), .IN3(mem[26]), .IN4(n144), .Q(n200) );
  AO22X1 U44 ( .IN1(n159), .IN2(n5), .IN3(mem[27]), .IN4(n144), .Q(n199) );
  AO22X1 U45 ( .IN1(n159), .IN2(n7), .IN3(mem[28]), .IN4(n144), .Q(n198) );
  AO22X1 U46 ( .IN1(n159), .IN2(n4), .IN3(mem[29]), .IN4(n143), .Q(n197) );
  AO22X1 U47 ( .IN1(n159), .IN2(n8), .IN3(mem[30]), .IN4(n143), .Q(n196) );
  AO22X1 U48 ( .IN1(n159), .IN2(n3), .IN3(mem[31]), .IN4(n143), .Q(n195) );
  AND2X1 U50 ( .IN1(we), .IN2(waddr[2]), .Q(n235) );
  AO22X1 U51 ( .IN1(n157), .IN2(n10), .IN3(mem[32]), .IN4(n142), .Q(n194) );
  AO22X1 U52 ( .IN1(n157), .IN2(n6), .IN3(mem[33]), .IN4(n142), .Q(n193) );
  AO22X1 U53 ( .IN1(n157), .IN2(n9), .IN3(mem[34]), .IN4(n142), .Q(n192) );
  AO22X1 U54 ( .IN1(n157), .IN2(n5), .IN3(mem[35]), .IN4(n142), .Q(n191) );
  AO22X1 U55 ( .IN1(n157), .IN2(n7), .IN3(mem[36]), .IN4(n142), .Q(n190) );
  AO22X1 U56 ( .IN1(n157), .IN2(n4), .IN3(mem[37]), .IN4(n141), .Q(n189) );
  AO22X1 U57 ( .IN1(n157), .IN2(n8), .IN3(mem[38]), .IN4(n141), .Q(n188) );
  AO22X1 U58 ( .IN1(n157), .IN2(n3), .IN3(mem[39]), .IN4(n141), .Q(n187) );
  AO22X1 U60 ( .IN1(n156), .IN2(n10), .IN3(mem[40]), .IN4(n140), .Q(n186) );
  AO22X1 U61 ( .IN1(n156), .IN2(n6), .IN3(mem[41]), .IN4(n140), .Q(n185) );
  AO22X1 U62 ( .IN1(n156), .IN2(n9), .IN3(mem[42]), .IN4(n140), .Q(n184) );
  AO22X1 U63 ( .IN1(n156), .IN2(n5), .IN3(mem[43]), .IN4(n140), .Q(n183) );
  AO22X1 U64 ( .IN1(n156), .IN2(n7), .IN3(mem[44]), .IN4(n140), .Q(n182) );
  AO22X1 U65 ( .IN1(n156), .IN2(n4), .IN3(mem[45]), .IN4(n139), .Q(n181) );
  AO22X1 U66 ( .IN1(n156), .IN2(n8), .IN3(mem[46]), .IN4(n139), .Q(n180) );
  AO22X1 U67 ( .IN1(n156), .IN2(n3), .IN3(mem[47]), .IN4(n139), .Q(n179) );
  AO22X1 U69 ( .IN1(n155), .IN2(n10), .IN3(mem[48]), .IN4(n138), .Q(n178) );
  AO22X1 U70 ( .IN1(n155), .IN2(n6), .IN3(mem[49]), .IN4(n138), .Q(n177) );
  AO22X1 U71 ( .IN1(n155), .IN2(n9), .IN3(mem[50]), .IN4(n138), .Q(n176) );
  AO22X1 U72 ( .IN1(n155), .IN2(n5), .IN3(mem[51]), .IN4(n138), .Q(n175) );
  AO22X1 U73 ( .IN1(n155), .IN2(n7), .IN3(mem[52]), .IN4(n138), .Q(n174) );
  AO22X1 U74 ( .IN1(n155), .IN2(wdata[5]), .IN3(mem[53]), .IN4(n137), .Q(n173)
         );
  AO22X1 U75 ( .IN1(n155), .IN2(wdata[6]), .IN3(mem[54]), .IN4(n137), .Q(n172)
         );
  AO22X1 U76 ( .IN1(n155), .IN2(wdata[7]), .IN3(mem[55]), .IN4(n137), .Q(n171)
         );
  AO22X1 U78 ( .IN1(n154), .IN2(n10), .IN3(mem[56]), .IN4(n136), .Q(n170) );
  AO22X1 U79 ( .IN1(n154), .IN2(n6), .IN3(mem[57]), .IN4(n136), .Q(n169) );
  AO22X1 U80 ( .IN1(n154), .IN2(n9), .IN3(mem[58]), .IN4(n136), .Q(n168) );
  AO22X1 U81 ( .IN1(n154), .IN2(n5), .IN3(mem[59]), .IN4(n136), .Q(n167) );
  AO22X1 U82 ( .IN1(n154), .IN2(n7), .IN3(mem[60]), .IN4(n136), .Q(n166) );
  AO22X1 U83 ( .IN1(n154), .IN2(n4), .IN3(mem[61]), .IN4(n135), .Q(n165) );
  AO22X1 U84 ( .IN1(n154), .IN2(n8), .IN3(mem[62]), .IN4(n135), .Q(n164) );
  AO22X1 U85 ( .IN1(n154), .IN2(n3), .IN3(mem[63]), .IN4(n135), .Q(n163) );
  AO22X1 U2 ( .IN1(n89), .IN2(n11), .IN3(n88), .IN4(n125), .Q(rdata[0]) );
  NBUFFX2 U3 ( .INP(n116), .Z(n132) );
  NBUFFX2 U4 ( .INP(n118), .Z(n128) );
  NBUFFX2 U5 ( .INP(n116), .Z(n131) );
  NBUFFX2 U6 ( .INP(n118), .Z(n129) );
  NAND3X0 U7 ( .IN1(n151), .IN2(n153), .IN3(n230), .QN(n228) );
  NBUFFX2 U8 ( .INP(n234), .Z(n148) );
  NBUFFX2 U9 ( .INP(n234), .Z(n147) );
  NBUFFX2 U10 ( .INP(n232), .Z(n144) );
  NBUFFX2 U11 ( .INP(n232), .Z(n143) );
  NBUFFX2 U12 ( .INP(n229), .Z(n140) );
  NBUFFX2 U13 ( .INP(n229), .Z(n139) );
  NBUFFX2 U22 ( .INP(n228), .Z(n137) );
  NBUFFX2 U31 ( .INP(n227), .Z(n136) );
  NBUFFX2 U40 ( .INP(n227), .Z(n135) );
  NAND3X1 U49 ( .IN1(waddr[1]), .IN2(n152), .IN3(n230), .QN(n229) );
  NBUFFX2 U59 ( .INP(n228), .Z(n138) );
  NAND3X0 U68 ( .IN1(waddr[1]), .IN2(n151), .IN3(n230), .QN(n231) );
  NAND3X0 U77 ( .IN1(n152), .IN2(n153), .IN3(n230), .QN(n227) );
  NAND3X0 U86 ( .IN1(n152), .IN2(n153), .IN3(n235), .QN(n232) );
  NAND3X0 U87 ( .IN1(n151), .IN2(n235), .IN3(waddr[1]), .QN(n236) );
  NAND3X0 U88 ( .IN1(n235), .IN2(n153), .IN3(n151), .QN(n233) );
  NBUFFX2 U89 ( .INP(n11), .Z(n1) );
  INVX0 U90 ( .INP(n11), .ZN(n2) );
  NBUFFX2 U91 ( .INP(wdata[7]), .Z(n3) );
  NBUFFX2 U92 ( .INP(wdata[5]), .Z(n4) );
  NBUFFX2 U93 ( .INP(wdata[3]), .Z(n5) );
  NBUFFX2 U94 ( .INP(wdata[1]), .Z(n6) );
  NBUFFX2 U95 ( .INP(wdata[4]), .Z(n7) );
  NBUFFX2 U96 ( .INP(wdata[6]), .Z(n8) );
  NBUFFX2 U97 ( .INP(wdata[2]), .Z(n9) );
  NBUFFX2 U98 ( .INP(wdata[0]), .Z(n10) );
  INVX0 U99 ( .INP(n125), .ZN(n11) );
  NBUFFX2 U100 ( .INP(n118), .Z(n130) );
  NBUFFX2 U101 ( .INP(n119), .Z(n127) );
  NBUFFX2 U102 ( .INP(n119), .Z(n126) );
  NAND3X1 U103 ( .IN1(n235), .IN2(n152), .IN3(waddr[1]), .QN(n234) );
  INVX0 U104 ( .INP(n143), .ZN(n159) );
  INVX0 U105 ( .INP(n145), .ZN(n160) );
  INVX0 U106 ( .INP(n137), .ZN(n155) );
  INVX0 U107 ( .INP(n135), .ZN(n154) );
  INVX0 U108 ( .INP(n149), .ZN(n162) );
  INVX0 U109 ( .INP(n141), .ZN(n157) );
  INVX0 U110 ( .INP(n139), .ZN(n156) );
  INVX0 U111 ( .INP(n147), .ZN(n161) );
  NBUFFX2 U112 ( .INP(n233), .Z(n145) );
  NBUFFX2 U113 ( .INP(n233), .Z(n146) );
  NBUFFX2 U114 ( .INP(n115), .Z(n134) );
  NBUFFX2 U115 ( .INP(n115), .Z(n133) );
  NBUFFX2 U116 ( .INP(n236), .Z(n149) );
  NBUFFX2 U117 ( .INP(n231), .Z(n141) );
  NBUFFX2 U118 ( .INP(n236), .Z(n150) );
  NBUFFX2 U119 ( .INP(n231), .Z(n142) );
  NOR2X0 U120 ( .IN1(n158), .IN2(waddr[2]), .QN(n230) );
  INVX0 U121 ( .INP(we), .ZN(n158) );
  NOR2X0 U122 ( .IN1(n122), .IN2(raddr[1]), .QN(n119) );
  NOR2X0 U123 ( .IN1(raddr[1]), .IN2(n123), .QN(n115) );
  AO22X1 U124 ( .IN1(mem[32]), .IN2(n132), .IN3(mem[48]), .IN4(n134), .Q(n86)
         );
  AO221X1 U125 ( .IN1(mem[16]), .IN2(n127), .IN3(mem[0]), .IN4(n130), .IN5(n86), .Q(n89) );
  AO22X1 U126 ( .IN1(mem[40]), .IN2(n132), .IN3(mem[56]), .IN4(n133), .Q(n87)
         );
  AO221X1 U127 ( .IN1(mem[24]), .IN2(n126), .IN3(mem[8]), .IN4(n130), .IN5(n87), .Q(n88) );
  AO22X1 U128 ( .IN1(mem[33]), .IN2(n132), .IN3(mem[49]), .IN4(n134), .Q(n90)
         );
  AO221X1 U129 ( .IN1(mem[17]), .IN2(n127), .IN3(mem[1]), .IN4(n130), .IN5(n90), .Q(n93) );
  AO22X1 U130 ( .IN1(mem[41]), .IN2(n132), .IN3(mem[57]), .IN4(n133), .Q(n91)
         );
  AO221X1 U131 ( .IN1(mem[25]), .IN2(n126), .IN3(mem[9]), .IN4(n130), .IN5(n91), .Q(n92) );
  AO22X1 U132 ( .IN1(n93), .IN2(n11), .IN3(n92), .IN4(n125), .Q(rdata[1]) );
  AO22X1 U133 ( .IN1(mem[34]), .IN2(n132), .IN3(mem[50]), .IN4(n134), .Q(n94)
         );
  AO221X1 U134 ( .IN1(mem[18]), .IN2(n127), .IN3(mem[2]), .IN4(n130), .IN5(n94), .Q(n97) );
  AO22X1 U135 ( .IN1(mem[42]), .IN2(n132), .IN3(mem[58]), .IN4(n133), .Q(n95)
         );
  AO221X1 U136 ( .IN1(mem[26]), .IN2(n126), .IN3(mem[10]), .IN4(n130), .IN5(
        n95), .Q(n96) );
  AO22X1 U137 ( .IN1(n97), .IN2(n1), .IN3(n96), .IN4(n125), .Q(rdata[2]) );
  AO22X1 U138 ( .IN1(mem[35]), .IN2(n132), .IN3(mem[51]), .IN4(n134), .Q(n98)
         );
  AO221X1 U139 ( .IN1(mem[19]), .IN2(n127), .IN3(mem[3]), .IN4(n128), .IN5(n98), .Q(n101) );
  AO22X1 U140 ( .IN1(mem[43]), .IN2(n132), .IN3(mem[59]), .IN4(n133), .Q(n99)
         );
  AO221X1 U141 ( .IN1(mem[27]), .IN2(n126), .IN3(mem[11]), .IN4(n129), .IN5(
        n99), .Q(n100) );
  AO22X1 U142 ( .IN1(n101), .IN2(n1), .IN3(n100), .IN4(n125), .Q(rdata[3]) );
  AO22X1 U143 ( .IN1(mem[36]), .IN2(n131), .IN3(mem[52]), .IN4(n134), .Q(n102)
         );
  AO221X1 U144 ( .IN1(mem[20]), .IN2(n127), .IN3(mem[4]), .IN4(n128), .IN5(
        n102), .Q(n105) );
  AO22X1 U145 ( .IN1(mem[44]), .IN2(n131), .IN3(mem[60]), .IN4(n133), .Q(n103)
         );
  AO221X1 U146 ( .IN1(mem[28]), .IN2(n126), .IN3(mem[12]), .IN4(n129), .IN5(
        n103), .Q(n104) );
  AO22X1 U147 ( .IN1(n105), .IN2(raddr[0]), .IN3(n104), .IN4(n2), .Q(rdata[4])
         );
  AO22X1 U148 ( .IN1(mem[37]), .IN2(n131), .IN3(mem[53]), .IN4(n134), .Q(n106)
         );
  AO221X1 U149 ( .IN1(mem[21]), .IN2(n127), .IN3(mem[5]), .IN4(n128), .IN5(
        n106), .Q(n109) );
  AO22X1 U150 ( .IN1(mem[45]), .IN2(n131), .IN3(mem[61]), .IN4(n133), .Q(n107)
         );
  AO221X1 U151 ( .IN1(mem[29]), .IN2(n126), .IN3(mem[13]), .IN4(n129), .IN5(
        n107), .Q(n108) );
  AO22X1 U152 ( .IN1(n109), .IN2(raddr[0]), .IN3(n108), .IN4(n2), .Q(rdata[5])
         );
  AO22X1 U153 ( .IN1(mem[38]), .IN2(n131), .IN3(mem[54]), .IN4(n134), .Q(n110)
         );
  AO221X1 U154 ( .IN1(mem[22]), .IN2(n127), .IN3(mem[6]), .IN4(n128), .IN5(
        n110), .Q(n113) );
  AO22X1 U155 ( .IN1(mem[46]), .IN2(n131), .IN3(mem[62]), .IN4(n133), .Q(n111)
         );
  AO221X1 U156 ( .IN1(mem[30]), .IN2(n126), .IN3(mem[14]), .IN4(n129), .IN5(
        n111), .Q(n112) );
  AO22X1 U157 ( .IN1(n113), .IN2(n1), .IN3(n112), .IN4(n2), .Q(rdata[6]) );
  AO22X1 U158 ( .IN1(mem[39]), .IN2(n131), .IN3(mem[55]), .IN4(n134), .Q(n114)
         );
  AO221X1 U159 ( .IN1(mem[23]), .IN2(n127), .IN3(mem[7]), .IN4(n128), .IN5(
        n114), .Q(n121) );
  AO22X1 U160 ( .IN1(mem[47]), .IN2(n131), .IN3(mem[63]), .IN4(n133), .Q(n117)
         );
  AO221X1 U161 ( .IN1(mem[31]), .IN2(n126), .IN3(mem[15]), .IN4(n129), .IN5(
        n117), .Q(n120) );
  AO22X1 U162 ( .IN1(n1), .IN2(n121), .IN3(n120), .IN4(n2), .Q(rdata[7]) );
  INVX0 U163 ( .INP(raddr[2]), .ZN(n122) );
  INVX0 U164 ( .INP(n122), .ZN(n123) );
  INVX0 U165 ( .INP(raddr[1]), .ZN(n124) );
  INVX0 U166 ( .INP(raddr[0]), .ZN(n125) );
  NOR2X0 U167 ( .IN1(n122), .IN2(n124), .QN(n118) );
  NOR2X0 U168 ( .IN1(n124), .IN2(n123), .QN(n116) );
  INVX0 U169 ( .INP(n152), .ZN(n151) );
  INVX0 U170 ( .INP(waddr[0]), .ZN(n152) );
  INVX0 U171 ( .INP(waddr[1]), .ZN(n153) );
endmodule


module payload_ram_bank8x8_2 ( clk, we, waddr, wdata, raddr, rdata );
  input [2:0] waddr;
  input [7:0] wdata;
  input [2:0] raddr;
  output [7:0] rdata;
  input clk, we;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240;
  wire   [63:0] mem;

  DFFX1 mem_reg_0__7_ ( .D(n167), .CLK(clk), .Q(mem[63]) );
  DFFX1 mem_reg_0__6_ ( .D(n168), .CLK(clk), .Q(mem[62]) );
  DFFX1 mem_reg_0__5_ ( .D(n169), .CLK(clk), .Q(mem[61]) );
  DFFX1 mem_reg_0__4_ ( .D(n170), .CLK(clk), .Q(mem[60]) );
  DFFX1 mem_reg_0__3_ ( .D(n171), .CLK(clk), .Q(mem[59]) );
  DFFX1 mem_reg_0__2_ ( .D(n172), .CLK(clk), .Q(mem[58]) );
  DFFX1 mem_reg_0__1_ ( .D(n173), .CLK(clk), .Q(mem[57]) );
  DFFX1 mem_reg_0__0_ ( .D(n174), .CLK(clk), .Q(mem[56]) );
  DFFX1 mem_reg_1__7_ ( .D(n175), .CLK(clk), .Q(mem[55]) );
  DFFX1 mem_reg_1__6_ ( .D(n176), .CLK(clk), .Q(mem[54]) );
  DFFX1 mem_reg_1__5_ ( .D(n177), .CLK(clk), .Q(mem[53]) );
  DFFX1 mem_reg_1__4_ ( .D(n178), .CLK(clk), .Q(mem[52]) );
  DFFX1 mem_reg_1__3_ ( .D(n179), .CLK(clk), .Q(mem[51]) );
  DFFX1 mem_reg_1__2_ ( .D(n180), .CLK(clk), .Q(mem[50]) );
  DFFX1 mem_reg_1__1_ ( .D(n181), .CLK(clk), .Q(mem[49]) );
  DFFX1 mem_reg_1__0_ ( .D(n182), .CLK(clk), .Q(mem[48]) );
  DFFX1 mem_reg_2__7_ ( .D(n183), .CLK(clk), .Q(mem[47]) );
  DFFX1 mem_reg_2__6_ ( .D(n184), .CLK(clk), .Q(mem[46]) );
  DFFX1 mem_reg_2__5_ ( .D(n185), .CLK(clk), .Q(mem[45]) );
  DFFX1 mem_reg_2__4_ ( .D(n186), .CLK(clk), .Q(mem[44]) );
  DFFX1 mem_reg_2__3_ ( .D(n187), .CLK(clk), .Q(mem[43]) );
  DFFX1 mem_reg_2__2_ ( .D(n188), .CLK(clk), .Q(mem[42]) );
  DFFX1 mem_reg_2__1_ ( .D(n189), .CLK(clk), .Q(mem[41]) );
  DFFX1 mem_reg_2__0_ ( .D(n190), .CLK(clk), .Q(mem[40]) );
  DFFX1 mem_reg_3__7_ ( .D(n191), .CLK(clk), .Q(mem[39]) );
  DFFX1 mem_reg_3__6_ ( .D(n192), .CLK(clk), .Q(mem[38]) );
  DFFX1 mem_reg_3__5_ ( .D(n193), .CLK(clk), .Q(mem[37]) );
  DFFX1 mem_reg_3__4_ ( .D(n194), .CLK(clk), .Q(mem[36]) );
  DFFX1 mem_reg_3__3_ ( .D(n195), .CLK(clk), .Q(mem[35]) );
  DFFX1 mem_reg_3__2_ ( .D(n196), .CLK(clk), .Q(mem[34]) );
  DFFX1 mem_reg_3__1_ ( .D(n197), .CLK(clk), .Q(mem[33]) );
  DFFX1 mem_reg_3__0_ ( .D(n198), .CLK(clk), .Q(mem[32]) );
  DFFX1 mem_reg_4__7_ ( .D(n199), .CLK(clk), .Q(mem[31]) );
  DFFX1 mem_reg_4__6_ ( .D(n200), .CLK(clk), .Q(mem[30]) );
  DFFX1 mem_reg_4__5_ ( .D(n201), .CLK(clk), .Q(mem[29]) );
  DFFX1 mem_reg_4__4_ ( .D(n202), .CLK(clk), .Q(mem[28]) );
  DFFX1 mem_reg_4__3_ ( .D(n203), .CLK(clk), .Q(mem[27]) );
  DFFX1 mem_reg_4__2_ ( .D(n204), .CLK(clk), .Q(mem[26]) );
  DFFX1 mem_reg_4__1_ ( .D(n205), .CLK(clk), .Q(mem[25]) );
  DFFX1 mem_reg_4__0_ ( .D(n206), .CLK(clk), .Q(mem[24]) );
  DFFX1 mem_reg_5__7_ ( .D(n207), .CLK(clk), .Q(mem[23]) );
  DFFX1 mem_reg_5__6_ ( .D(n208), .CLK(clk), .Q(mem[22]) );
  DFFX1 mem_reg_5__5_ ( .D(n209), .CLK(clk), .Q(mem[21]) );
  DFFX1 mem_reg_5__4_ ( .D(n210), .CLK(clk), .Q(mem[20]) );
  DFFX1 mem_reg_5__3_ ( .D(n211), .CLK(clk), .Q(mem[19]) );
  DFFX1 mem_reg_5__2_ ( .D(n212), .CLK(clk), .Q(mem[18]) );
  DFFX1 mem_reg_5__1_ ( .D(n213), .CLK(clk), .Q(mem[17]) );
  DFFX1 mem_reg_5__0_ ( .D(n214), .CLK(clk), .Q(mem[16]) );
  DFFX1 mem_reg_6__7_ ( .D(n215), .CLK(clk), .Q(mem[15]) );
  DFFX1 mem_reg_6__6_ ( .D(n216), .CLK(clk), .Q(mem[14]) );
  DFFX1 mem_reg_6__5_ ( .D(n217), .CLK(clk), .Q(mem[13]) );
  DFFX1 mem_reg_6__4_ ( .D(n218), .CLK(clk), .Q(mem[12]) );
  DFFX1 mem_reg_6__3_ ( .D(n219), .CLK(clk), .Q(mem[11]) );
  DFFX1 mem_reg_6__2_ ( .D(n220), .CLK(clk), .Q(mem[10]) );
  DFFX1 mem_reg_6__1_ ( .D(n221), .CLK(clk), .Q(mem[9]) );
  DFFX1 mem_reg_6__0_ ( .D(n222), .CLK(clk), .Q(mem[8]) );
  DFFX1 mem_reg_7__7_ ( .D(n223), .CLK(clk), .Q(mem[7]) );
  DFFX1 mem_reg_7__6_ ( .D(n224), .CLK(clk), .Q(mem[6]) );
  DFFX1 mem_reg_7__5_ ( .D(n225), .CLK(clk), .Q(mem[5]) );
  DFFX1 mem_reg_7__4_ ( .D(n226), .CLK(clk), .Q(mem[4]) );
  DFFX1 mem_reg_7__3_ ( .D(n227), .CLK(clk), .Q(mem[3]) );
  DFFX1 mem_reg_7__2_ ( .D(n228), .CLK(clk), .Q(mem[2]) );
  DFFX1 mem_reg_7__1_ ( .D(n229), .CLK(clk), .Q(mem[1]) );
  DFFX1 mem_reg_7__0_ ( .D(n230), .CLK(clk), .Q(mem[0]) );
  AO22X1 U14 ( .IN1(n89), .IN2(n166), .IN3(mem[0]), .IN4(n157), .Q(n230) );
  AO22X1 U15 ( .IN1(n86), .IN2(n166), .IN3(mem[1]), .IN4(n157), .Q(n229) );
  AO22X1 U16 ( .IN1(n88), .IN2(n166), .IN3(mem[2]), .IN4(n157), .Q(n228) );
  AO22X1 U17 ( .IN1(n11), .IN2(n166), .IN3(mem[3]), .IN4(n157), .Q(n227) );
  AO22X1 U18 ( .IN1(n10), .IN2(n166), .IN3(mem[4]), .IN4(n157), .Q(n226) );
  AO22X1 U19 ( .IN1(n7), .IN2(n166), .IN3(mem[5]), .IN4(n156), .Q(n225) );
  AO22X1 U20 ( .IN1(n87), .IN2(n166), .IN3(mem[6]), .IN4(n156), .Q(n224) );
  AO22X1 U21 ( .IN1(n5), .IN2(n166), .IN3(mem[7]), .IN4(n156), .Q(n223) );
  AO22X1 U23 ( .IN1(n165), .IN2(n89), .IN3(mem[8]), .IN4(n155), .Q(n222) );
  AO22X1 U24 ( .IN1(n165), .IN2(n86), .IN3(mem[9]), .IN4(n155), .Q(n221) );
  AO22X1 U25 ( .IN1(n165), .IN2(n88), .IN3(mem[10]), .IN4(n155), .Q(n220) );
  AO22X1 U26 ( .IN1(n165), .IN2(n11), .IN3(mem[11]), .IN4(n155), .Q(n219) );
  AO22X1 U27 ( .IN1(n165), .IN2(n10), .IN3(mem[12]), .IN4(n155), .Q(n218) );
  AO22X1 U28 ( .IN1(n165), .IN2(n7), .IN3(mem[13]), .IN4(n154), .Q(n217) );
  AO22X1 U29 ( .IN1(n165), .IN2(n87), .IN3(mem[14]), .IN4(n154), .Q(n216) );
  AO22X1 U30 ( .IN1(n165), .IN2(n5), .IN3(mem[15]), .IN4(n154), .Q(n215) );
  AO22X1 U32 ( .IN1(n164), .IN2(n89), .IN3(mem[16]), .IN4(n153), .Q(n214) );
  AO22X1 U33 ( .IN1(n164), .IN2(wdata[1]), .IN3(mem[17]), .IN4(n153), .Q(n213)
         );
  AO22X1 U34 ( .IN1(n164), .IN2(n88), .IN3(mem[18]), .IN4(n153), .Q(n212) );
  AO22X1 U35 ( .IN1(n164), .IN2(wdata[3]), .IN3(mem[19]), .IN4(n153), .Q(n211)
         );
  AO22X1 U36 ( .IN1(n164), .IN2(n10), .IN3(mem[20]), .IN4(n153), .Q(n210) );
  AO22X1 U37 ( .IN1(n164), .IN2(n7), .IN3(mem[21]), .IN4(n152), .Q(n209) );
  AO22X1 U38 ( .IN1(n164), .IN2(wdata[6]), .IN3(mem[22]), .IN4(n152), .Q(n208)
         );
  AO22X1 U39 ( .IN1(n164), .IN2(n5), .IN3(mem[23]), .IN4(n152), .Q(n207) );
  AO22X1 U41 ( .IN1(n163), .IN2(n89), .IN3(mem[24]), .IN4(n151), .Q(n206) );
  AO22X1 U42 ( .IN1(n163), .IN2(wdata[1]), .IN3(mem[25]), .IN4(n151), .Q(n205)
         );
  AO22X1 U43 ( .IN1(n163), .IN2(n88), .IN3(mem[26]), .IN4(n151), .Q(n204) );
  AO22X1 U44 ( .IN1(n163), .IN2(wdata[3]), .IN3(mem[27]), .IN4(n151), .Q(n203)
         );
  AO22X1 U45 ( .IN1(n163), .IN2(n10), .IN3(mem[28]), .IN4(n151), .Q(n202) );
  AO22X1 U46 ( .IN1(n163), .IN2(n7), .IN3(mem[29]), .IN4(n151), .Q(n201) );
  AO22X1 U47 ( .IN1(n163), .IN2(wdata[6]), .IN3(mem[30]), .IN4(n151), .Q(n200)
         );
  AO22X1 U48 ( .IN1(n163), .IN2(n5), .IN3(mem[31]), .IN4(n151), .Q(n199) );
  AO22X1 U51 ( .IN1(n142), .IN2(n89), .IN3(mem[32]), .IN4(n150), .Q(n198) );
  AO22X1 U52 ( .IN1(n142), .IN2(n86), .IN3(mem[33]), .IN4(n150), .Q(n197) );
  AO22X1 U53 ( .IN1(n142), .IN2(n88), .IN3(mem[34]), .IN4(n150), .Q(n196) );
  AO22X1 U54 ( .IN1(n142), .IN2(n11), .IN3(mem[35]), .IN4(n150), .Q(n195) );
  AO22X1 U55 ( .IN1(n142), .IN2(n10), .IN3(mem[36]), .IN4(n150), .Q(n194) );
  AO22X1 U56 ( .IN1(n142), .IN2(n7), .IN3(mem[37]), .IN4(n149), .Q(n193) );
  AO22X1 U57 ( .IN1(n142), .IN2(n87), .IN3(mem[38]), .IN4(n149), .Q(n192) );
  AO22X1 U58 ( .IN1(n142), .IN2(n5), .IN3(mem[39]), .IN4(n149), .Q(n191) );
  AO22X1 U60 ( .IN1(n141), .IN2(n89), .IN3(mem[40]), .IN4(n148), .Q(n190) );
  AO22X1 U61 ( .IN1(n141), .IN2(n86), .IN3(mem[41]), .IN4(n148), .Q(n189) );
  AO22X1 U62 ( .IN1(n141), .IN2(n88), .IN3(mem[42]), .IN4(n148), .Q(n188) );
  AO22X1 U63 ( .IN1(n141), .IN2(n11), .IN3(mem[43]), .IN4(n148), .Q(n187) );
  AO22X1 U64 ( .IN1(n141), .IN2(n10), .IN3(mem[44]), .IN4(n148), .Q(n186) );
  AO22X1 U65 ( .IN1(n141), .IN2(n7), .IN3(mem[45]), .IN4(n147), .Q(n185) );
  AO22X1 U66 ( .IN1(n141), .IN2(n87), .IN3(mem[46]), .IN4(n147), .Q(n184) );
  AO22X1 U67 ( .IN1(n141), .IN2(n5), .IN3(mem[47]), .IN4(n147), .Q(n183) );
  AO22X1 U69 ( .IN1(n2), .IN2(n89), .IN3(mem[48]), .IN4(n146), .Q(n182) );
  AO22X1 U70 ( .IN1(n2), .IN2(n86), .IN3(mem[49]), .IN4(n146), .Q(n181) );
  AO22X1 U71 ( .IN1(n2), .IN2(n88), .IN3(mem[50]), .IN4(n146), .Q(n180) );
  AO22X1 U72 ( .IN1(n3), .IN2(n11), .IN3(mem[51]), .IN4(n146), .Q(n179) );
  AO22X1 U73 ( .IN1(n2), .IN2(wdata[4]), .IN3(mem[52]), .IN4(n146), .Q(n178)
         );
  AO22X1 U74 ( .IN1(n3), .IN2(n7), .IN3(mem[53]), .IN4(n145), .Q(n177) );
  AO22X1 U75 ( .IN1(n3), .IN2(n87), .IN3(mem[54]), .IN4(n145), .Q(n176) );
  AO22X1 U76 ( .IN1(n3), .IN2(n5), .IN3(mem[55]), .IN4(n145), .Q(n175) );
  AO22X1 U78 ( .IN1(n161), .IN2(n89), .IN3(mem[56]), .IN4(n144), .Q(n174) );
  AO22X1 U79 ( .IN1(n161), .IN2(n86), .IN3(mem[57]), .IN4(n144), .Q(n173) );
  AO22X1 U80 ( .IN1(n161), .IN2(n88), .IN3(mem[58]), .IN4(n144), .Q(n172) );
  AO22X1 U81 ( .IN1(n161), .IN2(n11), .IN3(mem[59]), .IN4(n144), .Q(n171) );
  AO22X1 U82 ( .IN1(n161), .IN2(n10), .IN3(mem[60]), .IN4(n144), .Q(n170) );
  AO22X1 U83 ( .IN1(n161), .IN2(n7), .IN3(mem[61]), .IN4(n143), .Q(n169) );
  AO22X1 U84 ( .IN1(n161), .IN2(n87), .IN3(mem[62]), .IN4(n143), .Q(n168) );
  AO22X1 U85 ( .IN1(n161), .IN2(n5), .IN3(mem[63]), .IN4(n143), .Q(n167) );
  AND2X1 U2 ( .IN1(we), .IN2(waddr[2]), .Q(n239) );
  NBUFFX2 U3 ( .INP(n123), .Z(n138) );
  NBUFFX2 U4 ( .INP(n122), .Z(n140) );
  NBUFFX2 U5 ( .INP(n122), .Z(n139) );
  NBUFFX2 U6 ( .INP(n123), .Z(n137) );
  NAND3X0 U7 ( .IN1(n159), .IN2(n160), .IN3(n239), .QN(n236) );
  NBUFFX2 U8 ( .INP(n236), .Z(n151) );
  NBUFFX2 U9 ( .INP(n232), .Z(n146) );
  INVX0 U10 ( .INP(n8), .ZN(n1) );
  INVX0 U11 ( .INP(n1), .ZN(n2) );
  INVX0 U12 ( .INP(n1), .ZN(n3) );
  NAND3X0 U13 ( .IN1(waddr[1]), .IN2(n158), .IN3(n234), .QN(n235) );
  NBUFFX2 U22 ( .INP(wdata[2]), .Z(n88) );
  NBUFFX2 U31 ( .INP(wdata[0]), .Z(n89) );
  NAND3X0 U40 ( .IN1(n158), .IN2(n239), .IN3(waddr[1]), .QN(n240) );
  NBUFFX2 U49 ( .INP(n232), .Z(n145) );
  NBUFFX2 U50 ( .INP(n238), .Z(n155) );
  NAND3X0 U59 ( .IN1(waddr[1]), .IN2(n159), .IN3(n234), .QN(n233) );
  INVX0 U68 ( .INP(wdata[7]), .ZN(n4) );
  INVX0 U77 ( .INP(n4), .ZN(n5) );
  INVX0 U86 ( .INP(wdata[5]), .ZN(n6) );
  INVX0 U87 ( .INP(n6), .ZN(n7) );
  INVX0 U88 ( .INP(n232), .ZN(n8) );
  INVX0 U89 ( .INP(wdata[4]), .ZN(n9) );
  INVX0 U90 ( .INP(n9), .ZN(n10) );
  NAND3X1 U91 ( .IN1(n158), .IN2(n160), .IN3(n234), .QN(n232) );
  NBUFFX2 U92 ( .INP(wdata[3]), .Z(n11) );
  NBUFFX2 U93 ( .INP(wdata[1]), .Z(n86) );
  NBUFFX2 U94 ( .INP(wdata[6]), .Z(n87) );
  INVX0 U95 ( .INP(n131), .ZN(n90) );
  INVX0 U96 ( .INP(raddr[1]), .ZN(n91) );
  INVX0 U97 ( .INP(n91), .ZN(n92) );
  NBUFFX2 U98 ( .INP(n125), .Z(n134) );
  NBUFFX2 U99 ( .INP(n125), .Z(n135) );
  NBUFFX2 U100 ( .INP(n126), .Z(n132) );
  NAND3X1 U101 ( .IN1(n239), .IN2(n159), .IN3(waddr[1]), .QN(n238) );
  INVX0 U102 ( .INP(n156), .ZN(n166) );
  INVX0 U103 ( .INP(n154), .ZN(n165) );
  NBUFFX2 U104 ( .INP(n125), .Z(n136) );
  NBUFFX2 U105 ( .INP(n238), .Z(n154) );
  NBUFFX2 U106 ( .INP(n240), .Z(n156) );
  NBUFFX2 U107 ( .INP(n235), .Z(n149) );
  NBUFFX2 U108 ( .INP(n233), .Z(n147) );
  NBUFFX2 U109 ( .INP(n235), .Z(n150) );
  NBUFFX2 U110 ( .INP(n233), .Z(n148) );
  NBUFFX2 U111 ( .INP(n152), .Z(n153) );
  NBUFFX2 U112 ( .INP(n143), .Z(n144) );
  NBUFFX2 U113 ( .INP(n240), .Z(n157) );
  NBUFFX2 U114 ( .INP(n126), .Z(n133) );
  NAND3X0 U115 ( .IN1(n239), .IN2(n160), .IN3(n158), .QN(n237) );
  NAND3X0 U116 ( .IN1(n159), .IN2(n160), .IN3(n234), .QN(n231) );
  NOR2X0 U117 ( .IN1(n162), .IN2(waddr[2]), .QN(n234) );
  INVX0 U118 ( .INP(we), .ZN(n162) );
  NOR2X0 U119 ( .IN1(n129), .IN2(n92), .QN(n126) );
  NOR2X0 U120 ( .IN1(n92), .IN2(n130), .QN(n122) );
  AO22X1 U121 ( .IN1(mem[32]), .IN2(n138), .IN3(mem[48]), .IN4(n140), .Q(n93)
         );
  AO221X1 U122 ( .IN1(mem[16]), .IN2(n133), .IN3(mem[0]), .IN4(n136), .IN5(n93), .Q(n96) );
  AO22X1 U123 ( .IN1(mem[40]), .IN2(n138), .IN3(mem[56]), .IN4(n139), .Q(n94)
         );
  AO221X1 U124 ( .IN1(mem[24]), .IN2(n132), .IN3(mem[8]), .IN4(n136), .IN5(n94), .Q(n95) );
  AO22X1 U125 ( .IN1(n96), .IN2(n90), .IN3(n95), .IN4(n131), .Q(rdata[0]) );
  AO22X1 U126 ( .IN1(mem[33]), .IN2(n138), .IN3(mem[49]), .IN4(n140), .Q(n97)
         );
  AO221X1 U127 ( .IN1(mem[17]), .IN2(n133), .IN3(mem[1]), .IN4(n136), .IN5(n97), .Q(n100) );
  AO22X1 U128 ( .IN1(mem[41]), .IN2(n138), .IN3(mem[57]), .IN4(n139), .Q(n98)
         );
  AO221X1 U129 ( .IN1(mem[25]), .IN2(n132), .IN3(mem[9]), .IN4(n136), .IN5(n98), .Q(n99) );
  AO22X1 U130 ( .IN1(n100), .IN2(n90), .IN3(n99), .IN4(n131), .Q(rdata[1]) );
  AO22X1 U131 ( .IN1(mem[34]), .IN2(n138), .IN3(mem[50]), .IN4(n140), .Q(n101)
         );
  AO221X1 U132 ( .IN1(mem[18]), .IN2(n133), .IN3(mem[2]), .IN4(n136), .IN5(
        n101), .Q(n104) );
  AO22X1 U133 ( .IN1(mem[42]), .IN2(n138), .IN3(mem[58]), .IN4(n139), .Q(n102)
         );
  AO221X1 U134 ( .IN1(mem[26]), .IN2(n132), .IN3(mem[10]), .IN4(n136), .IN5(
        n102), .Q(n103) );
  AO22X1 U135 ( .IN1(n104), .IN2(n90), .IN3(n103), .IN4(n131), .Q(rdata[2]) );
  AO22X1 U136 ( .IN1(mem[35]), .IN2(n138), .IN3(mem[51]), .IN4(n140), .Q(n105)
         );
  AO221X1 U137 ( .IN1(mem[19]), .IN2(n133), .IN3(mem[3]), .IN4(n134), .IN5(
        n105), .Q(n108) );
  AO22X1 U138 ( .IN1(mem[43]), .IN2(n138), .IN3(mem[59]), .IN4(n139), .Q(n106)
         );
  AO221X1 U139 ( .IN1(mem[27]), .IN2(n132), .IN3(mem[11]), .IN4(n135), .IN5(
        n106), .Q(n107) );
  AO22X1 U140 ( .IN1(n108), .IN2(n90), .IN3(n107), .IN4(n131), .Q(rdata[3]) );
  AO22X1 U141 ( .IN1(mem[36]), .IN2(n137), .IN3(mem[52]), .IN4(n140), .Q(n109)
         );
  AO221X1 U142 ( .IN1(mem[20]), .IN2(n133), .IN3(mem[4]), .IN4(n134), .IN5(
        n109), .Q(n112) );
  AO22X1 U143 ( .IN1(mem[44]), .IN2(n137), .IN3(mem[60]), .IN4(n139), .Q(n110)
         );
  AO221X1 U144 ( .IN1(mem[28]), .IN2(n132), .IN3(mem[12]), .IN4(n135), .IN5(
        n110), .Q(n111) );
  AO22X1 U145 ( .IN1(n112), .IN2(raddr[0]), .IN3(n111), .IN4(n131), .Q(
        rdata[4]) );
  AO22X1 U146 ( .IN1(mem[37]), .IN2(n137), .IN3(mem[53]), .IN4(n140), .Q(n113)
         );
  AO221X1 U147 ( .IN1(mem[21]), .IN2(n133), .IN3(mem[5]), .IN4(n134), .IN5(
        n113), .Q(n116) );
  AO22X1 U148 ( .IN1(mem[45]), .IN2(n137), .IN3(mem[61]), .IN4(n139), .Q(n114)
         );
  AO221X1 U149 ( .IN1(mem[29]), .IN2(n132), .IN3(mem[13]), .IN4(n135), .IN5(
        n114), .Q(n115) );
  AO22X1 U150 ( .IN1(n116), .IN2(raddr[0]), .IN3(n115), .IN4(n131), .Q(
        rdata[5]) );
  AO22X1 U151 ( .IN1(mem[38]), .IN2(n137), .IN3(mem[54]), .IN4(n140), .Q(n117)
         );
  AO221X1 U152 ( .IN1(mem[22]), .IN2(n133), .IN3(mem[6]), .IN4(n134), .IN5(
        n117), .Q(n120) );
  AO22X1 U153 ( .IN1(mem[46]), .IN2(n137), .IN3(mem[62]), .IN4(n139), .Q(n118)
         );
  AO221X1 U154 ( .IN1(mem[30]), .IN2(n132), .IN3(mem[14]), .IN4(n135), .IN5(
        n118), .Q(n119) );
  AO22X1 U155 ( .IN1(n120), .IN2(n90), .IN3(n119), .IN4(n131), .Q(rdata[6]) );
  AO22X1 U156 ( .IN1(mem[39]), .IN2(n137), .IN3(mem[55]), .IN4(n140), .Q(n121)
         );
  AO221X1 U157 ( .IN1(mem[23]), .IN2(n133), .IN3(mem[7]), .IN4(n134), .IN5(
        n121), .Q(n128) );
  AO22X1 U158 ( .IN1(mem[47]), .IN2(n137), .IN3(mem[63]), .IN4(n139), .Q(n124)
         );
  AO221X1 U159 ( .IN1(mem[31]), .IN2(n132), .IN3(mem[15]), .IN4(n135), .IN5(
        n124), .Q(n127) );
  AO22X1 U160 ( .IN1(n90), .IN2(n128), .IN3(n127), .IN4(n131), .Q(rdata[7]) );
  INVX0 U161 ( .INP(raddr[2]), .ZN(n129) );
  INVX0 U162 ( .INP(n129), .ZN(n130) );
  INVX0 U163 ( .INP(raddr[0]), .ZN(n131) );
  NOR2X0 U164 ( .IN1(n129), .IN2(n91), .QN(n125) );
  NOR2X0 U165 ( .IN1(n91), .IN2(n130), .QN(n123) );
  INVX0 U166 ( .INP(n147), .ZN(n141) );
  INVX0 U167 ( .INP(n149), .ZN(n142) );
  NBUFFX2 U168 ( .INP(n231), .Z(n143) );
  INVX0 U169 ( .INP(n231), .ZN(n161) );
  INVX0 U170 ( .INP(n236), .ZN(n163) );
  NBUFFX2 U171 ( .INP(n237), .Z(n152) );
  INVX0 U172 ( .INP(n237), .ZN(n164) );
  INVX0 U173 ( .INP(n159), .ZN(n158) );
  INVX0 U174 ( .INP(waddr[0]), .ZN(n159) );
  INVX0 U175 ( .INP(waddr[1]), .ZN(n160) );
endmodule


module payload_ram_bank8x8_1 ( clk, we, waddr, wdata, raddr, rdata );
  input [2:0] waddr;
  input [7:0] wdata;
  input [2:0] raddr;
  output [7:0] rdata;
  input clk, we;
  wire   n1, n2, n4, n5, n6, n7, n8, n9, n10, n11, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246,
         n247, n248, n249, n250, n251, n252, n253;
  wire   [63:0] mem;

  DFFX1 mem_reg_0__7_ ( .D(n180), .CLK(clk), .Q(mem[63]) );
  DFFX1 mem_reg_0__6_ ( .D(n181), .CLK(clk), .Q(mem[62]) );
  DFFX1 mem_reg_0__5_ ( .D(n182), .CLK(clk), .Q(mem[61]) );
  DFFX1 mem_reg_0__4_ ( .D(n183), .CLK(clk), .Q(mem[60]) );
  DFFX1 mem_reg_0__3_ ( .D(n184), .CLK(clk), .Q(mem[59]) );
  DFFX1 mem_reg_0__2_ ( .D(n185), .CLK(clk), .Q(mem[58]) );
  DFFX1 mem_reg_0__1_ ( .D(n186), .CLK(clk), .Q(mem[57]) );
  DFFX1 mem_reg_0__0_ ( .D(n187), .CLK(clk), .Q(mem[56]) );
  DFFX1 mem_reg_1__7_ ( .D(n188), .CLK(clk), .Q(mem[55]) );
  DFFX1 mem_reg_1__6_ ( .D(n189), .CLK(clk), .Q(mem[54]) );
  DFFX1 mem_reg_1__5_ ( .D(n190), .CLK(clk), .Q(mem[53]) );
  DFFX1 mem_reg_1__4_ ( .D(n191), .CLK(clk), .Q(mem[52]) );
  DFFX1 mem_reg_1__3_ ( .D(n192), .CLK(clk), .Q(mem[51]) );
  DFFX1 mem_reg_1__2_ ( .D(n193), .CLK(clk), .Q(mem[50]) );
  DFFX1 mem_reg_1__1_ ( .D(n194), .CLK(clk), .Q(mem[49]) );
  DFFX1 mem_reg_1__0_ ( .D(n195), .CLK(clk), .Q(mem[48]) );
  DFFX1 mem_reg_2__7_ ( .D(n196), .CLK(clk), .Q(mem[47]) );
  DFFX1 mem_reg_2__6_ ( .D(n197), .CLK(clk), .Q(mem[46]) );
  DFFX1 mem_reg_2__5_ ( .D(n198), .CLK(clk), .Q(mem[45]) );
  DFFX1 mem_reg_2__4_ ( .D(n199), .CLK(clk), .Q(mem[44]) );
  DFFX1 mem_reg_2__3_ ( .D(n200), .CLK(clk), .Q(mem[43]) );
  DFFX1 mem_reg_2__2_ ( .D(n201), .CLK(clk), .Q(mem[42]) );
  DFFX1 mem_reg_2__1_ ( .D(n202), .CLK(clk), .Q(mem[41]) );
  DFFX1 mem_reg_2__0_ ( .D(n203), .CLK(clk), .Q(mem[40]) );
  DFFX1 mem_reg_3__7_ ( .D(n204), .CLK(clk), .Q(mem[39]) );
  DFFX1 mem_reg_3__6_ ( .D(n205), .CLK(clk), .Q(mem[38]) );
  DFFX1 mem_reg_3__5_ ( .D(n206), .CLK(clk), .Q(mem[37]) );
  DFFX1 mem_reg_3__4_ ( .D(n207), .CLK(clk), .Q(mem[36]) );
  DFFX1 mem_reg_3__3_ ( .D(n208), .CLK(clk), .Q(mem[35]) );
  DFFX1 mem_reg_3__2_ ( .D(n209), .CLK(clk), .Q(mem[34]) );
  DFFX1 mem_reg_3__1_ ( .D(n210), .CLK(clk), .Q(mem[33]) );
  DFFX1 mem_reg_3__0_ ( .D(n211), .CLK(clk), .Q(mem[32]) );
  DFFX1 mem_reg_4__7_ ( .D(n212), .CLK(clk), .Q(mem[31]) );
  DFFX1 mem_reg_4__6_ ( .D(n213), .CLK(clk), .Q(mem[30]) );
  DFFX1 mem_reg_4__5_ ( .D(n214), .CLK(clk), .Q(mem[29]) );
  DFFX1 mem_reg_4__4_ ( .D(n215), .CLK(clk), .Q(mem[28]) );
  DFFX1 mem_reg_4__3_ ( .D(n216), .CLK(clk), .Q(mem[27]) );
  DFFX1 mem_reg_4__2_ ( .D(n217), .CLK(clk), .Q(mem[26]) );
  DFFX1 mem_reg_4__1_ ( .D(n218), .CLK(clk), .Q(mem[25]) );
  DFFX1 mem_reg_4__0_ ( .D(n219), .CLK(clk), .Q(mem[24]) );
  DFFX1 mem_reg_5__7_ ( .D(n220), .CLK(clk), .Q(mem[23]) );
  DFFX1 mem_reg_5__6_ ( .D(n221), .CLK(clk), .Q(mem[22]) );
  DFFX1 mem_reg_5__5_ ( .D(n222), .CLK(clk), .Q(mem[21]) );
  DFFX1 mem_reg_5__4_ ( .D(n223), .CLK(clk), .Q(mem[20]) );
  DFFX1 mem_reg_5__3_ ( .D(n224), .CLK(clk), .Q(mem[19]) );
  DFFX1 mem_reg_5__2_ ( .D(n225), .CLK(clk), .Q(mem[18]) );
  DFFX1 mem_reg_5__1_ ( .D(n226), .CLK(clk), .Q(mem[17]) );
  DFFX1 mem_reg_5__0_ ( .D(n227), .CLK(clk), .Q(mem[16]) );
  DFFX1 mem_reg_6__7_ ( .D(n228), .CLK(clk), .Q(mem[15]) );
  DFFX1 mem_reg_6__6_ ( .D(n229), .CLK(clk), .Q(mem[14]) );
  DFFX1 mem_reg_6__5_ ( .D(n230), .CLK(clk), .Q(mem[13]) );
  DFFX1 mem_reg_6__4_ ( .D(n231), .CLK(clk), .Q(mem[12]) );
  DFFX1 mem_reg_6__3_ ( .D(n232), .CLK(clk), .Q(mem[11]) );
  DFFX1 mem_reg_6__2_ ( .D(n233), .CLK(clk), .Q(mem[10]) );
  DFFX1 mem_reg_6__1_ ( .D(n234), .CLK(clk), .Q(mem[9]) );
  DFFX1 mem_reg_6__0_ ( .D(n235), .CLK(clk), .Q(mem[8]) );
  DFFX1 mem_reg_7__7_ ( .D(n236), .CLK(clk), .Q(mem[7]) );
  DFFX1 mem_reg_7__6_ ( .D(n237), .CLK(clk), .Q(mem[6]) );
  DFFX1 mem_reg_7__5_ ( .D(n238), .CLK(clk), .Q(mem[5]) );
  DFFX1 mem_reg_7__4_ ( .D(n239), .CLK(clk), .Q(mem[4]) );
  DFFX1 mem_reg_7__3_ ( .D(n240), .CLK(clk), .Q(mem[3]) );
  DFFX1 mem_reg_7__2_ ( .D(n241), .CLK(clk), .Q(mem[2]) );
  DFFX1 mem_reg_7__1_ ( .D(n242), .CLK(clk), .Q(mem[1]) );
  DFFX1 mem_reg_7__0_ ( .D(n243), .CLK(clk), .Q(mem[0]) );
  AO22X1 U14 ( .IN1(wdata[0]), .IN2(n155), .IN3(mem[0]), .IN4(n172), .Q(n243)
         );
  AO22X1 U15 ( .IN1(wdata[1]), .IN2(n155), .IN3(mem[1]), .IN4(n172), .Q(n242)
         );
  AO22X1 U16 ( .IN1(wdata[2]), .IN2(n155), .IN3(mem[2]), .IN4(n172), .Q(n241)
         );
  AO22X1 U17 ( .IN1(wdata[3]), .IN2(n155), .IN3(mem[3]), .IN4(n172), .Q(n240)
         );
  AO22X1 U18 ( .IN1(n2), .IN2(n156), .IN3(mem[4]), .IN4(n172), .Q(n239) );
  AO22X1 U19 ( .IN1(wdata[5]), .IN2(n156), .IN3(mem[5]), .IN4(n171), .Q(n238)
         );
  AO22X1 U20 ( .IN1(wdata[6]), .IN2(n156), .IN3(mem[6]), .IN4(n171), .Q(n237)
         );
  AO22X1 U21 ( .IN1(wdata[7]), .IN2(n156), .IN3(mem[7]), .IN4(n171), .Q(n236)
         );
  AO22X1 U23 ( .IN1(n149), .IN2(n86), .IN3(mem[8]), .IN4(n170), .Q(n235) );
  AO22X1 U24 ( .IN1(n149), .IN2(n9), .IN3(mem[9]), .IN4(n170), .Q(n234) );
  AO22X1 U25 ( .IN1(n149), .IN2(n11), .IN3(mem[10]), .IN4(n170), .Q(n233) );
  AO22X1 U26 ( .IN1(n149), .IN2(n8), .IN3(mem[11]), .IN4(n170), .Q(n232) );
  AO22X1 U27 ( .IN1(n150), .IN2(n5), .IN3(mem[12]), .IN4(n170), .Q(n231) );
  AO22X1 U28 ( .IN1(n150), .IN2(wdata[5]), .IN3(mem[13]), .IN4(n169), .Q(n230)
         );
  AO22X1 U29 ( .IN1(n150), .IN2(n10), .IN3(mem[14]), .IN4(n169), .Q(n229) );
  AO22X1 U30 ( .IN1(n150), .IN2(wdata[7]), .IN3(mem[15]), .IN4(n169), .Q(n228)
         );
  AO22X1 U32 ( .IN1(n143), .IN2(n86), .IN3(mem[16]), .IN4(n168), .Q(n227) );
  AO22X1 U33 ( .IN1(n179), .IN2(wdata[1]), .IN3(mem[17]), .IN4(n168), .Q(n226)
         );
  AO22X1 U34 ( .IN1(n179), .IN2(n11), .IN3(mem[18]), .IN4(n168), .Q(n225) );
  AO22X1 U35 ( .IN1(n143), .IN2(wdata[3]), .IN3(mem[19]), .IN4(n168), .Q(n224)
         );
  AO22X1 U36 ( .IN1(n179), .IN2(n2), .IN3(mem[20]), .IN4(n168), .Q(n223) );
  AO22X1 U37 ( .IN1(n143), .IN2(n7), .IN3(mem[21]), .IN4(n167), .Q(n222) );
  AO22X1 U38 ( .IN1(n179), .IN2(wdata[6]), .IN3(mem[22]), .IN4(n167), .Q(n221)
         );
  AO22X1 U39 ( .IN1(n143), .IN2(n6), .IN3(mem[23]), .IN4(n167), .Q(n220) );
  AO22X1 U41 ( .IN1(n178), .IN2(n86), .IN3(mem[24]), .IN4(n166), .Q(n219) );
  AO22X1 U42 ( .IN1(n178), .IN2(n9), .IN3(mem[25]), .IN4(n166), .Q(n218) );
  AO22X1 U43 ( .IN1(n146), .IN2(n11), .IN3(mem[26]), .IN4(n166), .Q(n217) );
  AO22X1 U44 ( .IN1(n146), .IN2(n8), .IN3(mem[27]), .IN4(n166), .Q(n216) );
  AO22X1 U45 ( .IN1(n178), .IN2(n2), .IN3(mem[28]), .IN4(n166), .Q(n215) );
  AO22X1 U46 ( .IN1(n146), .IN2(n7), .IN3(mem[29]), .IN4(n165), .Q(n214) );
  AO22X1 U47 ( .IN1(n178), .IN2(n10), .IN3(mem[30]), .IN4(n165), .Q(n213) );
  AO22X1 U48 ( .IN1(n146), .IN2(n6), .IN3(mem[31]), .IN4(n165), .Q(n212) );
  AND2X1 U50 ( .IN1(we), .IN2(waddr[2]), .Q(n252) );
  AO22X1 U51 ( .IN1(n153), .IN2(n86), .IN3(mem[32]), .IN4(n164), .Q(n211) );
  AO22X1 U52 ( .IN1(n153), .IN2(n9), .IN3(mem[33]), .IN4(n164), .Q(n210) );
  AO22X1 U53 ( .IN1(n153), .IN2(n11), .IN3(mem[34]), .IN4(n164), .Q(n209) );
  AO22X1 U54 ( .IN1(n153), .IN2(n8), .IN3(mem[35]), .IN4(n164), .Q(n208) );
  AO22X1 U55 ( .IN1(n154), .IN2(n5), .IN3(mem[36]), .IN4(n164), .Q(n207) );
  AO22X1 U56 ( .IN1(n154), .IN2(n7), .IN3(mem[37]), .IN4(n163), .Q(n206) );
  AO22X1 U57 ( .IN1(n154), .IN2(n10), .IN3(mem[38]), .IN4(n163), .Q(n205) );
  AO22X1 U58 ( .IN1(n154), .IN2(n6), .IN3(mem[39]), .IN4(n163), .Q(n204) );
  AO22X1 U60 ( .IN1(n151), .IN2(n86), .IN3(mem[40]), .IN4(n162), .Q(n203) );
  AO22X1 U61 ( .IN1(n151), .IN2(n9), .IN3(mem[41]), .IN4(n162), .Q(n202) );
  AO22X1 U62 ( .IN1(n151), .IN2(n11), .IN3(mem[42]), .IN4(n162), .Q(n201) );
  AO22X1 U63 ( .IN1(n151), .IN2(n8), .IN3(mem[43]), .IN4(n162), .Q(n200) );
  AO22X1 U64 ( .IN1(n152), .IN2(n5), .IN3(mem[44]), .IN4(n162), .Q(n199) );
  AO22X1 U65 ( .IN1(n152), .IN2(n7), .IN3(mem[45]), .IN4(n161), .Q(n198) );
  AO22X1 U66 ( .IN1(n152), .IN2(n10), .IN3(mem[46]), .IN4(n161), .Q(n197) );
  AO22X1 U67 ( .IN1(n152), .IN2(n6), .IN3(mem[47]), .IN4(n161), .Q(n196) );
  AO22X1 U69 ( .IN1(n176), .IN2(n86), .IN3(mem[48]), .IN4(n160), .Q(n195) );
  AO22X1 U70 ( .IN1(n176), .IN2(n9), .IN3(mem[49]), .IN4(n160), .Q(n194) );
  AO22X1 U71 ( .IN1(n145), .IN2(n11), .IN3(mem[50]), .IN4(n160), .Q(n193) );
  AO22X1 U72 ( .IN1(n145), .IN2(n8), .IN3(mem[51]), .IN4(n160), .Q(n192) );
  AO22X1 U73 ( .IN1(n176), .IN2(n2), .IN3(mem[52]), .IN4(n160), .Q(n191) );
  AO22X1 U74 ( .IN1(n145), .IN2(n7), .IN3(mem[53]), .IN4(n159), .Q(n190) );
  AO22X1 U75 ( .IN1(n176), .IN2(n10), .IN3(mem[54]), .IN4(n159), .Q(n189) );
  AO22X1 U76 ( .IN1(n145), .IN2(n6), .IN3(mem[55]), .IN4(n159), .Q(n188) );
  AO22X1 U78 ( .IN1(n175), .IN2(n86), .IN3(mem[56]), .IN4(n158), .Q(n187) );
  AO22X1 U79 ( .IN1(n175), .IN2(n9), .IN3(mem[57]), .IN4(n158), .Q(n186) );
  AO22X1 U80 ( .IN1(n144), .IN2(n11), .IN3(mem[58]), .IN4(n158), .Q(n185) );
  AO22X1 U81 ( .IN1(n144), .IN2(n8), .IN3(mem[59]), .IN4(n158), .Q(n184) );
  AO22X1 U82 ( .IN1(n175), .IN2(n2), .IN3(mem[60]), .IN4(n158), .Q(n183) );
  AO22X1 U83 ( .IN1(n144), .IN2(n7), .IN3(mem[61]), .IN4(n157), .Q(n182) );
  AO22X1 U84 ( .IN1(n175), .IN2(n10), .IN3(mem[62]), .IN4(n157), .Q(n181) );
  AO22X1 U85 ( .IN1(n144), .IN2(n6), .IN3(mem[63]), .IN4(n157), .Q(n180) );
  NBUFFX2 U2 ( .INP(n119), .Z(n140) );
  NBUFFX2 U3 ( .INP(n120), .Z(n135) );
  AND2X1 U4 ( .IN1(n127), .IN2(n128), .Q(n123) );
  NBUFFX2 U5 ( .INP(n120), .Z(n142) );
  NBUFFX2 U6 ( .INP(n123), .Z(n88) );
  NBUFFX2 U7 ( .INP(n119), .Z(n137) );
  NBUFFX2 U8 ( .INP(n123), .Z(n89) );
  NBUFFX2 U9 ( .INP(n120), .Z(n141) );
  NBUFFX2 U10 ( .INP(n119), .Z(n139) );
  NBUFFX2 U11 ( .INP(n123), .Z(n131) );
  NBUFFX2 U12 ( .INP(n122), .Z(n132) );
  NBUFFX2 U13 ( .INP(n122), .Z(n133) );
  NBUFFX2 U22 ( .INP(n123), .Z(n130) );
  INVX0 U31 ( .INP(wdata[4]), .ZN(n1) );
  INVX0 U40 ( .INP(n1), .ZN(n2) );
  NAND3X1 U49 ( .IN1(n174), .IN2(n147), .IN3(n247), .QN(n244) );
  NAND3X1 U59 ( .IN1(n173), .IN2(n147), .IN3(n247), .QN(n245) );
  NAND3X1 U68 ( .IN1(n174), .IN2(n147), .IN3(n252), .QN(n249) );
  NAND3X1 U77 ( .IN1(n252), .IN2(n147), .IN3(n173), .QN(n250) );
  AO22X1 U86 ( .IN1(n93), .IN2(raddr[0]), .IN3(n92), .IN4(n129), .Q(rdata[0])
         );
  NAND3X0 U87 ( .IN1(n148), .IN2(n174), .IN3(n247), .QN(n246) );
  NAND3X0 U88 ( .IN1(n148), .IN2(n173), .IN3(n247), .QN(n248) );
  NAND3X0 U89 ( .IN1(n252), .IN2(n174), .IN3(n148), .QN(n251) );
  INVX0 U90 ( .INP(n2), .ZN(n4) );
  INVX0 U91 ( .INP(n4), .ZN(n5) );
  NBUFFX2 U92 ( .INP(wdata[7]), .Z(n6) );
  NBUFFX2 U93 ( .INP(wdata[5]), .Z(n7) );
  NBUFFX2 U94 ( .INP(wdata[3]), .Z(n8) );
  NBUFFX2 U95 ( .INP(wdata[1]), .Z(n9) );
  NBUFFX2 U96 ( .INP(wdata[6]), .Z(n10) );
  NBUFFX2 U97 ( .INP(wdata[2]), .Z(n11) );
  NBUFFX2 U98 ( .INP(wdata[0]), .Z(n86) );
  INVX0 U99 ( .INP(n129), .ZN(n87) );
  NBUFFX2 U100 ( .INP(n120), .Z(n136) );
  NBUFFX2 U101 ( .INP(n119), .Z(n138) );
  INVX0 U102 ( .INP(n165), .ZN(n178) );
  INVX0 U103 ( .INP(n159), .ZN(n176) );
  INVX0 U104 ( .INP(n157), .ZN(n175) );
  NBUFFX2 U105 ( .INP(n122), .Z(n134) );
  NBUFFX2 U106 ( .INP(n244), .Z(n158) );
  NBUFFX2 U107 ( .INP(n250), .Z(n168) );
  NBUFFX2 U108 ( .INP(n248), .Z(n163) );
  NBUFFX2 U109 ( .INP(n246), .Z(n161) );
  NBUFFX2 U110 ( .INP(n253), .Z(n171) );
  NBUFFX2 U111 ( .INP(n251), .Z(n169) );
  NBUFFX2 U112 ( .INP(n249), .Z(n165) );
  NBUFFX2 U113 ( .INP(n245), .Z(n159) );
  NBUFFX2 U114 ( .INP(n244), .Z(n157) );
  NBUFFX2 U115 ( .INP(n248), .Z(n164) );
  NBUFFX2 U116 ( .INP(n246), .Z(n162) );
  NBUFFX2 U117 ( .INP(n249), .Z(n166) );
  NBUFFX2 U118 ( .INP(n245), .Z(n160) );
  NBUFFX2 U119 ( .INP(n253), .Z(n172) );
  NBUFFX2 U120 ( .INP(n251), .Z(n170) );
  NAND3X0 U121 ( .IN1(n173), .IN2(n252), .IN3(n148), .QN(n253) );
  NOR2X0 U122 ( .IN1(n177), .IN2(waddr[2]), .QN(n247) );
  INVX0 U123 ( .INP(we), .ZN(n177) );
  NOR2X0 U124 ( .IN1(raddr[1]), .IN2(n127), .QN(n119) );
  AO22X1 U125 ( .IN1(mem[32]), .IN2(n136), .IN3(mem[48]), .IN4(n138), .Q(n90)
         );
  AO221X1 U126 ( .IN1(mem[16]), .IN2(n131), .IN3(mem[0]), .IN4(n134), .IN5(n90), .Q(n93) );
  AO22X1 U127 ( .IN1(mem[40]), .IN2(n135), .IN3(mem[56]), .IN4(n140), .Q(n91)
         );
  AO221X1 U128 ( .IN1(mem[24]), .IN2(n131), .IN3(mem[8]), .IN4(n134), .IN5(n91), .Q(n92) );
  AO22X1 U129 ( .IN1(mem[33]), .IN2(n142), .IN3(mem[49]), .IN4(n138), .Q(n94)
         );
  AO221X1 U130 ( .IN1(mem[17]), .IN2(n88), .IN3(mem[1]), .IN4(n134), .IN5(n94),
        .Q(n97) );
  AO22X1 U131 ( .IN1(mem[41]), .IN2(n141), .IN3(mem[57]), .IN4(n140), .Q(n95)
         );
  AO221X1 U132 ( .IN1(mem[25]), .IN2(n130), .IN3(mem[9]), .IN4(n134), .IN5(n95), .Q(n96) );
  AO22X1 U133 ( .IN1(n97), .IN2(n87), .IN3(n96), .IN4(n129), .Q(rdata[1]) );
  AO22X1 U134 ( .IN1(mem[34]), .IN2(n135), .IN3(mem[50]), .IN4(n139), .Q(n98)
         );
  AO221X1 U135 ( .IN1(mem[18]), .IN2(n89), .IN3(mem[2]), .IN4(n134), .IN5(n98),
        .Q(n101) );
  AO22X1 U136 ( .IN1(mem[42]), .IN2(n142), .IN3(mem[58]), .IN4(n137), .Q(n99)
         );
  AO221X1 U137 ( .IN1(mem[26]), .IN2(n88), .IN3(mem[10]), .IN4(n134), .IN5(n99), .Q(n100) );
  AO22X1 U138 ( .IN1(n101), .IN2(n87), .IN3(n100), .IN4(n129), .Q(rdata[2]) );
  AO221X1 U139 ( .IN1(mem[19]), .IN2(n130), .IN3(mem[3]), .IN4(n132), .IN5(
        n102), .Q(n105) );
  AO22X1 U140 ( .IN1(mem[43]), .IN2(n135), .IN3(mem[59]), .IN4(n138), .Q(n103)
         );
  AO221X1 U141 ( .IN1(mem[27]), .IN2(n89), .IN3(mem[11]), .IN4(n133), .IN5(
        n103), .Q(n104) );
  AO22X1 U142 ( .IN1(n105), .IN2(n87), .IN3(n104), .IN4(n129), .Q(rdata[3]) );
  AO22X1 U143 ( .IN1(mem[36]), .IN2(n136), .IN3(mem[52]), .IN4(n139), .Q(n106)
         );
  AO221X1 U144 ( .IN1(mem[20]), .IN2(n88), .IN3(mem[4]), .IN4(n132), .IN5(n106), .Q(n109) );
  AO22X1 U145 ( .IN1(mem[44]), .IN2(n142), .IN3(mem[60]), .IN4(n139), .Q(n107)
         );
  AO221X1 U146 ( .IN1(mem[28]), .IN2(n130), .IN3(mem[12]), .IN4(n133), .IN5(
        n107), .Q(n108) );
  AO22X1 U147 ( .IN1(n109), .IN2(n87), .IN3(n108), .IN4(n129), .Q(rdata[4]) );
  AO22X1 U148 ( .IN1(mem[37]), .IN2(n141), .IN3(mem[53]), .IN4(n140), .Q(n110)
         );
  AO221X1 U149 ( .IN1(mem[21]), .IN2(n89), .IN3(mem[5]), .IN4(n132), .IN5(n110), .Q(n113) );
  AO22X1 U150 ( .IN1(mem[45]), .IN2(n136), .IN3(mem[61]), .IN4(n140), .Q(n111)
         );
  AO221X1 U151 ( .IN1(mem[29]), .IN2(n88), .IN3(mem[13]), .IN4(n133), .IN5(
        n111), .Q(n112) );
  AO22X1 U152 ( .IN1(n113), .IN2(n87), .IN3(n112), .IN4(n129), .Q(rdata[5]) );
  AO22X1 U153 ( .IN1(mem[38]), .IN2(n142), .IN3(mem[54]), .IN4(n137), .Q(n114)
         );
  AO221X1 U154 ( .IN1(mem[22]), .IN2(n131), .IN3(mem[6]), .IN4(n132), .IN5(
        n114), .Q(n117) );
  AO22X1 U155 ( .IN1(mem[46]), .IN2(n141), .IN3(mem[62]), .IN4(n137), .Q(n115)
         );
  AO221X1 U156 ( .IN1(mem[30]), .IN2(n89), .IN3(mem[14]), .IN4(n133), .IN5(
        n115), .Q(n116) );
  AO22X1 U157 ( .IN1(n117), .IN2(n87), .IN3(n116), .IN4(n129), .Q(rdata[6]) );
  AO22X1 U158 ( .IN1(mem[39]), .IN2(n135), .IN3(mem[55]), .IN4(n138), .Q(n118)
         );
  AO221X1 U159 ( .IN1(mem[23]), .IN2(n131), .IN3(mem[7]), .IN4(n132), .IN5(
        n118), .Q(n125) );
  AO22X1 U160 ( .IN1(mem[47]), .IN2(n141), .IN3(mem[63]), .IN4(n139), .Q(n121)
         );
  AO221X1 U161 ( .IN1(mem[31]), .IN2(n130), .IN3(mem[15]), .IN4(n133), .IN5(
        n121), .Q(n124) );
  AO22X1 U162 ( .IN1(raddr[0]), .IN2(n125), .IN3(n124), .IN4(n129), .Q(
        rdata[7]) );
  INVX0 U163 ( .INP(raddr[2]), .ZN(n126) );
  INVX0 U164 ( .INP(n126), .ZN(n127) );
  INVX0 U165 ( .INP(raddr[1]), .ZN(n128) );
  INVX0 U166 ( .INP(raddr[0]), .ZN(n129) );
  NOR2X0 U167 ( .IN1(n126), .IN2(n128), .QN(n122) );
  NOR2X0 U168 ( .IN1(n128), .IN2(n127), .QN(n120) );
  AO22X1 U169 ( .IN1(mem[35]), .IN2(n136), .IN3(mem[51]), .IN4(n137), .Q(n102)
         );
  INVX0 U170 ( .INP(n167), .ZN(n143) );
  INVX0 U171 ( .INP(n157), .ZN(n144) );
  INVX0 U172 ( .INP(n159), .ZN(n145) );
  INVX0 U173 ( .INP(n165), .ZN(n146) );
  INVX0 U174 ( .INP(waddr[1]), .ZN(n147) );
  INVX0 U175 ( .INP(n147), .ZN(n148) );
  INVX0 U176 ( .INP(n169), .ZN(n149) );
  INVX0 U177 ( .INP(n251), .ZN(n150) );
  INVX0 U178 ( .INP(n161), .ZN(n151) );
  INVX0 U179 ( .INP(n246), .ZN(n152) );
  INVX0 U180 ( .INP(n163), .ZN(n153) );
  INVX0 U181 ( .INP(n248), .ZN(n154) );
  INVX0 U182 ( .INP(n171), .ZN(n155) );
  INVX0 U183 ( .INP(n253), .ZN(n156) );
  NBUFFX2 U184 ( .INP(n250), .Z(n167) );
  INVX0 U185 ( .INP(n167), .ZN(n179) );
  INVX0 U186 ( .INP(n174), .ZN(n173) );
  INVX0 U187 ( .INP(waddr[0]), .ZN(n174) );
endmodule


module payload_ram_bank8x8_0 ( clk, we, waddr, wdata, raddr, rdata );
  input [2:0] waddr;
  input [7:0] wdata;
  input [2:0] raddr;
  output [7:0] rdata;
  input clk, we;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246,
         n247, n248;
  wire   [63:0] mem;

  DFFX1 mem_reg_0__7_ ( .D(n175), .CLK(clk), .Q(mem[63]) );
  DFFX1 mem_reg_0__6_ ( .D(n176), .CLK(clk), .Q(mem[62]) );
  DFFX1 mem_reg_0__5_ ( .D(n177), .CLK(clk), .Q(mem[61]) );
  DFFX1 mem_reg_0__4_ ( .D(n178), .CLK(clk), .Q(mem[60]) );
  DFFX1 mem_reg_0__3_ ( .D(n179), .CLK(clk), .Q(mem[59]) );
  DFFX1 mem_reg_0__2_ ( .D(n180), .CLK(clk), .Q(mem[58]) );
  DFFX1 mem_reg_0__1_ ( .D(n181), .CLK(clk), .Q(mem[57]) );
  DFFX1 mem_reg_0__0_ ( .D(n182), .CLK(clk), .Q(mem[56]) );
  DFFX1 mem_reg_1__7_ ( .D(n183), .CLK(clk), .Q(mem[55]) );
  DFFX1 mem_reg_1__6_ ( .D(n184), .CLK(clk), .Q(mem[54]) );
  DFFX1 mem_reg_1__5_ ( .D(n185), .CLK(clk), .Q(mem[53]) );
  DFFX1 mem_reg_1__4_ ( .D(n186), .CLK(clk), .Q(mem[52]) );
  DFFX1 mem_reg_1__3_ ( .D(n187), .CLK(clk), .Q(mem[51]) );
  DFFX1 mem_reg_1__2_ ( .D(n188), .CLK(clk), .Q(mem[50]) );
  DFFX1 mem_reg_1__1_ ( .D(n189), .CLK(clk), .Q(mem[49]) );
  DFFX1 mem_reg_1__0_ ( .D(n190), .CLK(clk), .Q(mem[48]) );
  DFFX1 mem_reg_2__7_ ( .D(n191), .CLK(clk), .Q(mem[47]) );
  DFFX1 mem_reg_2__6_ ( .D(n192), .CLK(clk), .Q(mem[46]) );
  DFFX1 mem_reg_2__5_ ( .D(n193), .CLK(clk), .Q(mem[45]) );
  DFFX1 mem_reg_2__4_ ( .D(n194), .CLK(clk), .Q(mem[44]) );
  DFFX1 mem_reg_2__3_ ( .D(n195), .CLK(clk), .Q(mem[43]) );
  DFFX1 mem_reg_2__2_ ( .D(n196), .CLK(clk), .Q(mem[42]) );
  DFFX1 mem_reg_2__1_ ( .D(n197), .CLK(clk), .Q(mem[41]) );
  DFFX1 mem_reg_2__0_ ( .D(n198), .CLK(clk), .Q(mem[40]) );
  DFFX1 mem_reg_3__7_ ( .D(n199), .CLK(clk), .Q(mem[39]) );
  DFFX1 mem_reg_3__6_ ( .D(n200), .CLK(clk), .Q(mem[38]) );
  DFFX1 mem_reg_3__5_ ( .D(n201), .CLK(clk), .Q(mem[37]) );
  DFFX1 mem_reg_3__4_ ( .D(n202), .CLK(clk), .Q(mem[36]) );
  DFFX1 mem_reg_3__3_ ( .D(n203), .CLK(clk), .Q(mem[35]) );
  DFFX1 mem_reg_3__2_ ( .D(n204), .CLK(clk), .Q(mem[34]) );
  DFFX1 mem_reg_3__1_ ( .D(n205), .CLK(clk), .Q(mem[33]) );
  DFFX1 mem_reg_3__0_ ( .D(n206), .CLK(clk), .Q(mem[32]) );
  DFFX1 mem_reg_4__7_ ( .D(n207), .CLK(clk), .Q(mem[31]) );
  DFFX1 mem_reg_4__6_ ( .D(n208), .CLK(clk), .Q(mem[30]) );
  DFFX1 mem_reg_4__5_ ( .D(n209), .CLK(clk), .Q(mem[29]) );
  DFFX1 mem_reg_4__4_ ( .D(n210), .CLK(clk), .Q(mem[28]) );
  DFFX1 mem_reg_4__3_ ( .D(n211), .CLK(clk), .Q(mem[27]) );
  DFFX1 mem_reg_4__2_ ( .D(n212), .CLK(clk), .Q(mem[26]) );
  DFFX1 mem_reg_4__1_ ( .D(n213), .CLK(clk), .Q(mem[25]) );
  DFFX1 mem_reg_4__0_ ( .D(n214), .CLK(clk), .Q(mem[24]) );
  DFFX1 mem_reg_5__7_ ( .D(n215), .CLK(clk), .Q(mem[23]) );
  DFFX1 mem_reg_5__6_ ( .D(n216), .CLK(clk), .Q(mem[22]) );
  DFFX1 mem_reg_5__5_ ( .D(n217), .CLK(clk), .Q(mem[21]) );
  DFFX1 mem_reg_5__4_ ( .D(n218), .CLK(clk), .Q(mem[20]) );
  DFFX1 mem_reg_5__3_ ( .D(n219), .CLK(clk), .Q(mem[19]) );
  DFFX1 mem_reg_5__2_ ( .D(n220), .CLK(clk), .Q(mem[18]) );
  DFFX1 mem_reg_5__1_ ( .D(n221), .CLK(clk), .Q(mem[17]) );
  DFFX1 mem_reg_5__0_ ( .D(n222), .CLK(clk), .Q(mem[16]) );
  DFFX1 mem_reg_6__7_ ( .D(n223), .CLK(clk), .Q(mem[15]) );
  DFFX1 mem_reg_6__6_ ( .D(n224), .CLK(clk), .Q(mem[14]) );
  DFFX1 mem_reg_6__5_ ( .D(n225), .CLK(clk), .Q(mem[13]) );
  DFFX1 mem_reg_6__4_ ( .D(n226), .CLK(clk), .Q(mem[12]) );
  DFFX1 mem_reg_6__3_ ( .D(n227), .CLK(clk), .Q(mem[11]) );
  DFFX1 mem_reg_6__2_ ( .D(n228), .CLK(clk), .Q(mem[10]) );
  DFFX1 mem_reg_6__1_ ( .D(n229), .CLK(clk), .Q(mem[9]) );
  DFFX1 mem_reg_6__0_ ( .D(n230), .CLK(clk), .Q(mem[8]) );
  DFFX1 mem_reg_7__7_ ( .D(n231), .CLK(clk), .Q(mem[7]) );
  DFFX1 mem_reg_7__6_ ( .D(n232), .CLK(clk), .Q(mem[6]) );
  DFFX1 mem_reg_7__5_ ( .D(n233), .CLK(clk), .Q(mem[5]) );
  DFFX1 mem_reg_7__4_ ( .D(n234), .CLK(clk), .Q(mem[4]) );
  DFFX1 mem_reg_7__3_ ( .D(n235), .CLK(clk), .Q(mem[3]) );
  DFFX1 mem_reg_7__2_ ( .D(n236), .CLK(clk), .Q(mem[2]) );
  DFFX1 mem_reg_7__1_ ( .D(n237), .CLK(clk), .Q(mem[1]) );
  DFFX1 mem_reg_7__0_ ( .D(n238), .CLK(clk), .Q(mem[0]) );
  AO22X1 U14 ( .IN1(wdata[0]), .IN2(n155), .IN3(mem[0]), .IN4(n169), .Q(n238)
         );
  AO22X1 U15 ( .IN1(wdata[1]), .IN2(n155), .IN3(mem[1]), .IN4(n169), .Q(n237)
         );
  AO22X1 U16 ( .IN1(wdata[2]), .IN2(n155), .IN3(mem[2]), .IN4(n169), .Q(n236)
         );
  AO22X1 U17 ( .IN1(wdata[3]), .IN2(n155), .IN3(mem[3]), .IN4(n169), .Q(n235)
         );
  AO22X1 U18 ( .IN1(wdata[4]), .IN2(n155), .IN3(mem[4]), .IN4(n169), .Q(n234)
         );
  AO22X1 U19 ( .IN1(wdata[5]), .IN2(n155), .IN3(mem[5]), .IN4(n168), .Q(n233)
         );
  AO22X1 U20 ( .IN1(wdata[6]), .IN2(n155), .IN3(mem[6]), .IN4(n168), .Q(n232)
         );
  AO22X1 U21 ( .IN1(wdata[7]), .IN2(n155), .IN3(mem[7]), .IN4(n168), .Q(n231)
         );
  AO22X1 U23 ( .IN1(n152), .IN2(n90), .IN3(mem[8]), .IN4(n167), .Q(n230) );
  AO22X1 U24 ( .IN1(n152), .IN2(n10), .IN3(mem[9]), .IN4(n167), .Q(n229) );
  AO22X1 U25 ( .IN1(n152), .IN2(n88), .IN3(mem[10]), .IN4(n167), .Q(n228) );
  AO22X1 U26 ( .IN1(n152), .IN2(wdata[3]), .IN3(mem[11]), .IN4(n167), .Q(n227)
         );
  AO22X1 U27 ( .IN1(n152), .IN2(wdata[4]), .IN3(mem[12]), .IN4(n167), .Q(n226)
         );
  AO22X1 U28 ( .IN1(n152), .IN2(wdata[5]), .IN3(mem[13]), .IN4(n166), .Q(n225)
         );
  AO22X1 U29 ( .IN1(n152), .IN2(wdata[6]), .IN3(mem[14]), .IN4(n166), .Q(n224)
         );
  AO22X1 U30 ( .IN1(n152), .IN2(wdata[7]), .IN3(mem[15]), .IN4(n166), .Q(n223)
         );
  AO22X1 U32 ( .IN1(n86), .IN2(n90), .IN3(mem[16]), .IN4(n165), .Q(n222) );
  AO22X1 U33 ( .IN1(n86), .IN2(wdata[1]), .IN3(mem[17]), .IN4(n165), .Q(n221)
         );
  AO22X1 U34 ( .IN1(n86), .IN2(n88), .IN3(mem[18]), .IN4(n165), .Q(n220) );
  AO22X1 U35 ( .IN1(n86), .IN2(n8), .IN3(mem[19]), .IN4(n165), .Q(n219) );
  AO22X1 U36 ( .IN1(n86), .IN2(n5), .IN3(mem[20]), .IN4(n165), .Q(n218) );
  AO22X1 U37 ( .IN1(n86), .IN2(n4), .IN3(mem[21]), .IN4(n164), .Q(n217) );
  AO22X1 U38 ( .IN1(n86), .IN2(n6), .IN3(mem[22]), .IN4(n164), .Q(n216) );
  AO22X1 U39 ( .IN1(n86), .IN2(n3), .IN3(mem[23]), .IN4(n164), .Q(n215) );
  AO22X1 U41 ( .IN1(n11), .IN2(n90), .IN3(mem[24]), .IN4(n163), .Q(n214) );
  AO22X1 U42 ( .IN1(n11), .IN2(n10), .IN3(mem[25]), .IN4(n163), .Q(n213) );
  AO22X1 U43 ( .IN1(n11), .IN2(n88), .IN3(mem[26]), .IN4(n163), .Q(n212) );
  AO22X1 U44 ( .IN1(n11), .IN2(n8), .IN3(mem[27]), .IN4(n163), .Q(n211) );
  AO22X1 U45 ( .IN1(n11), .IN2(n5), .IN3(mem[28]), .IN4(n163), .Q(n210) );
  AO22X1 U46 ( .IN1(n11), .IN2(n4), .IN3(mem[29]), .IN4(n162), .Q(n209) );
  AO22X1 U47 ( .IN1(n11), .IN2(n6), .IN3(mem[30]), .IN4(n162), .Q(n208) );
  AO22X1 U48 ( .IN1(n11), .IN2(n3), .IN3(mem[31]), .IN4(n162), .Q(n207) );
  AND2X1 U50 ( .IN1(we), .IN2(waddr[2]), .Q(n247) );
  AO22X1 U51 ( .IN1(n154), .IN2(n90), .IN3(mem[32]), .IN4(n161), .Q(n206) );
  AO22X1 U52 ( .IN1(n154), .IN2(n10), .IN3(mem[33]), .IN4(n161), .Q(n205) );
  AO22X1 U53 ( .IN1(n154), .IN2(n88), .IN3(mem[34]), .IN4(n161), .Q(n204) );
  AO22X1 U54 ( .IN1(n154), .IN2(n8), .IN3(mem[35]), .IN4(n161), .Q(n203) );
  AO22X1 U55 ( .IN1(n154), .IN2(n5), .IN3(mem[36]), .IN4(n161), .Q(n202) );
  AO22X1 U56 ( .IN1(n154), .IN2(n4), .IN3(mem[37]), .IN4(n160), .Q(n201) );
  AO22X1 U57 ( .IN1(n154), .IN2(n6), .IN3(mem[38]), .IN4(n160), .Q(n200) );
  AO22X1 U58 ( .IN1(n154), .IN2(n3), .IN3(mem[39]), .IN4(n160), .Q(n199) );
  AO22X1 U60 ( .IN1(n153), .IN2(n90), .IN3(mem[40]), .IN4(n159), .Q(n198) );
  AO22X1 U61 ( .IN1(n153), .IN2(n10), .IN3(mem[41]), .IN4(n159), .Q(n197) );
  AO22X1 U62 ( .IN1(n153), .IN2(n88), .IN3(mem[42]), .IN4(n159), .Q(n196) );
  AO22X1 U63 ( .IN1(n153), .IN2(n8), .IN3(mem[43]), .IN4(n159), .Q(n195) );
  AO22X1 U64 ( .IN1(n153), .IN2(n5), .IN3(mem[44]), .IN4(n159), .Q(n194) );
  AO22X1 U65 ( .IN1(n153), .IN2(n4), .IN3(mem[45]), .IN4(n158), .Q(n193) );
  AO22X1 U66 ( .IN1(n153), .IN2(n6), .IN3(mem[46]), .IN4(n158), .Q(n192) );
  AO22X1 U67 ( .IN1(n153), .IN2(n3), .IN3(mem[47]), .IN4(n158), .Q(n191) );
  AO22X1 U69 ( .IN1(n173), .IN2(wdata[0]), .IN3(mem[48]), .IN4(n157), .Q(n190)
         );
  AO22X1 U70 ( .IN1(n173), .IN2(n10), .IN3(mem[49]), .IN4(n157), .Q(n189) );
  AO22X1 U71 ( .IN1(n173), .IN2(wdata[2]), .IN3(mem[50]), .IN4(n157), .Q(n188)
         );
  AO22X1 U72 ( .IN1(n173), .IN2(n8), .IN3(mem[51]), .IN4(n157), .Q(n187) );
  AO22X1 U73 ( .IN1(n173), .IN2(n5), .IN3(mem[52]), .IN4(n157), .Q(n186) );
  AO22X1 U74 ( .IN1(n173), .IN2(n4), .IN3(mem[53]), .IN4(n157), .Q(n185) );
  AO22X1 U75 ( .IN1(n173), .IN2(n6), .IN3(mem[54]), .IN4(n157), .Q(n184) );
  AO22X1 U76 ( .IN1(n173), .IN2(n3), .IN3(mem[55]), .IN4(n240), .Q(n183) );
  AO22X1 U78 ( .IN1(n172), .IN2(n90), .IN3(mem[56]), .IN4(n156), .Q(n182) );
  AO22X1 U79 ( .IN1(n172), .IN2(n10), .IN3(mem[57]), .IN4(n156), .Q(n181) );
  AO22X1 U80 ( .IN1(n172), .IN2(n88), .IN3(mem[58]), .IN4(n156), .Q(n180) );
  AO22X1 U81 ( .IN1(n172), .IN2(n8), .IN3(mem[59]), .IN4(n156), .Q(n179) );
  AO22X1 U82 ( .IN1(n172), .IN2(n5), .IN3(mem[60]), .IN4(n156), .Q(n178) );
  AO22X1 U83 ( .IN1(n172), .IN2(n4), .IN3(mem[61]), .IN4(n156), .Q(n177) );
  AO22X1 U84 ( .IN1(n172), .IN2(n6), .IN3(mem[62]), .IN4(n156), .Q(n176) );
  AO22X1 U85 ( .IN1(n172), .IN2(n3), .IN3(mem[63]), .IN4(n239), .Q(n175) );
  NBUFFX2 U2 ( .INP(n150), .Z(n96) );
  NBUFFX2 U3 ( .INP(n125), .Z(n140) );
  NBUFFX2 U4 ( .INP(n134), .Z(n95) );
  NBUFFX2 U5 ( .INP(n125), .Z(n147) );
  NBUFFX2 U6 ( .INP(n125), .Z(n139) );
  NBUFFX2 U7 ( .INP(n128), .Z(n135) );
  NAND3X0 U8 ( .IN1(n247), .IN2(n96), .IN3(n170), .QN(n245) );
  NAND3X0 U9 ( .IN1(n171), .IN2(n96), .IN3(n247), .QN(n244) );
  AOI221X1 U10 ( .IN1(mem[25]), .IN2(n149), .IN3(mem[9]), .IN4(n138), .IN5(
        n102), .QN(n94) );
  NBUFFX2 U11 ( .INP(n245), .Z(n165) );
  NBUFFX2 U12 ( .INP(n240), .Z(n157) );
  NBUFFX2 U13 ( .INP(n239), .Z(n156) );
  NAND3X0 U22 ( .IN1(n247), .IN2(n171), .IN3(n151), .QN(n246) );
  NAND3X0 U31 ( .IN1(n151), .IN2(n171), .IN3(n242), .QN(n241) );
  NBUFFX2 U40 ( .INP(n245), .Z(n164) );
  NAND3X0 U49 ( .IN1(n151), .IN2(n170), .IN3(n242), .QN(n243) );
  NAND3X0 U59 ( .IN1(n170), .IN2(n247), .IN3(n151), .QN(n248) );
  NAND3X0 U68 ( .IN1(n170), .IN2(n96), .IN3(n242), .QN(n240) );
  INVX0 U77 ( .INP(raddr[0]), .ZN(n1) );
  INVX0 U86 ( .INP(n1), .ZN(n2) );
  NBUFFX2 U87 ( .INP(wdata[7]), .Z(n3) );
  NBUFFX2 U88 ( .INP(wdata[5]), .Z(n4) );
  NBUFFX2 U89 ( .INP(wdata[4]), .Z(n5) );
  NBUFFX2 U90 ( .INP(wdata[6]), .Z(n6) );
  INVX0 U91 ( .INP(wdata[3]), .ZN(n7) );
  INVX0 U92 ( .INP(n7), .ZN(n8) );
  INVX0 U93 ( .INP(wdata[1]), .ZN(n9) );
  INVX0 U94 ( .INP(n9), .ZN(n10) );
  INVX0 U95 ( .INP(n244), .ZN(n11) );
  INVX0 U96 ( .INP(n245), .ZN(n86) );
  INVX0 U97 ( .INP(wdata[2]), .ZN(n87) );
  INVX0 U98 ( .INP(n87), .ZN(n88) );
  INVX0 U99 ( .INP(wdata[0]), .ZN(n89) );
  INVX0 U100 ( .INP(n89), .ZN(n90) );
  INVX0 U101 ( .INP(n134), .ZN(n91) );
  NBUFFX2 U102 ( .INP(n2), .Z(n92) );
  OAI22X1 U103 ( .IN1(n93), .IN2(n134), .IN3(n94), .IN4(n91), .QN(rdata[1]) );
  AOI221X2 U104 ( .IN1(mem[17]), .IN2(n149), .IN3(mem[1]), .IN4(n138), .IN5(
        n101), .QN(n93) );
  NBUFFX2 U105 ( .INP(n124), .Z(n144) );
  NBUFFX2 U106 ( .INP(n124), .Z(n142) );
  NBUFFX2 U107 ( .INP(n124), .Z(n145) );
  NBUFFX2 U108 ( .INP(n128), .Z(n136) );
  NBUFFX2 U109 ( .INP(n128), .Z(n148) );
  NBUFFX2 U110 ( .INP(n128), .Z(n149) );
  NBUFFX4 U111 ( .INP(n125), .Z(n146) );
  INVX0 U112 ( .INP(n240), .ZN(n173) );
  INVX0 U113 ( .INP(n239), .ZN(n172) );
  NBUFFX2 U114 ( .INP(n127), .Z(n137) );
  NBUFFX2 U115 ( .INP(n127), .Z(n138) );
  NBUFFX2 U116 ( .INP(n244), .Z(n162) );
  NBUFFX2 U117 ( .INP(n248), .Z(n168) );
  NBUFFX2 U118 ( .INP(n246), .Z(n166) );
  NBUFFX2 U119 ( .INP(n243), .Z(n160) );
  NBUFFX2 U120 ( .INP(n241), .Z(n158) );
  NBUFFX2 U121 ( .INP(n248), .Z(n169) );
  NBUFFX2 U122 ( .INP(n246), .Z(n167) );
  NBUFFX2 U123 ( .INP(n243), .Z(n161) );
  NBUFFX2 U124 ( .INP(n241), .Z(n159) );
  NBUFFX2 U125 ( .INP(n244), .Z(n163) );
  NAND3X0 U126 ( .IN1(n171), .IN2(n96), .IN3(n242), .QN(n239) );
  NOR2X0 U127 ( .IN1(n174), .IN2(waddr[2]), .QN(n242) );
  INVX0 U128 ( .INP(we), .ZN(n174) );
  NOR2X0 U129 ( .IN1(n131), .IN2(raddr[1]), .QN(n128) );
  NOR2X0 U130 ( .IN1(raddr[1]), .IN2(n132), .QN(n124) );
  AO22X1 U131 ( .IN1(mem[32]), .IN2(n147), .IN3(mem[48]), .IN4(n145), .Q(n97)
         );
  AO221X1 U132 ( .IN1(mem[16]), .IN2(n135), .IN3(mem[0]), .IN4(n138), .IN5(n97), .Q(n100) );
  AO22X1 U133 ( .IN1(mem[40]), .IN2(n146), .IN3(mem[56]), .IN4(n144), .Q(n98)
         );
  AO221X1 U134 ( .IN1(mem[24]), .IN2(n148), .IN3(mem[8]), .IN4(n138), .IN5(n98), .Q(n99) );
  AO22X1 U135 ( .IN1(n100), .IN2(n92), .IN3(n99), .IN4(n95), .Q(rdata[0]) );
  AO22X1 U136 ( .IN1(mem[33]), .IN2(n139), .IN3(mem[49]), .IN4(n141), .Q(n101)
         );
  AO22X1 U137 ( .IN1(mem[41]), .IN2(n146), .IN3(mem[57]), .IN4(n144), .Q(n102)
         );
  AO22X1 U138 ( .IN1(mem[34]), .IN2(n140), .IN3(mem[50]), .IN4(n142), .Q(n103)
         );
  AO221X1 U139 ( .IN1(mem[18]), .IN2(n148), .IN3(mem[2]), .IN4(n138), .IN5(
        n103), .Q(n106) );
  AO22X1 U140 ( .IN1(mem[42]), .IN2(n147), .IN3(mem[58]), .IN4(n145), .Q(n104)
         );
  AO221X1 U141 ( .IN1(mem[26]), .IN2(n148), .IN3(mem[10]), .IN4(n138), .IN5(
        n104), .Q(n105) );
  AO22X1 U142 ( .IN1(n106), .IN2(n92), .IN3(n105), .IN4(n134), .Q(rdata[2]) );
  AO22X1 U143 ( .IN1(mem[35]), .IN2(n146), .IN3(mem[51]), .IN4(n144), .Q(n107)
         );
  AO221X1 U144 ( .IN1(mem[19]), .IN2(n136), .IN3(mem[3]), .IN4(n143), .IN5(
        n107), .Q(n110) );
  AO22X1 U145 ( .IN1(mem[43]), .IN2(n139), .IN3(mem[59]), .IN4(n141), .Q(n108)
         );
  AO221X1 U146 ( .IN1(mem[27]), .IN2(n135), .IN3(mem[11]), .IN4(n137), .IN5(
        n108), .Q(n109) );
  AO22X1 U147 ( .IN1(n110), .IN2(n92), .IN3(n109), .IN4(n95), .Q(rdata[3]) );
  AO22X1 U148 ( .IN1(mem[36]), .IN2(n147), .IN3(mem[52]), .IN4(n145), .Q(n111)
         );
  AO221X1 U149 ( .IN1(mem[20]), .IN2(n136), .IN3(mem[4]), .IN4(n143), .IN5(
        n111), .Q(n114) );
  AO22X1 U150 ( .IN1(mem[44]), .IN2(n140), .IN3(mem[60]), .IN4(n142), .Q(n112)
         );
  AO221X1 U151 ( .IN1(mem[28]), .IN2(n149), .IN3(mem[12]), .IN4(n137), .IN5(
        n112), .Q(n113) );
  AO22X1 U152 ( .IN1(n114), .IN2(n92), .IN3(n113), .IN4(n1), .Q(rdata[4]) );
  AO22X1 U153 ( .IN1(mem[37]), .IN2(n139), .IN3(mem[53]), .IN4(n141), .Q(n115)
         );
  AO221X1 U154 ( .IN1(mem[21]), .IN2(n136), .IN3(mem[5]), .IN4(n143), .IN5(
        n115), .Q(n118) );
  AO22X1 U155 ( .IN1(mem[45]), .IN2(n146), .IN3(mem[61]), .IN4(n144), .Q(n116)
         );
  AO221X1 U156 ( .IN1(mem[29]), .IN2(n148), .IN3(mem[13]), .IN4(n137), .IN5(
        n116), .Q(n117) );
  AO22X1 U157 ( .IN1(n118), .IN2(n92), .IN3(n117), .IN4(n95), .Q(rdata[5]) );
  AO22X1 U158 ( .IN1(mem[38]), .IN2(n140), .IN3(mem[54]), .IN4(n142), .Q(n119)
         );
  AO221X1 U159 ( .IN1(mem[22]), .IN2(n136), .IN3(mem[6]), .IN4(n143), .IN5(
        n119), .Q(n122) );
  AO22X1 U160 ( .IN1(mem[46]), .IN2(n147), .IN3(mem[62]), .IN4(n145), .Q(n120)
         );
  AO221X1 U161 ( .IN1(mem[30]), .IN2(n135), .IN3(mem[14]), .IN4(n137), .IN5(
        n120), .Q(n121) );
  AO22X1 U162 ( .IN1(n122), .IN2(n92), .IN3(n121), .IN4(n134), .Q(rdata[6]) );
  AO22X1 U163 ( .IN1(mem[39]), .IN2(n140), .IN3(mem[55]), .IN4(n142), .Q(n123)
         );
  AO221X1 U164 ( .IN1(mem[23]), .IN2(n149), .IN3(mem[7]), .IN4(n143), .IN5(
        n123), .Q(n130) );
  AO22X1 U165 ( .IN1(mem[47]), .IN2(n139), .IN3(mem[63]), .IN4(n141), .Q(n126)
         );
  AO221X1 U166 ( .IN1(mem[31]), .IN2(n135), .IN3(mem[15]), .IN4(n137), .IN5(
        n126), .Q(n129) );
  AO22X1 U167 ( .IN1(n130), .IN2(n92), .IN3(n129), .IN4(n134), .Q(rdata[7]) );
  INVX0 U168 ( .INP(raddr[2]), .ZN(n131) );
  INVX0 U169 ( .INP(n131), .ZN(n132) );
  INVX0 U170 ( .INP(raddr[1]), .ZN(n133) );
  INVX0 U171 ( .INP(n2), .ZN(n134) );
  NOR2X0 U172 ( .IN1(n131), .IN2(n133), .QN(n127) );
  NBUFFX2 U173 ( .INP(n124), .Z(n141) );
  NOR2X0 U174 ( .IN1(n133), .IN2(n132), .QN(n125) );
  NOR2X0 U175 ( .IN1(n131), .IN2(n133), .QN(n143) );
  INVX0 U176 ( .INP(waddr[1]), .ZN(n150) );
  INVX0 U177 ( .INP(n150), .ZN(n151) );
  INVX0 U178 ( .INP(n166), .ZN(n152) );
  INVX0 U179 ( .INP(n158), .ZN(n153) );
  INVX0 U180 ( .INP(n160), .ZN(n154) );
  INVX0 U181 ( .INP(n248), .ZN(n155) );
  INVX0 U182 ( .INP(n171), .ZN(n170) );
  INVX0 U183 ( .INP(waddr[0]), .ZN(n171) );
endmodule


module payload_ram ( clk, reset, we, waddr, wdata, raddr, rdata );
  input [6:0] waddr;
  input [7:0] wdata;
  input [6:0] raddr;
  output [7:0] rdata;
  input clk, reset, we;
  wire   N73, N90, N91, N92, N93, N94, N95, N96, N97, n1, n2, n3, n4, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n27, n28, n29, n30, n32, n33,
         n34, n35, n36, n38, n44, n52, n53, n54, n55, n61, n62, n64, n70, n71,
         n72, n73, n80, n82, n89, n91, n98, n107, n112, n115, n118, n119, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, net23574, net23575, net23577, net28907, net29117, net29116,
         net29123, net29122, net30474, net30503, net30615, net30706, net30745,
         net30826, net30825, net30859, net30898, net30897, net30961, net31127,
         net31131, net33240, net34583, net34660, net34658, net34942, net35039,
         net35038, net35224, net35228, net35226, net35235, net35423, net35495,
         net35741, net35810, net35841, net35854, net35853, net35863, net36018,
         net36143, n116, n110, net36524, net36557, net36611, net36618,
         net36626, net36627, net36631, net36635, net36640, net36643, net36648,
         net36651, net36825, net36816, net36798, net36789, net36788, net36982,
         net37002, net37248, net37277, net37479, net37478, net37477, net37476,
         net37475, net37474, net37463, net37462, net37461, net37419, net37403,
         net37402, net37662, net37846, net37837, net37816, net37749, net37744,
         net39127, n5, n6, n7, n8, n9, n11, n22, n23, n24, n25, n26, n31, n37,
         n39, n40, n41, n42, n43, n45, n46, n47, n48, n49, n50, n51, n56, n57,
         n58, n59, n60, n63, n65, n66, n67, n68, n69, n74, n75, n76, n77, n78,
         n79, n81, n83, n84, n85, n86, n87, n88, n90, n92, n93, n94, n95, n96,
         n97, n99, n100, n101, n102, n103, n104, n105, n106, n108, n109, n111,
         n113, n114, n117, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217,
         n218, n219, n220, n221, n222, n223, n224, n225, n226, n227, n228,
         n229, n230, n231, n232, n233, n234, n235, n236, n237, n238, n239,
         n240, n241, n242, n243, n244, n245, n246, n247, n248, n249, n250,
         n251, n252, n253, n254, n255, n256, n257, n258, n259, n260, n261,
         n262, n263, n264, n265, n266, n267, n268, n269, n270, n271, n272,
         n273, n274, n275, n276, n277, n278, n279, n280, n281, n282, n283,
         n284, n285, n286, n287, n288, n289, n290, n291, n292, n293, n294,
         n295, n296, n297, n298, n299, n300, n301, n302, n303, n304, n305,
         n306, n307, n308, n309, n310, n311, n312, n313, n314, n315, n316,
         n317, n318, n319, n320, n321, n322, n323, n324, n325, n326, n327,
         n328, n329, n330, n331, n332, n333, n334, n335, n336, n337, n338,
         n339, n340, n341, n342, n343, n344, n345, n346, n347, n348, n349,
         n350, n351, n352, n353, n354, n355, n356, n357, n358, n359, n360,
         n361, n362, n363, n364, n365, n366, n367, n368, n369, n370, n371,
         n372, n373, n374, n375, n376, n377, n378, n379, n380, n381, n382,
         n383, n384, n385, n386, n387, n388, n389, n390, n391, n392, n393,
         n394, n395, n396, n397, n398, n399;
  wire   [6:0] waddr_q;
  wire   [15:0] bank_we;
  wire   [7:0] wdata_q;
  wire   [7:0] bank_rdata0;
  wire   [7:0] bank_rdata1;
  wire   [7:0] bank_rdata2;
  wire   [7:0] bank_rdata3;
  wire   [7:0] bank_rdata4;
  wire   [7:0] bank_rdata5;
  wire   [7:0] bank_rdata6;
  wire   [7:0] bank_rdata7;
  wire   [7:0] bank_rdata8;
  wire   [7:0] bank_rdata9;
  wire   [7:0] bank_rdata10;
  wire   [7:0] bank_rdata11;
  wire   [7:0] bank_rdata12;
  wire   [7:0] bank_rdata13;
  wire   [7:0] bank_rdata14;
  wire   [7:0] bank_rdata15;

  DFFX1 we_q_reg ( .D(N73), .CLK(clk), .QN(n1) );
  DFFX1 waddr_q_reg_6_ ( .D(n124), .CLK(clk), .Q(waddr_q[6]), .QN(n277) );
  DFFX1 waddr_q_reg_5_ ( .D(n123), .CLK(clk), .Q(waddr_q[5]), .QN(n2) );
  DFFX1 waddr_q_reg_4_ ( .D(n122), .CLK(clk), .Q(waddr_q[4]), .QN(n3) );
  DFFX1 waddr_q_reg_3_ ( .D(n121), .CLK(clk), .Q(waddr_q[3]), .QN(n4) );
  DFFX1 waddr_q_reg_2_ ( .D(n120), .CLK(clk), .Q(waddr_q[2]), .QN(n191) );
  DFFX1 waddr_q_reg_0_ ( .D(n118), .CLK(clk), .Q(waddr_q[0]), .QN(n248) );
  DFFX1 rdata_reg_7_ ( .D(N97), .CLK(clk), .Q(rdata[7]) );
  DFFX1 rdata_reg_6_ ( .D(N96), .CLK(clk), .Q(rdata[6]) );
  DFFX1 rdata_reg_5_ ( .D(N95), .CLK(clk), .Q(rdata[5]) );
  DFFX1 rdata_reg_4_ ( .D(N94), .CLK(clk), .Q(rdata[4]) );
  DFFX1 rdata_reg_3_ ( .D(N93), .CLK(clk), .Q(rdata[3]) );
  DFFX1 rdata_reg_2_ ( .D(N92), .CLK(clk), .Q(rdata[2]) );
  DFFX1 rdata_reg_1_ ( .D(N91), .CLK(clk), .Q(rdata[1]) );
  DFFX1 rdata_reg_0_ ( .D(N90), .CLK(clk), .Q(rdata[0]) );
  AO22X1 U61 ( .IN1(n278), .IN2(net37002), .IN3(waddr[1]), .IN4(n399), .Q(n119) );
  AO22X1 U62 ( .IN1(n245), .IN2(net29123), .IN3(waddr[2]), .IN4(n398), .Q(n120) );
  AO22X1 U63 ( .IN1(waddr_q[3]), .IN2(net37002), .IN3(waddr[3]), .IN4(n396),
        .Q(n121) );
  AO22X1 U64 ( .IN1(waddr_q[4]), .IN2(net29122), .IN3(waddr[4]), .IN4(n396),
        .Q(n122) );
  AO22X1 U65 ( .IN1(waddr_q[5]), .IN2(net29123), .IN3(waddr[5]), .IN4(net29117), .Q(n123) );
  AO22X1 U66 ( .IN1(waddr_q[6]), .IN2(net37002), .IN3(waddr[6]), .IN4(n398),
        .Q(n124) );
  AO22X1 U67 ( .IN1(wdata_q[0]), .IN2(n397), .IN3(wdata[0]), .IN4(n399), .Q(
        n125) );
  AO22X1 U68 ( .IN1(n369), .IN2(net37002), .IN3(wdata[1]), .IN4(net36018), .Q(
        n126) );
  AO22X1 U69 ( .IN1(wdata_q[2]), .IN2(net29123), .IN3(wdata[2]), .IN4(net29116), .Q(n127) );
  AO22X1 U71 ( .IN1(n304), .IN2(n397), .IN3(wdata[4]), .IN4(n399), .Q(n129) );
  AO22X1 U72 ( .IN1(n359), .IN2(net29123), .IN3(wdata[5]), .IN4(n396), .Q(n130) );
  AO22X1 U73 ( .IN1(wdata_q[6]), .IN2(net37002), .IN3(wdata[6]), .IN4(net36018), .Q(n131) );
  AO22X1 U74 ( .IN1(n356), .IN2(n397), .IN3(wdata[7]), .IN4(n398), .Q(n132) );
  AO22X1 U77 ( .IN1(bank_rdata2[7]), .IN2(n30), .IN3(bank_rdata3[7]), .IN4(
        net36557), .Q(n29) );
  AO22X1 U99 ( .IN1(bank_rdata14[5]), .IN2(net36643), .IN3(bank_rdata15[5]),
        .IN4(net36651), .Q(n64) );
  AO22X1 U101 ( .IN1(bank_rdata2[4]), .IN2(n30), .IN3(bank_rdata3[4]), .IN4(
        net36557), .Q(n70) );
  AO22X1 U111 ( .IN1(bank_rdata6[3]), .IN2(n198), .IN3(bank_rdata7[3]), .IN4(
        n36), .Q(n80) );
  AO22X1 U115 ( .IN1(bank_rdata14[3]), .IN2(net36640), .IN3(bank_rdata15[3]),
        .IN4(net36648), .Q(n82) );
  AO22X1 U123 ( .IN1(bank_rdata14[2]), .IN2(net36640), .IN3(bank_rdata15[2]),
        .IN4(net36648), .Q(n91) );
  AO22X1 U127 ( .IN1(bank_rdata6[1]), .IN2(n198), .IN3(bank_rdata7[1]), .IN4(
        n36), .Q(n98) );
  DFFX1 wdata_q_reg_1_ ( .D(n126), .CLK(clk), .Q(wdata_q[1]), .QN(n363) );
  DFFX1 wdata_q_reg_3_ ( .D(n128), .CLK(clk), .Q(wdata_q[3]), .QN(net30474) );
  DFFX1 wdata_q_reg_5_ ( .D(n130), .CLK(clk), .Q(wdata_q[5]), .QN(n358) );
  DFFX1 wdata_q_reg_7_ ( .D(n132), .CLK(clk), .Q(wdata_q[7]), .QN(n355) );
  DFFX1 wdata_q_reg_0_ ( .D(n125), .CLK(clk), .Q(wdata_q[0]), .QN(n364) );
  DFFX1 wdata_q_reg_2_ ( .D(n127), .CLK(clk), .Q(wdata_q[2]), .QN(n362) );
  DFFX1 wdata_q_reg_4_ ( .D(n129), .CLK(clk), .Q(wdata_q[4]), .QN(n360) );
  DFFX1 wdata_q_reg_6_ ( .D(n131), .CLK(clk), .Q(wdata_q[6]), .QN(n357) );
  DFFX1 waddr_q_reg_1_ ( .D(n119), .CLK(clk), .Q(waddr_q[1]), .QN(n295) );
  DELLN1X2 U3 ( .INP(net39127), .Z(net29122) );
  NBUFFX2 U6 ( .INP(n395), .Z(net29123) );
  NBUFFX2 U7 ( .INP(net39127), .Z(net37002) );
  NAND2X0 U9 ( .IN1(n5), .IN2(n6), .QN(n128) );
  NAND2X0 U10 ( .IN1(net28907), .IN2(net29122), .QN(n5) );
  NBUFFX2 U11 ( .INP(net30615), .Z(net28907) );
  NAND2X1 U12 ( .IN1(wdata[3]), .IN2(net29117), .QN(n6) );
  INVX0 U13 ( .INP(net33240), .ZN(net29117) );
  NBUFFX4 U14 ( .INP(raddr[2]), .Z(n266) );
  OR2X1 U15 ( .IN1(n7), .IN2(n8), .Q(n105) );
  NAND2X1 U16 ( .IN1(net31131), .IN2(n279), .QN(n7) );
  NAND2X0 U17 ( .IN1(n280), .IN2(n281), .QN(n8) );
  NBUFFX4 U18 ( .INP(n240), .Z(n366) );
  INVX0 U19 ( .INP(net36982), .ZN(n9) );
  INVX0 U20 ( .INP(n9), .ZN(n11) );
  NBUFFX2 U21 ( .INP(n342), .Z(n387) );
  NOR2X0 U23 ( .IN1(n207), .IN2(n159), .QN(n22) );
  NOR2X0 U24 ( .IN1(n22), .IN2(n23), .QN(n99) );
  OR2X1 U25 ( .IN1(n24), .IN2(n93), .Q(n23) );
  INVX0 U26 ( .INP(n217), .ZN(n24) );
  NOR2X0 U27 ( .IN1(n25), .IN2(n26), .QN(n227) );
  NAND2X0 U28 ( .IN1(n95), .IN2(n40), .QN(n25) );
  NAND2X0 U29 ( .IN1(n135), .IN2(n289), .QN(n26) );
  OR3X1 U30 ( .IN1(n49), .IN2(n50), .IN3(n61), .Q(n39) );
  NBUFFX4 U31 ( .INP(n235), .Z(n240) );
  INVX0 U32 ( .INP(n282), .ZN(n31) );
  AND2X1 U33 ( .IN1(net31127), .IN2(n37), .Q(n193) );
  NOR2X0 U34 ( .IN1(n39), .IN2(n31), .QN(n37) );
  AND2X4 U35 ( .IN1(n94), .IN2(n181), .Q(n40) );
  AND2X1 U36 ( .IN1(n285), .IN2(n284), .Q(n41) );
  AND2X1 U37 ( .IN1(n287), .IN2(n41), .Q(n195) );
  AND2X1 U38 ( .IN1(bank_rdata1[7]), .IN2(n27), .Q(n42) );
  AND2X1 U39 ( .IN1(bank_rdata0[7]), .IN2(n160), .Q(n43) );
  NOR3X0 U40 ( .IN1(n42), .IN2(n43), .IN3(n29), .QN(n290) );
  NOR2X1 U41 ( .IN1(n48), .IN2(n47), .QN(n45) );
  NOR2X0 U42 ( .IN1(n52), .IN2(n46), .QN(n281) );
  INVX1 U43 ( .INP(n45), .ZN(n46) );
  AND2X2 U44 ( .IN1(bank_rdata1[6]), .IN2(n27), .Q(n47) );
  AND2X1 U45 ( .IN1(bank_rdata0[6]), .IN2(net35854), .Q(n48) );
  AND2X1 U46 ( .IN1(bank_rdata1[5]), .IN2(n27), .Q(n49) );
  AND2X1 U47 ( .IN1(bank_rdata0[5]), .IN2(n160), .Q(n50) );
  AND2X1 U48 ( .IN1(n103), .IN2(net37837), .Q(n51) );
  AND2X1 U49 ( .IN1(n104), .IN2(n51), .Q(net31127) );
  OR2X2 U50 ( .IN1(n163), .IN2(n159), .Q(n104) );
  DELLN1X2 U51 ( .INP(raddr[1]), .Z(n75) );
  NBUFFX2 U52 ( .INP(n246), .Z(n390) );
  DELLN1X2 U53 ( .INP(n246), .Z(n297) );
  DELLN1X2 U54 ( .INP(raddr[1]), .Z(n246) );
  INVX0 U55 ( .INP(n84), .ZN(n141) );
  OR2X1 U56 ( .IN1(n79), .IN2(net35810), .Q(net36789) );
  INVX0 U57 ( .INP(net36789), .ZN(n142) );
  NOR2X0 U58 ( .IN1(n67), .IN2(n187), .QN(n188) );
  NAND2X0 U59 ( .IN1(bank_rdata11[2]), .IN2(n141), .QN(net37479) );
  INVX0 U60 ( .INP(n83), .ZN(net37277) );
  NBUFFX4 U70 ( .INP(net36798), .Z(n159) );
  INVX0 U75 ( .INP(bank_rdata1[3]), .ZN(n145) );
  OR2X1 U76 ( .IN1(net36789), .IN2(n146), .Q(n100) );
  NAND2X1 U78 ( .IN1(bank_rdata11[3]), .IN2(n141), .QN(n153) );
  NAND2X0 U79 ( .IN1(bank_rdata2[5]), .IN2(n142), .QN(net37402) );
  NAND2X0 U80 ( .IN1(bank_rdata11[7]), .IN2(net36618), .QN(n138) );
  INVX0 U81 ( .INP(bank_rdata9[7]), .ZN(n164) );
  NAND3X0 U82 ( .IN1(n63), .IN2(n168), .IN3(net37816), .QN(n167) );
  NAND2X0 U83 ( .IN1(bank_rdata11[1]), .IN2(net37749), .QN(n171) );
  NAND3X0 U84 ( .IN1(n174), .IN2(n175), .IN3(n176), .QN(n173) );
  NAND2X0 U85 ( .IN1(n178), .IN2(n179), .QN(n177) );
  NAND2X0 U86 ( .IN1(bank_rdata2[2]), .IN2(n142), .QN(net37474) );
  AOI221X1 U87 ( .IN1(bank_rdata13[2]), .IN2(net36627), .IN3(bank_rdata12[2]),
        .IN4(net36631), .IN5(n91), .QN(net35226) );
  NAND2X0 U88 ( .IN1(bank_rdata10[2]), .IN2(net37744), .QN(net37477) );
  NBUFFX2 U89 ( .INP(net23575), .Z(n92) );
  NBUFFX4 U90 ( .INP(n240), .Z(n388) );
  DELLN1X2 U91 ( .INP(waddr_q[1]), .Z(n381) );
  DELLN1X2 U92 ( .INP(waddr_q[1]), .Z(n256) );
  NBUFFX2 U93 ( .INP(n387), .Z(n386) );
  NBUFFX2 U94 ( .INP(n56), .Z(net36524) );
  AND2X1 U95 ( .IN1(raddr[5]), .IN2(n111), .Q(n56) );
  NBUFFX2 U96 ( .INP(wdata_q[4]), .Z(n372) );
  AND2X1 U97 ( .IN1(n220), .IN2(n219), .Q(n96) );
  NAND2X1 U98 ( .IN1(bank_rdata2[1]), .IN2(n142), .QN(net37816) );
  INVX0 U100 ( .INP(bank_rdata1[1]), .ZN(n165) );
  INVX0 U102 ( .INP(net37461), .ZN(net37744) );
  DELLN1X2 U103 ( .INP(wdata_q[5]), .Z(n373) );
  DELLN1X2 U104 ( .INP(wdata_q[7]), .Z(n377) );
  NBUFFX2 U105 ( .INP(n343), .Z(n316) );
  NBUFFX2 U106 ( .INP(net30615), .Z(net30859) );
  NBUFFX2 U107 ( .INP(n350), .Z(n313) );
  NOR2X0 U108 ( .IN1(n66), .IN2(n147), .QN(n148) );
  NAND2X1 U109 ( .IN1(bank_rdata9[3]), .IN2(net37277), .QN(n152) );
  AOI221X1 U110 ( .IN1(bank_rdata13[3]), .IN2(net36627), .IN3(bank_rdata12[3]),
        .IN4(net36631), .IN5(n82), .QN(net34658) );
  NAND2X1 U112 ( .IN1(bank_rdata10[3]), .IN2(n140), .QN(n151) );
  AOI221X1 U113 ( .IN1(bank_rdata9[4]), .IN2(net37277), .IN3(bank_rdata8[4]),
        .IN4(n162), .IN5(n72), .QN(n285) );
  AO22X1 U114 ( .IN1(bank_rdata10[4]), .IN2(net36611), .IN3(bank_rdata11[4]),
        .IN4(net36618), .Q(n72) );
  AOI221X1 U116 ( .IN1(bank_rdata13[4]), .IN2(net36626), .IN3(bank_rdata12[4]),
        .IN4(net36635), .IN5(n73), .QN(n284) );
  AO22X1 U117 ( .IN1(bank_rdata14[4]), .IN2(net36643), .IN3(bank_rdata15[4]),
        .IN4(net36651), .Q(n73) );
  AOI221X1 U118 ( .IN1(bank_rdata1[4]), .IN2(n27), .IN3(bank_rdata0[4]), .IN4(
        net35854), .IN5(n70), .QN(n287) );
  AO22X1 U119 ( .IN1(bank_rdata10[6]), .IN2(net36611), .IN3(bank_rdata11[6]),
        .IN4(net36618), .Q(n54) );
  AO22X1 U120 ( .IN1(bank_rdata14[6]), .IN2(net36643), .IN3(bank_rdata15[6]),
        .IN4(net36651), .Q(n55) );
  AOI221X1 U121 ( .IN1(bank_rdata13[7]), .IN2(net36626), .IN3(bank_rdata12[7]),
        .IN4(net36635), .IN5(n44), .QN(n288) );
  AO22X1 U122 ( .IN1(bank_rdata14[7]), .IN2(net36643), .IN3(bank_rdata15[7]),
        .IN4(net36651), .Q(n44) );
  AOI221X1 U124 ( .IN1(bank_rdata5[7]), .IN2(n32), .IN3(bank_rdata4[7]), .IN4(
        n114), .IN5(n34), .QN(n289) );
  AOI221X1 U125 ( .IN1(bank_rdata5[1]), .IN2(n32), .IN3(bank_rdata4[1]), .IN4(
        n33), .IN5(n98), .QN(net35224) );
  AOI221X1 U126 ( .IN1(bank_rdata5[2]), .IN2(n32), .IN3(bank_rdata4[2]), .IN4(
        n33), .IN5(n89), .QN(net35228) );
  AO22X1 U128 ( .IN1(n232), .IN2(net29123), .IN3(waddr[0]), .IN4(net29116),
        .Q(n118) );
  NBUFFX2 U129 ( .INP(net35854), .Z(n160) );
  AND2X4 U130 ( .IN1(net37248), .IN2(n112), .Q(n35) );
  DELLN1X2 U131 ( .INP(n106), .Z(n79) );
  AOI221X1 U132 ( .IN1(bank_rdata13[5]), .IN2(net36626), .IN3(bank_rdata12[5]),
        .IN4(net36635), .IN5(n64), .QN(n282) );
  AND2X1 U133 ( .IN1(net37248), .IN2(n110), .Q(n28) );
  DELLN1X2 U134 ( .INP(waddr_q[1]), .Z(n380) );
  DELLN1X2 U135 ( .INP(n269), .Z(n389) );
  NBUFFX4 U136 ( .INP(n269), .Z(n342) );
  DELLN1X2 U137 ( .INP(raddr[0]), .Z(n269) );
  NBUFFX2 U138 ( .INP(wdata_q[7]), .Z(n378) );
  NBUFFX2 U139 ( .INP(wdata_q[5]), .Z(n374) );
  NBUFFX2 U140 ( .INP(wdata_q[2]), .Z(n347) );
  NBUFFX2 U141 ( .INP(wdata_q[0]), .Z(n348) );
  NBUFFX2 U142 ( .INP(wdata_q[6]), .Z(n291) );
  NBUFFX2 U143 ( .INP(n343), .Z(n369) );
  NAND2X1 U144 ( .IN1(n56), .IN2(net35841), .QN(n57) );
  NBUFFX2 U145 ( .INP(wdata_q[3]), .Z(net30961) );
  NBUFFX2 U146 ( .INP(wdata_q[1]), .Z(n293) );
  NBUFFX2 U147 ( .INP(wdata_q[7]), .Z(n312) );
  NBUFFX2 U148 ( .INP(wdata_q[5]), .Z(n314) );
  DELLN1X2 U149 ( .INP(wdata_q[2]), .Z(n292) );
  DELLN1X2 U150 ( .INP(wdata_q[0]), .Z(n294) );
  INVX0 U151 ( .INP(net37463), .ZN(n143) );
  AND2X1 U152 ( .IN1(n161), .IN2(bank_rdata8[6]), .Q(n58) );
  OR2X1 U153 ( .IN1(n83), .IN2(n166), .Q(n59) );
  OR2X1 U154 ( .IN1(n203), .IN2(net37662), .Q(n60) );
  OR2X1 U155 ( .IN1(net37662), .IN2(n165), .Q(n63) );
  NAND2X0 U156 ( .IN1(net36524), .IN2(n116), .QN(n65) );
  AND2X4 U157 ( .IN1(bank_rdata0[3]), .IN2(n28), .Q(n66) );
  AND2X4 U158 ( .IN1(bank_rdata0[2]), .IN2(n28), .Q(n67) );
  OR2X1 U159 ( .IN1(n204), .IN2(n205), .Q(n68) );
  NAND2X0 U160 ( .IN1(n116), .IN2(n112), .QN(n69) );
  NBUFFX2 U161 ( .INP(n269), .Z(n239) );
  NAND2X0 U162 ( .IN1(n112), .IN2(n115), .QN(n74) );
  AND2X1 U163 ( .IN1(n223), .IN2(n116), .Q(n38) );
  NBUFFX2 U164 ( .INP(wdata_q[6]), .Z(n376) );
  NBUFFX4 U165 ( .INP(n372), .Z(n315) );
  NAND2X1 U166 ( .IN1(bank_rdata9[2]), .IN2(net37277), .QN(net37478) );
  NAND2X1 U167 ( .IN1(n36), .IN2(bank_rdata7[0]), .QN(n211) );
  DELLN1X2 U168 ( .INP(raddr[1]), .Z(n365) );
  NBUFFX2 U169 ( .INP(n110), .Z(n223) );
  AND2X1 U170 ( .IN1(net23577), .IN2(n111), .Q(n110) );
  INVX0 U171 ( .INP(net35235), .ZN(net35863) );
  INVX0 U172 ( .INP(reset), .ZN(net35235) );
  INVX0 U173 ( .INP(net36788), .ZN(n27) );
  NOR2X0 U174 ( .IN1(net36788), .IN2(n145), .QN(n147) );
  NAND2X1 U175 ( .IN1(bank_rdata15[0]), .IN2(net36648), .QN(n214) );
  NAND2X1 U176 ( .IN1(bank_rdata15[1]), .IN2(net36648), .QN(n179) );
  NBUFFX2 U177 ( .INP(n390), .Z(n76) );
  DELLN1X2 U178 ( .INP(raddr[0]), .Z(n77) );
  INVX0 U179 ( .INP(n92), .ZN(n78) );
  NBUFFX4 U180 ( .INP(n75), .Z(n81) );
  INVX0 U181 ( .INP(n106), .ZN(net37248) );
  NBUFFX4 U182 ( .INP(net36798), .Z(n83) );
  INVX0 U183 ( .INP(net37749), .ZN(n84) );
  INVX0 U184 ( .INP(net37462), .ZN(net37749) );
  DELLN1X2 U185 ( .INP(raddr[2]), .Z(n392) );
  DELLN1X2 U186 ( .INP(raddr[2]), .Z(n391) );
  DELLN1X2 U187 ( .INP(raddr[2]), .Z(n267) );
  DELLN1X2 U188 ( .INP(waddr_q[2]), .Z(n384) );
  INVX0 U189 ( .INP(n191), .ZN(n85) );
  INVX0 U190 ( .INP(n88), .ZN(n86) );
  INVX0 U191 ( .INP(n205), .ZN(n87) );
  NAND2X0 U192 ( .IN1(bank_rdata10[7]), .IN2(n140), .QN(n139) );
  INVX0 U193 ( .INP(n75), .ZN(n88) );
  INVX0 U194 ( .INP(n88), .ZN(n90) );
  DELLN2X2 U195 ( .INP(n246), .Z(n296) );
  NAND2X0 U196 ( .IN1(bank_rdata14[1]), .IN2(net36640), .QN(n178) );
  NAND2X0 U197 ( .IN1(bank_rdata14[0]), .IN2(net36640), .QN(n213) );
  NAND2X0 U198 ( .IN1(n108), .IN2(n109), .QN(n106) );
  INVX0 U199 ( .INP(bank_rdata9[5]), .ZN(n163) );
  INVX0 U200 ( .INP(bank_rdata9[6]), .ZN(n144) );
  DELLN1X2 U201 ( .INP(n231), .Z(n385) );
  NAND2X0 U202 ( .IN1(n96), .IN2(net36825), .QN(n93) );
  AND2X1 U203 ( .IN1(n138), .IN2(n139), .Q(n94) );
  OR2X1 U204 ( .IN1(n164), .IN2(n159), .Q(n95) );
  INVX0 U205 ( .INP(bank_rdata2[3]), .ZN(n146) );
  INVX0 U206 ( .INP(bank_rdata1[0]), .ZN(n203) );
  NAND2X0 U207 ( .IN1(bank_rdata10[0]), .IN2(n140), .QN(net36825) );
  DELLN1X2 U208 ( .INP(raddr[0]), .Z(n242) );
  NAND2X0 U209 ( .IN1(bank_rdata10[1]), .IN2(net37744), .QN(n175) );
  AND2X1 U210 ( .IN1(n222), .IN2(n218), .Q(n97) );
  AND2X1 U211 ( .IN1(n221), .IN2(n97), .Q(n210) );
  NOR2X0 U212 ( .IN1(n144), .IN2(n159), .QN(n137) );
  NOR2X0 U213 ( .IN1(net37662), .IN2(n186), .QN(n187) );
  INVX0 U214 ( .INP(bank_rdata1[2]), .ZN(n186) );
  DELLN1X2 U215 ( .INP(raddr[0]), .Z(n231) );
  NAND2X0 U216 ( .IN1(n102), .IN2(n99), .QN(n199) );
  NAND2X0 U217 ( .IN1(n28), .IN2(bank_rdata0[0]), .QN(n209) );
  INVX0 U218 ( .INP(bank_rdata5[0]), .ZN(n204) );
  INVX0 U219 ( .INP(raddr[5]), .ZN(net23577) );
  INVX0 U220 ( .INP(net37461), .ZN(n140) );
  INVX0 U221 ( .INP(net35810), .ZN(n184) );
  INVX0 U222 ( .INP(raddr[4]), .ZN(n111) );
  AOI221X1 U223 ( .IN1(bank_rdata5[5]), .IN2(n87), .IN3(bank_rdata4[5]), .IN4(
        n114), .IN5(n62), .QN(n283) );
  AOI221X1 U224 ( .IN1(bank_rdata5[6]), .IN2(n32), .IN3(bank_rdata4[6]), .IN4(
        n114), .IN5(n53), .QN(n280) );
  AOI221X1 U225 ( .IN1(bank_rdata5[4]), .IN2(n87), .IN3(bank_rdata4[4]), .IN4(
        n114), .IN5(n71), .QN(n286) );
  AOI221X1 U226 ( .IN1(bank_rdata5[3]), .IN2(n87), .IN3(bank_rdata4[3]), .IN4(
        n33), .IN5(n80), .QN(net34660) );
  INVX0 U227 ( .INP(raddr[3]), .ZN(n108) );
  DELLN1X2 U228 ( .INP(n109), .Z(net36982) );
  AND2X1 U229 ( .IN1(n100), .IN2(n101), .Q(n149) );
  NAND2X0 U230 ( .IN1(bank_rdata8[3]), .IN2(n161), .QN(n101) );
  NAND2X0 U231 ( .IN1(bank_rdata12[1]), .IN2(net36631), .QN(n176) );
  NAND2X0 U232 ( .IN1(n162), .IN2(bank_rdata8[2]), .QN(net37475) );
  AND3X1 U233 ( .IN1(n212), .IN2(net36816), .IN3(n210), .Q(n102) );
  NAND2X0 U234 ( .IN1(bank_rdata11[0]), .IN2(net37749), .QN(net36816) );
  NAND2X0 U235 ( .IN1(bank_rdata3[0]), .IN2(net36557), .QN(n212) );
  INVX0 U236 ( .INP(bank_rdata9[0]), .ZN(n207) );
  NAND2X1 U237 ( .IN1(bank_rdata13[1]), .IN2(net36627), .QN(n174) );
  AOI22X1 U238 ( .IN1(bank_rdata10[5]), .IN2(net36611), .IN3(bank_rdata11[5]),
        .IN4(net36618), .QN(n103) );
  NAND2X0 U239 ( .IN1(n38), .IN2(bank_rdata8[5]), .QN(net37837) );
  NAND2X0 U240 ( .IN1(bank_rdata13[0]), .IN2(net36626), .QN(n215) );
  NAND2X0 U241 ( .IN1(bank_rdata12[0]), .IN2(net36631), .QN(n216) );
  NAND2X0 U242 ( .IN1(n30), .IN2(bank_rdata2[0]), .QN(n208) );
  NAND2X0 U243 ( .IN1(bank_rdata2[6]), .IN2(n30), .QN(n185) );
  INVX0 U244 ( .INP(bank_rdata9[1]), .ZN(n166) );
  NAND2X0 U245 ( .IN1(bank_rdata3[3]), .IN2(n143), .QN(n150) );
  DELLN1X2 U246 ( .INP(waddr_q[2]), .Z(n245) );
  NAND2X0 U247 ( .IN1(bank_rdata3[2]), .IN2(n143), .QN(net37476) );
  INVX0 U248 ( .INP(raddr[6]), .ZN(n109) );
  AND2X1 U249 ( .IN1(n105), .IN2(net35235), .Q(N96) );
  INVX0 U250 ( .INP(n113), .ZN(n114) );
  NAND2X0 U251 ( .IN1(net36524), .IN2(net37248), .QN(n113) );
  INVX0 U252 ( .INP(n113), .ZN(n33) );
  AND2X1 U253 ( .IN1(n117), .IN2(net35235), .Q(N94) );
  NAND2X0 U254 ( .IN1(n286), .IN2(n195), .QN(n117) );
  AND3X1 U255 ( .IN1(n180), .IN2(n182), .IN3(n169), .Q(n133) );
  AND2X1 U256 ( .IN1(n134), .IN2(net35235), .Q(N91) );
  NAND2X0 U257 ( .IN1(net35224), .IN2(n133), .QN(n134) );
  NAND2X0 U258 ( .IN1(bank_rdata3[1]), .IN2(net36557), .QN(n182) );
  NOR2X0 U259 ( .IN1(n173), .IN2(n177), .QN(n180) );
  NOR2X0 U260 ( .IN1(n170), .IN2(n167), .QN(n169) );
  AND2X1 U261 ( .IN1(n290), .IN2(n288), .Q(n135) );
  AND2X1 U262 ( .IN1(n136), .IN2(net35235), .Q(N92) );
  NAND2X0 U263 ( .IN1(net35228), .IN2(n183), .QN(n136) );
  NOR3X0 U264 ( .IN1(n58), .IN2(n54), .IN3(n137), .QN(net31131) );
  AND3X1 U265 ( .IN1(n148), .IN2(n149), .IN3(n150), .Q(n155) );
  NAND2X0 U266 ( .IN1(net34660), .IN2(n158), .QN(n154) );
  INVX0 U267 ( .INP(n156), .ZN(n161) );
  INVX0 U268 ( .INP(n156), .ZN(n162) );
  INVX0 U269 ( .INP(n38), .ZN(n156) );
  AND2X1 U270 ( .IN1(n154), .IN2(net35235), .Q(N93) );
  AND4X1 U271 ( .IN1(n151), .IN2(n152), .IN3(n153), .IN4(net34658), .Q(n157)
         );
  NAND2X0 U272 ( .IN1(n143), .IN2(bank_rdata3[6]), .QN(net37419) );
  AND2X1 U273 ( .IN1(n157), .IN2(n155), .Q(n158) );
  NAND3X0 U274 ( .IN1(n172), .IN2(n171), .IN3(n59), .QN(n170) );
  NAND2X0 U275 ( .IN1(n38), .IN2(bank_rdata8[1]), .QN(n172) );
  NAND2X0 U276 ( .IN1(bank_rdata8[7]), .IN2(n162), .QN(n181) );
  INVX0 U277 ( .INP(net37846), .ZN(net37662) );
  INVX0 U278 ( .INP(net36788), .ZN(net37846) );
  NAND2X0 U279 ( .IN1(bank_rdata0[1]), .IN2(n160), .QN(n168) );
  NAND2X0 U280 ( .IN1(n143), .IN2(bank_rdata3[5]), .QN(net37403) );
  AND2X1 U281 ( .IN1(n190), .IN2(n189), .Q(n183) );
  NAND2X0 U282 ( .IN1(n107), .IN2(n184), .QN(net37463) );
  INVX0 U283 ( .INP(net37463), .ZN(net36557) );
  NAND2X0 U284 ( .IN1(n116), .IN2(n184), .QN(net37461) );
  INVX0 U285 ( .INP(net37461), .ZN(net36611) );
  NAND2X0 U286 ( .IN1(net35841), .IN2(n184), .QN(net37462) );
  INVX0 U287 ( .INP(net37462), .ZN(net36618) );
  AND4X1 U288 ( .IN1(net37477), .IN2(net37478), .IN3(net37479), .IN4(net35226),
        .Q(n189) );
  AND4X1 U289 ( .IN1(n188), .IN2(net37474), .IN3(net37475), .IN4(net37476),
        .Q(n190) );
  NAND2X0 U290 ( .IN1(n185), .IN2(net37419), .QN(n52) );
  NAND2X0 U291 ( .IN1(net37402), .IN2(net37403), .QN(n61) );
  INVX0 U292 ( .INP(n191), .ZN(n192) );
  AND2X1 U293 ( .IN1(n194), .IN2(net35235), .Q(N95) );
  NAND2X0 U294 ( .IN1(n283), .IN2(n193), .QN(n194) );
  AOI221X1 U295 ( .IN1(bank_rdata13[6]), .IN2(net36627), .IN3(bank_rdata12[6]),
        .IN4(net36635), .IN5(n55), .QN(n279) );
  INVX0 U296 ( .INP(n205), .ZN(n32) );
  INVX0 U297 ( .INP(n35), .ZN(n196) );
  INVX0 U298 ( .INP(n196), .ZN(n197) );
  INVX0 U299 ( .INP(n196), .ZN(n198) );
  NAND2X0 U300 ( .IN1(n223), .IN2(net35841), .QN(net36798) );
  AND2X1 U301 ( .IN1(n199), .IN2(net35235), .Q(N90) );
  INVX0 U302 ( .INP(n295), .ZN(n200) );
  INVX0 U303 ( .INP(n200), .ZN(n201) );
  INVX0 U304 ( .INP(n200), .ZN(n202) );
  AO22X1 U305 ( .IN1(bank_rdata6[2]), .IN2(n198), .IN3(bank_rdata7[2]), .IN4(
        n224), .Q(n89) );
  AO22X1 U306 ( .IN1(bank_rdata6[4]), .IN2(n198), .IN3(bank_rdata7[4]), .IN4(
        n36), .Q(n71) );
  AO22X1 U307 ( .IN1(bank_rdata6[6]), .IN2(n197), .IN3(bank_rdata7[6]), .IN4(
        n224), .Q(n53) );
  AO22X1 U308 ( .IN1(bank_rdata6[7]), .IN2(n197), .IN3(bank_rdata7[7]), .IN4(
        n224), .Q(n34) );
  AO22X1 U309 ( .IN1(bank_rdata6[5]), .IN2(n197), .IN3(bank_rdata7[5]), .IN4(
        n224), .Q(n62) );
  NBUFFX2 U310 ( .INP(n291), .Z(n375) );
  NAND2X0 U311 ( .IN1(n107), .IN2(n112), .QN(n206) );
  NAND2X0 U312 ( .IN1(n56), .IN2(n107), .QN(n205) );
  NAND2X0 U313 ( .IN1(n107), .IN2(n223), .QN(net36788) );
  NAND2X0 U314 ( .IN1(bank_rdata8[0]), .IN2(n161), .QN(n219) );
  AND4X1 U315 ( .IN1(n213), .IN2(n214), .IN3(n215), .IN4(n216), .Q(n220) );
  NAND2X0 U316 ( .IN1(bank_rdata6[0]), .IN2(n197), .QN(n218) );
  AND2X1 U317 ( .IN1(n68), .IN2(n211), .Q(n221) );
  AND3X1 U318 ( .IN1(n60), .IN2(n208), .IN3(n209), .Q(n222) );
  INVX0 U319 ( .INP(n206), .ZN(n224) );
  INVX0 U320 ( .INP(n206), .ZN(n36) );
  NAND2X0 U321 ( .IN1(bank_rdata4[0]), .IN2(n33), .QN(n217) );
  INVX0 U322 ( .INP(n69), .ZN(net36640) );
  INVX0 U323 ( .INP(n69), .ZN(net36643) );
  INVX0 U324 ( .INP(n65), .ZN(net36631) );
  INVX0 U325 ( .INP(n65), .ZN(net36635) );
  INVX0 U326 ( .INP(net36789), .ZN(n30) );
  INVX0 U327 ( .INP(n74), .ZN(net36648) );
  INVX0 U328 ( .INP(n74), .ZN(net36651) );
  INVX0 U329 ( .INP(n57), .ZN(net36627) );
  INVX0 U330 ( .INP(n57), .ZN(net36626) );
  INVX0 U331 ( .INP(raddr[5]), .ZN(net36143) );
  NAND2X0 U332 ( .IN1(raddr[4]), .IN2(net36143), .QN(net35810) );
  NOR2X0 U333 ( .IN1(n11), .IN2(n78), .QN(n116) );
  NOR2X0 U334 ( .IN1(net36982), .IN2(n92), .QN(n115) );
  NBUFFX2 U335 ( .INP(n260), .Z(n371) );
  DELLN1X2 U336 ( .INP(n390), .Z(n225) );
  INVX0 U337 ( .INP(net33240), .ZN(net36018) );
  NBUFFX2 U338 ( .INP(n236), .Z(n370) );
  NBUFFX2 U339 ( .INP(n238), .Z(n368) );
  INVX0 U340 ( .INP(n228), .ZN(n226) );
  NOR2X0 U341 ( .IN1(n227), .IN2(net35863), .QN(N97) );
  INVX0 U342 ( .INP(n28), .ZN(net35853) );
  INVX0 U343 ( .INP(net35853), .ZN(net35854) );
  INVX0 U344 ( .INP(net35741), .ZN(net35841) );
  INVX0 U345 ( .INP(n255), .ZN(n228) );
  INVX0 U346 ( .INP(n228), .ZN(n229) );
  INVX0 U347 ( .INP(n115), .ZN(net35741) );
  DELLN1X2 U348 ( .INP(n231), .Z(n235) );
  DELLN1X2 U349 ( .INP(waddr_q[2]), .Z(n230) );
  NBUFFX2 U350 ( .INP(waddr_q[0]), .Z(n232) );
  NBUFFX2 U351 ( .INP(waddr_q[0]), .Z(n233) );
  NBUFFX2 U352 ( .INP(waddr_q[0]), .Z(n379) );
  INVX0 U353 ( .INP(net30745), .ZN(net35495) );
  INVX0 U354 ( .INP(n335), .ZN(n234) );
  INVX0 U355 ( .INP(net35038), .ZN(net35423) );
  INVX0 U356 ( .INP(n249), .ZN(n236) );
  INVX0 U357 ( .INP(n251), .ZN(n237) );
  INVX0 U358 ( .INP(n253), .ZN(n238) );
  INVX0 U359 ( .INP(n202), .ZN(n241) );
  INVX0 U360 ( .INP(n202), .ZN(n243) );
  INVX0 U361 ( .INP(n201), .ZN(n244) );
  INVX0 U362 ( .INP(n326), .ZN(n247) );
  INVX0 U363 ( .INP(wdata_q[3]), .ZN(net35038) );
  INVX0 U364 ( .INP(net35038), .ZN(net35039) );
  INVX0 U365 ( .INP(wdata_q[2]), .ZN(n249) );
  INVX0 U366 ( .INP(n249), .ZN(n250) );
  INVX0 U367 ( .INP(wdata_q[1]), .ZN(n251) );
  INVX0 U368 ( .INP(n251), .ZN(n252) );
  INVX0 U369 ( .INP(wdata_q[0]), .ZN(n253) );
  INVX0 U370 ( .INP(n253), .ZN(n254) );
  INVX0 U371 ( .INP(n202), .ZN(n255) );
  INVX0 U372 ( .INP(n201), .ZN(n257) );
  DELLN1X2 U373 ( .INP(n255), .Z(n258) );
  INVX0 U374 ( .INP(n358), .ZN(n259) );
  INVX0 U375 ( .INP(n360), .ZN(n260) );
  INVX0 U376 ( .INP(net30474), .ZN(net34942) );
  INVX0 U377 ( .INP(n362), .ZN(n261) );
  INVX0 U378 ( .INP(n363), .ZN(n262) );
  INVX0 U379 ( .INP(n364), .ZN(n263) );
  INVX0 U380 ( .INP(n355), .ZN(n264) );
  INVX0 U381 ( .INP(n357), .ZN(n265) );
  INVX0 U382 ( .INP(n202), .ZN(n268) );
  INVX0 U383 ( .INP(net30825), .ZN(net34583) );
  INVX0 U384 ( .INP(n249), .ZN(n270) );
  INVX0 U385 ( .INP(n322), .ZN(n271) );
  INVX0 U386 ( .INP(n253), .ZN(n272) );
  INVX0 U387 ( .INP(n324), .ZN(n273) );
  INVX0 U388 ( .INP(n326), .ZN(n274) );
  INVX0 U389 ( .INP(n328), .ZN(n275) );
  INVX0 U390 ( .INP(n346), .ZN(n276) );
  NOR2X0 U391 ( .IN1(net36143), .IN2(n111), .QN(n112) );
  INVX0 U392 ( .INP(raddr[3]), .ZN(net23575) );
  NOR2X0 U393 ( .IN1(n9), .IN2(net23575), .QN(n107) );
  NOR2X0 U394 ( .IN1(n16), .IN2(n17), .QN(bank_we[6]) );
  NOR2X0 U395 ( .IN1(n13), .IN2(n14), .QN(bank_we[8]) );
  NOR2X0 U396 ( .IN1(n13), .IN2(n17), .QN(bank_we[0]) );
  NOR2X0 U397 ( .IN1(n17), .IN2(n18), .QN(bank_we[4]) );
  NOR2X0 U398 ( .IN1(n15), .IN2(n18), .QN(bank_we[5]) );
  NOR2X0 U399 ( .IN1(n15), .IN2(n16), .QN(bank_we[7]) );
  NOR2X0 U400 ( .IN1(n14), .IN2(n19), .QN(bank_we[10]) );
  NOR2X0 U401 ( .IN1(n14), .IN2(n18), .QN(bank_we[12]) );
  NOR2X0 U402 ( .IN1(n12), .IN2(n19), .QN(bank_we[11]) );
  NOR2X0 U403 ( .IN1(n12), .IN2(n13), .QN(bank_we[9]) );
  NOR2X0 U404 ( .IN1(n12), .IN2(n16), .QN(bank_we[15]) );
  NOR2X0 U405 ( .IN1(n12), .IN2(n18), .QN(bank_we[13]) );
  NOR2X0 U406 ( .IN1(n13), .IN2(n15), .QN(bank_we[1]) );
  NOR2X0 U407 ( .IN1(n17), .IN2(n19), .QN(bank_we[2]) );
  NOR2X0 U408 ( .IN1(n15), .IN2(n19), .QN(bank_we[3]) );
  NOR2X0 U409 ( .IN1(n14), .IN2(n16), .QN(bank_we[14]) );
  NAND2X0 U410 ( .IN1(n20), .IN2(n4), .QN(n17) );
  NAND2X0 U411 ( .IN1(n21), .IN2(n4), .QN(n14) );
  NAND2X0 U412 ( .IN1(n20), .IN2(waddr_q[3]), .QN(n15) );
  NAND2X0 U413 ( .IN1(n21), .IN2(waddr_q[3]), .QN(n12) );
  NOR2X0 U414 ( .IN1(n1), .IN2(waddr_q[6]), .QN(n20) );
  NOR2X0 U415 ( .IN1(n1), .IN2(n277), .QN(n21) );
  NAND2X0 U416 ( .IN1(waddr_q[5]), .IN2(n3), .QN(n18) );
  NAND2X0 U417 ( .IN1(waddr_q[4]), .IN2(n2), .QN(n19) );
  NAND2X0 U418 ( .IN1(waddr_q[5]), .IN2(waddr_q[4]), .QN(n16) );
  NAND2X0 U419 ( .IN1(n3), .IN2(n2), .QN(n13) );
  INVX0 U421 ( .INP(we), .ZN(net23574) );
  DELLN1X2 U422 ( .INP(waddr_q[2]), .Z(n383) );
  DELLN1X2 U423 ( .INP(waddr_q[2]), .Z(n382) );
  INVX0 U424 ( .INP(net33240), .ZN(net29116) );
  INVX0 U425 ( .INP(n201), .ZN(n278) );
  INVX0 U426 ( .INP(n248), .ZN(n367) );
  INVX0 U427 ( .INP(n355), .ZN(n298) );
  INVX0 U428 ( .INP(n355), .ZN(n299) );
  INVX0 U429 ( .INP(n357), .ZN(n300) );
  INVX0 U430 ( .INP(n357), .ZN(n301) );
  INVX0 U431 ( .INP(n358), .ZN(n302) );
  INVX0 U432 ( .INP(n358), .ZN(n303) );
  INVX0 U433 ( .INP(n360), .ZN(n304) );
  INVX0 U434 ( .INP(n360), .ZN(n305) );
  INVX0 U435 ( .INP(net30474), .ZN(net30897) );
  INVX0 U436 ( .INP(net30474), .ZN(net30898) );
  INVX0 U437 ( .INP(n362), .ZN(n306) );
  INVX0 U438 ( .INP(n362), .ZN(n307) );
  INVX0 U439 ( .INP(n363), .ZN(n308) );
  INVX0 U440 ( .INP(n363), .ZN(n309) );
  INVX0 U441 ( .INP(n364), .ZN(n310) );
  INVX0 U442 ( .INP(n364), .ZN(n311) );
  INVX0 U443 ( .INP(n355), .ZN(n317) );
  INVX0 U444 ( .INP(n291), .ZN(n318) );
  INVX0 U445 ( .INP(n318), .ZN(n319) );
  INVX0 U446 ( .INP(n358), .ZN(n320) );
  INVX0 U447 ( .INP(n346), .ZN(n321) );
  INVX0 U448 ( .INP(net35423), .ZN(net30825) );
  INVX0 U449 ( .INP(net30825), .ZN(net30826) );
  INVX0 U450 ( .INP(n237), .ZN(n322) );
  INVX0 U451 ( .INP(n322), .ZN(n323) );
  INVX0 U452 ( .INP(n378), .ZN(n324) );
  INVX0 U453 ( .INP(n324), .ZN(n325) );
  INVX0 U454 ( .INP(wdata_q[6]), .ZN(n326) );
  INVX0 U455 ( .INP(n326), .ZN(n327) );
  INVX0 U456 ( .INP(n374), .ZN(n328) );
  INVX0 U457 ( .INP(n328), .ZN(n329) );
  INVX0 U458 ( .INP(n346), .ZN(n330) );
  INVX0 U459 ( .INP(n344), .ZN(n331) );
  INVX0 U460 ( .INP(n318), .ZN(n332) );
  INVX0 U461 ( .INP(n345), .ZN(n333) );
  INVX0 U462 ( .INP(n346), .ZN(n334) );
  INVX0 U463 ( .INP(net35423), .ZN(net30745) );
  INVX0 U464 ( .INP(n237), .ZN(n335) );
  INVX0 U465 ( .INP(n324), .ZN(n336) );
  INVX0 U466 ( .INP(n318), .ZN(n337) );
  INVX0 U467 ( .INP(n328), .ZN(n338) );
  INVX0 U468 ( .INP(n372), .ZN(n339) );
  INVX0 U469 ( .INP(n339), .ZN(n340) );
  INVX0 U470 ( .INP(net30745), .ZN(net30706) );
  INVX0 U471 ( .INP(n335), .ZN(n341) );
  INVX0 U472 ( .INP(net30474), .ZN(net30615) );
  INVX0 U473 ( .INP(n363), .ZN(n343) );
  INVX0 U474 ( .INP(wdata_q[7]), .ZN(n344) );
  INVX0 U475 ( .INP(wdata_q[5]), .ZN(n345) );
  INVX0 U476 ( .INP(wdata_q[4]), .ZN(n346) );
  INVX0 U477 ( .INP(n355), .ZN(n349) );
  INVX0 U478 ( .INP(n357), .ZN(n350) );
  INVX0 U479 ( .INP(n358), .ZN(n351) );
  INVX0 U480 ( .INP(net30474), .ZN(net30503) );
  INVX0 U481 ( .INP(n362), .ZN(n352) );
  INVX0 U482 ( .INP(n363), .ZN(n353) );
  INVX0 U483 ( .INP(n364), .ZN(n354) );
  INVX0 U484 ( .INP(n344), .ZN(n356) );
  INVX0 U485 ( .INP(n345), .ZN(n359) );
  INVX0 U486 ( .INP(n346), .ZN(n361) );
  payload_ram_bank8x8_15 b00 ( .clk(clk), .we(bank_we[0]), .waddr({n382, n256,
        n232}), .wdata({n378, n291, n374, n304, net30961, n292, n293, n294}),
        .raddr({n267, n296, n388}), .rdata(bank_rdata0) );
  payload_ram_bank8x8_14 b01 ( .clk(clk), .we(bank_we[1]), .waddr({n384, n229,
        n367}), .wdata({n356, n375, n359, n361, net28907, n347, n369, n348}),
        .raddr({n266, n86, n77}), .rdata(bank_rdata1) );
  payload_ram_bank8x8_13 b02 ( .clk(clk), .we(bank_we[2]), .waddr({n383, n257,
        n233}), .wdata({n264, n265, n259, n260, net34942, n261, n262, n263}),
        .raddr({n392, n365, n342}), .rdata(bank_rdata2) );
  payload_ram_bank8x8_12 b03 ( .clk(clk), .we(bank_we[3]), .waddr({n192, n380,
        n367}), .wdata({n312, n247, n314, n371, net35039, n250, n252, n254}),
        .raddr({n391, n365, n366}), .rdata(bank_rdata3) );
  payload_ram_bank8x8_11 b04 ( .clk(clk), .we(bank_we[4]), .waddr({n192, n258,
        n367}), .wdata({n299, n301, n303, n305, net30898, n307, n309, n311}),
        .raddr({n392, n76, n242}), .rdata(bank_rdata4) );
  payload_ram_bank8x8_10 b05 ( .clk(clk), .we(bank_we[5]), .waddr({n382, n256,
        n379}), .wdata({n298, n300, n302, n304, net30503, n352, n353, n354}),
        .raddr({n267, n390, n389}), .rdata(bank_rdata5) );
  payload_ram_bank8x8_9 b06 ( .clk(clk), .we(bank_we[6]), .waddr({n245, n244,
        n379}), .wdata({n377, n375, n373, n315, net35495, n370, n234, n368}),
        .raddr({n391, n225, n235}), .rdata(bank_rdata6) );
  payload_ram_bank8x8_8 b07 ( .clk(clk), .we(bank_we[7]), .waddr({n245, n226,
        n379}), .wdata({n273, n274, n275, n276, net30961, n347, n293, n348}),
        .raddr({n392, n90, n235}), .rdata(bank_rdata7) );
  payload_ram_bank8x8_7 b08 ( .clk(clk), .we(bank_we[8]), .waddr({n85, n381,
        n367}), .wdata({n356, n376, n359, n305, net34583, n270, n271, n272}),
        .raddr({n391, n297, n387}), .rdata(bank_rdata8) );
  payload_ram_bank8x8_6 b09 ( .clk(clk), .we(bank_we[9]), .waddr({n85, n278,
        n232}), .wdata({n349, n350, n351, n340, net30897, n306, n308, n310}),
        .raddr({n266, n296, n386}), .rdata(bank_rdata9) );
  payload_ram_bank8x8_5 b10 ( .clk(clk), .we(bank_we[10]), .waddr({n230,
        waddr_q[1], n233}), .wdata({n325, n327, n329, n330, net35423, n307,
        n237, n311}), .raddr({n267, n86, n385}), .rdata(bank_rdata10) );
  payload_ram_bank8x8_4 b11 ( .clk(clk), .we(bank_we[11]), .waddr({n230, n241,
        n232}), .wdata({n378, n376, n374, n372, net30961, n261, n293, n263}),
        .raddr({n391, n365, n240}), .rdata(bank_rdata11) );
  payload_ram_bank8x8_3 b12 ( .clk(clk), .we(bank_we[12]), .waddr({n383, n243,
        n367}), .wdata({n317, n319, n320, n321, net30826, n306, n323, n310}),
        .raddr({n266, n81, n385}), .rdata(bank_rdata12) );
  payload_ram_bank8x8_2 b13 ( .clk(clk), .we(bank_we[13]), .waddr({n85, n268,
        n379}), .wdata({n312, n313, n314, n315, net30859, n347, n316, n348}),
        .raddr({n266, n296, n77}), .rdata(bank_rdata13) );
  payload_ram_bank8x8_1 b14 ( .clk(clk), .we(bank_we[14]), .waddr({n192, n244,
        n233}), .wdata({n336, n337, n338, n340, net30706, n352, n341, n354}),
        .raddr({n392, n75, n239}), .rdata(bank_rdata14) );
  payload_ram_bank8x8_0 b15 ( .clk(clk), .we(bank_we[15]), .waddr({n384, n257,
        n233}), .wdata({n331, n332, n333, n334, net35039, n292, n252, n294}),
        .raddr({n267, n297, n242}), .rdata(bank_rdata15) );
  NOR2X2 U4 ( .IN1(reset), .IN2(net23574), .QN(N73) );
  NAND2X2 U5 ( .IN1(n393), .IN2(we), .QN(net33240) );
  INVX1 U8 ( .INP(we), .ZN(n394) );
  INVX1 U22 ( .INP(reset), .ZN(n393) );
  DELLN1X2 U420 ( .INP(net29122), .Z(n397) );
  AND2X1 U487 ( .IN1(n394), .IN2(n393), .Q(net39127) );
  AND2X4 U488 ( .IN1(n394), .IN2(n393), .Q(n395) );
  NBUFFX2 U489 ( .INP(net29117), .Z(n398) );
  NBUFFX2 U490 ( .INP(net29116), .Z(n399) );
  NBUFFX2 U491 ( .INP(net36018), .Z(n396) );
endmodule


module bit_accumulator ( clk, reset, clear, preload, load, byte_vld, consume,
        rate, phr_len, byte_in, window );
  input [6:0] phr_len;
  input [7:0] byte_in;
  output [11:0] window;
  input clk, reset, clear, preload, load, byte_vld, consume, rate;
  wire   n6, n7, n8, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n1, n2, n3, n4, n5, n9, n50, n51, n52, n53, n54, n55, n56, n57;
  wire   [23:12] acc;

  DFFX1 acc_reg_23_ ( .D(n32), .CLK(clk), .Q(acc[23]) );
  DFFX1 acc_reg_22_ ( .D(n33), .CLK(clk), .Q(acc[22]) );
  DFFX1 acc_reg_21_ ( .D(n34), .CLK(clk), .Q(acc[21]) );
  DFFX1 acc_reg_20_ ( .D(n35), .CLK(clk), .Q(acc[20]) );
  DFFX1 acc_reg_19_ ( .D(n36), .CLK(clk), .Q(acc[19]) );
  DFFX1 acc_reg_18_ ( .D(n37), .CLK(clk), .Q(acc[18]) );
  DFFX1 acc_reg_17_ ( .D(n38), .CLK(clk), .Q(acc[17]) );
  DFFX1 acc_reg_16_ ( .D(n39), .CLK(clk), .Q(acc[16]) );
  DFFX1 acc_reg_15_ ( .D(n40), .CLK(clk), .Q(acc[15]) );
  DFFX1 acc_reg_14_ ( .D(n41), .CLK(clk), .Q(acc[14]) );
  DFFX1 acc_reg_13_ ( .D(n42), .CLK(clk), .Q(acc[13]) );
  DFFX1 acc_reg_12_ ( .D(n43), .CLK(clk), .Q(acc[12]) );
  DFFX1 acc_reg_11_ ( .D(n44), .CLK(clk), .Q(window[11]) );
  DFFX1 acc_reg_10_ ( .D(n45), .CLK(clk), .Q(window[10]) );
  DFFX1 acc_reg_9_ ( .D(n46), .CLK(clk), .Q(window[9]) );
  DFFX1 acc_reg_8_ ( .D(n47), .CLK(clk), .Q(window[8]) );
  DFFX1 acc_reg_6_ ( .D(n49), .CLK(clk), .Q(window[6]) );
  DFFX1 acc_reg_3_ ( .D(n29), .CLK(clk), .Q(window[3]) );
  DFFX1 acc_reg_2_ ( .D(n28), .CLK(clk), .Q(window[2]) );
  DFFX1 acc_reg_1_ ( .D(n27), .CLK(clk), .Q(window[1]) );
  AO221X1 U12 ( .IN1(window[6]), .IN2(n50), .IN3(window[0]), .IN4(n51), .IN5(
        n8), .Q(n26) );
  AO222X1 U13 ( .IN1(acc[12]), .IN2(n1), .IN3(phr_len[0]), .IN4(n56), .IN5(
        window[8]), .IN6(n4), .Q(n8) );
  AO222X1 U15 ( .IN1(acc[13]), .IN2(n1), .IN3(phr_len[1]), .IN4(n56), .IN5(
        window[9]), .IN6(n3), .Q(n10) );
  AO221X1 U16 ( .IN1(n9), .IN2(window[8]), .IN3(window[2]), .IN4(n51), .IN5(
        n11), .Q(n28) );
  AO222X1 U17 ( .IN1(acc[14]), .IN2(n1), .IN3(phr_len[2]), .IN4(n56), .IN5(
        window[10]), .IN6(n4), .Q(n11) );
  AO221X1 U18 ( .IN1(window[9]), .IN2(n5), .IN3(window[3]), .IN4(n51), .IN5(
        n12), .Q(n29) );
  AO222X1 U19 ( .IN1(acc[15]), .IN2(n1), .IN3(phr_len[3]), .IN4(n56), .IN5(
        window[11]), .IN6(n3), .Q(n12) );
  AO222X1 U21 ( .IN1(acc[16]), .IN2(n1), .IN3(phr_len[4]), .IN4(n56), .IN5(n2),
        .IN6(acc[12]), .Q(n13) );
  AO222X1 U23 ( .IN1(acc[17]), .IN2(n1), .IN3(phr_len[5]), .IN4(n56), .IN5(
        acc[13]), .IN6(n4), .Q(n14) );
  AO22X1 U24 ( .IN1(acc[23]), .IN2(n52), .IN3(byte_in[7]), .IN4(n15), .Q(n32)
         );
  AO22X1 U25 ( .IN1(acc[22]), .IN2(n52), .IN3(byte_in[6]), .IN4(n15), .Q(n33)
         );
  AO22X1 U26 ( .IN1(acc[21]), .IN2(n52), .IN3(byte_in[5]), .IN4(n15), .Q(n34)
         );
  AO22X1 U27 ( .IN1(acc[20]), .IN2(n52), .IN3(byte_in[4]), .IN4(n15), .Q(n35)
         );
  AO22X1 U28 ( .IN1(acc[19]), .IN2(n52), .IN3(byte_in[3]), .IN4(n15), .Q(n36)
         );
  AO22X1 U29 ( .IN1(acc[18]), .IN2(n52), .IN3(byte_in[2]), .IN4(n15), .Q(n37)
         );
  AO222X1 U30 ( .IN1(acc[23]), .IN2(n50), .IN3(byte_in[1]), .IN4(n15), .IN5(
        acc[17]), .IN6(n7), .Q(n38) );
  AO222X1 U31 ( .IN1(acc[22]), .IN2(n9), .IN3(byte_in[0]), .IN4(n15), .IN5(
        acc[16]), .IN6(n7), .Q(n39) );
  AND2X1 U32 ( .IN1(byte_vld), .IN2(n4), .Q(n15) );
  AO222X1 U33 ( .IN1(acc[21]), .IN2(n5), .IN3(acc[23]), .IN4(n2), .IN5(acc[15]), .IN6(n52), .Q(n40) );
  AO222X1 U34 ( .IN1(acc[20]), .IN2(n50), .IN3(acc[22]), .IN4(n2), .IN5(
        acc[14]), .IN6(n52), .Q(n41) );
  AO222X1 U35 ( .IN1(acc[19]), .IN2(n9), .IN3(acc[21]), .IN4(n2), .IN5(acc[13]), .IN6(n52), .Q(n42) );
  AO222X1 U36 ( .IN1(acc[18]), .IN2(n5), .IN3(acc[20]), .IN4(n2), .IN5(n7),
        .IN6(acc[12]), .Q(n43) );
  AO221X1 U37 ( .IN1(acc[17]), .IN2(n5), .IN3(window[11]), .IN4(n51), .IN5(n16), .Q(n44) );
  AO221X1 U39 ( .IN1(acc[16]), .IN2(n50), .IN3(window[10]), .IN4(n51), .IN5(
        n17), .Q(n45) );
  AO221X1 U41 ( .IN1(acc[15]), .IN2(n9), .IN3(window[9]), .IN4(n51), .IN5(n18),
        .Q(n46) );
  AO221X1 U43 ( .IN1(acc[14]), .IN2(n5), .IN3(n52), .IN4(window[8]), .IN5(n19),
        .Q(n47) );
  AO222X1 U48 ( .IN1(acc[18]), .IN2(n1), .IN3(phr_len[6]), .IN4(n56), .IN5(
        acc[14]), .IN6(n3), .Q(n21) );
  AND4X1 U49 ( .IN1(n25), .IN2(n24), .IN3(n22), .IN4(n23), .Q(n7) );
  NAND4X0 U51 ( .IN1(consume), .IN2(n25), .IN3(n54), .IN4(n57), .QN(n24) );
  DFFX1 acc_reg_7_ ( .D(n48), .CLK(clk), .Q(window[7]) );
  DFFX1 acc_reg_4_ ( .D(n30), .CLK(clk), .Q(window[4]) );
  DFFX1 acc_reg_0_ ( .D(n26), .CLK(clk), .Q(window[0]) );
  DFFX1 acc_reg_5_ ( .D(n31), .CLK(clk), .Q(window[5]) );
  NBUFFX2 U3 ( .INP(n7), .Z(n52) );
  AO221X1 U4 ( .IN1(acc[13]), .IN2(n50), .IN3(window[7]), .IN4(n51), .IN5(n20),
        .Q(n48) );
  AO22X1 U5 ( .IN1(acc[15]), .IN2(n3), .IN3(acc[19]), .IN4(n1), .Q(n20) );
  NAND3X0 U6 ( .IN1(n25), .IN2(n57), .IN3(load), .QN(n22) );
  NBUFFX2 U7 ( .INP(n55), .Z(n4) );
  NBUFFX2 U8 ( .INP(n55), .Z(n3) );
  NBUFFX2 U9 ( .INP(n6), .Z(n9) );
  NBUFFX2 U10 ( .INP(n6), .Z(n50) );
  AO221X1 U11 ( .IN1(window[7]), .IN2(n9), .IN3(window[1]), .IN4(n51), .IN5(
        n10), .Q(n27) );
  AO221X1 U14 ( .IN1(n5), .IN2(acc[12]), .IN3(n52), .IN4(window[6]), .IN5(n21),
        .Q(n49) );
  AO22X1 U20 ( .IN1(acc[16]), .IN2(n4), .IN3(acc[20]), .IN4(n1), .Q(n19) );
  AO22X1 U22 ( .IN1(acc[17]), .IN2(n3), .IN3(acc[21]), .IN4(n1), .Q(n18) );
  AO22X1 U38 ( .IN1(acc[18]), .IN2(n4), .IN3(acc[22]), .IN4(n1), .Q(n17) );
  AO22X1 U40 ( .IN1(acc[19]), .IN2(n3), .IN3(acc[23]), .IN4(n1), .Q(n16) );
  NOR2X0 U42 ( .IN1(n53), .IN2(n24), .QN(n1) );
  NBUFFX2 U44 ( .INP(n7), .Z(n51) );
  AO221X1 U45 ( .IN1(window[11]), .IN2(n9), .IN3(window[5]), .IN4(n51), .IN5(
        n14), .Q(n31) );
  AO221X1 U46 ( .IN1(window[10]), .IN2(n50), .IN3(window[4]), .IN4(n51), .IN5(
        n13), .Q(n30) );
  NBUFFX2 U47 ( .INP(n6), .Z(n5) );
  NBUFFX2 U50 ( .INP(n55), .Z(n2) );
  NOR2X0 U52 ( .IN1(n24), .IN2(rate), .QN(n6) );
  INVX0 U53 ( .INP(n22), .ZN(n55) );
  INVX0 U54 ( .INP(n23), .ZN(n56) );
  INVX0 U55 ( .INP(load), .ZN(n54) );
  INVX0 U56 ( .INP(rate), .ZN(n53) );
  NOR2X0 U57 ( .IN1(clear), .IN2(reset), .QN(n25) );
  NAND2X0 U58 ( .IN1(preload), .IN2(n25), .QN(n23) );
  INVX0 U59 ( .INP(preload), .ZN(n57) );
endmodule


module iq_demux ( bits_in, i_bits, q_bits );
  input [11:0] bits_in;
  output [5:0] i_bits;
  output [5:0] q_bits;


  NBUFFX2 U1 ( .INP(bits_in[11]), .Z(q_bits[5]) );
  NBUFFX2 U2 ( .INP(bits_in[10]), .Z(i_bits[5]) );
  NBUFFX2 U3 ( .INP(bits_in[5]), .Z(q_bits[2]) );
  NBUFFX2 U4 ( .INP(bits_in[4]), .Z(i_bits[2]) );
  NBUFFX2 U5 ( .INP(bits_in[1]), .Z(q_bits[0]) );
  NBUFFX2 U6 ( .INP(bits_in[7]), .Z(q_bits[3]) );
  NBUFFX2 U7 ( .INP(bits_in[6]), .Z(i_bits[3]) );
  NBUFFX4 U8 ( .INP(bits_in[0]), .Z(i_bits[0]) );
  NBUFFX2 U9 ( .INP(bits_in[9]), .Z(q_bits[4]) );
  NBUFFX2 U10 ( .INP(bits_in[8]), .Z(i_bits[4]) );
  NBUFFX2 U11 ( .INP(bits_in[3]), .Z(q_bits[1]) );
  NBUFFX2 U12 ( .INP(bits_in[2]), .Z(i_bits[1]) );
endmodule


module symbol_mapper_1 ( rate, bits_in, codeword );
  input [5:0] bits_in;
  output [31:0] codeword;
  input rate;
  wire   n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n1, n2, n4, n5, n6, n7, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53;

  OAI22X1 U41 ( .IN1(n17), .IN2(rate), .IN3(n12), .IN4(n48), .QN(codeword[3])
         );
  XOR2X1 U45 ( .IN1(n7), .IN2(n25), .Q(n24) );
  XOR2X1 U56 ( .IN1(codeword[0]), .IN2(n51), .Q(n10) );
  XOR2X1 U59 ( .IN1(bits_in[4]), .IN2(n52), .Q(n22) );
  XOR2X1 U60 ( .IN1(n1), .IN2(n52), .Q(n25) );
  XOR2X1 U62 ( .IN1(n12), .IN2(n7), .Q(n34) );
  XOR2X1 U63 ( .IN1(n14), .IN2(n40), .Q(n35) );
  XOR2X1 U64 ( .IN1(n9), .IN2(n7), .Q(n36) );
  XOR2X1 U71 ( .IN1(bits_in[4]), .IN2(bits_in[0]), .Q(n14) );
  XOR2X1 U2 ( .IN1(bits_in[5]), .IN2(n14), .Q(n12) );
  XOR2X1 U3 ( .IN1(n1), .IN2(n2), .Q(n9) );
  XOR2X1 U4 ( .IN1(n41), .IN2(n14), .Q(n13) );
  XOR2X1 U5 ( .IN1(n41), .IN2(n12), .Q(n11) );
  XOR2X1 U6 ( .IN1(n51), .IN2(n50), .Q(n20) );
  OAI22X1 U7 ( .IN1(n48), .IN2(n9), .IN3(rate), .IN4(n10), .QN(codeword[1]) );
  NBUFFX2 U8 ( .INP(n23), .Z(n5) );
  NBUFFX2 U9 ( .INP(n48), .Z(n46) );
  NBUFFX2 U10 ( .INP(n20), .Z(n7) );
  NBUFFX2 U11 ( .INP(n20), .Z(n40) );
  NBUFFX2 U12 ( .INP(n20), .Z(n6) );
  XOR2X1 U13 ( .IN1(n41), .IN2(n9), .Q(n15) );
  XOR2X1 U14 ( .IN1(n4), .IN2(n14), .Q(n39) );
  XOR2X1 U15 ( .IN1(n4), .IN2(n12), .Q(n38) );
  AND2X1 U16 ( .IN1(rate), .IN2(n19), .Q(codeword[19]) );
  XOR2X1 U17 ( .IN1(bits_in[3]), .IN2(n25), .Q(n32) );
  NOR2X0 U18 ( .IN1(n30), .IN2(n47), .QN(codeword[23]) );
  XOR2X1 U19 ( .IN1(n4), .IN2(n25), .Q(n29) );
  XOR2X1 U20 ( .IN1(n52), .IN2(n6), .Q(n26) );
  XOR2X1 U21 ( .IN1(n22), .IN2(n40), .Q(n21) );
  XNOR2X1 U22 ( .IN1(n19), .IN2(n6), .Q(n18) );
  XOR2X1 U23 ( .IN1(n4), .IN2(n9), .Q(n8) );
  NBUFFX2 U24 ( .INP(n48), .Z(n42) );
  DELLN1X2 U25 ( .INP(n48), .Z(n45) );
  NBUFFX2 U26 ( .INP(bits_in[5]), .Z(n1) );
  XNOR2X1 U27 ( .IN1(n22), .IN2(n1), .Q(n19) );
  INVX0 U28 ( .INP(codeword[0]), .ZN(n2) );
  NBUFFX2 U29 ( .INP(n53), .Z(codeword[0]) );
  XOR2X1 U30 ( .IN1(n51), .IN2(n5), .Q(n17) );
  NBUFFX2 U31 ( .INP(bits_in[2]), .Z(n4) );
  XOR2X1 U32 ( .IN1(n53), .IN2(bits_in[1]), .Q(n23) );
  XOR2X1 U33 ( .IN1(n51), .IN2(n19), .Q(n27) );
  XOR2X1 U34 ( .IN1(n4), .IN2(n22), .Q(n28) );
  XOR2X1 U35 ( .IN1(n41), .IN2(n52), .Q(n33) );
  XOR2X1 U36 ( .IN1(n41), .IN2(n22), .Q(n31) );
  XOR2X2 U37 ( .IN1(n2), .IN2(n40), .Q(n37) );
  XOR2X1 U38 ( .IN1(n41), .IN2(n2), .Q(n16) );
  XOR2X1 U39 ( .IN1(n50), .IN2(n19), .Q(n30) );
  NBUFFX2 U40 ( .INP(bits_in[3]), .Z(n41) );
  NBUFFX4 U42 ( .INP(n48), .Z(n47) );
  DELLN1X2 U43 ( .INP(n48), .Z(n43) );
  DELLN1X2 U44 ( .INP(n48), .Z(n44) );
  NOR2X0 U46 ( .IN1(n42), .IN2(n10), .QN(codeword[8]) );
  NOR2X0 U47 ( .IN1(n47), .IN2(n52), .QN(codeword[16]) );
  NOR2X0 U48 ( .IN1(n45), .IN2(n25), .QN(codeword[17]) );
  NOR2X0 U49 ( .IN1(n46), .IN2(n22), .QN(codeword[18]) );
  NOR2X0 U50 ( .IN1(n45), .IN2(n17), .QN(codeword[24]) );
  NOR2X0 U51 ( .IN1(n43), .IN2(n27), .QN(codeword[27]) );
  NOR2X0 U52 ( .IN1(n46), .IN2(n34), .QN(codeword[15]) );
  NOR2X0 U53 ( .IN1(n43), .IN2(n21), .QN(codeword[30]) );
  NOR2X0 U54 ( .IN1(n42), .IN2(n24), .QN(codeword[29]) );
  NOR2X0 U55 ( .IN1(n44), .IN2(n26), .QN(codeword[28]) );
  NOR2X0 U57 ( .IN1(n44), .IN2(n18), .QN(codeword[31]) );
  NOR2X0 U58 ( .IN1(n45), .IN2(n35), .QN(codeword[14]) );
  NOR2X0 U61 ( .IN1(n42), .IN2(n36), .QN(codeword[13]) );
  INVX0 U65 ( .INP(n14), .ZN(n49) );
  NOR2X0 U66 ( .IN1(n46), .IN2(n13), .QN(codeword[6]) );
  NOR2X0 U67 ( .IN1(n43), .IN2(n15), .QN(codeword[5]) );
  NOR2X0 U68 ( .IN1(n42), .IN2(n16), .QN(codeword[4]) );
  NOR2X0 U69 ( .IN1(n44), .IN2(n11), .QN(codeword[7]) );
  NOR2X0 U70 ( .IN1(n46), .IN2(n31), .QN(codeword[22]) );
  NOR2X0 U72 ( .IN1(n45), .IN2(n32), .QN(codeword[21]) );
  NOR2X0 U73 ( .IN1(n47), .IN2(n33), .QN(codeword[20]) );
  NOR2X0 U74 ( .IN1(n45), .IN2(n37), .QN(codeword[12]) );
  NOR2X0 U75 ( .IN1(n47), .IN2(n29), .QN(codeword[25]) );
  NOR2X0 U76 ( .IN1(n42), .IN2(n28), .QN(codeword[26]) );
  NOR2X0 U77 ( .IN1(n43), .IN2(n8), .QN(codeword[9]) );
  NOR2X0 U78 ( .IN1(n44), .IN2(n39), .QN(codeword[10]) );
  NOR2X0 U79 ( .IN1(n47), .IN2(n38), .QN(codeword[11]) );
  INVX0 U80 ( .INP(bits_in[3]), .ZN(n50) );
  INVX0 U81 ( .INP(bits_in[2]), .ZN(n51) );
  INVX0 U82 ( .INP(n23), .ZN(n52) );
  INVX0 U83 ( .INP(bits_in[0]), .ZN(n53) );
  AO22X2 U84 ( .IN1(n5), .IN2(n48), .IN3(n49), .IN4(rate), .Q(codeword[2]) );
  INVX0 U85 ( .INP(rate), .ZN(n48) );
endmodule


module symbol_mapper_0 ( rate, bits_in, codeword );
  input [5:0] bits_in;
  output [31:0] codeword;
  input rate;
  wire   n1, n2, n3, n4, n5, n6, n7, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81;

  XOR2X1 U43 ( .IN1(n67), .IN2(n69), .Q(n68) );
  XOR2X1 U46 ( .IN1(n48), .IN2(n69), .Q(n63) );
  XOR2X1 U59 ( .IN1(bits_in[4]), .IN2(n48), .Q(n67) );
  XOR2X1 U62 ( .IN1(n77), .IN2(n69), .Q(n55) );
  XOR2X1 U64 ( .IN1(n80), .IN2(n69), .Q(n53) );
  XOR2X1 U71 ( .IN1(bits_in[4]), .IN2(n3), .Q(n75) );
  NBUFFX2 U2 ( .INP(n66), .Z(n4) );
  XOR2X1 U3 ( .IN1(n1), .IN2(n3), .Q(n80) );
  XOR2X1 U4 ( .IN1(bits_in[5]), .IN2(n75), .Q(n77) );
  XOR2X1 U5 ( .IN1(n47), .IN2(n4), .Q(n72) );
  XOR2X1 U6 ( .IN1(n1), .IN2(n48), .Q(n64) );
  XOR2X1 U7 ( .IN1(n5), .IN2(n77), .Q(n78) );
  XOR2X1 U8 ( .IN1(n2), .IN2(n80), .Q(n81) );
  XOR2X1 U9 ( .IN1(n2), .IN2(n75), .Q(n50) );
  XOR2X1 U10 ( .IN1(n2), .IN2(n77), .Q(n51) );
  XOR2X1 U11 ( .IN1(n3), .IN2(n69), .Q(n52) );
  XOR2X1 U12 ( .IN1(n2), .IN2(n67), .Q(n61) );
  XOR2X1 U13 ( .IN1(n47), .IN2(n70), .Q(n62) );
  XNOR2X1 U14 ( .IN1(n70), .IN2(n69), .Q(n71) );
  XOR2X1 U15 ( .IN1(n47), .IN2(n46), .Q(n69) );
  NBUFFX2 U16 ( .INP(bits_in[5]), .Z(n1) );
  XOR2X1 U17 ( .IN1(n69), .IN2(n64), .Q(n65) );
  XOR2X1 U18 ( .IN1(n2), .IN2(n64), .Q(n60) );
  NBUFFX4 U19 ( .INP(n44), .Z(n43) );
  XOR2X1 U20 ( .IN1(bits_in[3]), .IN2(n64), .Q(n57) );
  NBUFFX4 U21 ( .INP(n43), .Z(n40) );
  AO22X1 U22 ( .IN1(n4), .IN2(n44), .IN3(n45), .IN4(rate), .Q(codeword[2]) );
  DELLN1X2 U23 ( .INP(n44), .Z(n42) );
  NBUFFX2 U24 ( .INP(n43), .Z(n7) );
  NOR2X0 U25 ( .IN1(n7), .IN2(n65), .QN(codeword[29]) );
  NOR2X0 U26 ( .IN1(n68), .IN2(n40), .QN(codeword[30]) );
  NOR2X0 U27 ( .IN1(n62), .IN2(n40), .QN(codeword[27]) );
  XNOR2X1 U28 ( .IN1(n67), .IN2(n1), .Q(n70) );
  NBUFFX2 U29 ( .INP(n43), .Z(n6) );
  DELLN1X2 U30 ( .INP(n44), .Z(n41) );
  NBUFFX2 U31 ( .INP(bits_in[2]), .Z(n2) );
  XOR2X1 U32 ( .IN1(n75), .IN2(n69), .Q(n54) );
  OAI22X1 U33 ( .IN1(n72), .IN2(rate), .IN3(n77), .IN4(n7), .QN(codeword[3])
         );
  XOR2X1 U34 ( .IN1(n49), .IN2(n47), .Q(n79) );
  NBUFFX2 U35 ( .INP(bits_in[0]), .Z(n3) );
  XOR2X1 U36 ( .IN1(n49), .IN2(bits_in[1]), .Q(n66) );
  XOR2X1 U37 ( .IN1(n5), .IN2(n75), .Q(n76) );
  XOR2X1 U38 ( .IN1(n5), .IN2(n80), .Q(n74) );
  NOR2X0 U39 ( .IN1(n41), .IN2(n59), .QN(codeword[23]) );
  XOR2X1 U40 ( .IN1(n5), .IN2(n3), .Q(n73) );
  XOR2X1 U41 ( .IN1(n46), .IN2(n70), .Q(n59) );
  XOR2X1 U42 ( .IN1(n5), .IN2(n48), .Q(n56) );
  XOR2X1 U44 ( .IN1(n5), .IN2(n67), .Q(n58) );
  OAI22X2 U45 ( .IN1(n44), .IN2(n80), .IN3(n79), .IN4(rate), .QN(codeword[1])
         );
  NBUFFX2 U47 ( .INP(bits_in[3]), .Z(n5) );
  NOR2X0 U48 ( .IN1(n40), .IN2(n79), .QN(codeword[8]) );
  NOR2X0 U49 ( .IN1(n7), .IN2(n54), .QN(codeword[14]) );
  NOR2X0 U50 ( .IN1(n7), .IN2(n53), .QN(codeword[13]) );
  NOR2X0 U51 ( .IN1(n42), .IN2(n55), .QN(codeword[15]) );
  NOR2X0 U52 ( .IN1(n6), .IN2(n71), .QN(codeword[31]) );
  NOR2X0 U53 ( .IN1(n40), .IN2(n63), .QN(codeword[28]) );
  NOR2X0 U54 ( .IN1(n42), .IN2(n48), .QN(codeword[16]) );
  NOR2X0 U55 ( .IN1(n42), .IN2(n64), .QN(codeword[17]) );
  NOR2X0 U56 ( .IN1(n42), .IN2(n67), .QN(codeword[18]) );
  NOR2X0 U57 ( .IN1(n41), .IN2(n72), .QN(codeword[24]) );
  INVX0 U58 ( .INP(bits_in[3]), .ZN(n46) );
  NOR2X0 U60 ( .IN1(n42), .IN2(n52), .QN(codeword[12]) );
  INVX0 U61 ( .INP(n75), .ZN(n45) );
  NOR2X0 U63 ( .IN1(n6), .IN2(n73), .QN(codeword[4]) );
  NOR2X0 U65 ( .IN1(n41), .IN2(n76), .QN(codeword[6]) );
  NOR2X0 U66 ( .IN1(n6), .IN2(n78), .QN(codeword[7]) );
  NOR2X0 U67 ( .IN1(n7), .IN2(n74), .QN(codeword[5]) );
  NOR2X0 U68 ( .IN1(n43), .IN2(n56), .QN(codeword[20]) );
  NOR2X0 U69 ( .IN1(n41), .IN2(n58), .QN(codeword[22]) );
  NOR2X0 U70 ( .IN1(n42), .IN2(n57), .QN(codeword[21]) );
  NOR2X0 U72 ( .IN1(n41), .IN2(n60), .QN(codeword[25]) );
  NOR2X0 U73 ( .IN1(n6), .IN2(n61), .QN(codeword[26]) );
  NOR2X0 U74 ( .IN1(n6), .IN2(n81), .QN(codeword[9]) );
  NOR2X0 U75 ( .IN1(n40), .IN2(n50), .QN(codeword[10]) );
  NOR2X0 U76 ( .IN1(n41), .IN2(n51), .QN(codeword[11]) );
  INVX0 U77 ( .INP(bits_in[2]), .ZN(n47) );
  INVX0 U78 ( .INP(n66), .ZN(n48) );
  INVX0 U79 ( .INP(bits_in[0]), .ZN(n49) );
  INVX0 U80 ( .INP(n3), .ZN(codeword[0]) );
  AND2X4 U81 ( .IN1(rate), .IN2(n70), .Q(codeword[19]) );
  INVX0 U82 ( .INP(rate), .ZN(n44) );
endmodule


module bit_interleaver ( clk, reset, clear, hold_en, rate, cw_i, cw_q, nib_idx,
        nib_i, nib_q );
  input [31:0] cw_i;
  input [31:0] cw_q;
  input [3:0] nib_idx;
  output [3:0] nib_i;
  output [3:0] nib_q;
  input clk, reset, clear, hold_en, rate;
  wire   n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n1, n2, n3, n4, n5, n6,
         n7, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198,
         n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n209,
         n210;
  wire   [31:0] hold_i;
  wire   [31:0] hold_q;
  wire   [3:0] sel_i;
  wire   [3:0] sel_q;

  DFFX1 hold_q_reg_31_ ( .D(n72), .CLK(clk), .Q(hold_q[31]) );
  DFFX1 hold_q_reg_30_ ( .D(n71), .CLK(clk), .Q(hold_q[30]) );
  DFFX1 hold_q_reg_29_ ( .D(n70), .CLK(clk), .Q(hold_q[29]) );
  DFFX1 hold_q_reg_28_ ( .D(n69), .CLK(clk), .Q(hold_q[28]) );
  DFFX1 hold_q_reg_27_ ( .D(n68), .CLK(clk), .Q(hold_q[27]) );
  DFFX1 hold_q_reg_26_ ( .D(n67), .CLK(clk), .Q(hold_q[26]) );
  DFFX1 hold_q_reg_25_ ( .D(n66), .CLK(clk), .Q(hold_q[25]) );
  DFFX1 hold_q_reg_24_ ( .D(n65), .CLK(clk), .Q(hold_q[24]) );
  DFFX1 hold_q_reg_23_ ( .D(n64), .CLK(clk), .Q(hold_q[23]) );
  DFFX1 hold_q_reg_22_ ( .D(n63), .CLK(clk), .Q(hold_q[22]) );
  DFFX1 hold_q_reg_21_ ( .D(n62), .CLK(clk), .Q(hold_q[21]) );
  DFFX1 hold_q_reg_20_ ( .D(n61), .CLK(clk), .Q(hold_q[20]) );
  DFFX1 hold_q_reg_19_ ( .D(n60), .CLK(clk), .Q(hold_q[19]) );
  DFFX1 hold_q_reg_18_ ( .D(n59), .CLK(clk), .Q(hold_q[18]) );
  DFFX1 hold_q_reg_17_ ( .D(n58), .CLK(clk), .Q(hold_q[17]) );
  DFFX1 hold_q_reg_16_ ( .D(n57), .CLK(clk), .Q(hold_q[16]) );
  DFFX1 hold_q_reg_15_ ( .D(n56), .CLK(clk), .Q(hold_q[15]) );
  DFFX1 hold_q_reg_14_ ( .D(n55), .CLK(clk), .Q(hold_q[14]) );
  DFFX1 hold_q_reg_13_ ( .D(n54), .CLK(clk), .Q(hold_q[13]) );
  DFFX1 hold_q_reg_12_ ( .D(n53), .CLK(clk), .Q(hold_q[12]) );
  DFFX1 hold_q_reg_11_ ( .D(n52), .CLK(clk), .Q(hold_q[11]) );
  DFFX1 hold_q_reg_10_ ( .D(n51), .CLK(clk), .Q(hold_q[10]) );
  DFFX1 hold_q_reg_9_ ( .D(n50), .CLK(clk), .Q(hold_q[9]) );
  DFFX1 hold_q_reg_8_ ( .D(n49), .CLK(clk), .Q(hold_q[8]) );
  DFFX1 hold_q_reg_7_ ( .D(n48), .CLK(clk), .Q(hold_q[7]) );
  DFFX1 hold_q_reg_6_ ( .D(n47), .CLK(clk), .Q(hold_q[6]) );
  DFFX1 hold_q_reg_5_ ( .D(n46), .CLK(clk), .Q(hold_q[5]) );
  DFFX1 hold_q_reg_4_ ( .D(n45), .CLK(clk), .Q(hold_q[4]) );
  DFFX1 hold_q_reg_3_ ( .D(n44), .CLK(clk), .Q(hold_q[3]) );
  DFFX1 hold_q_reg_2_ ( .D(n43), .CLK(clk), .Q(hold_q[2]) );
  DFFX1 hold_q_reg_1_ ( .D(n42), .CLK(clk), .Q(hold_q[1]) );
  DFFX1 hold_q_reg_0_ ( .D(n41), .CLK(clk), .Q(hold_q[0]) );
  DFFX1 hold_i_reg_31_ ( .D(n40), .CLK(clk), .Q(hold_i[31]) );
  DFFX1 hold_i_reg_30_ ( .D(n39), .CLK(clk), .Q(hold_i[30]) );
  DFFX1 hold_i_reg_29_ ( .D(n38), .CLK(clk), .Q(hold_i[29]) );
  DFFX1 hold_i_reg_28_ ( .D(n37), .CLK(clk), .Q(hold_i[28]) );
  DFFX1 hold_i_reg_27_ ( .D(n36), .CLK(clk), .Q(hold_i[27]) );
  DFFX1 hold_i_reg_26_ ( .D(n35), .CLK(clk), .Q(hold_i[26]) );
  DFFX1 hold_i_reg_25_ ( .D(n34), .CLK(clk), .Q(hold_i[25]) );
  DFFX1 hold_i_reg_24_ ( .D(n33), .CLK(clk), .Q(hold_i[24]) );
  DFFX1 hold_i_reg_23_ ( .D(n32), .CLK(clk), .Q(hold_i[23]) );
  DFFX1 hold_i_reg_22_ ( .D(n31), .CLK(clk), .Q(hold_i[22]) );
  DFFX1 hold_i_reg_21_ ( .D(n30), .CLK(clk), .Q(hold_i[21]) );
  DFFX1 hold_i_reg_20_ ( .D(n29), .CLK(clk), .Q(hold_i[20]) );
  DFFX1 hold_i_reg_19_ ( .D(n28), .CLK(clk), .Q(hold_i[19]) );
  DFFX1 hold_i_reg_18_ ( .D(n27), .CLK(clk), .Q(hold_i[18]) );
  DFFX1 hold_i_reg_17_ ( .D(n26), .CLK(clk), .Q(hold_i[17]) );
  DFFX1 hold_i_reg_16_ ( .D(n25), .CLK(clk), .Q(hold_i[16]) );
  DFFX1 hold_i_reg_15_ ( .D(n24), .CLK(clk), .Q(hold_i[15]) );
  DFFX1 hold_i_reg_14_ ( .D(n23), .CLK(clk), .Q(hold_i[14]) );
  DFFX1 hold_i_reg_13_ ( .D(n22), .CLK(clk), .Q(hold_i[13]) );
  DFFX1 hold_i_reg_12_ ( .D(n21), .CLK(clk), .Q(hold_i[12]) );
  DFFX1 hold_i_reg_11_ ( .D(n20), .CLK(clk), .Q(hold_i[11]) );
  DFFX1 hold_i_reg_10_ ( .D(n19), .CLK(clk), .Q(hold_i[10]) );
  DFFX1 hold_i_reg_9_ ( .D(n18), .CLK(clk), .Q(hold_i[9]) );
  DFFX1 hold_i_reg_8_ ( .D(n17), .CLK(clk), .Q(hold_i[8]) );
  DFFX1 hold_i_reg_7_ ( .D(n16), .CLK(clk), .Q(hold_i[7]) );
  DFFX1 hold_i_reg_6_ ( .D(n15), .CLK(clk), .Q(hold_i[6]) );
  DFFX1 hold_i_reg_5_ ( .D(n14), .CLK(clk), .Q(hold_i[5]) );
  DFFX1 hold_i_reg_4_ ( .D(n13), .CLK(clk), .Q(hold_i[4]) );
  DFFX1 hold_i_reg_3_ ( .D(n12), .CLK(clk), .Q(hold_i[3]) );
  DFFX1 hold_i_reg_2_ ( .D(n11), .CLK(clk), .Q(hold_i[2]) );
  DFFX1 hold_i_reg_1_ ( .D(n10), .CLK(clk), .Q(hold_i[1]) );
  DFFX1 hold_i_reg_0_ ( .D(n9), .CLK(clk), .Q(hold_i[0]) );
  AO22X1 U10 ( .IN1(sel_q[0]), .IN2(rate), .IN3(cw_q[0]), .IN4(n137), .Q(
        nib_q[0]) );
  AO22X1 U14 ( .IN1(sel_i[0]), .IN2(rate), .IN3(cw_i[0]), .IN4(n137), .Q(
        nib_i[0]) );
  AO22X1 U15 ( .IN1(hold_i[0]), .IN2(n134), .IN3(n103), .IN4(cw_i[0]), .Q(n9)
         );
  AO22X1 U17 ( .IN1(hold_i[2]), .IN2(n134), .IN3(n125), .IN4(cw_i[2]), .Q(n11)
         );
  AO22X1 U19 ( .IN1(hold_i[4]), .IN2(n133), .IN3(cw_i[4]), .IN4(n128), .Q(n13)
         );
  AO22X1 U20 ( .IN1(hold_i[5]), .IN2(n133), .IN3(cw_i[5]), .IN4(n104), .Q(n14)
         );
  AO22X1 U21 ( .IN1(hold_i[6]), .IN2(n133), .IN3(cw_i[6]), .IN4(n105), .Q(n15)
         );
  AO22X1 U22 ( .IN1(hold_i[7]), .IN2(n133), .IN3(cw_i[7]), .IN4(n126), .Q(n16)
         );
  AO22X1 U23 ( .IN1(hold_i[8]), .IN2(n133), .IN3(cw_i[8]), .IN4(n104), .Q(n17)
         );
  AO22X1 U24 ( .IN1(hold_i[9]), .IN2(n133), .IN3(cw_i[9]), .IN4(n127), .Q(n18)
         );
  AO22X1 U25 ( .IN1(hold_i[10]), .IN2(n133), .IN3(cw_i[10]), .IN4(n103), .Q(
        n19) );
  AO22X1 U26 ( .IN1(hold_i[11]), .IN2(n133), .IN3(cw_i[11]), .IN4(n128), .Q(
        n20) );
  AO22X1 U27 ( .IN1(hold_i[12]), .IN2(n133), .IN3(cw_i[12]), .IN4(n104), .Q(
        n21) );
  AO22X1 U28 ( .IN1(hold_i[13]), .IN2(n133), .IN3(cw_i[13]), .IN4(n75), .Q(n22) );
  AO22X1 U29 ( .IN1(hold_i[14]), .IN2(n133), .IN3(cw_i[14]), .IN4(n126), .Q(
        n23) );
  AO22X1 U30 ( .IN1(hold_i[15]), .IN2(n133), .IN3(cw_i[15]), .IN4(n75), .Q(n24) );
  AO22X1 U31 ( .IN1(hold_i[16]), .IN2(n132), .IN3(cw_i[16]), .IN4(n105), .Q(
        n25) );
  AO22X1 U32 ( .IN1(hold_i[17]), .IN2(n132), .IN3(cw_i[17]), .IN4(n105), .Q(
        n26) );
  AO22X1 U33 ( .IN1(hold_i[18]), .IN2(n132), .IN3(cw_i[18]), .IN4(n126), .Q(
        n27) );
  AO22X1 U34 ( .IN1(hold_i[19]), .IN2(n132), .IN3(cw_i[19]), .IN4(n128), .Q(
        n28) );
  AO22X1 U35 ( .IN1(hold_i[20]), .IN2(n132), .IN3(cw_i[20]), .IN4(n127), .Q(
        n29) );
  AO22X1 U36 ( .IN1(hold_i[21]), .IN2(n132), .IN3(cw_i[21]), .IN4(n103), .Q(
        n30) );
  AO22X1 U37 ( .IN1(hold_i[22]), .IN2(n132), .IN3(cw_i[22]), .IN4(n103), .Q(
        n31) );
  AO22X1 U39 ( .IN1(hold_i[24]), .IN2(n132), .IN3(cw_i[24]), .IN4(n75), .Q(n33) );
  AO22X1 U40 ( .IN1(hold_i[25]), .IN2(n132), .IN3(cw_i[25]), .IN4(n127), .Q(
        n34) );
  AO22X1 U41 ( .IN1(hold_i[26]), .IN2(n132), .IN3(cw_i[26]), .IN4(n125), .Q(
        n35) );
  AO22X1 U42 ( .IN1(hold_i[27]), .IN2(n132), .IN3(cw_i[27]), .IN4(n105), .Q(
        n36) );
  AO22X1 U43 ( .IN1(hold_i[28]), .IN2(n131), .IN3(cw_i[28]), .IN4(n103), .Q(
        n37) );
  AO22X1 U44 ( .IN1(hold_i[29]), .IN2(n131), .IN3(cw_i[29]), .IN4(n104), .Q(
        n38) );
  AO22X1 U45 ( .IN1(hold_i[30]), .IN2(n131), .IN3(cw_i[30]), .IN4(n105), .Q(
        n39) );
  AO22X1 U47 ( .IN1(hold_q[0]), .IN2(n131), .IN3(n128), .IN4(cw_q[0]), .Q(n41)
         );
  AO22X1 U48 ( .IN1(hold_q[1]), .IN2(n131), .IN3(n75), .IN4(cw_q[1]), .Q(n42)
         );
  AO22X1 U49 ( .IN1(hold_q[2]), .IN2(n131), .IN3(n75), .IN4(cw_q[2]), .Q(n43)
         );
  AO22X1 U50 ( .IN1(hold_q[3]), .IN2(n131), .IN3(n126), .IN4(n7), .Q(n44) );
  AO22X1 U51 ( .IN1(hold_q[4]), .IN2(n131), .IN3(cw_q[4]), .IN4(n104), .Q(n45)
         );
  AO22X1 U52 ( .IN1(hold_q[5]), .IN2(n131), .IN3(cw_q[5]), .IN4(n105), .Q(n46)
         );
  AO22X1 U53 ( .IN1(hold_q[6]), .IN2(n131), .IN3(cw_q[6]), .IN4(n104), .Q(n47)
         );
  AO22X1 U54 ( .IN1(hold_q[7]), .IN2(n131), .IN3(cw_q[7]), .IN4(n126), .Q(n48)
         );
  AO22X1 U55 ( .IN1(hold_q[8]), .IN2(n130), .IN3(cw_q[8]), .IN4(n126), .Q(n49)
         );
  AO22X1 U56 ( .IN1(hold_q[9]), .IN2(n130), .IN3(n6), .IN4(n126), .Q(n50) );
  AO22X1 U57 ( .IN1(hold_q[10]), .IN2(n130), .IN3(cw_q[10]), .IN4(n127), .Q(
        n51) );
  AO22X1 U58 ( .IN1(hold_q[11]), .IN2(n130), .IN3(cw_q[11]), .IN4(n127), .Q(
        n52) );
  AO22X1 U59 ( .IN1(hold_q[12]), .IN2(n130), .IN3(cw_q[12]), .IN4(n128), .Q(
        n53) );
  AO22X1 U60 ( .IN1(hold_q[13]), .IN2(n130), .IN3(cw_q[13]), .IN4(n128), .Q(
        n54) );
  AO22X1 U61 ( .IN1(hold_q[14]), .IN2(n130), .IN3(cw_q[14]), .IN4(n127), .Q(
        n55) );
  AO22X1 U62 ( .IN1(hold_q[15]), .IN2(n130), .IN3(cw_q[15]), .IN4(n126), .Q(
        n56) );
  AO22X1 U63 ( .IN1(hold_q[16]), .IN2(n130), .IN3(cw_q[16]), .IN4(n128), .Q(
        n57) );
  AO22X1 U64 ( .IN1(hold_q[17]), .IN2(n130), .IN3(cw_q[17]), .IN4(n127), .Q(
        n58) );
  AO22X1 U65 ( .IN1(hold_q[18]), .IN2(n130), .IN3(cw_q[18]), .IN4(n128), .Q(
        n59) );
  AO22X1 U66 ( .IN1(hold_q[19]), .IN2(n130), .IN3(cw_q[19]), .IN4(n75), .Q(n60) );
  AO22X1 U67 ( .IN1(hold_q[20]), .IN2(n129), .IN3(cw_q[20]), .IN4(n126), .Q(
        n61) );
  AO22X1 U68 ( .IN1(hold_q[21]), .IN2(n129), .IN3(cw_q[21]), .IN4(n103), .Q(
        n62) );
  AO22X1 U69 ( .IN1(hold_q[22]), .IN2(n129), .IN3(cw_q[22]), .IN4(n127), .Q(
        n63) );
  AO22X1 U70 ( .IN1(hold_q[23]), .IN2(n129), .IN3(cw_q[23]), .IN4(n104), .Q(
        n64) );
  AO22X1 U71 ( .IN1(hold_q[24]), .IN2(n129), .IN3(cw_q[24]), .IN4(n128), .Q(
        n65) );
  AO22X1 U72 ( .IN1(hold_q[25]), .IN2(n129), .IN3(cw_q[25]), .IN4(n105), .Q(
        n66) );
  AO22X1 U73 ( .IN1(hold_q[26]), .IN2(n129), .IN3(cw_q[26]), .IN4(n125), .Q(
        n67) );
  AO22X1 U75 ( .IN1(hold_q[28]), .IN2(n129), .IN3(cw_q[28]), .IN4(n103), .Q(
        n69) );
  AO22X1 U78 ( .IN1(hold_q[31]), .IN2(n129), .IN3(n88), .IN4(n104), .Q(n72) );
  NOR3X0 U80 ( .IN1(clear), .IN2(reset), .IN3(n138), .QN(n8) );
  NAND2X1 U3 ( .IN1(cw_i[19]), .IN2(n108), .QN(n2) );
  NBUFFX2 U4 ( .INP(n167), .Z(n124) );
  NBUFFX2 U5 ( .INP(n167), .Z(n122) );
  NBUFFX2 U6 ( .INP(n167), .Z(n123) );
  NBUFFX2 U7 ( .INP(n205), .Z(n119) );
  NBUFFX2 U8 ( .INP(n167), .Z(n115) );
  INVX0 U9 ( .INP(n106), .ZN(n108) );
  NBUFFX2 U11 ( .INP(n167), .Z(n116) );
  NBUFFX2 U12 ( .INP(n170), .Z(n111) );
  NBUFFX2 U13 ( .INP(n167), .Z(n114) );
  NBUFFX2 U16 ( .INP(n170), .Z(n109) );
  NBUFFX2 U18 ( .INP(n1), .Z(n135) );
  NBUFFX2 U38 ( .INP(n1), .Z(n136) );
  AND2X1 U46 ( .IN1(cw_q[17]), .IN2(n206), .Q(n80) );
  AND2X1 U74 ( .IN1(cw_q[25]), .IN2(n119), .Q(n81) );
  INVX0 U76 ( .INP(n137), .ZN(n101) );
  NBUFFX2 U77 ( .INP(n125), .Z(n128) );
  AO22X1 U79 ( .IN1(sel_i[2]), .IN2(n101), .IN3(cw_i[2]), .IN4(n137), .Q(
        nib_i[2]) );
  AO22X1 U81 ( .IN1(sel_i[3]), .IN2(n101), .IN3(cw_i[3]), .IN4(n137), .Q(
        nib_i[3]) );
  AO22X1 U82 ( .IN1(hold_i[1]), .IN2(n134), .IN3(n75), .IN4(n74), .Q(n10) );
  AO22X1 U83 ( .IN1(hold_i[3]), .IN2(n134), .IN3(n75), .IN4(cw_i[3]), .Q(n12)
         );
  AO22X1 U84 ( .IN1(hold_i[23]), .IN2(n132), .IN3(cw_i[23]), .IN4(n103), .Q(
        n32) );
  AO22X1 U85 ( .IN1(hold_i[31]), .IN2(n131), .IN3(cw_i[31]), .IN4(n103), .Q(
        n40) );
  AO22X1 U86 ( .IN1(hold_q[27]), .IN2(n129), .IN3(cw_q[27]), .IN4(n126), .Q(
        n68) );
  AO22X1 U87 ( .IN1(hold_q[29]), .IN2(n129), .IN3(cw_q[29]), .IN4(n75), .Q(n70) );
  AO22X1 U88 ( .IN1(hold_q[30]), .IN2(n129), .IN3(cw_q[30]), .IN4(n125), .Q(
        n71) );
  NBUFFX2 U89 ( .INP(n125), .Z(n127) );
  NBUFFX2 U90 ( .INP(n125), .Z(n126) );
  NOR3X0 U91 ( .IN1(clear), .IN2(reset), .IN3(n8), .QN(n1) );
  NBUFFX2 U92 ( .INP(n8), .Z(n125) );
  NAND2X1 U93 ( .IN1(n95), .IN2(n96), .QN(nib_q[2]) );
  INVX0 U94 ( .INP(rate), .ZN(n137) );
  NAND2X1 U95 ( .IN1(cw_i[27]), .IN2(n110), .QN(n3) );
  NAND3X0 U96 ( .IN1(n2), .IN2(n3), .IN3(n4), .QN(n174) );
  AND2X1 U97 ( .IN1(n79), .IN2(n78), .Q(n4) );
  NBUFFX2 U98 ( .INP(n170), .Z(n110) );
  INVX0 U99 ( .INP(cw_q[9]), .ZN(n5) );
  INVX0 U100 ( .INP(n5), .ZN(n6) );
  INVX0 U101 ( .INP(n76), .ZN(n7) );
  AO22X1 U102 ( .IN1(cw_q[10]), .IN2(n168), .IN3(cw_q[2]), .IN4(n122), .Q(n193) );
  NAND2X1 U103 ( .IN1(cw_q[2]), .IN2(n137), .QN(n96) );
  AND2X1 U104 ( .IN1(n140), .IN2(n139), .Q(n167) );
  AO22X2 U105 ( .IN1(cw_i[10]), .IN2(n113), .IN3(cw_i[2]), .IN4(n114), .Q(n158) );
  MUX41X1 U106 ( .IN1(n164), .IN3(n163), .IN2(n162), .IN4(n161), .S0(n98),
        .S1(n100), .Q(sel_i[2]) );
  INVX0 U107 ( .INP(cw_i[1]), .ZN(n73) );
  INVX0 U108 ( .INP(n73), .ZN(n74) );
  INVX0 U109 ( .INP(n100), .ZN(n77) );
  INVX0 U110 ( .INP(n102), .ZN(n75) );
  INVX0 U111 ( .INP(n102), .ZN(n103) );
  INVX0 U112 ( .INP(cw_q[3]), .ZN(n76) );
  MUX41X1 U113 ( .IN1(n208), .IN3(n207), .IN2(n210), .IN4(n209), .S0(n98),
        .S1(n77), .Q(sel_q[3]) );
  NAND2X0 U114 ( .IN1(cw_i[11]), .IN2(n113), .QN(n78) );
  NAND2X0 U115 ( .IN1(cw_i[3]), .IN2(n115), .QN(n79) );
  OR3X1 U116 ( .IN1(n80), .IN2(n81), .IN3(n185), .Q(n190) );
  NAND2X1 U117 ( .IN1(sel_i[1]), .IN2(n101), .QN(n82) );
  NAND2X0 U118 ( .IN1(n74), .IN2(n137), .QN(n83) );
  NAND2X1 U119 ( .IN1(n82), .IN2(n83), .QN(nib_i[1]) );
  OR2X1 U120 ( .IN1(n84), .IN2(n99), .Q(n150) );
  AND2X1 U121 ( .IN1(cw_i[9]), .IN2(n113), .Q(n84) );
  MUX41X1 U122 ( .IN1(n148), .IN3(n147), .IN2(n146), .IN4(n145), .S0(
        nib_idx[3]), .S1(nib_idx[0]), .Q(sel_i[0]) );
  INVX0 U123 ( .INP(nib_idx[1]), .ZN(n140) );
  NAND2X0 U124 ( .IN1(n6), .IN2(n203), .QN(n85) );
  NAND2X0 U125 ( .IN1(cw_q[1]), .IN2(n124), .QN(n86) );
  NAND2X0 U126 ( .IN1(n85), .IN2(n86), .QN(n185) );
  NAND2X0 U127 ( .IN1(n89), .IN2(n90), .QN(n166) );
  AO22X2 U128 ( .IN1(n88), .IN2(n121), .IN3(cw_q[23]), .IN4(n124), .Q(n202) );
  INVX0 U129 ( .INP(cw_q[31]), .ZN(n87) );
  INVX0 U130 ( .INP(n87), .ZN(n88) );
  NAND2X0 U131 ( .IN1(cw_i[31]), .IN2(n203), .QN(n89) );
  NAND2X0 U132 ( .IN1(n116), .IN2(cw_i[23]), .QN(n90) );
  MUX41X1 U133 ( .IN1(n175), .IN3(n174), .IN2(n173), .IN4(n172), .S0(
        nib_idx[3]), .S1(n100), .Q(sel_i[3]) );
  AO22X1 U134 ( .IN1(sel_q[1]), .IN2(n101), .IN3(cw_q[1]), .IN4(n137), .Q(
        nib_q[1]) );
  NAND2X1 U135 ( .IN1(sel_q[3]), .IN2(n101), .QN(n91) );
  NAND2X0 U136 ( .IN1(n7), .IN2(n137), .QN(n92) );
  NAND2X1 U137 ( .IN1(n91), .IN2(n92), .QN(nib_q[3]) );
  NAND2X0 U138 ( .IN1(cw_q[11]), .IN2(n168), .QN(n93) );
  NAND2X0 U139 ( .IN1(n7), .IN2(n123), .QN(n94) );
  NAND2X0 U140 ( .IN1(n93), .IN2(n94), .QN(n201) );
  MUX41X1 U141 ( .IN1(n156), .IN3(n155), .IN2(n154), .IN4(n153), .S0(n98),
        .S1(n100), .Q(sel_i[1]) );
  AND2X1 U142 ( .IN1(cw_i[1]), .IN2(n116), .Q(n99) );
  NAND2X1 U143 ( .IN1(sel_q[2]), .IN2(n101), .QN(n95) );
  MUX41X1 U144 ( .IN1(n198), .IN3(n196), .IN2(n199), .IN4(n197), .S0(n100),
        .S1(n97), .Q(sel_q[2]) );
  INVX0 U145 ( .INP(n98), .ZN(n97) );
  NBUFFX2 U146 ( .INP(nib_idx[3]), .Z(n98) );
  MUX41X1 U147 ( .IN1(n183), .IN3(n182), .IN2(n181), .IN4(n180), .S0(n98),
        .S1(nib_idx[0]), .Q(sel_q[0]) );
  MUX41X1 U148 ( .IN1(n191), .IN3(n190), .IN2(n189), .IN4(n188), .S0(n98),
        .S1(n100), .Q(sel_q[1]) );
  NBUFFX2 U149 ( .INP(nib_idx[0]), .Z(n100) );
  NOR2X0 U150 ( .IN1(n139), .IN2(n140), .QN(n205) );
  INVX0 U151 ( .INP(n125), .ZN(n102) );
  INVX0 U152 ( .INP(n171), .ZN(n106) );
  INVX0 U153 ( .INP(n203), .ZN(n120) );
  INVX0 U154 ( .INP(n168), .ZN(n112) );
  NBUFFX2 U155 ( .INP(n205), .Z(n117) );
  NBUFFX2 U156 ( .INP(n205), .Z(n118) );
  NBUFFX2 U157 ( .INP(n135), .Z(n133) );
  NBUFFX2 U158 ( .INP(n135), .Z(n132) );
  NBUFFX2 U159 ( .INP(n136), .Z(n131) );
  NBUFFX2 U160 ( .INP(n136), .Z(n130) );
  NBUFFX2 U161 ( .INP(n136), .Z(n129) );
  NBUFFX2 U162 ( .INP(n135), .Z(n134) );
  INVX0 U163 ( .INP(n102), .ZN(n104) );
  INVX0 U164 ( .INP(n102), .ZN(n105) );
  INVX0 U165 ( .INP(n106), .ZN(n107) );
  INVX0 U166 ( .INP(n120), .ZN(n121) );
  INVX0 U167 ( .INP(n112), .ZN(n113) );
  NOR2X0 U168 ( .IN1(n139), .IN2(n140), .QN(n170) );
  INVX0 U169 ( .INP(nib_idx[2]), .ZN(n139) );
  NOR2X0 U170 ( .IN1(n139), .IN2(nib_idx[1]), .QN(n206) );
  NOR2X0 U171 ( .IN1(n139), .IN2(nib_idx[1]), .QN(n171) );
  NOR2X0 U172 ( .IN1(n140), .IN2(nib_idx[2]), .QN(n203) );
  NOR2X0 U173 ( .IN1(n140), .IN2(nib_idx[2]), .QN(n168) );
  INVX0 U174 ( .INP(hold_en), .ZN(n138) );
  AO22X1 U175 ( .IN1(hold_i[8]), .IN2(n168), .IN3(hold_i[0]), .IN4(n114), .Q(
        n141) );
  AO221X1 U176 ( .IN1(hold_i[16]), .IN2(n107), .IN3(hold_i[24]), .IN4(n109),
        .IN5(n141), .Q(n148) );
  AO22X1 U177 ( .IN1(cw_i[8]), .IN2(n113), .IN3(cw_i[0]), .IN4(n115), .Q(n142)
         );
  AO221X1 U178 ( .IN1(cw_i[16]), .IN2(n108), .IN3(cw_i[24]), .IN4(n110), .IN5(
        n142), .Q(n147) );
  AO22X1 U179 ( .IN1(cw_i[28]), .IN2(n203), .IN3(cw_i[20]), .IN4(n116), .Q(
        n143) );
  AO221X1 U180 ( .IN1(cw_i[4]), .IN2(n107), .IN3(cw_i[12]), .IN4(n111), .IN5(
        n143), .Q(n146) );
  AO22X1 U181 ( .IN1(hold_i[28]), .IN2(n113), .IN3(hold_i[20]), .IN4(n114),
        .Q(n144) );
  AO221X1 U182 ( .IN1(hold_i[4]), .IN2(n108), .IN3(hold_i[12]), .IN4(n109),
        .IN5(n144), .Q(n145) );
  AO22X1 U183 ( .IN1(hold_i[9]), .IN2(n168), .IN3(hold_i[1]), .IN4(n115), .Q(
        n149) );
  AO221X1 U184 ( .IN1(hold_i[17]), .IN2(n107), .IN3(hold_i[25]), .IN4(n110),
        .IN5(n149), .Q(n156) );
  AO221X1 U185 ( .IN1(cw_i[17]), .IN2(n108), .IN3(cw_i[25]), .IN4(n111), .IN5(
        n150), .Q(n155) );
  AO22X1 U186 ( .IN1(cw_i[29]), .IN2(n203), .IN3(cw_i[21]), .IN4(n114), .Q(
        n151) );
  AO221X1 U187 ( .IN1(cw_i[5]), .IN2(n107), .IN3(cw_i[13]), .IN4(n109), .IN5(
        n151), .Q(n154) );
  AO22X1 U188 ( .IN1(hold_i[29]), .IN2(n113), .IN3(hold_i[21]), .IN4(n115),
        .Q(n152) );
  AO221X1 U189 ( .IN1(hold_i[5]), .IN2(n108), .IN3(hold_i[13]), .IN4(n110),
        .IN5(n152), .Q(n153) );
  AO22X1 U190 ( .IN1(hold_i[10]), .IN2(n203), .IN3(hold_i[2]), .IN4(n116), .Q(
        n157) );
  AO221X1 U191 ( .IN1(hold_i[18]), .IN2(n107), .IN3(hold_i[26]), .IN4(n111),
        .IN5(n157), .Q(n164) );
  AO221X1 U192 ( .IN1(cw_i[18]), .IN2(n108), .IN3(cw_i[26]), .IN4(n109), .IN5(
        n158), .Q(n163) );
  AO22X1 U193 ( .IN1(cw_i[30]), .IN2(n168), .IN3(cw_i[22]), .IN4(n115), .Q(
        n159) );
  AO221X1 U194 ( .IN1(cw_i[6]), .IN2(n107), .IN3(cw_i[14]), .IN4(n110), .IN5(
        n159), .Q(n162) );
  AO22X1 U195 ( .IN1(hold_i[30]), .IN2(n113), .IN3(hold_i[22]), .IN4(n116),
        .Q(n160) );
  AO221X1 U196 ( .IN1(hold_i[6]), .IN2(n108), .IN3(hold_i[14]), .IN4(n111),
        .IN5(n160), .Q(n161) );
  AO22X1 U197 ( .IN1(hold_i[11]), .IN2(n168), .IN3(hold_i[3]), .IN4(n114), .Q(
        n165) );
  AO221X1 U198 ( .IN1(hold_i[19]), .IN2(n107), .IN3(hold_i[27]), .IN4(n109),
        .IN5(n165), .Q(n175) );
  AO221X1 U199 ( .IN1(cw_i[7]), .IN2(n107), .IN3(cw_i[15]), .IN4(n111), .IN5(
        n166), .Q(n173) );
  AO22X1 U200 ( .IN1(hold_i[31]), .IN2(n113), .IN3(hold_i[23]), .IN4(n114),
        .Q(n169) );
  AO221X1 U201 ( .IN1(hold_i[7]), .IN2(n108), .IN3(hold_i[15]), .IN4(n109),
        .IN5(n169), .Q(n172) );
  AO22X1 U202 ( .IN1(hold_q[8]), .IN2(n121), .IN3(hold_q[0]), .IN4(n122), .Q(
        n176) );
  AO221X1 U203 ( .IN1(hold_q[16]), .IN2(n206), .IN3(hold_q[24]), .IN4(n117),
        .IN5(n176), .Q(n183) );
  AO22X1 U204 ( .IN1(cw_q[8]), .IN2(n203), .IN3(cw_q[0]), .IN4(n123), .Q(n177)
         );
  AO221X1 U205 ( .IN1(cw_q[16]), .IN2(n206), .IN3(cw_q[24]), .IN4(n118), .IN5(
        n177), .Q(n182) );
  AO22X1 U206 ( .IN1(cw_q[28]), .IN2(n121), .IN3(cw_q[20]), .IN4(n124), .Q(
        n178) );
  AO221X1 U207 ( .IN1(cw_q[4]), .IN2(n171), .IN3(cw_q[12]), .IN4(n119), .IN5(
        n178), .Q(n181) );
  AO22X1 U208 ( .IN1(hold_q[28]), .IN2(n168), .IN3(hold_q[20]), .IN4(n122),
        .Q(n179) );
  AO221X1 U209 ( .IN1(hold_q[4]), .IN2(n206), .IN3(hold_q[12]), .IN4(n117),
        .IN5(n179), .Q(n180) );
  AO22X1 U210 ( .IN1(hold_q[9]), .IN2(n121), .IN3(hold_q[1]), .IN4(n123), .Q(
        n184) );
  AO221X1 U211 ( .IN1(hold_q[17]), .IN2(n206), .IN3(hold_q[25]), .IN4(n118),
        .IN5(n184), .Q(n191) );
  AO22X1 U212 ( .IN1(cw_q[29]), .IN2(n121), .IN3(cw_q[21]), .IN4(n122), .Q(
        n186) );
  AO221X1 U213 ( .IN1(cw_q[5]), .IN2(n206), .IN3(cw_q[13]), .IN4(n117), .IN5(
        n186), .Q(n189) );
  AO22X1 U214 ( .IN1(hold_q[29]), .IN2(n203), .IN3(hold_q[21]), .IN4(n123),
        .Q(n187) );
  AO221X1 U215 ( .IN1(hold_q[5]), .IN2(n206), .IN3(hold_q[13]), .IN4(n118),
        .IN5(n187), .Q(n188) );
  AO22X1 U216 ( .IN1(hold_q[10]), .IN2(n121), .IN3(hold_q[2]), .IN4(n124), .Q(
        n192) );
  AO221X1 U217 ( .IN1(hold_q[18]), .IN2(n171), .IN3(hold_q[26]), .IN4(n119),
        .IN5(n192), .Q(n199) );
  AO221X1 U218 ( .IN1(cw_q[18]), .IN2(n206), .IN3(cw_q[26]), .IN4(n117), .IN5(
        n193), .Q(n198) );
  AO22X1 U219 ( .IN1(cw_q[30]), .IN2(n121), .IN3(cw_q[22]), .IN4(n123), .Q(
        n194) );
  AO221X1 U220 ( .IN1(cw_q[6]), .IN2(n206), .IN3(cw_q[14]), .IN4(n118), .IN5(
        n194), .Q(n197) );
  AO22X1 U221 ( .IN1(hold_q[30]), .IN2(n203), .IN3(hold_q[22]), .IN4(n124),
        .Q(n195) );
  AO221X1 U222 ( .IN1(hold_q[6]), .IN2(n107), .IN3(hold_q[14]), .IN4(n119),
        .IN5(n195), .Q(n196) );
  AO22X1 U223 ( .IN1(hold_q[11]), .IN2(n121), .IN3(hold_q[3]), .IN4(n122), .Q(
        n200) );
  AO221X1 U224 ( .IN1(hold_q[19]), .IN2(n171), .IN3(hold_q[27]), .IN4(n117),
        .IN5(n200), .Q(n210) );
  AO221X1 U225 ( .IN1(cw_q[19]), .IN2(n171), .IN3(cw_q[27]), .IN4(n118), .IN5(
        n201), .Q(n209) );
  AO221X1 U226 ( .IN1(cw_q[7]), .IN2(n206), .IN3(cw_q[15]), .IN4(n119), .IN5(
        n202), .Q(n208) );
  AO22X1 U227 ( .IN1(hold_q[31]), .IN2(n168), .IN3(hold_q[23]), .IN4(n122),
        .Q(n204) );
  AO221X1 U228 ( .IN1(hold_q[7]), .IN2(n206), .IN3(hold_q[15]), .IN4(n117),
        .IN5(n204), .Q(n207) );
endmodule


module shr_rom ( rate, idx, nib, last_idx );
  input [4:0] idx;
  output [3:0] nib;
  output [4:0] last_idx;
  input rate;
  wire   N33, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n5, n6, n7, n9, n25, n26, n27, n28;

  NAND4X0 U23 ( .IN1(n18), .IN2(n16), .IN3(n17), .IN4(n15), .QN(nib[2]) );
  NAND4X0 U24 ( .IN1(n13), .IN2(n19), .IN3(n26), .IN4(n27), .QN(n15) );
  AO221X1 U26 ( .IN1(n22), .IN2(n25), .IN3(idx[1]), .IN4(n12), .IN5(n14), .Q(
        nib[0]) );
  AO22X1 U27 ( .IN1(n23), .IN2(N33), .IN3(n19), .IN4(n28), .Q(n14) );
  AND3X1 U29 ( .IN1(idx[2]), .IN2(n28), .IN3(idx[4]), .Q(n24) );
  INVX0 U7 ( .INP(n18), .ZN(n25) );
  NOR3X0 U8 ( .IN1(idx[4]), .IN2(last_idx[2]), .IN3(n9), .QN(n12) );
  AO221X1 U9 ( .IN1(n21), .IN2(n25), .IN3(n12), .IN4(n20), .IN5(n14), .Q(
        nib[1]) );
  NAND2X0 U10 ( .IN1(n12), .IN2(n26), .QN(n5) );
  NAND2X0 U11 ( .IN1(n25), .IN2(n13), .QN(n6) );
  INVX0 U12 ( .INP(n14), .ZN(n7) );
  NAND3X0 U13 ( .IN1(n5), .IN2(n6), .IN3(n7), .QN(nib[3]) );
  INVX0 U14 ( .INP(last_idx[3]), .ZN(last_idx[2]) );
  INVX0 U15 ( .INP(n27), .ZN(n9) );
  NAND2X0 U16 ( .IN1(N33), .IN2(last_idx[2]), .QN(n16) );
  NAND2X0 U17 ( .IN1(n19), .IN2(n28), .QN(n17) );
  NAND2X0 U18 ( .IN1(n24), .IN2(last_idx[4]), .QN(n18) );
  NOR2X0 U19 ( .IN1(idx[4]), .IN2(last_idx[4]), .QN(n19) );
  NOR2X0 U20 ( .IN1(idx[1]), .IN2(n26), .QN(n22) );
  NOR2X0 U21 ( .IN1(idx[1]), .IN2(idx[0]), .QN(n21) );
  NAND2X0 U22 ( .IN1(idx[1]), .IN2(n26), .QN(n20) );
  OA21X1 U25 ( .IN1(n26), .IN2(idx[1]), .IN3(n20), .Q(n13) );
  INVX0 U28 ( .INP(idx[2]), .ZN(n27) );
  INVX0 U30 ( .INP(idx[0]), .ZN(n26) );
  INVX0 U31 ( .INP(idx[3]), .ZN(n28) );
  NOR2X0 U32 ( .IN1(last_idx[3]), .IN2(n24), .QN(n23) );
  INVX0 U33 ( .INP(rate), .ZN(last_idx[3]) );
  INVX0 U34 ( .INP(last_idx[3]), .ZN(last_idx[4]) );
  OAI21X1 U35 ( .IN1(idx[3]), .IN2(n9), .IN3(idx[4]), .QN(N33) );
  INVX0 U3 ( .INP(1'b0), .ZN(last_idx[1]) );
  INVX0 U5 ( .INP(1'b0), .ZN(last_idx[0]) );
endmodule


module ppdu_mux ( shr_nib, data_nib_i, data_nib_q, sel_shr, out_i, out_q );
  input [3:0] shr_nib;
  input [3:0] data_nib_i;
  input [3:0] data_nib_q;
  output [3:0] out_i;
  output [3:0] out_q;
  input sel_shr;
  wire   n1, n2;

  AO22X1 U2 ( .IN1(shr_nib[3]), .IN2(n2), .IN3(data_nib_q[3]), .IN4(n1), .Q(
        out_q[3]) );
  AO22X1 U3 ( .IN1(shr_nib[2]), .IN2(n2), .IN3(data_nib_q[2]), .IN4(n1), .Q(
        out_q[2]) );
  AO22X1 U4 ( .IN1(shr_nib[1]), .IN2(n2), .IN3(data_nib_q[1]), .IN4(n1), .Q(
        out_q[1]) );
  AO22X1 U5 ( .IN1(shr_nib[0]), .IN2(n2), .IN3(data_nib_q[0]), .IN4(n1), .Q(
        out_q[0]) );
  AO22X1 U6 ( .IN1(shr_nib[3]), .IN2(n2), .IN3(data_nib_i[3]), .IN4(n1), .Q(
        out_i[3]) );
  AO22X1 U7 ( .IN1(shr_nib[2]), .IN2(n2), .IN3(data_nib_i[2]), .IN4(n1), .Q(
        out_i[2]) );
  AO22X1 U8 ( .IN1(shr_nib[1]), .IN2(n2), .IN3(data_nib_i[1]), .IN4(n1), .Q(
        out_i[1]) );
  AO22X1 U9 ( .IN1(shr_nib[0]), .IN2(n2), .IN3(data_nib_i[0]), .IN4(n1), .Q(
        out_i[0]) );
  INVX0 U1 ( .INP(n1), .ZN(n2) );
  INVX0 U10 ( .INP(sel_shr), .ZN(n1) );
endmodule


module css_tx_framer ( clk, reset, start_Tx, rate, payloadLength, payload_we,
        payload_addr, payload_din, mod_busy, frame_ready, mod_nib_i, mod_nib_q,
        ppdu_nibbles, ppdu_done, len_err, busy );
  input [7:0] payloadLength;
  input [6:0] payload_addr;
  input [7:0] payload_din;
  output [3:0] mod_nib_i;
  output [3:0] mod_nib_q;
  output [9:0] ppdu_nibbles;
  input clk, reset, start_Tx, rate, payload_we, mod_busy;
  output frame_ready, ppdu_done, len_err, busy;
  wire   rate_q, acc_clear, acc_preload, acc_load, acc_byte_vld, acc_consume,
         il_clear, il_hold_en, buf_sel_shr, n1, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2;
  wire   [4:0] shr_last;
  wire   [6:0] len_q;
  wire   [6:0] ram_raddr;
  wire   [3:0] nib_idx;
  wire   [4:0] shr_idx;
  wire   [7:0] ram_rdata;
  wire   [11:0] acc_window;
  wire   [5:0] i_bits;
  wire   [5:0] q_bits;
  wire   [31:0] cw_i;
  wire   [31:0] cw_q;
  wire   [3:0] nib_i;
  wire   [3:0] nib_q;
  wire   [3:0] shr_nib;

  NBUFFX4 U1 ( .INP(rate_q), .Z(n10) );
  NBUFFX4 U2 ( .INP(rate_q), .Z(n6) );
  NBUFFX4 U3 ( .INP(n6), .Z(n3) );
  INVX0 U4 ( .INP(shr_idx[0]), .ZN(n1) );
  INVX0 U5 ( .INP(n1), .ZN(n2) );
  DELLN1X2 U6 ( .INP(n3), .Z(n7) );
  INVX0 U7 ( .INP(shr_idx[4]), .ZN(n4) );
  INVX0 U8 ( .INP(n4), .ZN(n5) );
  DELLN2X2 U9 ( .INP(n3), .Z(n9) );
  DELLN2X2 U10 ( .INP(n3), .Z(n8) );
  ppdu_ctrl u_ctrl ( .clk(clk), .reset(reset), .start_Tx(start_Tx), .rate(rate), .payloadLength(payloadLength), .shr_last({shr_last[4:2], 1'b1, 1'b1}),
        .mod_busy(mod_busy), .rate_q(rate_q), .len_q(len_q), .ram_raddr(
        ram_raddr), .acc_clear(acc_clear), .acc_preload(acc_preload),
        .acc_load(acc_load), .acc_byte_vld(acc_byte_vld), .acc_consume(
        acc_consume), .il_clear(il_clear), .il_hold_en(il_hold_en), .nib_idx(
        nib_idx), .shr_idx(shr_idx), .frame_ready(frame_ready), .buf_sel_shr(
        buf_sel_shr), .ppdu_done(ppdu_done), .ppdu_nibbles(ppdu_nibbles),
        .len_err(len_err), .busy(busy) );
  payload_ram u_payload_ram ( .clk(clk), .reset(reset), .we(payload_we),
        .waddr(payload_addr), .wdata(payload_din), .raddr(ram_raddr), .rdata(
        ram_rdata) );
  bit_accumulator u_acc ( .clk(clk), .reset(reset), .clear(acc_clear),
        .preload(acc_preload), .load(acc_load), .byte_vld(acc_byte_vld),
        .consume(acc_consume), .rate(n8), .phr_len(len_q), .byte_in(ram_rdata),
        .window(acc_window) );
  iq_demux u_demux ( .bits_in(acc_window), .i_bits(i_bits), .q_bits(q_bits) );
  symbol_mapper_1 u_map_i ( .rate(n10), .bits_in(i_bits), .codeword(cw_i) );
  symbol_mapper_0 u_map_q ( .rate(n7), .bits_in(q_bits), .codeword(cw_q) );
  bit_interleaver u_il ( .clk(clk), .reset(reset), .clear(il_clear), .hold_en(
        il_hold_en), .rate(n9), .cw_i(cw_i), .cw_q(cw_q), .nib_idx(nib_idx),
        .nib_i(nib_i), .nib_q(nib_q) );
  shr_rom u_shr ( .rate(n6), .idx({n5, shr_idx[3:1], n2}), .nib(shr_nib),
        .last_idx({shr_last[4:2], SYNOPSYS_UNCONNECTED_1,
        SYNOPSYS_UNCONNECTED_2}) );
  ppdu_mux u_mux ( .shr_nib(shr_nib), .data_nib_i(nib_i), .data_nib_q(nib_q),
        .sel_shr(buf_sel_shr), .out_i(mod_nib_i), .out_q(mod_nib_q) );
endmodule


module complex_multiplier_c_WIDTH_12_WIDTH_22_OUT_WIDTH2 ( a_real, a_imag,
        b_real, b_imag, y_real, y_imag );
  input [1:0] a_real;
  input [1:0] a_imag;
  input [1:0] b_real;
  input [1:0] b_imag;
  output [1:0] y_real;
  output [1:0] y_imag;
  wire   mult_bd_1_, mult_ac_1_, mult_ac_0_, mult_bc_0_, mult_ad_1_,
         mult_ad_0_, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12;

  XOR3X1 U1 ( .IN1(n1), .IN2(mult_ad_1_), .IN3(n2), .Q(y_imag[1]) );
  XNOR2X1 U2 ( .IN1(n4), .IN2(n5), .Q(n1) );
  NAND2X0 U3 ( .IN1(mult_ad_0_), .IN2(mult_bc_0_), .QN(n2) );
  NOR2X0 U4 ( .IN1(n3), .IN2(mult_ac_0_), .QN(n8) );
  NAND2X0 U5 ( .IN1(b_imag[0]), .IN2(a_imag[1]), .QN(n10) );
  NAND2X0 U6 ( .IN1(b_imag[1]), .IN2(a_real[0]), .QN(n6) );
  NAND2X0 U7 ( .IN1(b_real[1]), .IN2(a_real[0]), .QN(n11) );
  NAND2X0 U8 ( .IN1(b_real[1]), .IN2(a_imag[0]), .QN(n4) );
  NAND2X0 U9 ( .IN1(b_imag[1]), .IN2(a_imag[0]), .QN(n9) );
  NAND2X0 U10 ( .IN1(b_imag[0]), .IN2(a_real[1]), .QN(n7) );
  NAND2X0 U11 ( .IN1(b_real[0]), .IN2(a_real[1]), .QN(n12) );
  NAND2X0 U12 ( .IN1(a_imag[0]), .IN2(b_imag[0]), .QN(n3) );
  NAND2X0 U13 ( .IN1(b_real[0]), .IN2(a_imag[1]), .QN(n5) );
  XOR2X1 U14 ( .IN1(mult_bc_0_), .IN2(mult_ad_0_), .Q(y_imag[0]) );
  AND2X1 U15 ( .IN1(a_imag[0]), .IN2(b_real[0]), .Q(mult_bc_0_) );
  XOR2X1 U16 ( .IN1(n6), .IN2(n7), .Q(mult_ad_1_) );
  AND2X1 U17 ( .IN1(a_real[0]), .IN2(b_imag[0]), .Q(mult_ad_0_) );
  XOR3X1 U18 ( .IN1(mult_bd_1_), .IN2(mult_ac_1_), .IN3(n8), .Q(y_real[1]) );
  AO21X1 U19 ( .IN1(mult_ac_0_), .IN2(n3), .IN3(n8), .Q(y_real[0]) );
  XOR2X1 U20 ( .IN1(n9), .IN2(n10), .Q(mult_bd_1_) );
  XOR2X1 U21 ( .IN1(n11), .IN2(n12), .Q(mult_ac_1_) );
  AND2X1 U22 ( .IN1(a_real[0]), .IN2(b_real[0]), .Q(mult_ac_0_) );
endmodule


module dreg_N1 ( clk, rstn, data_in, dataout );
  input [0:0] data_in;
  output [0:0] dataout;
  input clk, rstn;


  DFFARX1 dataout_reg_0_ ( .D(data_in[0]), .CLK(clk), .RSTB(rstn), .Q(
        dataout[0]) );
endmodule


module address_counter_N3_MAX4 ( clk, rstn, clear, enable, address );
  output [2:0] address;
  input clk, rstn, clear, enable;
  wire   n1, n2, n4, n5, n6, n9, n10, n11, n3, n7, n8;

  DFFARX1 address_reg_0_ ( .D(n11), .CLK(clk), .RSTB(rstn), .Q(address[0]),
        .QN(n2) );
  DFFARX1 address_reg_1_ ( .D(n10), .CLK(clk), .RSTB(rstn), .Q(address[1]),
        .QN(n1) );
  DFFARX1 address_reg_2_ ( .D(n9), .CLK(clk), .RSTB(rstn), .Q(address[2]) );
  AO22X1 U5 ( .IN1(address[2]), .IN2(n4), .IN3(n5), .IN4(address[1]), .Q(n9)
         );
  AND2X1 U6 ( .IN1(n6), .IN2(address[0]), .Q(n5) );
  AO22X1 U10 ( .IN1(n4), .IN2(address[0]), .IN3(n6), .IN4(n2), .Q(n11) );
  NOR3X0 U11 ( .IN1(address[2]), .IN2(clear), .IN3(n8), .QN(n6) );
  INVX0 U3 ( .INP(enable), .ZN(n8) );
  NOR2X0 U4 ( .IN1(enable), .IN2(clear), .QN(n4) );
  AO21X1 U7 ( .IN1(n3), .IN2(address[1]), .IN3(n7), .Q(n10) );
  AO21X1 U8 ( .IN1(n2), .IN2(n6), .IN3(n4), .Q(n3) );
  AND3X1 U9 ( .IN1(n6), .IN2(n1), .IN3(address[0]), .Q(n7) );
endmodule


module bit_RAM_Depth4_1 ( clk, rstn, we, r_address, data_in, data_out );
  input [1:0] r_address;
  input [3:0] data_in;
  input clk, rstn, we;
  output data_out;
  wire   n2, n3, n4, n5, n1, n6, n7, n8, n9;
  wire   [3:0] mem;

  AO22X1 U2 ( .IN1(mem[0]), .IN2(n9), .IN3(data_in[0]), .IN4(we), .Q(n2) );
  AO22X1 U3 ( .IN1(mem[1]), .IN2(n9), .IN3(data_in[1]), .IN4(we), .Q(n3) );
  AO22X1 U4 ( .IN1(mem[2]), .IN2(n9), .IN3(data_in[2]), .IN4(we), .Q(n4) );
  AO22X1 U5 ( .IN1(mem[3]), .IN2(n9), .IN3(data_in[3]), .IN4(we), .Q(n5) );
  DFFARX1 mem_reg_3_ ( .D(n5), .CLK(clk), .RSTB(rstn), .Q(mem[3]) );
  DFFARX1 mem_reg_2_ ( .D(n4), .CLK(clk), .RSTB(rstn), .Q(mem[2]) );
  DFFARX1 mem_reg_1_ ( .D(n3), .CLK(clk), .RSTB(rstn), .Q(mem[1]) );
  DFFARX1 mem_reg_0_ ( .D(n2), .CLK(clk), .RSTB(rstn), .Q(mem[0]) );
  INVX0 U6 ( .INP(we), .ZN(n9) );
  INVX0 U7 ( .INP(r_address[0]), .ZN(n8) );
  INVX0 U8 ( .INP(r_address[1]), .ZN(n7) );
  AO22X1 U9 ( .IN1(mem[3]), .IN2(r_address[0]), .IN3(mem[2]), .IN4(n8), .Q(n6)
         );
  AO22X1 U10 ( .IN1(mem[1]), .IN2(r_address[0]), .IN3(mem[0]), .IN4(n8), .Q(n1) );
  AO22X1 U11 ( .IN1(r_address[1]), .IN2(n6), .IN3(n1), .IN4(n7), .Q(data_out)
         );
endmodule


module bit_RAM_Depth4_0 ( clk, rstn, we, r_address, data_in, data_out );
  input [1:0] r_address;
  input [3:0] data_in;
  input clk, rstn, we;
  output data_out;
  wire   n1, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;
  wire   [3:0] mem;

  AO22X1 U3 ( .IN1(mem[1]), .IN2(n11), .IN3(data_in[1]), .IN4(we), .Q(n14) );
  AO22X1 U4 ( .IN1(mem[2]), .IN2(n11), .IN3(data_in[2]), .IN4(we), .Q(n13) );
  AO22X1 U5 ( .IN1(mem[3]), .IN2(n11), .IN3(data_in[3]), .IN4(we), .Q(n12) );
  DFFARX1 mem_reg_3_ ( .D(n12), .CLK(clk), .RSTB(rstn), .Q(mem[3]) );
  DFFARX1 mem_reg_2_ ( .D(n13), .CLK(clk), .RSTB(rstn), .Q(mem[2]) );
  DFFARX1 mem_reg_1_ ( .D(n14), .CLK(clk), .RSTB(rstn), .Q(mem[1]) );
  DFFARX1 mem_reg_0_ ( .D(n15), .CLK(clk), .RSTB(rstn), .Q(mem[0]) );
  NAND2X1 U2 ( .IN1(mem[0]), .IN2(n11), .QN(n1) );
  NAND2X0 U6 ( .IN1(we), .IN2(data_in[0]), .QN(n6) );
  NAND2X0 U7 ( .IN1(n1), .IN2(n6), .QN(n15) );
  INVX0 U8 ( .INP(we), .ZN(n11) );
  INVX0 U9 ( .INP(r_address[1]), .ZN(n9) );
  INVX0 U10 ( .INP(r_address[0]), .ZN(n10) );
  AO22X1 U11 ( .IN1(mem[3]), .IN2(r_address[0]), .IN3(mem[2]), .IN4(n10), .Q(
        n8) );
  AO22X1 U12 ( .IN1(mem[1]), .IN2(r_address[0]), .IN3(mem[0]), .IN4(n10), .Q(
        n7) );
  AO22X1 U13 ( .IN1(r_address[1]), .IN2(n8), .IN3(n7), .IN4(n9), .Q(data_out)
         );
endmodule


module dqpsk_mapper_cartesian_N2 ( I, Q, QPSK_RE, QPSK_IM );
  output [1:0] QPSK_RE;
  output [1:0] QPSK_IM;
  input I, Q;
  wire   n1;

  AO21X1 U7 ( .IN1(Q), .IN2(n1), .IN3(QPSK_IM[1]), .Q(QPSK_IM[0]) );
  INVX0 U3 ( .INP(QPSK_IM[0]), .ZN(QPSK_RE[0]) );
  NOR2X0 U4 ( .IN1(n1), .IN2(Q), .QN(QPSK_IM[1]) );
  INVX0 U5 ( .INP(I), .ZN(n1) );
  NOR2X0 U6 ( .IN1(I), .IN2(QPSK_IM[0]), .QN(QPSK_RE[1]) );
endmodule


module feedback_memory_cartesian_N2 ( clk, rstn, clear, we, datain_re,
        datain_im, address, dataout_re, dataout_im );
  input [1:0] datain_re;
  input [1:0] datain_im;
  input [1:0] address;
  output [1:0] dataout_re;
  output [1:0] dataout_im;
  input clk, rstn, clear, we;
  wire   n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n1, n2, n3, n4, n5, n6, n7, n37, n38, n39, n40, n41, n42, n43,
         n44;
  wire   [7:0] mem_re;
  wire   [7:0] mem_im;

  DFFARX1 mem_re_reg_0__1_ ( .D(n36), .CLK(clk), .RSTB(rstn), .Q(mem_re[7]) );
  DFFASX1 mem_re_reg_0__0_ ( .D(n35), .CLK(clk), .SETB(rstn), .Q(mem_re[6]) );
  DFFARX1 mem_re_reg_1__1_ ( .D(n34), .CLK(clk), .RSTB(rstn), .Q(mem_re[5]) );
  DFFASX1 mem_re_reg_1__0_ ( .D(n33), .CLK(clk), .SETB(rstn), .Q(mem_re[4]) );
  DFFARX1 mem_re_reg_2__1_ ( .D(n32), .CLK(clk), .RSTB(rstn), .Q(mem_re[3]) );
  DFFASX1 mem_re_reg_2__0_ ( .D(n31), .CLK(clk), .SETB(rstn), .Q(mem_re[2]) );
  DFFARX1 mem_re_reg_3__1_ ( .D(n30), .CLK(clk), .RSTB(rstn), .Q(mem_re[1]) );
  DFFASX1 mem_re_reg_3__0_ ( .D(n29), .CLK(clk), .SETB(rstn), .Q(mem_re[0]) );
  DFFARX1 mem_im_reg_0__1_ ( .D(n28), .CLK(clk), .RSTB(rstn), .Q(mem_im[7]) );
  DFFASX1 mem_im_reg_0__0_ ( .D(n27), .CLK(clk), .SETB(rstn), .Q(mem_im[6]) );
  DFFARX1 mem_im_reg_1__1_ ( .D(n26), .CLK(clk), .RSTB(rstn), .Q(mem_im[5]) );
  DFFASX1 mem_im_reg_1__0_ ( .D(n25), .CLK(clk), .SETB(rstn), .Q(mem_im[4]) );
  DFFARX1 mem_im_reg_2__1_ ( .D(n24), .CLK(clk), .RSTB(rstn), .Q(mem_im[3]) );
  DFFASX1 mem_im_reg_2__0_ ( .D(n23), .CLK(clk), .SETB(rstn), .Q(mem_im[2]) );
  DFFARX1 mem_im_reg_3__1_ ( .D(n22), .CLK(clk), .RSTB(rstn), .Q(mem_im[1]) );
  DFFASX1 mem_im_reg_3__0_ ( .D(n21), .CLK(clk), .SETB(rstn), .Q(mem_im[0]) );
  AO22X1 U14 ( .IN1(mem_im[0]), .IN2(n42), .IN3(n8), .IN4(n9), .Q(n21) );
  AO22X1 U15 ( .IN1(mem_im[1]), .IN2(n42), .IN3(n10), .IN4(n9), .Q(n22) );
  AO22X1 U16 ( .IN1(mem_im[2]), .IN2(n41), .IN3(n11), .IN4(n8), .Q(n23) );
  AO22X1 U17 ( .IN1(mem_im[3]), .IN2(n41), .IN3(n10), .IN4(n11), .Q(n24) );
  AO22X1 U18 ( .IN1(mem_im[4]), .IN2(n40), .IN3(n12), .IN4(n8), .Q(n25) );
  AO22X1 U19 ( .IN1(mem_im[5]), .IN2(n40), .IN3(n10), .IN4(n12), .Q(n26) );
  AO22X1 U20 ( .IN1(mem_im[6]), .IN2(n39), .IN3(n13), .IN4(n8), .Q(n27) );
  AO22X1 U22 ( .IN1(mem_im[7]), .IN2(n39), .IN3(n10), .IN4(n13), .Q(n28) );
  AND2X1 U23 ( .IN1(datain_im[1]), .IN2(n14), .Q(n10) );
  AO22X1 U24 ( .IN1(n15), .IN2(n9), .IN3(mem_re[0]), .IN4(n42), .Q(n29) );
  AO22X1 U25 ( .IN1(mem_re[1]), .IN2(n42), .IN3(n16), .IN4(n9), .Q(n30) );
  NAND3X0 U26 ( .IN1(address[0]), .IN2(n14), .IN3(address[1]), .QN(n17) );
  AO22X1 U27 ( .IN1(n15), .IN2(n11), .IN3(mem_re[2]), .IN4(n41), .Q(n31) );
  AO22X1 U28 ( .IN1(mem_re[3]), .IN2(n41), .IN3(n16), .IN4(n11), .Q(n32) );
  NAND3X0 U29 ( .IN1(n14), .IN2(n44), .IN3(address[1]), .QN(n18) );
  AO22X1 U30 ( .IN1(n15), .IN2(n12), .IN3(mem_re[4]), .IN4(n40), .Q(n33) );
  AO22X1 U31 ( .IN1(mem_re[5]), .IN2(n40), .IN3(n16), .IN4(n12), .Q(n34) );
  NAND3X0 U32 ( .IN1(n14), .IN2(n38), .IN3(address[0]), .QN(n19) );
  AO22X1 U33 ( .IN1(n15), .IN2(n13), .IN3(mem_re[6]), .IN4(n39), .Q(n35) );
  AO22X1 U35 ( .IN1(mem_re[7]), .IN2(n39), .IN3(n16), .IN4(n13), .Q(n36) );
  AND2X1 U36 ( .IN1(datain_re[1]), .IN2(n14), .Q(n16) );
  NAND3X0 U37 ( .IN1(n44), .IN2(n38), .IN3(n14), .QN(n20) );
  AND2X1 U38 ( .IN1(we), .IN2(n43), .Q(n14) );
  OR2X1 U3 ( .IN1(datain_im[0]), .IN2(clear), .Q(n8) );
  OR2X1 U4 ( .IN1(datain_re[0]), .IN2(clear), .Q(n15) );
  NAND2X0 U5 ( .IN1(n43), .IN2(n19), .QN(n12) );
  INVX0 U6 ( .INP(clear), .ZN(n43) );
  INVX0 U7 ( .INP(n13), .ZN(n39) );
  NAND2X1 U8 ( .IN1(n43), .IN2(n20), .QN(n13) );
  INVX0 U9 ( .INP(n9), .ZN(n42) );
  INVX0 U10 ( .INP(n12), .ZN(n40) );
  INVX0 U11 ( .INP(n11), .ZN(n41) );
  NAND2X1 U12 ( .IN1(n43), .IN2(n17), .QN(n9) );
  NAND2X1 U13 ( .IN1(n43), .IN2(n18), .QN(n11) );
  INVX0 U21 ( .INP(address[0]), .ZN(n44) );
  INVX0 U34 ( .INP(address[1]), .ZN(n38) );
  NOR2X0 U39 ( .IN1(n38), .IN2(address[0]), .QN(n37) );
  NOR2X0 U40 ( .IN1(n38), .IN2(n44), .QN(n7) );
  NOR2X0 U41 ( .IN1(n44), .IN2(address[1]), .QN(n5) );
  NOR2X0 U42 ( .IN1(address[0]), .IN2(address[1]), .QN(n4) );
  AO22X1 U43 ( .IN1(mem_im[4]), .IN2(n5), .IN3(mem_im[6]), .IN4(n4), .Q(n1) );
  AO221X1 U44 ( .IN1(mem_im[2]), .IN2(n37), .IN3(mem_im[0]), .IN4(n7), .IN5(n1), .Q(dataout_im[0]) );
  AO22X1 U45 ( .IN1(mem_im[5]), .IN2(n5), .IN3(mem_im[7]), .IN4(n4), .Q(n2) );
  AO221X1 U46 ( .IN1(mem_im[3]), .IN2(n37), .IN3(mem_im[1]), .IN4(n7), .IN5(n2), .Q(dataout_im[1]) );
  AO22X1 U47 ( .IN1(mem_re[4]), .IN2(n5), .IN3(mem_re[6]), .IN4(n4), .Q(n3) );
  AO221X1 U48 ( .IN1(mem_re[2]), .IN2(n37), .IN3(mem_re[0]), .IN4(n7), .IN5(n3), .Q(dataout_re[0]) );
  AO22X1 U49 ( .IN1(mem_re[5]), .IN2(n5), .IN3(mem_re[7]), .IN4(n4), .Q(n6) );
  AO221X1 U50 ( .IN1(mem_re[3]), .IN2(n37), .IN3(mem_re[1]), .IN4(n7), .IN5(n6), .Q(dataout_re[1]) );
endmodule


module complex_multiplier_c_WIDTH_12_WIDTH_25_OUT_WIDTH6_DW02_mult_3 ( A, B,
        TC, PRODUCT );
  input [1:0] A;
  input [4:0] B;
  output [6:0] PRODUCT;
  input TC;
  wire   add0_3_, add0_2_, add0_1_, add0_0_, add1_4_, add1_3_, add1_2_,
         add1_1_, add1_0_, PROD_not_5_, PROD_not_4_, PROD_not_3_, PROD_not_2_,
         PROD_not_1_, PROD_not_0_, PROD_cmp_5_, PROD_cmp_4_, PROD_cmp_3_,
         PROD_cmp_2_, PROD_cmp_1_, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36;
  wire   [3:0] B_tc;
  wire   [5:1] PROD;
  wire   [4:1] A2_2_AMUX1;
  wire   [4:0] A2_2_AN;

  MUX21X1 U2 ( .IN1(B[2]), .IN2(A2_2_AMUX1[2]), .S(n1), .Q(B_tc[2]) );
  MUX21X1 U4 ( .IN1(B[3]), .IN2(A2_2_AMUX1[3]), .S(n2), .Q(B_tc[3]) );
  INVX0 U5 ( .INP(B_tc[1]), .ZN(n31) );
  MUX21X1 U6 ( .IN1(B[1]), .IN2(A2_2_AMUX1[1]), .S(n1), .Q(B_tc[1]) );
  MUX21X1 U7 ( .IN1(B[0]), .IN2(B[0]), .S(B[4]), .Q(B_tc[0]) );
  XNOR2X1 U8 ( .IN1(n12), .IN2(n11), .Q(PROD[2]) );
  NBUFFX2 U9 ( .INP(n36), .Z(n3) );
  MUX21X1 U10 ( .IN1(PROD[1]), .IN2(PROD_cmp_1_), .S(n36), .Q(PRODUCT[1]) );
  NBUFFX2 U11 ( .INP(B[4]), .Z(n1) );
  NBUFFX2 U12 ( .INP(B[4]), .Z(n2) );
  NAND2X1 U13 ( .IN1(add0_0_), .IN2(add1_0_), .QN(n12) );
  INVX0 U14 ( .INP(n9), .ZN(n22) );
  INVX0 U15 ( .INP(n17), .ZN(n24) );
  INVX0 U16 ( .INP(n13), .ZN(n23) );
  XOR2X1 U17 ( .IN1(PROD_not_1_), .IN2(PROD_not_0_), .Q(PROD_cmp_1_) );
  INVX0 U18 ( .INP(A2_2_AN[2]), .ZN(n5) );
  XOR2X1 U19 ( .IN1(A2_2_AN[1]), .IN2(A2_2_AN[0]), .Q(A2_2_AMUX1[1]) );
  INVX0 U20 ( .INP(B_tc[2]), .ZN(n30) );
  INVX0 U21 ( .INP(B_tc[0]), .ZN(n32) );
  XNOR2X1 U22 ( .IN1(add1_4_), .IN2(n21), .Q(PROD[5]) );
  NAND2X0 U23 ( .IN1(A2_2_AMUX1[4]), .IN2(n2), .QN(n4) );
  INVX0 U24 ( .INP(B_tc[3]), .ZN(n29) );
  INVX0 U25 ( .INP(A[0]), .ZN(n33) );
  INVX0 U26 ( .INP(B[0]), .ZN(A2_2_AN[0]) );
  INVX0 U27 ( .INP(B[1]), .ZN(A2_2_AN[1]) );
  INVX0 U28 ( .INP(B[2]), .ZN(A2_2_AN[2]) );
  INVX0 U29 ( .INP(B[3]), .ZN(A2_2_AN[3]) );
  INVX0 U30 ( .INP(n2), .ZN(A2_2_AN[4]) );
  XOR2X1 U31 ( .IN1(A2_2_AN[4]), .IN2(n6), .Q(A2_2_AMUX1[4]) );
  AND2X1 U32 ( .IN1(n7), .IN2(A2_2_AN[3]), .Q(n6) );
  XOR2X1 U33 ( .IN1(A2_2_AN[3]), .IN2(n7), .Q(A2_2_AMUX1[3]) );
  NOR2X0 U34 ( .IN1(n5), .IN2(n8), .QN(n7) );
  NAND2X0 U35 ( .IN1(A2_2_AN[1]), .IN2(A2_2_AN[0]), .QN(n8) );
  NOR2X0 U36 ( .IN1(add1_1_), .IN2(add0_1_), .QN(n10) );
  NAND2X0 U37 ( .IN1(add1_1_), .IN2(add0_1_), .QN(n9) );
  OA21X1 U38 ( .IN1(n12), .IN2(n10), .IN3(n9), .Q(n15) );
  NOR2X0 U39 ( .IN1(add1_2_), .IN2(add0_2_), .QN(n13) );
  NAND2X0 U40 ( .IN1(add1_2_), .IN2(add0_2_), .QN(n14) );
  OA21X1 U41 ( .IN1(n15), .IN2(n13), .IN3(n14), .Q(n19) );
  NOR2X0 U42 ( .IN1(add1_3_), .IN2(add0_3_), .QN(n17) );
  NAND2X0 U43 ( .IN1(add1_3_), .IN2(add0_3_), .QN(n18) );
  OA21X1 U44 ( .IN1(n19), .IN2(n17), .IN3(n18), .Q(n21) );
  OA21X1 U45 ( .IN1(add1_0_), .IN2(add0_0_), .IN3(n12), .Q(PROD[1]) );
  NOR2X0 U46 ( .IN1(n22), .IN2(n10), .QN(n11) );
  NAND2X0 U47 ( .IN1(n23), .IN2(n14), .QN(n16) );
  XOR2X1 U48 ( .IN1(n16), .IN2(n15), .Q(PROD[3]) );
  NAND2X0 U49 ( .IN1(n24), .IN2(n18), .QN(n20) );
  XOR2X1 U50 ( .IN1(n20), .IN2(n19), .Q(PROD[4]) );
  AND2X1 U51 ( .IN1(PROD_not_1_), .IN2(PROD_not_0_), .Q(n26) );
  XOR2X1 U52 ( .IN1(PROD_not_2_), .IN2(n26), .Q(PROD_cmp_2_) );
  AND2X1 U53 ( .IN1(n26), .IN2(PROD_not_2_), .Q(n25) );
  XOR2X1 U54 ( .IN1(PROD_not_3_), .IN2(n25), .Q(PROD_cmp_3_) );
  XNOR2X1 U56 ( .IN1(PROD_not_4_), .IN2(n27), .Q(PROD_cmp_4_) );
  NOR2X0 U57 ( .IN1(n27), .IN2(PROD[4]), .QN(n28) );
  XOR2X1 U58 ( .IN1(PROD_not_5_), .IN2(n28), .Q(PROD_cmp_5_) );
  NOR2X0 U59 ( .IN1(n34), .IN2(n4), .QN(add1_4_) );
  NOR2X0 U60 ( .IN1(n34), .IN2(n29), .QN(add1_3_) );
  NOR2X0 U61 ( .IN1(n34), .IN2(n30), .QN(add1_2_) );
  NOR2X0 U62 ( .IN1(n34), .IN2(n31), .QN(add1_1_) );
  NOR2X0 U63 ( .IN1(n34), .IN2(n32), .QN(add1_0_) );
  NAND2X0 U64 ( .IN1(A[1]), .IN2(n33), .QN(n34) );
  NOR2X0 U65 ( .IN1(n4), .IN2(n33), .QN(add0_3_) );
  NOR2X0 U66 ( .IN1(n29), .IN2(n33), .QN(add0_2_) );
  NOR2X0 U67 ( .IN1(n30), .IN2(n33), .QN(add0_1_) );
  NOR2X0 U68 ( .IN1(n31), .IN2(n33), .QN(add0_0_) );
  INVX0 U69 ( .INP(PROD[5]), .ZN(PROD_not_5_) );
  INVX0 U70 ( .INP(PROD[4]), .ZN(PROD_not_4_) );
  INVX0 U71 ( .INP(PROD[3]), .ZN(PROD_not_3_) );
  INVX0 U72 ( .INP(PROD[2]), .ZN(PROD_not_2_) );
  INVX0 U73 ( .INP(PROD[1]), .ZN(PROD_not_1_) );
  INVX0 U74 ( .INP(n35), .ZN(PROD_not_0_) );
  MUX21X1 U75 ( .IN1(PROD[5]), .IN2(PROD_cmp_5_), .S(n3), .Q(PRODUCT[5]) );
  MUX21X1 U76 ( .IN1(PROD[4]), .IN2(PROD_cmp_4_), .S(n3), .Q(PRODUCT[4]) );
  MUX21X1 U77 ( .IN1(PROD[3]), .IN2(PROD_cmp_3_), .S(n3), .Q(PRODUCT[3]) );
  MUX21X1 U78 ( .IN1(PROD[2]), .IN2(PROD_cmp_2_), .S(n3), .Q(PRODUCT[2]) );
  MUX21X1 U79 ( .IN1(n35), .IN2(n35), .S(n36), .Q(PRODUCT[0]) );
  XOR2X1 U80 ( .IN1(A[1]), .IN2(n2), .Q(n36) );
  NOR2X0 U81 ( .IN1(n33), .IN2(n32), .QN(n35) );
  NAND3X1 U3 ( .IN1(PROD_not_2_), .IN2(n26), .IN3(PROD_not_3_), .QN(n27) );
  XNOR2X2 U55 ( .IN1(n8), .IN2(A2_2_AN[2]), .Q(A2_2_AMUX1[2]) );
endmodule


module complex_multiplier_c_WIDTH_12_WIDTH_25_OUT_WIDTH6_DW02_mult_2 ( A, B,
        TC, PRODUCT );
  input [1:0] A;
  input [4:0] B;
  output [6:0] PRODUCT;
  input TC;
  wire   add0_3_, add0_2_, add0_1_, add0_0_, add1_4_, add1_3_, add1_2_,
         add1_1_, add1_0_, PROD_not_4_, PROD_not_3_, PROD_not_2_, PROD_not_1_,
         PROD_not_0_, PROD_cmp_5_, PROD_cmp_4_, PROD_cmp_3_, PROD_cmp_2_,
         PROD_cmp_1_, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38;
  wire   [3:0] B_tc;
  wire   [5:1] PROD;
  wire   [4:0] A2_2_AMUX1;
  wire   [3:0] A2_2_AN;

  AND2X1 U2 ( .IN1(B_tc[2]), .IN2(A[0]), .Q(add0_1_) );
  XOR2X1 U3 ( .IN1(n3), .IN2(n2), .Q(n38) );
  NBUFFX2 U4 ( .INP(n38), .Z(n1) );
  MUX21X1 U5 ( .IN1(n37), .IN2(n37), .S(n38), .Q(PRODUCT[0]) );
  INVX0 U6 ( .INP(B_tc[1]), .ZN(n34) );
  MUX21X1 U7 ( .IN1(PROD[2]), .IN2(PROD_cmp_2_), .S(n38), .Q(PRODUCT[2]) );
  MUX21X1 U8 ( .IN1(PROD[3]), .IN2(PROD_cmp_3_), .S(n1), .Q(PRODUCT[3]) );
  MUX21X1 U9 ( .IN1(PROD[4]), .IN2(PROD_cmp_4_), .S(n1), .Q(PRODUCT[4]) );
  MUX21X1 U10 ( .IN1(PROD[5]), .IN2(PROD_cmp_5_), .S(n1), .Q(PRODUCT[5]) );
  INVX0 U11 ( .INP(A[1]), .ZN(n2) );
  INVX0 U12 ( .INP(B[4]), .ZN(n3) );
  INVX0 U13 ( .INP(n3), .ZN(n4) );
  INVX0 U14 ( .INP(n3), .ZN(n5) );
  MUX21X2 U15 ( .IN1(PROD[1]), .IN2(PROD_cmp_1_), .S(n38), .Q(PRODUCT[1]) );
  INVX0 U16 ( .INP(n12), .ZN(n27) );
  INVX0 U17 ( .INP(n20), .ZN(n25) );
  INVX0 U18 ( .INP(n16), .ZN(n26) );
  INVX0 U19 ( .INP(A2_2_AN[2]), .ZN(n8) );
  XOR2X1 U20 ( .IN1(PROD_not_1_), .IN2(PROD_not_0_), .Q(PROD_cmp_1_) );
  XNOR2X1 U21 ( .IN1(PROD_not_3_), .IN2(n6), .Q(PROD_cmp_3_) );
  NAND2X0 U22 ( .IN1(n28), .IN2(PROD_not_2_), .QN(n6) );
  INVX0 U23 ( .INP(B_tc[0]), .ZN(n33) );
  XOR2X1 U24 ( .IN1(A2_2_AN[1]), .IN2(A2_2_AN[0]), .Q(A2_2_AMUX1[1]) );
  INVX0 U25 ( .INP(B_tc[2]), .ZN(n31) );
  XNOR2X1 U26 ( .IN1(PROD[5]), .IN2(n30), .Q(PROD_cmp_5_) );
  XNOR2X1 U27 ( .IN1(add1_4_), .IN2(n24), .Q(PROD[5]) );
  NAND2X0 U28 ( .IN1(A2_2_AMUX1[4]), .IN2(n4), .QN(n7) );
  INVX0 U29 ( .INP(B_tc[3]), .ZN(n32) );
  INVX0 U30 ( .INP(A[0]), .ZN(n35) );
  MUX21X1 U31 ( .IN1(B[0]), .IN2(A2_2_AMUX1[0]), .S(n5), .Q(B_tc[0]) );
  MUX21X1 U32 ( .IN1(B[1]), .IN2(A2_2_AMUX1[1]), .S(n4), .Q(B_tc[1]) );
  MUX21X1 U33 ( .IN1(B[2]), .IN2(A2_2_AMUX1[2]), .S(n5), .Q(B_tc[2]) );
  MUX21X1 U34 ( .IN1(B[3]), .IN2(A2_2_AMUX1[3]), .S(n4), .Q(B_tc[3]) );
  INVX0 U35 ( .INP(B[0]), .ZN(A2_2_AN[0]) );
  INVX0 U36 ( .INP(B[1]), .ZN(A2_2_AN[1]) );
  INVX0 U37 ( .INP(B[2]), .ZN(A2_2_AN[2]) );
  INVX0 U38 ( .INP(B[3]), .ZN(A2_2_AN[3]) );
  XOR2X1 U39 ( .IN1(n3), .IN2(n9), .Q(A2_2_AMUX1[4]) );
  AND2X1 U40 ( .IN1(n10), .IN2(A2_2_AN[3]), .Q(n9) );
  XOR2X1 U41 ( .IN1(A2_2_AN[3]), .IN2(n10), .Q(A2_2_AMUX1[3]) );
  NOR2X0 U42 ( .IN1(n8), .IN2(n11), .QN(n10) );
  XNOR2X1 U43 ( .IN1(n11), .IN2(A2_2_AN[2]), .Q(A2_2_AMUX1[2]) );
  NAND2X0 U44 ( .IN1(A2_2_AN[1]), .IN2(A2_2_AN[0]), .QN(n11) );
  INVX0 U45 ( .INP(A2_2_AN[0]), .ZN(A2_2_AMUX1[0]) );
  NAND2X0 U46 ( .IN1(add1_0_), .IN2(add0_0_), .QN(n15) );
  NOR2X0 U47 ( .IN1(add1_1_), .IN2(add0_1_), .QN(n13) );
  NAND2X0 U48 ( .IN1(add1_1_), .IN2(add0_1_), .QN(n12) );
  OA21X1 U49 ( .IN1(n15), .IN2(n13), .IN3(n12), .Q(n18) );
  NOR2X0 U50 ( .IN1(add1_2_), .IN2(add0_2_), .QN(n16) );
  NAND2X0 U51 ( .IN1(add1_2_), .IN2(add0_2_), .QN(n17) );
  OA21X1 U52 ( .IN1(n18), .IN2(n16), .IN3(n17), .Q(n22) );
  NOR2X0 U53 ( .IN1(add1_3_), .IN2(add0_3_), .QN(n20) );
  NAND2X0 U54 ( .IN1(add1_3_), .IN2(add0_3_), .QN(n21) );
  OA21X1 U55 ( .IN1(n22), .IN2(n20), .IN3(n21), .Q(n24) );
  OA21X1 U56 ( .IN1(add0_0_), .IN2(add1_0_), .IN3(n15), .Q(PROD[1]) );
  NOR2X0 U57 ( .IN1(n27), .IN2(n13), .QN(n14) );
  XNOR2X1 U58 ( .IN1(n15), .IN2(n14), .Q(PROD[2]) );
  NAND2X0 U59 ( .IN1(n26), .IN2(n17), .QN(n19) );
  XOR2X1 U60 ( .IN1(n19), .IN2(n18), .Q(PROD[3]) );
  NAND2X0 U61 ( .IN1(n25), .IN2(n21), .QN(n23) );
  XOR2X1 U62 ( .IN1(n23), .IN2(n22), .Q(PROD[4]) );
  AND2X1 U63 ( .IN1(PROD_not_1_), .IN2(PROD_not_0_), .Q(n28) );
  XOR2X1 U64 ( .IN1(PROD_not_2_), .IN2(n28), .Q(PROD_cmp_2_) );
  NAND3X0 U65 ( .IN1(PROD_not_2_), .IN2(n28), .IN3(PROD_not_3_), .QN(n29) );
  XNOR2X1 U66 ( .IN1(PROD_not_4_), .IN2(n29), .Q(PROD_cmp_4_) );
  NOR2X0 U67 ( .IN1(n29), .IN2(PROD[4]), .QN(n30) );
  NOR2X0 U68 ( .IN1(n36), .IN2(n7), .QN(add1_4_) );
  NOR2X0 U69 ( .IN1(n36), .IN2(n32), .QN(add1_3_) );
  NOR2X0 U70 ( .IN1(n36), .IN2(n31), .QN(add1_2_) );
  NOR2X0 U71 ( .IN1(n36), .IN2(n34), .QN(add1_1_) );
  NOR2X0 U72 ( .IN1(n36), .IN2(n33), .QN(add1_0_) );
  NAND2X0 U73 ( .IN1(A[1]), .IN2(n35), .QN(n36) );
  NOR2X0 U74 ( .IN1(n7), .IN2(n35), .QN(add0_3_) );
  NOR2X0 U75 ( .IN1(n32), .IN2(n35), .QN(add0_2_) );
  NOR2X0 U76 ( .IN1(n34), .IN2(n35), .QN(add0_0_) );
  INVX0 U77 ( .INP(PROD[4]), .ZN(PROD_not_4_) );
  INVX0 U78 ( .INP(PROD[3]), .ZN(PROD_not_3_) );
  INVX0 U79 ( .INP(PROD[2]), .ZN(PROD_not_2_) );
  INVX0 U80 ( .INP(PROD[1]), .ZN(PROD_not_1_) );
  INVX0 U81 ( .INP(n37), .ZN(PROD_not_0_) );
  NOR2X0 U82 ( .IN1(n35), .IN2(n33), .QN(n37) );
endmodule


module complex_multiplier_c_WIDTH_12_WIDTH_25_OUT_WIDTH6_DW02_mult_1 ( A, B,
        TC, PRODUCT );
  input [1:0] A;
  input [4:0] B;
  output [6:0] PRODUCT;
  input TC;
  wire   add0_3_, add0_2_, add0_1_, add0_0_, add1_4_, add1_3_, add1_2_,
         add1_1_, add1_0_, PROD_not_5_, PROD_not_4_, PROD_not_3_, PROD_not_2_,
         PROD_not_1_, PROD_not_0_, PROD_cmp_5_, PROD_cmp_4_, PROD_cmp_3_,
         PROD_cmp_2_, PROD_cmp_1_, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39;
  wire   [3:0] B_tc;
  wire   [5:1] PROD;
  wire   [4:1] A2_2_AMUX1;
  wire   [4:0] A2_2_AN;

  INVX0 U2 ( .INP(PROD[1]), .ZN(n1) );
  INVX0 U3 ( .INP(n1), .ZN(n2) );
  MUX21X1 U4 ( .IN1(B[2]), .IN2(A2_2_AMUX1[2]), .S(B[4]), .Q(B_tc[2]) );
  MUX21X1 U5 ( .IN1(B[3]), .IN2(A2_2_AMUX1[3]), .S(B[4]), .Q(B_tc[3]) );
  MUX21X1 U6 ( .IN1(B[1]), .IN2(A2_2_AMUX1[1]), .S(B[4]), .Q(B_tc[1]) );
  MUX21X1 U7 ( .IN1(B[0]), .IN2(B[0]), .S(B[4]), .Q(B_tc[0]) );
  XNOR2X1 U8 ( .IN1(n5), .IN2(n14), .Q(PROD[2]) );
  MUX21X1 U9 ( .IN1(PROD[5]), .IN2(PROD_cmp_5_), .S(n6), .Q(PRODUCT[5]) );
  INVX0 U10 ( .INP(A[1]), .ZN(n7) );
  MUX21X1 U11 ( .IN1(PROD_cmp_2_), .IN2(PROD[2]), .S(n3), .Q(PRODUCT[2]) );
  INVX0 U12 ( .INP(B_tc[1]), .ZN(n35) );
  INVX0 U13 ( .INP(n39), .ZN(n3) );
  INVX0 U14 ( .INP(n3), .ZN(n4) );
  NAND2X0 U15 ( .IN1(add0_0_), .IN2(add1_0_), .QN(n5) );
  NAND2X0 U16 ( .IN1(add0_0_), .IN2(add1_0_), .QN(n15) );
  NBUFFX4 U17 ( .INP(n39), .Z(n6) );
  XOR2X1 U18 ( .IN1(n7), .IN2(A2_2_AN[4]), .Q(n39) );
  MUX21X2 U19 ( .IN1(PROD[4]), .IN2(PROD_cmp_4_), .S(n6), .Q(PRODUCT[4]) );
  MUX21X2 U20 ( .IN1(PROD[3]), .IN2(PROD_cmp_3_), .S(n6), .Q(PRODUCT[3]) );
  MUX21X2 U21 ( .IN1(n2), .IN2(PROD_cmp_1_), .S(n4), .Q(PRODUCT[1]) );
  INVX0 U22 ( .INP(n12), .ZN(n27) );
  INVX0 U23 ( .INP(n20), .ZN(n25) );
  INVX0 U24 ( .INP(n16), .ZN(n26) );
  XOR2X1 U25 ( .IN1(PROD_not_1_), .IN2(PROD_not_0_), .Q(PROD_cmp_1_) );
  XOR2X1 U26 ( .IN1(A2_2_AN[1]), .IN2(A2_2_AN[0]), .Q(A2_2_AMUX1[1]) );
  INVX0 U27 ( .INP(B_tc[2]), .ZN(n32) );
  INVX0 U28 ( .INP(B_tc[0]), .ZN(n34) );
  XNOR2X1 U29 ( .IN1(add1_4_), .IN2(n24), .Q(PROD[5]) );
  NAND2X0 U30 ( .IN1(A2_2_AMUX1[4]), .IN2(B[4]), .QN(n8) );
  INVX0 U31 ( .INP(B_tc[3]), .ZN(n33) );
  INVX0 U32 ( .INP(A[0]), .ZN(n36) );
  INVX0 U33 ( .INP(B[0]), .ZN(A2_2_AN[0]) );
  INVX0 U34 ( .INP(B[1]), .ZN(A2_2_AN[1]) );
  INVX0 U35 ( .INP(B[2]), .ZN(A2_2_AN[2]) );
  INVX0 U36 ( .INP(B[3]), .ZN(A2_2_AN[3]) );
  INVX0 U37 ( .INP(B[4]), .ZN(A2_2_AN[4]) );
  XOR2X1 U38 ( .IN1(A2_2_AN[4]), .IN2(n9), .Q(A2_2_AMUX1[4]) );
  AND2X1 U39 ( .IN1(n10), .IN2(A2_2_AN[3]), .Q(n9) );
  XOR2X1 U40 ( .IN1(A2_2_AN[3]), .IN2(n10), .Q(A2_2_AMUX1[3]) );
  NOR2X0 U41 ( .IN1(B[2]), .IN2(n11), .QN(n10) );
  XNOR2X1 U42 ( .IN1(A2_2_AN[2]), .IN2(n11), .Q(A2_2_AMUX1[2]) );
  NAND2X0 U43 ( .IN1(A2_2_AN[1]), .IN2(A2_2_AN[0]), .QN(n11) );
  NOR2X0 U44 ( .IN1(add1_1_), .IN2(add0_1_), .QN(n13) );
  NAND2X0 U45 ( .IN1(add1_1_), .IN2(add0_1_), .QN(n12) );
  OA21X1 U46 ( .IN1(n5), .IN2(n13), .IN3(n12), .Q(n18) );
  NOR2X0 U47 ( .IN1(add1_2_), .IN2(add0_2_), .QN(n16) );
  NAND2X0 U48 ( .IN1(add1_2_), .IN2(add0_2_), .QN(n17) );
  OA21X1 U49 ( .IN1(n18), .IN2(n16), .IN3(n17), .Q(n22) );
  NOR2X0 U50 ( .IN1(add1_3_), .IN2(add0_3_), .QN(n20) );
  NAND2X0 U51 ( .IN1(add1_3_), .IN2(add0_3_), .QN(n21) );
  OA21X1 U52 ( .IN1(n22), .IN2(n20), .IN3(n21), .Q(n24) );
  OA21X1 U53 ( .IN1(add1_0_), .IN2(add0_0_), .IN3(n15), .Q(PROD[1]) );
  NOR2X0 U54 ( .IN1(n27), .IN2(n13), .QN(n14) );
  NAND2X0 U55 ( .IN1(n26), .IN2(n17), .QN(n19) );
  XOR2X1 U56 ( .IN1(n19), .IN2(n18), .Q(PROD[3]) );
  NAND2X0 U57 ( .IN1(n25), .IN2(n21), .QN(n23) );
  XOR2X1 U58 ( .IN1(n23), .IN2(n22), .Q(PROD[4]) );
  AND2X1 U59 ( .IN1(PROD_not_1_), .IN2(PROD_not_0_), .Q(n29) );
  XOR2X1 U60 ( .IN1(PROD_not_2_), .IN2(n29), .Q(PROD_cmp_2_) );
  AND2X1 U61 ( .IN1(n29), .IN2(PROD_not_2_), .Q(n28) );
  XOR2X1 U62 ( .IN1(PROD_not_3_), .IN2(n28), .Q(PROD_cmp_3_) );
  NAND3X0 U63 ( .IN1(PROD_not_2_), .IN2(n29), .IN3(PROD_not_3_), .QN(n30) );
  XNOR2X1 U64 ( .IN1(PROD_not_4_), .IN2(n30), .Q(PROD_cmp_4_) );
  NOR2X0 U65 ( .IN1(n30), .IN2(PROD[4]), .QN(n31) );
  XOR2X1 U66 ( .IN1(PROD_not_5_), .IN2(n31), .Q(PROD_cmp_5_) );
  NOR2X0 U67 ( .IN1(n37), .IN2(n8), .QN(add1_4_) );
  NOR2X0 U68 ( .IN1(n37), .IN2(n33), .QN(add1_3_) );
  NOR2X0 U69 ( .IN1(n37), .IN2(n32), .QN(add1_2_) );
  NOR2X0 U70 ( .IN1(n37), .IN2(n35), .QN(add1_1_) );
  NOR2X0 U71 ( .IN1(n37), .IN2(n34), .QN(add1_0_) );
  NAND2X0 U72 ( .IN1(A[1]), .IN2(n36), .QN(n37) );
  NOR2X0 U73 ( .IN1(n8), .IN2(n36), .QN(add0_3_) );
  NOR2X0 U74 ( .IN1(n33), .IN2(n36), .QN(add0_2_) );
  NOR2X0 U75 ( .IN1(n32), .IN2(n36), .QN(add0_1_) );
  NOR2X0 U76 ( .IN1(n35), .IN2(n36), .QN(add0_0_) );
  INVX0 U77 ( .INP(PROD[5]), .ZN(PROD_not_5_) );
  INVX0 U78 ( .INP(PROD[4]), .ZN(PROD_not_4_) );
  INVX0 U79 ( .INP(PROD[3]), .ZN(PROD_not_3_) );
  INVX0 U80 ( .INP(PROD[2]), .ZN(PROD_not_2_) );
  INVX0 U81 ( .INP(PROD[1]), .ZN(PROD_not_1_) );
  INVX0 U82 ( .INP(n38), .ZN(PROD_not_0_) );
  MUX21X1 U83 ( .IN1(n38), .IN2(n38), .S(n4), .Q(PRODUCT[0]) );
  NOR2X0 U84 ( .IN1(n36), .IN2(n34), .QN(n38) );
endmodule


module complex_multiplier_c_WIDTH_12_WIDTH_25_OUT_WIDTH6_DW02_mult_0 ( A, B,
        TC, PRODUCT );
  input [1:0] A;
  input [4:0] B;
  output [6:0] PRODUCT;
  input TC;
  wire   add0_3_, add0_2_, add0_1_, add0_0_, add1_4_, add1_3_, add1_2_,
         add1_1_, add1_0_, PROD_not_4_, PROD_not_3_, PROD_not_2_, PROD_not_1_,
         PROD_not_0_, PROD_cmp_5_, PROD_cmp_4_, PROD_cmp_3_, PROD_cmp_2_,
         PROD_cmp_1_, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34;
  wire   [3:0] B_tc;
  wire   [5:1] PROD;
  wire   [4:1] A2_2_AMUX1;
  wire   [4:0] A2_2_AN;

  NBUFFX2 U2 ( .INP(n34), .Z(n2) );
  MUX21X1 U3 ( .IN1(PROD[4]), .IN2(PROD_cmp_4_), .S(n2), .Q(PRODUCT[4]) );
  MUX21X1 U4 ( .IN1(B[2]), .IN2(A2_2_AMUX1[2]), .S(n1), .Q(B_tc[2]) );
  MUX21X1 U5 ( .IN1(B[3]), .IN2(A2_2_AMUX1[3]), .S(n1), .Q(B_tc[3]) );
  INVX0 U6 ( .INP(B_tc[1]), .ZN(n29) );
  MUX21X1 U7 ( .IN1(B[1]), .IN2(A2_2_AMUX1[1]), .S(B[4]), .Q(B_tc[1]) );
  XNOR2X1 U8 ( .IN1(n11), .IN2(n10), .Q(PROD[2]) );
  MUX21X1 U9 ( .IN1(PROD[1]), .IN2(PROD_cmp_1_), .S(n34), .Q(PRODUCT[1]) );
  MUX21X1 U10 ( .IN1(PROD[5]), .IN2(PROD_cmp_5_), .S(n2), .Q(PRODUCT[5]) );
  NBUFFX2 U11 ( .INP(B[4]), .Z(n1) );
  MUX21X1 U12 ( .IN1(B[0]), .IN2(B[0]), .S(B[4]), .Q(B_tc[0]) );
  NAND2X1 U13 ( .IN1(add0_0_), .IN2(add1_0_), .QN(n11) );
  XNOR2X1 U14 ( .IN1(A[1]), .IN2(A2_2_AN[4]), .Q(n34) );
  MUX21X2 U15 ( .IN1(PROD[3]), .IN2(PROD_cmp_3_), .S(n2), .Q(PRODUCT[3]) );
  MUX21X2 U16 ( .IN1(PROD[2]), .IN2(PROD_cmp_2_), .S(n2), .Q(PRODUCT[2]) );
  XNOR2X1 U17 ( .IN1(PROD_not_3_), .IN2(n3), .Q(PROD_cmp_3_) );
  NAND2X0 U18 ( .IN1(n24), .IN2(PROD_not_2_), .QN(n3) );
  INVX0 U19 ( .INP(n8), .ZN(n21) );
  INVX0 U20 ( .INP(n16), .ZN(n23) );
  INVX0 U21 ( .INP(n12), .ZN(n22) );
  XOR2X1 U22 ( .IN1(PROD_not_1_), .IN2(PROD_not_0_), .Q(PROD_cmp_1_) );
  XNOR2X1 U23 ( .IN1(PROD[5]), .IN2(n26), .Q(PROD_cmp_5_) );
  XOR2X1 U24 ( .IN1(A2_2_AN[1]), .IN2(A2_2_AN[0]), .Q(A2_2_AMUX1[1]) );
  INVX0 U25 ( .INP(B_tc[2]), .ZN(n28) );
  INVX0 U26 ( .INP(B_tc[0]), .ZN(n30) );
  XNOR2X1 U27 ( .IN1(add1_4_), .IN2(n20), .Q(PROD[5]) );
  NAND2X0 U28 ( .IN1(A2_2_AMUX1[4]), .IN2(n1), .QN(n4) );
  INVX0 U29 ( .INP(B_tc[3]), .ZN(n27) );
  INVX0 U30 ( .INP(A[0]), .ZN(n31) );
  INVX0 U31 ( .INP(B[0]), .ZN(A2_2_AN[0]) );
  INVX0 U32 ( .INP(B[1]), .ZN(A2_2_AN[1]) );
  INVX0 U33 ( .INP(B[2]), .ZN(A2_2_AN[2]) );
  INVX0 U34 ( .INP(B[3]), .ZN(A2_2_AN[3]) );
  INVX0 U35 ( .INP(B[4]), .ZN(A2_2_AN[4]) );
  XOR2X1 U36 ( .IN1(A2_2_AN[4]), .IN2(n5), .Q(A2_2_AMUX1[4]) );
  AND2X1 U37 ( .IN1(n6), .IN2(A2_2_AN[3]), .Q(n5) );
  XOR2X1 U38 ( .IN1(A2_2_AN[3]), .IN2(n6), .Q(A2_2_AMUX1[3]) );
  NOR2X0 U39 ( .IN1(B[2]), .IN2(n7), .QN(n6) );
  XNOR2X1 U40 ( .IN1(n7), .IN2(A2_2_AN[2]), .Q(A2_2_AMUX1[2]) );
  NAND2X0 U41 ( .IN1(A2_2_AN[1]), .IN2(A2_2_AN[0]), .QN(n7) );
  NOR2X0 U42 ( .IN1(add1_1_), .IN2(add0_1_), .QN(n9) );
  NAND2X0 U43 ( .IN1(add1_1_), .IN2(add0_1_), .QN(n8) );
  OA21X1 U44 ( .IN1(n11), .IN2(n9), .IN3(n8), .Q(n14) );
  NOR2X0 U45 ( .IN1(add1_2_), .IN2(add0_2_), .QN(n12) );
  NAND2X0 U46 ( .IN1(add1_2_), .IN2(add0_2_), .QN(n13) );
  OA21X1 U47 ( .IN1(n14), .IN2(n12), .IN3(n13), .Q(n18) );
  NOR2X0 U48 ( .IN1(add1_3_), .IN2(add0_3_), .QN(n16) );
  NAND2X0 U49 ( .IN1(add1_3_), .IN2(add0_3_), .QN(n17) );
  OA21X1 U50 ( .IN1(n18), .IN2(n16), .IN3(n17), .Q(n20) );
  OA21X1 U51 ( .IN1(add1_0_), .IN2(add0_0_), .IN3(n11), .Q(PROD[1]) );
  NOR2X0 U52 ( .IN1(n21), .IN2(n9), .QN(n10) );
  NAND2X0 U53 ( .IN1(n22), .IN2(n13), .QN(n15) );
  XOR2X1 U54 ( .IN1(n15), .IN2(n14), .Q(PROD[3]) );
  NAND2X0 U55 ( .IN1(n23), .IN2(n17), .QN(n19) );
  XOR2X1 U56 ( .IN1(n19), .IN2(n18), .Q(PROD[4]) );
  AND2X1 U57 ( .IN1(PROD_not_1_), .IN2(PROD_not_0_), .Q(n24) );
  XOR2X1 U58 ( .IN1(PROD_not_2_), .IN2(n24), .Q(PROD_cmp_2_) );
  XNOR2X1 U60 ( .IN1(PROD_not_4_), .IN2(n25), .Q(PROD_cmp_4_) );
  NOR2X0 U61 ( .IN1(n25), .IN2(PROD[4]), .QN(n26) );
  NOR2X0 U62 ( .IN1(n32), .IN2(n4), .QN(add1_4_) );
  NOR2X0 U63 ( .IN1(n32), .IN2(n27), .QN(add1_3_) );
  NOR2X0 U64 ( .IN1(n32), .IN2(n28), .QN(add1_2_) );
  NOR2X0 U65 ( .IN1(n32), .IN2(n29), .QN(add1_1_) );
  NOR2X0 U66 ( .IN1(n32), .IN2(n30), .QN(add1_0_) );
  NAND2X0 U67 ( .IN1(A[1]), .IN2(n31), .QN(n32) );
  NOR2X0 U68 ( .IN1(n4), .IN2(n31), .QN(add0_3_) );
  NOR2X0 U69 ( .IN1(n27), .IN2(n31), .QN(add0_2_) );
  NOR2X0 U70 ( .IN1(n28), .IN2(n31), .QN(add0_1_) );
  NOR2X0 U71 ( .IN1(n29), .IN2(n31), .QN(add0_0_) );
  INVX0 U72 ( .INP(PROD[4]), .ZN(PROD_not_4_) );
  INVX0 U73 ( .INP(PROD[3]), .ZN(PROD_not_3_) );
  INVX0 U74 ( .INP(PROD[2]), .ZN(PROD_not_2_) );
  INVX0 U75 ( .INP(PROD[1]), .ZN(PROD_not_1_) );
  INVX0 U76 ( .INP(n33), .ZN(PROD_not_0_) );
  MUX21X1 U77 ( .IN1(n33), .IN2(n33), .S(n34), .Q(PRODUCT[0]) );
  NOR2X0 U78 ( .IN1(n31), .IN2(n30), .QN(n33) );
  NAND3X1 U59 ( .IN1(PROD_not_2_), .IN2(n24), .IN3(PROD_not_3_), .QN(n25) );
endmodule


module complex_multiplier_c_WIDTH_12_WIDTH_25_OUT_WIDTH6 ( a_real, a_imag,
        b_real, b_imag, y_real, y_imag );
  input [1:0] a_real;
  input [1:0] a_imag;
  input [4:0] b_real;
  input [4:0] b_imag;
  output [5:0] y_real;
  output [5:0] y_imag;
  wire   mult_bd_5_, mult_bd_4_, mult_bd_3_, mult_bd_2_, mult_bd_1_,
         mult_bd_0_, mult_ac_5_, mult_ac_4_, mult_ac_3_, mult_ac_2_,
         mult_ac_1_, mult_ac_0_, mult_bc_5_, mult_bc_4_, mult_bc_3_,
         mult_bc_2_, mult_bc_1_, mult_bc_0_, mult_ad_5_, mult_ad_4_,
         mult_ad_3_, mult_ad_2_, mult_ad_1_, mult_ad_0_, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, sub_57_n6, sub_57_n5, sub_57_n4,
         sub_57_n3, sub_57_n2, sub_57_n1, add_58_n1, n19,
         SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2,
         SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4;
  wire   [5:1] sub_57_carry;
  wire   [5:2] add_58_carry;

  INVX0 U1 ( .INP(b_imag[4]), .ZN(n1) );
  INVX0 U2 ( .INP(n1), .ZN(n2) );
  NBUFFX2 U3 ( .INP(b_real[4]), .Z(n7) );
  INVX0 U4 ( .INP(b_real[1]), .ZN(n3) );
  INVX0 U5 ( .INP(n3), .ZN(n4) );
  INVX0 U6 ( .INP(b_real[0]), .ZN(n5) );
  INVX0 U7 ( .INP(n5), .ZN(n6) );
  INVX0 U8 ( .INP(n11), .ZN(n12) );
  INVX0 U9 ( .INP(b_real[0]), .ZN(n8) );
  INVX0 U10 ( .INP(n8), .ZN(n9) );
  NBUFFX4 U11 ( .INP(b_imag[4]), .Z(n10) );
  INVX0 U12 ( .INP(b_real[4]), .ZN(n11) );
  complex_multiplier_c_WIDTH_12_WIDTH_25_OUT_WIDTH6_DW02_mult_3 mult_53 ( .A(
        a_real), .B({n7, b_real[3:1], n6}), .TC(1'b1), .PRODUCT({
        SYNOPSYS_UNCONNECTED_1, mult_ac_5_, mult_ac_4_, mult_ac_3_, mult_ac_2_,
        mult_ac_1_, mult_ac_0_}) );
  complex_multiplier_c_WIDTH_12_WIDTH_25_OUT_WIDTH6_DW02_mult_2 mult_54 ( .A(
        a_imag), .B({n2, b_imag[3:0]}), .TC(1'b1), .PRODUCT({
        SYNOPSYS_UNCONNECTED_2, mult_bd_5_, mult_bd_4_, mult_bd_3_, mult_bd_2_,
        mult_bd_1_, mult_bd_0_}) );
  complex_multiplier_c_WIDTH_12_WIDTH_25_OUT_WIDTH6_DW02_mult_1 mult_55 ( .A(
        a_real), .B({n10, b_imag[3:1], n19}), .TC(1'b1), .PRODUCT({
        SYNOPSYS_UNCONNECTED_3, mult_ad_5_, mult_ad_4_, mult_ad_3_, mult_ad_2_,
        mult_ad_1_, mult_ad_0_}) );
  complex_multiplier_c_WIDTH_12_WIDTH_25_OUT_WIDTH6_DW02_mult_0 mult_56 ( .A(
        a_imag), .B({n12, b_real[3:2], n4, n9}), .TC(1'b1), .PRODUCT({
        SYNOPSYS_UNCONNECTED_4, mult_bc_5_, mult_bc_4_, mult_bc_3_, mult_bc_2_,
        mult_bc_1_, mult_bc_0_}) );
  XOR2X1 sub_57_U8 ( .IN1(mult_bd_0_), .IN2(mult_ac_0_), .Q(y_real[0]) );
  INVX0 sub_57_U7 ( .INP(mult_bd_5_), .ZN(sub_57_n2) );
  INVX0 sub_57_U6 ( .INP(mult_bd_1_), .ZN(sub_57_n6) );
  INVX0 sub_57_U5 ( .INP(mult_bd_3_), .ZN(sub_57_n4) );
  INVX0 sub_57_U4 ( .INP(mult_bd_4_), .ZN(sub_57_n3) );
  OR2X1 sub_57_U3 ( .IN1(mult_ac_0_), .IN2(sub_57_n1), .Q(sub_57_carry[1]) );
  INVX0 sub_57_U2 ( .INP(mult_bd_0_), .ZN(sub_57_n1) );
  INVX1 sub_57_U1 ( .INP(mult_bd_2_), .ZN(sub_57_n5) );
  XOR3X1 sub_57_U2_5 ( .IN1(mult_ac_5_), .IN2(sub_57_n2), .IN3(sub_57_carry[5]), .Q(y_real[5]) );
  FADDX1 sub_57_U2_1 ( .A(mult_ac_1_), .B(sub_57_n6), .CI(sub_57_carry[1]),
        .CO(sub_57_carry[2]), .S(y_real[1]) );
  FADDX1 sub_57_U2_2 ( .A(mult_ac_2_), .B(sub_57_n5), .CI(sub_57_carry[2]),
        .CO(sub_57_carry[3]), .S(y_real[2]) );
  FADDX1 sub_57_U2_3 ( .A(mult_ac_3_), .B(sub_57_n4), .CI(sub_57_carry[3]),
        .CO(sub_57_carry[4]), .S(y_real[3]) );
  FADDX1 sub_57_U2_4 ( .A(mult_ac_4_), .B(sub_57_n3), .CI(sub_57_carry[4]),
        .CO(sub_57_carry[5]), .S(y_real[4]) );
  AND2X1 add_58_U2 ( .IN1(mult_bc_0_), .IN2(mult_ad_0_), .Q(add_58_n1) );
  XOR2X1 add_58_U1 ( .IN1(mult_bc_0_), .IN2(mult_ad_0_), .Q(y_imag[0]) );
  XOR3X1 add_58_U1_5 ( .IN1(mult_ad_5_), .IN2(mult_bc_5_), .IN3(
        add_58_carry[5]), .Q(y_imag[5]) );
  FADDX1 add_58_U1_1 ( .A(mult_ad_1_), .B(mult_bc_1_), .CI(add_58_n1), .CO(
        add_58_carry[2]), .S(y_imag[1]) );
  FADDX1 add_58_U1_2 ( .A(add_58_carry[2]), .B(mult_bc_2_), .CI(mult_ad_2_),
        .CO(add_58_carry[3]), .S(y_imag[2]) );
  FADDX1 add_58_U1_3 ( .A(mult_ad_3_), .B(mult_bc_3_), .CI(add_58_carry[3]),
        .CO(add_58_carry[4]), .S(y_imag[3]) );
  FADDX1 add_58_U1_4 ( .A(mult_ad_4_), .B(mult_bc_4_), .CI(add_58_carry[4]),
        .CO(add_58_carry[5]), .S(y_imag[4]) );
  NBUFFX2 U15 ( .INP(b_imag[0]), .Z(n19) );
endmodule


module complex_exp_LUT_cart ( sample_address, chirp_re, chirp_im );
  input [11:0] sample_address;
  output [4:0] chirp_re;
  output [4:0] chirp_im;
  wire   n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n223, n224, n225, n226, n227, n228, n229,
         n230, n231, n232, n233, n234, n235, n236, n237, n238, n239, n240,
         n241, n242, n243, n244, n245, n246, n247, n248, n249, n250, n251,
         n252, n253, n254, n255, n256, n257, n258, n259, n260, n261, n262,
         n263, n264, n265, n266, n267, n268, n269, n270, n271, n272, n273,
         n274, n275, n276, n277, n278, n279, n280, n281, n282, n283, n284,
         n285, n286, n287, n288, n289, n290, n291, n292, n293, n294, n295,
         n296, n297, n298, n299, n300, n301, n302, n303, n304, n305, n306,
         n307, n308, n309, n310, n311, n312, n313, n314, n315, n316, n317,
         n318, n319, n320, n326, n327, n328, n329, n330, n331, n332, n333,
         n334, n335, n336, n337, n339, n340, n341, n342, n343, n344, n345,
         n346, n347, n348, n349, n350, n351, n352, n353, n354, n355, n356,
         n357, n358, n359, n360, n361, n362, n363, n364, n365, n366, n367,
         n368, n369, n370, n371, n372, n373, n374, n375, n376, n377, n378,
         n379, n380, n381, n382, n383, n384, n385, n386, n387, n388, n389,
         n390, n392, n393, n394, n395, n396, n397, n398, n399, n400, n401,
         n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412,
         n413, n414, n415, n416, n417, n418, n419, n420, n421, n422, n423,
         n424, n425, n426, n427, n428, n429, n430, n431, n432, n433, n434,
         n435, n436, n437, n438, n439, n440, n441, n442, n443, n444, n445,
         n446, n447, n448, n449, n450, n451, n452, n453, n454, n455, n456,
         n457, n458, n459, n460, n461, n462, n463, n464, n465, n466, n467,
         n468, n469, n470, n471, n472, n473, n474, n475, n476, n477, n478,
         n479, n480, n481, n482, n483, n484, n485, n486, n487, n488, n489,
         n491, n495, n496, n497, n498, n499, n500, n501, n502, n503, n504,
         n505, n506, n507, n508, n509, n510, n511, n512, n513, n514, n515,
         n516, n517, n518, n519, n520, n521, n522, n523, n524, n525, n526,
         n527, n528, n529, n530, n531, n532, n533, n534, n535, n536, n537,
         n538, n539, n540, n541, n542, n543, n544, n545, n546, n547, n548,
         n549, n550, n551, n552, n553, n554, n555, n556, n557, n558, n559,
         n560, n561, n562, n563, n564, n565, n566, n567, n568, n569, n570,
         n571, n572, n573, n574, n575, n576, n577, n578, n579, n580, n581,
         n582, n583, n584, n585, n586, n587, n588, n589, n590, n591, n592,
         n593, n594, n595, n596, n597, n598, n599, n600, n601, n602, n603,
         n604, n605, n606, n607, n608, n609, n610, n611, n612, n613, n614,
         n615, n616, n617, n618, n620, n621, n622, n623, n624, n625, n626,
         n627, n628, n629, n630, n631, n632, n633, n634, n635, n636, n637,
         n638, n639, n640, n641, n642, n643, n644, n645, n646, n647, n648,
         n649, n650, n651, n652, n653, n654, n655, n656, n657, n658, n659,
         n660, n661, n662, n663, n664, n665, n666, n667, n668, n669, n670,
         n671, n672, n673, n674, n675, n676, n677, n678, n679, n680, n681,
         n682, n683, n684, n685, n686, n687, n688, n689, n690, n691, n692,
         n693, n694, n695, n696, n697, n698, n699, n700, n701, n702, n703,
         n704, n705, n706, n707, n708, n709, n710, n711, n712, n713, n714,
         n715, n716, n717, n718, n719, n720, n721, n722, n723, n724, n725,
         n726, n727, n728, n729, n730, n731, n732, n733, n734, n735, n736,
         n737, n738, n739, n740, n741, n742, n743, n744, n745, n746, n747,
         n748, n749, n750, n751, n752, n753, n754, n755, n756, n757, n758,
         n759, n760, n761, n762, n763, n764, n765, n766, n767, n768, n769,
         n770, n771, n772, n773, n774, n775, n776, n777, n778, n779, n780,
         n781, n782, n783, n784, n785, n786, n787, n788, n789, n790, n791,
         n792, n793, n794, n795, n796, n797, n798, n799, n800, n801, n802,
         n803, n804, n805, n806, n807, n808, n809, n810, n811, n812, n813,
         n814, n815, n816, n817, n818, n819, n820, n821, n822, n823, n824,
         n825, n826, n827, n828, n829, n830, n831, n832, n833, n834, n835,
         n836, n837, n838, n839, n840, n841, n842, n843, n844, n845, n846,
         n847, n848, n849, n850, n851, n852, n853, n854, n855, n856, n857,
         n858, n859, n860, n861, n862, n863, n864, n865, n866, n867, n868,
         n869, n870, n871, n872, n873, n874, n875, n876, n877, n878, n879,
         n880, n881, n882, n883, n884, n885, n886, n887, n888, n889, n890,
         n891, n892, n893, n894, n895, n896, n897, n898, n899, n900, n901,
         n902, n903, n904, n905, n906, n907, n908, n909, n910, n911, n912,
         n913, n914, n915, n916, n917, n918, n919, n920, n921, n922, n923,
         n924, n925, n926, n927, n928, n929, n930, n931, n932, n933, n934,
         n935, n936, n937, n938, n939, n940, n941, n942, n943, n944, n945,
         n946, n947, n948, n949, n950, n951, n952, n953, n954, n955, n956,
         n957, n958, n959, n960, n961, n962, n963, n964, n965, n966, n967,
         n968, n969, n970, n971, n972, n973, n974, n975, n976, n977, n978,
         n979, n980, n981, n982, n983, n984, n985, n986, n987, n988, n989,
         n990, n991, n994, n995, n996, n997, n998, n999, n1001, n1002, n1003,
         n1004, n1005, n1006, n1007, n1008, n1009, n1010, n1011, n1012, n1013,
         n1014, n1015, n1016, n1017, n1018, n1019, n1020, n1021, n1022, n1023,
         n1024, n1026, n1027, n1028, n1029, n1030, n1031, n1032, n1033, n1034,
         n1035, n1036, n1037, n1038, n1039, n1040, n1041, n1042, n1043, n1044,
         n1045, n1046, n1047, n1048, n1049, n1050, n1051, n1052, n1053, n1054,
         n1055, n1056, n1057, n1058, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n321, n322, n323, n324, n325, n338, n391, n490, n492,
         n493, n494, n619, n992, n993, n1000, n1025, n1059, n1060, n1061,
         n1062, n1063, n1064, n1065, n1066, n1067, n1068, n1069, n1070, n1071,
         n1072, n1073, n1074, n1075, n1076, n1077, n1078, n1079, n1080, n1081,
         n1082, n1083, n1084, n1085, n1086, n1087, n1088, n1089, n1090, n1091,
         n1092, n1093, n1094, n1095, n1096, n1097, n1098, n1099, n1100, n1101,
         n1102, n1103, n1104, n1105, n1106, n1107, n1108, n1109, n1110, n1111,
         n1112, n1113, n1114, n1115, n1116, n1117, n1118, n1119, n1120, n1121,
         n1122, n1123, n1124, n1125, n1126, n1127, n1128, n1129, n1130, n1131,
         n1132, n1133, n1134, n1135, n1136, n1137, n1138, n1139, n1140, n1141,
         n1142, n1143, n1144, n1145, n1146, n1147, n1148, n1149, n1150, n1151,
         n1152, n1153, n1154, n1155, n1156, n1157, n1158, n1159, n1160, n1161,
         n1162, n1163, n1164, n1165, n1166, n1167, n1168, n1169, n1170, n1171,
         n1172, n1173, n1174, n1175, n1176, n1177, n1178, n1179, n1180, n1181,
         n1182, n1183, n1184, n1185, n1186, n1187, n1188, n1189, n1190, n1191,
         n1192, n1193, n1194, n1195, n1196, n1197, n1198, n1199, n1200, n1201,
         n1202, n1203, n1204, n1205, n1206, n1207, n1208, n1209, n1210, n1211,
         n1212, n1213, n1214, n1215, n1216, n1217, n1218, n1219, n1220, n1221,
         n1222, n1223, n1224, n1225, n1226, n1227, n1228, n1229, n1230, n1231,
         n1232, n1233, n1234, n1235, n1236, n1237, n1238, n1239, n1240, n1241,
         n1242, n1243, n1244, n1245, n1246, n1247, n1248, n1249, n1250, n1251,
         n1252, n1253, n1254, n1255, n1256, n1257, n1258, n1259, n1260, n1261,
         n1262, n1263, n1264, n1265, n1266, n1267, n1268, n1269, n1270, n1271,
         n1272, n1273, n1274, n1275, n1276;

  NAND4X0 U446 ( .IN1(n1161), .IN2(n1165), .IN3(n1133), .IN4(n184), .QN(n178)
         );
  NAND4X0 U447 ( .IN1(n186), .IN2(n187), .IN3(n188), .IN4(n189), .QN(n177) );
  NAND4X0 U449 ( .IN1(n194), .IN2(n195), .IN3(n196), .IN4(n197), .QN(n176) );
  OA221X1 U450 ( .IN1(n198), .IN2(n199), .IN3(n200), .IN4(n201), .IN5(n202),
        .Q(n197) );
  OA22X1 U451 ( .IN1(n1136), .IN2(n203), .IN3(n58), .IN4(n204), .Q(n202) );
  AND2X1 U452 ( .IN1(n210), .IN2(n1218), .Q(n199) );
  OA221X1 U453 ( .IN1(n211), .IN2(n1066), .IN3(n213), .IN4(n174), .IN5(n215),
        .Q(n196) );
  OA22X1 U454 ( .IN1(n216), .IN2(n217), .IN3(n1207), .IN4(n992), .Q(n215) );
  OA22X1 U456 ( .IN1(n223), .IN2(n224), .IN3(n159), .IN4(n226), .Q(n222) );
  NOR3X0 U457 ( .IN1(n229), .IN2(n228), .IN3(n227), .QN(n194) );
  AND4X1 U459 ( .IN1(n236), .IN2(n193), .IN3(n237), .IN4(n1149), .Q(n235) );
  NAND4X0 U460 ( .IN1(n1123), .IN2(n239), .IN3(n240), .IN4(n241), .QN(n230) );
  OA22X1 U461 ( .IN1(n246), .IN2(n1110), .IN3(n1065), .IN4(n248), .Q(n240) );
  NAND4X0 U463 ( .IN1(n237), .IN2(n1120), .IN3(n233), .IN4(n256), .QN(n251) );
  OA221X1 U464 ( .IN1(n1205), .IN2(n1065), .IN3(n257), .IN4(n1114), .IN5(n1140), .Q(n256) );
  AND4X1 U465 ( .IN1(n1129), .IN2(n261), .IN3(n262), .IN4(n263), .Q(n233) );
  OR3X1 U466 ( .IN1(n268), .IN2(n1131), .IN3(n269), .Q(n264) );
  AND3X1 U467 ( .IN1(n271), .IN2(n272), .IN3(n273), .Q(n262) );
  AND4X1 U468 ( .IN1(n275), .IN2(n1132), .IN3(n276), .IN4(n277), .Q(n237) );
  NAND4X0 U470 ( .IN1(n1150), .IN2(n291), .IN3(n292), .IN4(n293), .QN(n238) );
  OA222X1 U471 ( .IN1(n297), .IN2(n160), .IN3(n298), .IN4(n1065), .IN5(n299),
        .IN6(n993), .Q(n292) );
  NAND4X0 U472 ( .IN1(n261), .IN2(n193), .IN3(n1124), .IN4(n305), .QN(n285) );
  OA222X1 U473 ( .IN1(n1066), .IN2(n224), .IN3(n306), .IN4(n223), .IN5(n1220),
        .IN6(n1114), .Q(n305) );
  AND2X1 U474 ( .IN1(n307), .IN2(n308), .Q(n306) );
  AO21X1 U475 ( .IN1(n1146), .IN2(n209), .IN3(n309), .Q(n279) );
  NOR3X0 U477 ( .IN1(n312), .IN2(n313), .IN3(n314), .QN(n311) );
  AND4X1 U478 ( .IN1(n316), .IN2(n1127), .IN3(n317), .IN4(n318), .Q(n261) );
  OA222X1 U479 ( .IN1(n174), .IN2(n226), .IN3(n1207), .IN4(n153), .IN5(n172),
        .IN6(n319), .Q(n318) );
  NAND4X0 U481 ( .IN1(n1155), .IN2(n232), .IN3(n329), .IN4(n1122), .QN(n287)
         );
  OA22X1 U482 ( .IN1(n818), .IN2(n173), .IN3(n331), .IN4(n247), .Q(n329) );
  AND4X1 U483 ( .IN1(n1166), .IN2(n332), .IN3(n333), .IN4(n334), .Q(n232) );
  OA222X1 U484 ( .IN1(n339), .IN2(n993), .IN3(n340), .IN4(n619), .IN5(n341),
        .IN6(n1114), .Q(n333) );
  AND2X1 U485 ( .IN1(n342), .IN2(n343), .Q(n341) );
  AO22X1 U487 ( .IN1(n1232), .IN2(n1084), .IN3(n1087), .IN4(n347), .Q(n227) );
  NAND4X0 U488 ( .IN1(n348), .IN2(n349), .IN3(n350), .IN4(n351), .QN(n347) );
  AND2X1 U489 ( .IN1(n352), .IN2(n353), .Q(n351) );
  NAND4X0 U491 ( .IN1(n1139), .IN2(n355), .IN3(n234), .IN4(n356), .QN(n290) );
  OA222X1 U492 ( .IN1(n223), .IN2(n357), .IN3(n358), .IN4(n153), .IN5(n165),
        .IN6(n360), .Q(n356) );
  AND4X1 U493 ( .IN1(n184), .IN2(n361), .IN3(n362), .IN4(n363), .Q(n234) );
  AOI222X1 U494 ( .IN1(n78), .IN2(n368), .IN3(n105), .IN4(n369), .IN5(n110),
        .IN6(n370), .QN(n362) );
  NAND4X0 U496 ( .IN1(n210), .IN2(n373), .IN3(n374), .IN4(n375), .QN(n369) );
  NAND4X0 U498 ( .IN1(n381), .IN2(n302), .IN3(n382), .IN4(n383), .QN(n380) );
  AOI221X1 U499 ( .IN1(n1084), .IN2(n386), .IN3(n158), .IN4(n387), .IN5(n388),
        .QN(n184) );
  NAND4X0 U500 ( .IN1(n149), .IN2(n1242), .IN3(n38), .IN4(n393), .QN(n390) );
  AO21X1 U501 ( .IN1(n394), .IN2(n395), .IN3(n107), .Q(n389) );
  NAND3X0 U502 ( .IN1(n396), .IN2(n397), .IN3(n398), .QN(n387) );
  NAND3X0 U503 ( .IN1(n399), .IN2(n400), .IN3(n401), .QN(n386) );
  NAND4X0 U504 ( .IN1(n405), .IN2(n403), .IN3(n404), .IN4(n1152), .QN(n254) );
  OR3X1 U505 ( .IN1(n408), .IN2(n409), .IN3(n410), .Q(n289) );
  AO22X1 U506 ( .IN1(n411), .IN2(n1084), .IN3(n412), .IN4(n110), .Q(n410) );
  AO221X1 U508 ( .IN1(n1088), .IN2(n415), .IN3(n1237), .IN4(n154), .IN5(n416),
        .Q(n185) );
  AO22X1 U509 ( .IN1(n111), .IN2(n417), .IN3(n106), .IN4(n418), .Q(n416) );
  NAND4X0 U510 ( .IN1(n423), .IN2(n424), .IN3(n51), .IN4(n426), .QN(n415) );
  OA222X1 U511 ( .IN1(n428), .IN2(n1000), .IN3(n429), .IN4(n1066), .IN5(n430),
        .IN6(n992), .Q(n404) );
  AND3X1 U512 ( .IN1(n433), .IN2(n434), .IN3(n435), .Q(n186) );
  OA222X1 U513 ( .IN1(n619), .IN2(n436), .IN3(n437), .IN4(n1114), .IN5(n438),
        .IN6(n1065), .Q(n435) );
  AND2X1 U514 ( .IN1(n818), .IN2(n439), .Q(n437) );
  AND4X1 U515 ( .IN1(n441), .IN2(n442), .IN3(n443), .IN4(n444), .Q(n190) );
  OA221X1 U516 ( .IN1(n445), .IN2(n321), .IN3(n446), .IN4(n166), .IN5(n447),
        .Q(n444) );
  AO22X1 U518 ( .IN1(n259), .IN2(n1143), .IN3(n1145), .IN4(n258), .Q(n451) );
  AO222X1 U520 ( .IN1(n112), .IN2(n455), .IN3(n1085), .IN4(n456), .IN5(n156),
        .IN6(n457), .Q(n454) );
  NAND3X0 U521 ( .IN1(n458), .IN2(n459), .IN3(n460), .QN(n457) );
  NAND4X0 U522 ( .IN1(n1180), .IN2(n400), .IN3(n461), .IN4(n426), .QN(n456) );
  NAND3X0 U523 ( .IN1(n461), .IN2(n464), .IN3(n465), .QN(n453) );
  OR4X1 U524 ( .IN1(n288), .IN2(n327), .IN3(n328), .IN4(n326), .Q(n470) );
  NAND4X0 U525 ( .IN1(n1160), .IN2(n271), .IN3(n471), .IN4(n472), .QN(n288) );
  OA221X1 U526 ( .IN1(n170), .IN2(n473), .IN3(n1065), .IN4(n248), .IN5(n474),
        .Q(n472) );
  OA222X1 U527 ( .IN1(n1219), .IN2(n159), .IN3(n385), .IN4(n619), .IN5(n1218),
        .IN6(n153), .Q(n474) );
  AND3X1 U528 ( .IN1(n441), .IN2(n475), .IN3(n476), .Q(n471) );
  AOI22X1 U529 ( .IN1(n1076), .IN2(n477), .IN3(n103), .IN4(n478), .QN(n441) );
  AOI222X1 U530 ( .IN1(n103), .IN2(n412), .IN3(n49), .IN4(n479), .IN5(n1265),
        .IN6(n1077), .QN(n271) );
  AO222X1 U531 ( .IN1(n1173), .IN2(n1089), .IN3(n1086), .IN4(n480), .IN5(n1256), .IN6(n155), .Q(n407) );
  AO21X1 U532 ( .IN1(n1072), .IN2(n163), .IN3(n1183), .Q(n480) );
  OR4X1 U533 ( .IN1(n15), .IN2(n18), .IN3(n280), .IN4(n274), .Q(n469) );
  NAND4X0 U534 ( .IN1(n481), .IN2(n1148), .IN3(n482), .IN4(n483), .QN(n367) );
  OA221X1 U535 ( .IN1(n484), .IN2(n165), .IN3(n485), .IN4(n153), .IN5(n486),
        .Q(n483) );
  OA222X1 U536 ( .IN1(n487), .IN2(n172), .IN3(n1138), .IN4(n488), .IN5(n489),
        .IN6(n12), .Q(n486) );
  OAI21X1 U537 ( .IN1(n1105), .IN2(n133), .IN3(n127), .QN(n488) );
  NAND4X0 U539 ( .IN1(n497), .IN2(n498), .IN3(n499), .IN4(n500), .QN(n496) );
  NAND4X0 U541 ( .IN1(n424), .IN2(n508), .IN3(n509), .IN4(n510), .QN(n501) );
  AND3X1 U542 ( .IN1(n511), .IN2(n512), .IN3(n513), .Q(n510) );
  NAND4X0 U543 ( .IN1(n381), .IN2(n507), .IN3(n382), .IN4(n518), .QN(n517) );
  OA221X1 U544 ( .IN1(n53), .IN2(n1271), .IN3(n95), .IN4(n519), .IN5(n509),
        .Q(n518) );
  NAND4X0 U545 ( .IN1(n51), .IN2(n426), .IN3(n520), .IN4(n521), .QN(n516) );
  AND3X1 U546 ( .IN1(n302), .IN2(n1068), .IN3(n217), .Q(n521) );
  NAND3X0 U548 ( .IN1(n342), .IN2(n343), .IN3(n532), .QN(n531) );
  NAND4X0 U549 ( .IN1(n533), .IN2(n534), .IN3(n535), .IN4(n536), .QN(n530) );
  AOI21X1 U550 ( .IN1(n537), .IN2(n538), .IN3(n173), .QN(n527) );
  NAND4X0 U551 ( .IN1(n540), .IN2(n541), .IN3(n542), .IN4(n543), .QN(n539) );
  AND3X1 U552 ( .IN1(n547), .IN2(n548), .IN3(n549), .Q(n542) );
  NAND4X0 U553 ( .IN1(n443), .IN2(n551), .IN3(n552), .IN4(n553), .QN(n274) );
  AO21X1 U554 ( .IN1(n210), .IN2(n554), .IN3(n1000), .Q(n553) );
  AOI221X1 U557 ( .IN1(n101), .IN2(n556), .IN3(n1076), .IN4(n557), .IN5(n558),
        .QN(n443) );
  AO22X1 U558 ( .IN1(n1269), .IN2(n94), .IN3(n1081), .IN4(n559), .Q(n558) );
  NAND4X0 U559 ( .IN1(n560), .IN2(n561), .IN3(n499), .IN4(n500), .QN(n559) );
  NAND3X0 U561 ( .IN1(n115), .IN2(n130), .IN3(n122), .QN(n377) );
  AO22X1 U562 ( .IN1(n1231), .IN2(n1084), .IN3(n78), .IN4(n562), .Q(n280) );
  OR2X1 U563 ( .IN1(n563), .IN2(n346), .Q(n562) );
  OA221X1 U567 ( .IN1(n571), .IN2(n216), .IN3(n198), .IN4(n572), .IN5(n307),
        .Q(n570) );
  OA22X1 U568 ( .IN1(n164), .IN2(n1216), .IN3(n172), .IN4(n460), .Q(n275) );
  AND2X1 U569 ( .IN1(n574), .IN2(n575), .Q(n460) );
  NAND4X0 U570 ( .IN1(n578), .IN2(n576), .IN3(n577), .IN4(n1128), .QN(n229) );
  AO22X1 U571 ( .IN1(n1076), .IN2(n582), .IN3(n583), .IN4(n1145), .Q(n580) );
  NAND4X0 U572 ( .IN1(n584), .IN2(n297), .IN3(n585), .IN4(n586), .QN(n583) );
  AO221X1 U573 ( .IN1(n589), .IN2(n1142), .IN3(n590), .IN4(n573), .IN5(n591),
        .Q(n579) );
  AO22X1 U574 ( .IN1(n592), .IN2(n207), .IN3(n78), .IN4(n593), .Q(n591) );
  OR3X1 U576 ( .IN1(n478), .IN2(n1253), .IN3(n477), .Q(n592) );
  NAND4X0 U577 ( .IN1(n473), .IN2(n360), .IN3(n595), .IN4(n596), .QN(n590) );
  NAND4X0 U578 ( .IN1(n246), .IN2(n1185), .IN3(n597), .IN4(n598), .QN(n589) );
  OA221X1 U579 ( .IN1(n599), .IN2(n993), .IN3(n221), .IN4(n1179), .IN5(n600),
        .Q(n577) );
  OA22X1 U580 ( .IN1(n1206), .IN2(n1066), .IN3(n601), .IN4(n602), .Q(n600) );
  AND3X1 U581 ( .IN1(n127), .IN2(n132), .IN3(n115), .Q(n605) );
  NAND4X0 U583 ( .IN1(n445), .IN2(n428), .IN3(n1189), .IN4(n587), .QN(n603) );
  AND4X1 U584 ( .IN1(n1188), .IN2(n297), .IN3(n608), .IN4(n424), .Q(n428) );
  NAND3X0 U585 ( .IN1(n609), .IN2(n610), .IN3(n611), .QN(n265) );
  OA222X1 U586 ( .IN1(n612), .IN2(n1111), .IN3(n613), .IN4(n165), .IN5(n614),
        .IN6(n174), .Q(n611) );
  AND2X1 U587 ( .IN1(n1206), .IN2(n463), .Q(n614) );
  AO222X1 U588 ( .IN1(n78), .IN2(n616), .IN3(n115), .IN4(n617), .IN5(n155),
        .IN6(n301), .Q(n413) );
  AO22X1 U589 ( .IN1(n1073), .IN2(n111), .IN3(n618), .IN4(n149), .Q(n617) );
  OAI21X1 U590 ( .IN1(n1114), .IN2(n1068), .IN3(n620), .QN(n295) );
  NAND4X0 U591 ( .IN1(n1082), .IN2(n127), .IN3(n1105), .IN4(n57), .QN(n620) );
  AND3X1 U592 ( .IN1(n1168), .IN2(n433), .IN3(n621), .Q(n564) );
  AND3X1 U593 ( .IN1(n239), .IN2(n622), .IN3(n623), .Q(n433) );
  OA222X1 U594 ( .IN1(n107), .IN2(n436), .IN3(n438), .IN4(n1114), .IN5(n439),
        .IN6(n1066), .Q(n623) );
  AND2X1 U595 ( .IN1(n540), .IN2(n545), .Q(n439) );
  AOI222X1 U596 ( .IN1(n150), .IN2(n346), .IN3(n1077), .IN4(n563), .IN5(n1231),
        .IN6(n100), .QN(n239) );
  NAND3X0 U597 ( .IN1(n547), .IN2(n549), .IN3(n541), .QN(n346) );
  NAND4X0 U598 ( .IN1(n624), .IN2(n625), .IN3(n626), .IN4(n627), .QN(n467) );
  OA221X1 U599 ( .IN1(n628), .IN2(n816), .IN3(n219), .IN4(n629), .IN5(n630),
        .Q(n627) );
  OA221X1 U600 ( .IN1(n631), .IN2(n1114), .IN3(n221), .IN4(n632), .IN5(n1144),
        .Q(n630) );
  OA221X1 U602 ( .IN1(n58), .IN2(n446), .IN3(n198), .IN4(n635), .IN5(n636),
        .Q(n626) );
  OA22X1 U603 ( .IN1(n637), .IN2(n302), .IN3(n601), .IN4(n638), .Q(n636) );
  AND4X1 U604 ( .IN1(n226), .IN2(n445), .IN3(n1216), .IN4(n213), .Q(n635) );
  OA221X1 U605 ( .IN1(n1217), .IN2(n993), .IN3(n210), .IN4(n321), .IN5(n640),
        .Q(n625) );
  OA22X1 U606 ( .IN1(n164), .IN2(n248), .IN3(n247), .IN4(n1068), .Q(n640) );
  OR4X1 U607 ( .IN1(n646), .IN2(n647), .IN3(n648), .IN4(n649), .Q(n645) );
  NAND4X0 U608 ( .IN1(n650), .IN2(n651), .IN3(n652), .IN4(n653), .QN(n649) );
  NAND4X0 U609 ( .IN1(n1159), .IN2(n1165), .IN3(n654), .IN4(n655), .QN(n648)
         );
  AO222X1 U610 ( .IN1(n1208), .IN2(n1084), .IN3(n1085), .IN4(n656), .IN5(n1200), .IN6(n113), .Q(n296) );
  AO221X1 U611 ( .IN1(n1089), .IN2(n657), .IN3(n1246), .IN4(n1083), .IN5(n658),
        .Q(n183) );
  AO22X1 U612 ( .IN1(n1238), .IN2(n157), .IN3(n1266), .IN4(n110), .Q(n658) );
  NAND3X0 U613 ( .IN1(n396), .IN2(n397), .IN3(n659), .QN(n657) );
  NAND4X0 U614 ( .IN1(n3), .IN2(n661), .IN3(n662), .IN4(n663), .QN(n647) );
  OR4X1 U615 ( .IN1(n664), .IN2(n665), .IN3(n336), .IN4(n666), .Q(n646) );
  OR4X1 U616 ( .IN1(n667), .IN2(n668), .IN3(n669), .IN4(n670), .Q(n644) );
  NAND4X0 U618 ( .IN1(n1179), .IN2(n560), .IN3(n554), .IN4(n561), .QN(n674) );
  NAND4X0 U619 ( .IN1(n675), .IN2(n581), .IN3(n676), .IN4(n677), .QN(n669) );
  OA22X1 U620 ( .IN1(n678), .IN2(n1000), .IN3(n679), .IN4(n160), .Q(n677) );
  AO21X1 U622 ( .IN1(n683), .IN2(n217), .IN3(n1065), .Q(n676) );
  AO21X1 U623 ( .IN1(n512), .IN2(n511), .IN3(n159), .Q(n581) );
  NAND4X0 U624 ( .IN1(n1126), .IN2(n282), .IN3(n684), .IN4(n685), .QN(n668) );
  NAND4X0 U625 ( .IN1(n310), .IN2(n1125), .IN3(n1134), .IN4(n476), .QN(n667)
         );
  AOI222X1 U626 ( .IN1(n156), .IN2(n686), .IN3(n105), .IN4(n687), .IN5(n1232),
        .IN6(n1087), .QN(n310) );
  AND2X1 U627 ( .IN1(n348), .IN2(n350), .Q(n458) );
  NAND4X0 U628 ( .IN1(n693), .IN2(n3), .IN3(n1169), .IN4(n481), .QN(n692) );
  AND3X1 U629 ( .IN1(n652), .IN2(n653), .IN3(n694), .Q(n481) );
  AOI222X1 U630 ( .IN1(n157), .IN2(n695), .IN3(n110), .IN4(n696), .IN5(n1248),
        .IN6(n105), .QN(n653) );
  NAND3X0 U632 ( .IN1(n703), .IN2(n704), .IN3(n705), .QN(n700) );
  AO22X1 U633 ( .IN1(n111), .IN2(n706), .IN3(n1089), .IN4(n634), .Q(n666) );
  NAND3X0 U634 ( .IN1(n538), .IN2(n707), .IN3(n537), .QN(n706) );
  AND2X1 U636 ( .IN1(n654), .IN2(n655), .Q(n609) );
  AOI222X1 U637 ( .IN1(n103), .IN2(n708), .IN3(n1254), .IN4(n709), .IN5(n1235),
        .IN6(n24), .QN(n655) );
  AOI221X1 U638 ( .IN1(n151), .IN2(n711), .IN3(n1209), .IN4(n102), .IN5(n712),
        .QN(n654) );
  AO22X1 U639 ( .IN1(n1177), .IN2(n24), .IN3(n1178), .IN4(n100), .Q(n712) );
  NAND3X0 U640 ( .IN1(n714), .IN2(n360), .IN3(n399), .QN(n711) );
  AO221X1 U641 ( .IN1(n1074), .IN2(n715), .IN3(n1081), .IN4(n716), .IN5(n717),
        .Q(n182) );
  AO22X1 U642 ( .IN1(n150), .IN2(n718), .IN3(n1079), .IN4(n719), .Q(n717) );
  NAND4X0 U643 ( .IN1(n459), .IN2(n720), .IN3(n721), .IN4(n722), .QN(n716) );
  NAND4X0 U645 ( .IN1(n724), .IN2(n465), .IN3(n464), .IN4(n725), .QN(n715) );
  NOR3X0 U646 ( .IN1(n245), .IN2(n726), .IN3(n567), .QN(n191) );
  NAND4X0 U647 ( .IN1(n727), .IN2(n282), .IN3(n728), .IN4(n729), .QN(n567) );
  OA22X1 U648 ( .IN1(n730), .IN2(n1000), .IN3(n571), .IN4(n992), .Q(n728) );
  AND3X1 U649 ( .IN1(n731), .IN2(n732), .IN3(n733), .Q(n730) );
  AOI222X1 U650 ( .IN1(n24), .IN2(n639), .IN3(n1075), .IN4(n686), .IN5(n1226),
        .IN6(n1146), .QN(n282) );
  NAND4X0 U651 ( .IN1(n1168), .IN2(n1140), .IN3(n734), .IN4(n735), .QN(n690)
         );
  AO21X1 U652 ( .IN1(n1188), .IN2(n586), .IN3(n159), .Q(n735) );
  NAND3X0 U653 ( .IN1(n736), .IN2(n737), .IN3(n738), .QN(n477) );
  AO22X1 U654 ( .IN1(n94), .IN2(n739), .IN3(n1081), .IN4(n740), .Q(n312) );
  NAND4X0 U656 ( .IN1(n751), .IN2(n693), .IN3(n1164), .IN4(n1157), .QN(n750)
         );
  NAND3X0 U657 ( .IN1(n650), .IN2(n651), .IN3(n1158), .QN(n364) );
  AOI22X1 U658 ( .IN1(n1193), .IN2(n111), .IN3(n106), .IN4(n753), .QN(n651) );
  NAND3X0 U659 ( .IN1(n495), .IN2(n424), .IN3(n754), .QN(n753) );
  AOI222X1 U660 ( .IN1(n155), .IN2(n755), .IN3(n115), .IN4(n756), .IN5(n1245),
        .IN6(n108), .QN(n650) );
  AO22X1 U661 ( .IN1(n1072), .IN2(n1084), .IN3(n757), .IN4(n149), .Q(n756) );
  NAND3X0 U662 ( .IN1(n51), .IN2(n426), .IN3(n498), .QN(n755) );
  AO22X1 U663 ( .IN1(n1227), .IN2(n1084), .IN3(n1088), .IN4(n758), .Q(n336) );
  NAND4X0 U664 ( .IN1(n545), .IN2(n540), .IN3(n532), .IN4(n759), .QN(n758) );
  NAND4X0 U665 ( .IN1(n187), .IN2(n1141), .IN3(n1126), .IN4(n729), .QN(n749)
         );
  OA22X1 U666 ( .IN1(n224), .IN2(n992), .IN3(n993), .IN4(n1218), .Q(n729) );
  AO222X1 U667 ( .IN1(n1075), .IN2(n762), .IN3(n1081), .IN4(n686), .IN5(n1232),
        .IN6(n93), .Q(n245) );
  NAND3X0 U668 ( .IN1(n348), .IN2(n349), .IN3(n350), .QN(n762) );
  AO21X1 U669 ( .IN1(n1229), .IN2(n1142), .IN3(n763), .Q(n228) );
  AND4X1 U670 ( .IN1(n1117), .IN2(n734), .IN3(n764), .IN4(n765), .Q(n187) );
  OA222X1 U672 ( .IN1(n768), .IN2(n223), .IN3(n769), .IN4(n166), .IN5(n770),
        .IN6(n173), .Q(n767) );
  NAND3X0 U673 ( .IN1(n71), .IN2(n84), .IN3(n338), .QN(n511) );
  NAND3X0 U674 ( .IN1(n63), .IN2(n30), .IN3(n323), .QN(n512) );
  NAND3X0 U675 ( .IN1(n721), .IN2(n722), .IN3(n720), .QN(n606) );
  AND2X1 U676 ( .IN1(n681), .IN2(n682), .Q(n584) );
  AND4X1 U677 ( .IN1(n1134), .IN2(n621), .IN3(n1125), .IN4(n774), .Q(n734) );
  OA221X1 U678 ( .IN1(n445), .IN2(n1114), .IN3(n775), .IN4(n1065), .IN5(n776),
        .Q(n774) );
  OA22X1 U679 ( .IN1(n993), .IN2(n379), .IN3(n992), .IN4(n520), .Q(n776) );
  NAND3X0 U680 ( .IN1(n703), .IN2(n698), .IN3(n705), .QN(n412) );
  AO221X1 U681 ( .IN1(n777), .IN2(n778), .IN3(n1079), .IN4(n779), .IN5(n780),
        .Q(n243) );
  AO22X1 U682 ( .IN1(n1238), .IN2(n150), .IN3(n1266), .IN4(n49), .Q(n780) );
  NAND3X0 U683 ( .IN1(n396), .IN2(n397), .IN3(n394), .QN(n779) );
  AND2X1 U684 ( .IN1(n36), .IN2(n149), .Q(n777) );
  OA22X1 U685 ( .IN1(n371), .IN2(n218), .IN3(n374), .IN4(n1114), .Q(n621) );
  AO222X1 U686 ( .IN1(n1208), .IN2(n1077), .IN3(n102), .IN4(n781), .IN5(n1200),
        .IN6(n93), .Q(n242) );
  AO221X1 U687 ( .IN1(n1146), .IN2(n634), .IN3(n113), .IN4(n259), .IN5(n784),
        .Q(n748) );
  AO21X1 U688 ( .IN1(n94), .IN2(n209), .IN3(n785), .Q(n784) );
  AO221X1 U689 ( .IN1(n1240), .IN2(n1143), .IN3(n206), .IN4(n1135), .IN5(n788),
        .Q(n747) );
  NAND4X0 U691 ( .IN1(n693), .IN2(n661), .IN3(n751), .IN4(n791), .QN(n790) );
  NOR3X0 U692 ( .IN1(n664), .IN2(n752), .IN3(n665), .QN(n791) );
  AO221X1 U693 ( .IN1(n108), .IN2(n792), .IN3(n1213), .IN4(n105), .IN5(n793),
        .Q(n665) );
  AO22X1 U694 ( .IN1(n1202), .IN2(n78), .IN3(n1203), .IN4(n155), .Q(n793) );
  AO221X1 U695 ( .IN1(n108), .IN2(n794), .IN3(n1089), .IN4(n795), .IN5(n796),
        .Q(n752) );
  NAND4X0 U696 ( .IN1(n149), .IN2(n154), .IN3(n84), .IN4(n1090), .QN(n798) );
  AO21X1 U697 ( .IN1(n507), .IN2(n509), .IN3(n1066), .Q(n797) );
  NAND4X0 U698 ( .IN1(n588), .IN2(n638), .IN3(n799), .IN4(n800), .QN(n795) );
  NAND3X0 U699 ( .IN1(n504), .IN2(n498), .IN3(n505), .QN(n794) );
  AO22X1 U701 ( .IN1(n158), .IN2(n803), .IN3(n106), .IN4(n804), .Q(n802) );
  NAND3X0 U702 ( .IN1(n120), .IN2(n168), .IN3(n145), .QN(n217) );
  NAND3X0 U703 ( .IN1(n681), .IN2(n1067), .IN3(n683), .QN(n801) );
  AND4X1 U704 ( .IN1(n660), .IN2(n1156), .IN3(n807), .IN4(n1133), .Q(n751) );
  AO22X1 U705 ( .IN1(n1078), .IN2(n808), .IN3(n93), .IN4(n686), .Q(n278) );
  NAND4X0 U706 ( .IN1(n350), .IN2(n348), .IN3(n349), .IN4(n809), .QN(n808) );
  AO22X1 U707 ( .IN1(n1214), .IN2(n1084), .IN3(n155), .IN4(n810), .Q(n726) );
  AO22X1 U709 ( .IN1(n111), .IN2(n811), .IN3(n1087), .IN4(n639), .Q(n741) );
  NAND3X0 U710 ( .IN1(n352), .IN2(n307), .IN3(n353), .QN(n811) );
  AO222X1 U711 ( .IN1(n106), .IN2(n208), .IN3(n154), .IN4(n315), .IN5(n1228),
        .IN6(n1089), .Q(n335) );
  OR4X1 U712 ( .IN1(n327), .IN2(n253), .IN3(n281), .IN4(n309), .Q(n813) );
  AO222X1 U713 ( .IN1(n100), .IN2(n208), .IN3(n102), .IN4(n315), .IN5(n1228),
        .IN6(n93), .Q(n309) );
  AO22X1 U714 ( .IN1(n1214), .IN2(n158), .IN3(n106), .IN4(n814), .Q(n281) );
  NAND4X0 U715 ( .IN1(n535), .IN2(n536), .IN3(n345), .IN4(n344), .QN(n814) );
  AO22X1 U716 ( .IN1(n1231), .IN2(n158), .IN3(n111), .IN4(n815), .Q(n253) );
  NAND4X0 U717 ( .IN1(n547), .IN2(n549), .IN3(n541), .IN4(n816), .QN(n815) );
  AND2X1 U718 ( .IN1(n534), .IN2(n533), .Q(n816) );
  AO22X1 U719 ( .IN1(n1227), .IN2(n158), .IN3(n110), .IN4(n817), .Q(n327) );
  NAND4X0 U720 ( .IN1(n761), .IN2(n532), .IN3(n760), .IN4(n818), .QN(n817) );
  AND2X1 U721 ( .IN1(n819), .IN2(n820), .Q(n818) );
  NAND3X0 U722 ( .IN1(n434), .IN2(n622), .IN3(n1154), .QN(n812) );
  AO22X1 U723 ( .IN1(n1215), .IN2(n158), .IN3(n106), .IN4(n821), .Q(n314) );
  NAND4X0 U724 ( .IN1(n537), .IN2(n787), .IN3(n538), .IN4(n786), .QN(n821) );
  AOI22X1 U725 ( .IN1(n1089), .IN2(n739), .IN3(n111), .IN4(n209), .QN(n622) );
  AOI221X1 U726 ( .IN1(n112), .IN2(n209), .IN3(n111), .IN4(n822), .IN5(n823),
        .QN(n434) );
  AO21X1 U727 ( .IN1(n1232), .IN2(n155), .IN3(n249), .Q(n823) );
  AO222X1 U728 ( .IN1(n101), .IN2(n824), .IN3(n1074), .IN4(n258), .IN5(n1214),
        .IN6(n151), .Q(n249) );
  NAND4X0 U729 ( .IN1(n825), .IN2(n348), .IN3(n350), .IN4(n826), .QN(n822) );
  AND4X1 U730 ( .IN1(n574), .IN2(n575), .IN3(n349), .IN4(n827), .Q(n826) );
  NAND3X0 U731 ( .IN1(n136), .IN2(n28), .IN3(n1062), .QN(n350) );
  NAND3X0 U732 ( .IN1(n1096), .IN2(n129), .IN3(n1059), .QN(n348) );
  AO221X1 U733 ( .IN1(n1074), .IN2(n832), .IN3(n1231), .IN4(n151), .IN5(n833),
        .Q(n337) );
  AO22X1 U734 ( .IN1(n1079), .IN2(n834), .IN3(n1080), .IN4(n835), .Q(n833) );
  NAND4X0 U735 ( .IN1(n732), .IN2(n342), .IN3(n343), .IN4(n224), .QN(n835) );
  NAND3X0 U736 ( .IN1(n74), .IN2(n32), .IN3(n1060), .QN(n343) );
  NAND3X0 U737 ( .IN1(n62), .IN2(n116), .IN3(n1064), .QN(n342) );
  NAND4X0 U738 ( .IN1(n786), .IN2(n535), .IN3(n787), .IN4(n837), .QN(n834) );
  AND3X1 U739 ( .IN1(n831), .IN2(n830), .IN3(n536), .Q(n837) );
  NAND4X0 U740 ( .IN1(n575), .IN2(n574), .IN3(n838), .IN4(n839), .QN(n832) );
  AND3X1 U742 ( .IN1(n541), .IN2(n549), .IN3(n547), .Q(n838) );
  NAND3X0 U743 ( .IN1(n125), .IN2(n130), .IN3(n1070), .QN(n549) );
  NAND3X0 U744 ( .IN1(n147), .IN2(n85), .IN3(n1062), .QN(n541) );
  AO22X1 U746 ( .IN1(n1078), .IN2(n845), .IN3(n1109), .IN4(n846), .Q(n283) );
  NAND4X0 U747 ( .IN1(n760), .IN2(n761), .IN3(n532), .IN4(n436), .QN(n845) );
  AO22X1 U748 ( .IN1(n103), .IN2(n847), .IN3(n100), .IN4(n763), .Q(n330) );
  NAND4X0 U749 ( .IN1(n848), .IN2(n849), .IN3(n850), .IN4(n809), .QN(n847) );
  AO22X1 U751 ( .IN1(n103), .IN2(n851), .IN3(n1130), .IN4(n315), .Q(n440) );
  NAND4X0 U752 ( .IN1(n546), .IN2(n852), .IN3(n853), .IN4(n548), .QN(n851) );
  NAND3X0 U753 ( .IN1(n70), .IN2(n41), .IN3(n1070), .QN(n548) );
  AO221X1 U754 ( .IN1(n1077), .IN2(n854), .IN3(n111), .IN4(n855), .IN5(n550),
        .Q(n844) );
  AO22X1 U755 ( .IN1(n1226), .IN2(n157), .IN3(n106), .IN4(n856), .Q(n550) );
  NAND4X0 U756 ( .IN1(n353), .IN2(n352), .IN3(n820), .IN4(n819), .QN(n856) );
  NAND4X0 U759 ( .IN1(n680), .IN2(n546), .IN3(n857), .IN4(n858), .QN(n855) );
  AND4X1 U760 ( .IN1(n540), .IN2(n545), .IN3(n536), .IN4(n535), .Q(n858) );
  NAND3X0 U761 ( .IN1(n80), .IN2(n129), .IN3(n1064), .QN(n535) );
  NAND3X0 U762 ( .IN1(n125), .IN2(n130), .IN3(n1060), .QN(n536) );
  NAND4X0 U763 ( .IN1(n859), .IN2(n680), .IN3(n860), .IN4(n537), .QN(n854) );
  NAND3X0 U764 ( .IN1(n147), .IN2(n27), .IN3(n1062), .QN(n537) );
  AND2X1 U765 ( .IN1(n732), .IN2(n538), .Q(n860) );
  OA222X1 U767 ( .IN1(n861), .IN2(n247), .IN3(n571), .IN4(n321), .IN5(n862),
        .IN6(n992), .Q(n842) );
  NAND3X0 U768 ( .IN1(n345), .IN2(n344), .IN3(n859), .QN(n863) );
  AND4X1 U769 ( .IN1(n825), .IN2(n827), .IN3(n850), .IN4(n866), .Q(n859) );
  AND2X1 U770 ( .IN1(n849), .IN2(n848), .Q(n866) );
  AOI222X1 U772 ( .IN1(n156), .IN2(n868), .IN3(n100), .IN4(n869), .IN5(n105),
        .IN6(n870), .QN(n841) );
  NAND4X0 U777 ( .IN1(n848), .IN2(n849), .IN3(n850), .IN4(n248), .QN(n868) );
  AND4X1 U778 ( .IN1(n1120), .IN2(n871), .IN3(n727), .IN4(n872), .Q(n661) );
  OA222X1 U779 ( .IN1(n619), .IN2(n680), .IN3(n873), .IN4(n1065), .IN5(n874),
        .IN6(n1114), .Q(n872) );
  NAND3X0 U781 ( .IN1(n852), .IN2(n853), .IN3(n546), .QN(n208) );
  NAND3X0 U783 ( .IN1(n64), .IN2(n122), .IN3(n1070), .QN(n853) );
  NAND3X0 U784 ( .IN1(n125), .IN2(n1103), .IN3(n1064), .QN(n852) );
  NAND3X0 U785 ( .IN1(n849), .IN2(n850), .IN3(n848), .QN(n205) );
  NAND3X0 U786 ( .IN1(n74), .IN2(n39), .IN3(n1062), .QN(n848) );
  NAND3X0 U787 ( .IN1(n124), .IN2(n140), .IN3(n1070), .QN(n850) );
  NAND3X0 U788 ( .IN1(n73), .IN2(n117), .IN3(n1060), .QN(n849) );
  NAND3X0 U789 ( .IN1(n1096), .IN2(n129), .IN3(n1064), .QN(n533) );
  NAND3X0 U790 ( .IN1(n135), .IN2(n32), .IN3(n1059), .QN(n534) );
  NAND3X0 U791 ( .IN1(n47), .IN2(n82), .IN3(n1069), .QN(n680) );
  AOI222X1 U792 ( .IN1(n1076), .IN2(n875), .IN3(n93), .IN4(n876), .IN5(n102),
        .IN6(n877), .QN(n727) );
  NAND4X0 U793 ( .IN1(n345), .IN2(n344), .IN3(n248), .IN4(n438), .QN(n877) );
  AND3X1 U794 ( .IN1(n760), .IN2(n532), .IN3(n761), .Q(n438) );
  NAND3X0 U796 ( .IN1(n70), .IN2(n121), .IN3(n1061), .QN(n345) );
  NAND3X0 U797 ( .IN1(n69), .IN2(n81), .IN3(n1064), .QN(n865) );
  NAND3X0 U798 ( .IN1(n68), .IN2(n122), .IN3(n1059), .QN(n864) );
  NAND3X0 U799 ( .IN1(n545), .IN2(n540), .IN3(n732), .QN(n875) );
  NAND3X0 U800 ( .IN1(n1096), .IN2(n133), .IN3(n493), .QN(n732) );
  NAND3X0 U801 ( .IN1(n135), .IN2(n1107), .IN3(n1069), .QN(n248) );
  AO222X1 U802 ( .IN1(n1075), .IN2(n878), .IN3(n1080), .IN4(n846), .IN5(n1227),
        .IN6(n151), .Q(n785) );
  NAND3X0 U803 ( .IN1(n142), .IN2(n1107), .IN3(n1069), .QN(n436) );
  NAND3X0 U804 ( .IN1(n1096), .IN2(n1105), .IN3(n1063), .QN(n545) );
  NAND3X0 U805 ( .IN1(n142), .IN2(n35), .IN3(n1025), .QN(n540) );
  NAND3X0 U806 ( .IN1(n761), .IN2(n532), .IN3(n760), .QN(n878) );
  NAND3X0 U807 ( .IN1(n84), .IN2(n130), .IN3(n1061), .QN(n760) );
  NAND3X0 U810 ( .IN1(n125), .IN2(n129), .IN3(n1063), .QN(n761) );
  AND3X1 U811 ( .IN1(n663), .IN2(n188), .IN3(n662), .Q(n693) );
  AND4X1 U812 ( .IN1(n317), .IN2(n1119), .IN3(n272), .IN4(n881), .Q(n662) );
  AO222X1 U813 ( .IN1(n1088), .IN2(n882), .IN3(n883), .IN4(n1072), .IN5(n1083),
        .IN6(n884), .Q(n326) );
  NAND3X0 U814 ( .IN1(n426), .IN2(n422), .IN3(n51), .QN(n884) );
  AO221X1 U815 ( .IN1(n1088), .IN2(n886), .IN3(n106), .IN4(n887), .IN5(n888),
        .Q(n408) );
  NAND3X0 U816 ( .IN1(n500), .IN2(n1067), .IN3(n499), .QN(n887) );
  AOI221X1 U817 ( .IN1(n889), .IN2(n1072), .IN3(n1252), .IN4(n105), .IN5(n890),
        .QN(n272) );
  AO22X1 U818 ( .IN1(n1234), .IN2(n157), .IN3(n1261), .IN4(n110), .Q(n890) );
  AO221X1 U819 ( .IN1(n150), .IN2(n891), .IN3(n101), .IN4(n892), .IN5(n893),
        .Q(n365) );
  AO222X1 U820 ( .IN1(n49), .IN2(n894), .IN3(n895), .IN4(n778), .IN5(n102),
        .IN6(n896), .Q(n893) );
  NAND4X0 U821 ( .IN1(n497), .IN2(n371), .IN3(n607), .IN4(n699), .QN(n896) );
  NAND4X0 U823 ( .IN1(n897), .IN2(n499), .IN3(n373), .IN4(n898), .QN(n892) );
  AND4X1 U824 ( .IN1(n226), .IN2(n722), .IN3(n506), .IN4(n500), .Q(n898) );
  NAND4X0 U825 ( .IN1(n697), .IN2(n725), .IN3(n302), .IN4(n899), .QN(n891) );
  AOI222X1 U826 ( .IN1(n1077), .IN2(n900), .IN3(n778), .IN4(n901), .IN5(n1260),
        .IN6(n1074), .QN(n317) );
  AO22X1 U827 ( .IN1(n127), .IN2(n1105), .IN3(n149), .IN4(n85), .Q(n901) );
  NAND3X0 U828 ( .IN1(n799), .IN2(n800), .IN3(n507), .QN(n900) );
  AND4X1 U829 ( .IN1(n672), .IN2(n1151), .IN3(n671), .IN4(n902), .Q(n188) );
  OA221X1 U830 ( .IN1(n903), .IN2(n993), .IN3(n904), .IN4(n1066), .IN5(n905),
        .Q(n902) );
  OA22X1 U831 ( .IN1(n906), .IN2(n619), .IN3(n160), .IN4(n372), .Q(n905) );
  AND2X1 U832 ( .IN1(n595), .IN2(n586), .Q(n906) );
  AND4X1 U833 ( .IN1(n910), .IN2(n911), .IN3(n912), .IN4(n913), .Q(n671) );
  NAND3X0 U834 ( .IN1(n270), .IN2(n915), .IN3(n916), .QN(n452) );
  OA221X1 U835 ( .IN1(n917), .IN2(n170), .IN3(n376), .IN4(n165), .IN5(n918),
        .Q(n916) );
  NAND4X0 U836 ( .IN1(n102), .IN2(n127), .IN3(n57), .IN4(n136), .QN(n918) );
  AND2X1 U837 ( .IN1(n1068), .IN2(n302), .Q(n917) );
  NAND3X0 U840 ( .IN1(n136), .IN2(n42), .IN3(n163), .QN(n506) );
  OA222X1 U841 ( .IN1(n919), .IN2(n1111), .IN3(n920), .IN4(n172), .IN5(n921),
        .IN6(n165), .Q(n270) );
  AO221X1 U842 ( .IN1(n923), .IN2(n1073), .IN3(n1245), .IN4(n1074), .IN5(n924),
        .Q(n268) );
  AO22X1 U843 ( .IN1(n151), .IN2(n925), .IN3(n1081), .IN4(n926), .Q(n924) );
  AO221X1 U844 ( .IN1(n155), .IN2(n927), .IN3(n1088), .IN4(n928), .IN5(n929),
        .Q(n432) );
  AO21X1 U845 ( .IN1(n106), .IN2(n930), .IN3(n642), .Q(n929) );
  AO222X1 U846 ( .IN1(n156), .IN2(n931), .IN3(n108), .IN4(n932), .IN5(n1082),
        .IN6(n1244), .Q(n642) );
  NAND4X0 U847 ( .IN1(n397), .IN2(n722), .IN3(n396), .IN4(n933), .QN(n930) );
  AND2X1 U848 ( .IN1(n699), .IN2(n934), .Q(n933) );
  NAND4X0 U849 ( .IN1(n394), .IN2(n697), .IN3(n935), .IN4(n226), .QN(n928) );
  NAND3X0 U850 ( .IN1(n115), .IN2(n32), .IN3(n146), .QN(n659) );
  NAND4X0 U851 ( .IN1(n355), .IN2(n291), .IN3(n1162), .IN4(n936), .QN(n914) );
  OR2X1 U852 ( .IN1(n12), .IN2(n53), .Q(n936) );
  AO221X1 U853 ( .IN1(n1087), .IN2(n937), .IN3(n1254), .IN4(n1082), .IN5(n938),
        .Q(n515) );
  OAI22X1 U854 ( .IN1(n710), .IN2(n1114), .IN3(n50), .IN4(n993), .QN(n938) );
  AOI221X1 U855 ( .IN1(n112), .IN2(n940), .IN3(n1256), .IN4(n106), .IN5(n941),
        .QN(n291) );
  AO22X1 U856 ( .IN1(n1239), .IN2(n157), .IN3(n1268), .IN4(n110), .Q(n941) );
  AND3X1 U857 ( .IN1(n942), .IN2(n943), .IN3(n944), .Q(n355) );
  OA22X1 U858 ( .IN1(n945), .IN2(n171), .IN3(n1111), .IN4(n394), .Q(n944) );
  AO21X1 U860 ( .IN1(n397), .IN2(n396), .IN3(n165), .Q(n942) );
  OA221X1 U861 ( .IN1(n946), .IN2(n174), .IN3(n947), .IN4(n166), .IN5(n948),
        .Q(n912) );
  OA22X1 U862 ( .IN1(n949), .IN2(n160), .IN3(n950), .IN4(n1000), .Q(n948) );
  NOR3X0 U863 ( .IN1(n951), .IN2(n1247), .IN3(n1258), .QN(n950) );
  AND3X1 U864 ( .IN1(n127), .IN2(n57), .IN3(n1105), .Q(n952) );
  NAND3X0 U865 ( .IN1(n681), .IN2(n935), .IN3(n561), .QN(n951) );
  NAND3X0 U866 ( .IN1(n163), .IN2(n39), .IN3(n73), .QN(n561) );
  NAND3X0 U867 ( .IN1(n169), .IN2(n42), .IN3(n74), .QN(n497) );
  NAND4X0 U868 ( .IN1(n394), .IN2(n934), .IN3(n602), .IN4(n954), .QN(n953) );
  NAND3X0 U869 ( .IN1(n136), .IN2(n30), .IN3(n1090), .QN(n554) );
  OA22X1 U870 ( .IN1(n955), .IN2(n172), .IN3(n956), .IN4(n992), .Q(n911) );
  NAND3X0 U871 ( .IN1(n88), .IN2(n56), .IN3(n48), .QN(n513) );
  NAND3X0 U873 ( .IN1(n1096), .IN2(n161), .IN3(n73), .QN(n698) );
  OA22X1 U874 ( .IN1(n959), .IN2(n1110), .IN3(n960), .IN4(n1066), .Q(n910) );
  NAND4X0 U875 ( .IN1(n681), .IN2(n498), .IN3(n921), .IN4(n935), .QN(n961) );
  NAND3X0 U877 ( .IN1(n82), .IN2(n128), .IN3(n161), .QN(n602) );
  NAND3X0 U878 ( .IN1(n161), .IN2(n1104), .IN3(n122), .QN(n897) );
  NAND3X0 U879 ( .IN1(n168), .IN2(n1103), .IN3(n121), .QN(n596) );
  NAND3X0 U882 ( .IN1(n169), .IN2(n139), .IN3(n116), .QN(n934) );
  AO221X1 U883 ( .IN1(n156), .IN2(n963), .IN3(n1186), .IN4(n78), .IN5(n964),
        .Q(n294) );
  AO22X1 U884 ( .IN1(n1084), .IN2(n965), .IN3(n110), .IN4(n966), .Q(n964) );
  NAND3X0 U885 ( .IN1(n713), .IN2(n710), .IN3(n598), .QN(n965) );
  NAND4X0 U886 ( .IN1(n473), .IN2(n308), .IN3(n967), .IN4(n399), .QN(n963) );
  AND2X1 U887 ( .IN1(n939), .IN2(n714), .Q(n967) );
  NAND4X0 U889 ( .IN1(n782), .IN2(n682), .IN3(n783), .IN4(n977), .QN(n976) );
  OA22X1 U890 ( .IN1(n1074), .IN2(n108), .IN3(n1213), .IN4(n1187), .Q(n972) );
  NAND3X0 U891 ( .IN1(n124), .IN2(n140), .IN3(n492), .QN(n560) );
  OA221X1 U892 ( .IN1(n979), .IN2(n321), .IN3(n980), .IN4(n992), .IN5(n981),
        .Q(n970) );
  OA22X1 U893 ( .IN1(n982), .IN2(n171), .IN3(n983), .IN4(n159), .Q(n981) );
  NAND3X0 U894 ( .IN1(n375), .IN2(n395), .IN3(n595), .QN(n984) );
  NAND3X0 U895 ( .IN1(n703), .IN2(n986), .IN3(n705), .QN(n985) );
  AND3X1 U896 ( .IN1(n509), .IN2(n782), .IN3(n783), .Q(n980) );
  AND3X1 U898 ( .IN1(n505), .IN2(n504), .IN3(n508), .Q(n988) );
  AO22X1 U899 ( .IN1(n1181), .IN2(n24), .IN3(n100), .IN4(n989), .Q(n269) );
  NAND3X0 U900 ( .IN1(n754), .IN2(n495), .IN3(n420), .QN(n989) );
  AO22X1 U901 ( .IN1(n1200), .IN2(n103), .IN3(n150), .IN4(n990), .Q(n402) );
  NAND3X0 U902 ( .IN1(n783), .IN2(n782), .IN3(n395), .QN(n990) );
  NAND3X0 U906 ( .IN1(n720), .IN2(n721), .IN3(n704), .QN(n996) );
  NAND4X0 U907 ( .IN1(n783), .IN2(n400), .IN3(n997), .IN4(n782), .QN(n994) );
  NAND3X0 U908 ( .IN1(n135), .IN2(n35), .IN3(n324), .QN(n782) );
  AND2X1 U909 ( .IN1(n724), .IN2(n594), .Q(n997) );
  NAND3X0 U910 ( .IN1(n92), .IN2(n128), .IN3(n391), .QN(n783) );
  NAND3X0 U914 ( .IN1(n74), .IN2(n92), .IN3(n493), .QN(n465) );
  AO221X1 U915 ( .IN1(n102), .IN2(n1001), .IN3(n1078), .IN4(n1002), .IN5(n1003), .Q(n266) );
  AO22X1 U916 ( .IN1(n1183), .IN2(n1109), .IN3(n1204), .IN4(n100), .Q(n1003)
         );
  AO222X1 U917 ( .IN1(n1089), .IN2(n1004), .IN3(n108), .IN4(n1005), .IN5(n1196), .IN6(n155), .Q(n304) );
  NAND3X0 U918 ( .IN1(n703), .IN2(n702), .IN3(n705), .QN(n1004) );
  AO222X1 U919 ( .IN1(n1088), .IN2(n1006), .IN3(n108), .IN4(n1007), .IN5(n1186), .IN6(n156), .Q(n522) );
  NAND3X0 U920 ( .IN1(n136), .IN2(n42), .IN3(n492), .QN(n1008) );
  NAND3X0 U921 ( .IN1(n714), .IN2(n713), .IN3(n399), .QN(n1006) );
  AND4X1 U922 ( .IN1(n316), .IN2(n1118), .IN3(n273), .IN4(n1009), .Q(n663) );
  AO22X1 U923 ( .IN1(n1193), .IN2(n113), .IN3(n156), .IN4(n1010), .Q(n328) );
  NAND3X0 U924 ( .IN1(n424), .IN2(n713), .IN3(n420), .QN(n1010) );
  AO22X1 U925 ( .IN1(n1203), .IN2(n78), .IN3(n156), .IN4(n1011), .Q(n409) );
  AOI222X1 U927 ( .IN1(n1089), .IN2(n1012), .IN3(n110), .IN4(n1013), .IN5(
        n1197), .IN6(n156), .QN(n273) );
  NAND3X0 U928 ( .IN1(n381), .IN2(n375), .IN3(n382), .QN(n1012) );
  AO221X1 U929 ( .IN1(n1074), .IN2(n1014), .IN3(n1078), .IN4(n1015), .IN5(
        n1016), .Q(n366) );
  AO22X1 U930 ( .IN1(n1109), .IN2(n1017), .IN3(n1081), .IN4(n1018), .Q(n1016)
         );
  NAND4X0 U931 ( .IN1(n594), .IN2(n461), .IN3(n704), .IN4(n1019), .QN(n1018)
         );
  AND3X1 U932 ( .IN1(n505), .IN2(n978), .IN3(n504), .Q(n1019) );
  NAND3X0 U933 ( .IN1(n84), .IN2(n139), .IN3(n493), .QN(n978) );
  OR4X1 U934 ( .IN1(n1201), .IN2(n1194), .IN3(n1020), .IN4(n1021), .Q(n1017)
         );
  NAND4X0 U935 ( .IN1(n378), .IN2(n705), .IN3(n703), .IN4(n379), .QN(n1021) );
  NAND3X0 U936 ( .IN1(n126), .IN2(n132), .IN3(n338), .QN(n379) );
  NAND3X0 U938 ( .IN1(n135), .IN2(n36), .IN3(n391), .QN(n705) );
  NAND3X0 U940 ( .IN1(n724), .IN2(n319), .IN3(n707), .QN(n1020) );
  NAND3X0 U941 ( .IN1(n64), .IN2(n121), .IN3(n338), .QN(n319) );
  NAND3X0 U942 ( .IN1(n65), .IN2(n43), .IN3(n391), .QN(n382) );
  NAND4X0 U944 ( .IN1(n508), .IN2(n702), .IN3(n1022), .IN4(n375), .QN(n1015)
         );
  NAND3X0 U945 ( .IN1(n145), .IN2(n119), .IN3(n323), .QN(n375) );
  AND2X1 U946 ( .IN1(n721), .IN2(n720), .Q(n1022) );
  NAND3X0 U947 ( .IN1(n1096), .IN2(n139), .IN3(n324), .QN(n702) );
  NAND3X0 U948 ( .IN1(n704), .IN2(n594), .IN3(n374), .QN(n1014) );
  NAND3X0 U949 ( .IN1(n119), .IN2(n169), .IN3(n68), .QN(n594) );
  OA222X1 U950 ( .IN1(n509), .IN2(n171), .IN3(n174), .IN4(n421), .IN5(n638),
        .IN6(n153), .Q(n316) );
  NAND4X0 U951 ( .IN1(n192), .IN2(n236), .IN3(n694), .IN4(n1023), .QN(n789) );
  NOR3X0 U952 ( .IN1(n267), .IN2(n525), .IN3(n1024), .QN(n1023) );
  NAND3X0 U953 ( .IN1(n73), .IN2(n42), .IN3(n492), .QN(n473) );
  NAND3X0 U954 ( .IN1(n142), .IN2(n30), .IN3(n167), .QN(n308) );
  NAND3X0 U957 ( .IN1(n48), .IN2(n86), .IN3(n1063), .QN(n575) );
  NAND3X0 U958 ( .IN1(n119), .IN2(n140), .IN3(n1025), .QN(n830) );
  NAND3X0 U959 ( .IN1(n142), .IN2(n29), .IN3(n1061), .QN(n831) );
  NAND4X0 U960 ( .IN1(n475), .IN2(n1026), .IN3(n476), .IN4(n1027), .QN(n267)
         );
  OA221X1 U961 ( .IN1(n1028), .IN2(n166), .IN3(n1029), .IN4(n153), .IN5(n1030),
        .Q(n1027) );
  OA22X1 U962 ( .IN1(n1138), .IN2(n1031), .IN3(n1032), .IN4(n173), .Q(n1030)
         );
  NAND3X0 U964 ( .IN1(n90), .IN2(n139), .IN3(n162), .QN(n397) );
  AND4X1 U965 ( .IN1(n401), .IN2(n399), .IN3(n395), .IN4(n394), .Q(n1028) );
  NAND3X0 U966 ( .IN1(n162), .IN2(n89), .IN3(n146), .QN(n394) );
  NAND3X0 U967 ( .IN1(n126), .IN2(n133), .IN3(n493), .QN(n395) );
  NAND3X0 U968 ( .IN1(n142), .IN2(n39), .IN3(n323), .QN(n401) );
  AOI221X1 U969 ( .IN1(n1077), .IN2(n1033), .IN3(n778), .IN4(n1073), .IN5(
        n1034), .QN(n476) );
  AO22X1 U970 ( .IN1(n1237), .IN2(n150), .IN3(n1263), .IN4(n1076), .Q(n1034)
         );
  NAND3X0 U971 ( .IN1(n85), .IN2(n139), .IN3(n167), .QN(n422) );
  NAND3X0 U972 ( .IN1(n142), .IN2(n1090), .IN3(n89), .QN(n464) );
  NAND3X0 U973 ( .IN1(n426), .IN2(n419), .IN3(n50), .QN(n1033) );
  NAND3X0 U975 ( .IN1(n163), .IN2(n32), .IN3(n147), .QN(n419) );
  NAND3X0 U976 ( .IN1(n161), .IN2(n140), .IN3(n117), .QN(n426) );
  AOI222X1 U978 ( .IN1(n1193), .IN2(n1079), .IN3(n1146), .IN4(n1035), .IN5(
        n1181), .IN6(n93), .QN(n475) );
  NAND3X0 U979 ( .IN1(n70), .IN2(n117), .IN3(n324), .QN(n424) );
  NAND3X0 U980 ( .IN1(n120), .IN2(n132), .IN3(n338), .QN(n420) );
  AOI221X1 U981 ( .IN1(n78), .IN2(n1036), .IN3(n1255), .IN4(n1083), .IN5(n1037), .QN(n694) );
  AO22X1 U982 ( .IN1(n158), .IN2(n1038), .IN3(n111), .IN4(n1039), .Q(n1037) );
  NAND3X0 U983 ( .IN1(n398), .IN2(n699), .IN3(n704), .QN(n1039) );
  NAND3X0 U984 ( .IN1(n90), .IN2(n132), .IN3(n492), .QN(n704) );
  NAND3X0 U985 ( .IN1(n169), .IN2(n90), .IN3(n48), .QN(n699) );
  NAND3X0 U986 ( .IN1(n168), .IN2(n133), .IN3(n116), .QN(n398) );
  NAND3X0 U987 ( .IN1(n461), .IN2(n697), .IN3(n707), .QN(n1038) );
  NAND3X0 U988 ( .IN1(n146), .IN2(n119), .IN3(n490), .QN(n707) );
  NAND3X0 U990 ( .IN1(n146), .IN2(n41), .IN3(n391), .QN(n461) );
  NAND4X0 U994 ( .IN1(n724), .IN2(n720), .IN3(n1040), .IN4(n721), .QN(n1036)
         );
  AND2X1 U996 ( .IN1(n725), .IN2(n722), .Q(n1040) );
  NAND3X0 U997 ( .IN1(n162), .IN2(n133), .IN3(n116), .QN(n722) );
  NAND3X0 U998 ( .IN1(n163), .IN2(n131), .IN3(n122), .QN(n725) );
  NAND3X0 U999 ( .IN1(n141), .IN2(n39), .IN3(n338), .QN(n720) );
  NAND3X0 U1000 ( .IN1(n120), .IN2(n134), .IN3(n323), .QN(n724) );
  OA222X1 U1001 ( .IN1(n321), .IN2(n331), .IN3(n153), .IN4(n818), .IN5(n307),
        .IN6(n166), .Q(n236) );
  NAND3X0 U1002 ( .IN1(n1097), .IN2(n119), .IN3(n490), .QN(n307) );
  NAND3X0 U1005 ( .IN1(n148), .IN2(n38), .IN3(n1025), .QN(n819) );
  NAND3X0 U1007 ( .IN1(n123), .IN2(n131), .IN3(n1061), .QN(n731) );
  NAND3X0 U1009 ( .IN1(n1093), .IN2(n131), .IN3(n1025), .QN(n733) );
  AND4X1 U1011 ( .IN1(n1115), .IN2(n1116), .IN3(n1044), .IN4(n675), .Q(n192)
         );
  AO21X1 U1012 ( .IN1(n376), .IN2(n588), .IN3(n1000), .Q(n675) );
  AND2X1 U1014 ( .IN1(n500), .IN2(n499), .Q(n376) );
  NAND3X0 U1015 ( .IN1(n169), .IN2(n134), .IN3(n121), .QN(n499) );
  NAND3X0 U1016 ( .IN1(n161), .IN2(n1093), .IN3(n70), .QN(n500) );
  NAND3X0 U1018 ( .IN1(n148), .IN2(n81), .IN3(n324), .QN(n504) );
  AO222X1 U1020 ( .IN1(n100), .IN2(n1045), .IN3(n1079), .IN4(n1046), .IN5(
        n1146), .IN6(n1047), .Q(n244) );
  NAND4X0 U1021 ( .IN1(n745), .IN2(n399), .IN3(n714), .IN4(n939), .QN(n1047)
         );
  NAND3X0 U1024 ( .IN1(n1093), .IN2(n141), .IN3(n338), .QN(n399) );
  NAND3X0 U1026 ( .IN1(n126), .IN2(n131), .IN3(n323), .QN(n598) );
  NAND3X0 U1027 ( .IN1(n713), .IN2(n710), .IN3(n357), .QN(n1045) );
  NAND3X0 U1028 ( .IN1(n141), .IN2(n115), .IN3(n117), .QN(n357) );
  NAND3X0 U1029 ( .IN1(n1090), .IN2(n131), .IN3(n117), .QN(n710) );
  NAND3X0 U1030 ( .IN1(n1093), .IN2(n134), .IN3(n324), .QN(n713) );
  AOI221X1 U1031 ( .IN1(n1077), .IN2(n1048), .IN3(n103), .IN4(n1049), .IN5(
        n1050), .QN(n685) );
  NAND4X0 U1033 ( .IN1(n509), .IN2(n754), .IN3(n495), .IN4(n986), .QN(n1051)
         );
  NAND3X0 U1036 ( .IN1(n88), .IN2(n141), .IN3(n322), .QN(n495) );
  NAND3X0 U1037 ( .IN1(n120), .IN2(n139), .IN3(n325), .QN(n754) );
  NAND3X0 U1038 ( .IN1(n69), .IN2(n116), .IN3(n325), .QN(n509) );
  NAND3X0 U1039 ( .IN1(n74), .IN2(n80), .IN3(n322), .QN(n909) );
  NAND3X0 U1040 ( .IN1(n736), .IN2(n638), .IN3(n738), .QN(n1049) );
  NAND3X0 U1044 ( .IN1(n126), .IN2(n139), .IN3(n325), .QN(n597) );
  NAND3X0 U1046 ( .IN1(n126), .IN2(n140), .IN3(n322), .QN(n595) );
  AOI221X1 U1049 ( .IN1(n1076), .IN2(n1053), .IN3(n1260), .IN4(n1079), .IN5(
        n1054), .QN(n684) );
  AO222X1 U1050 ( .IN1(n94), .IN2(n1055), .IN3(n1056), .IN4(n923), .IN5(n102),
        .IN6(n1057), .Q(n1054) );
  NAND3X0 U1052 ( .IN1(n1105), .IN2(n56), .IN3(n121), .QN(n588) );
  NAND3X0 U1057 ( .IN1(n134), .IN2(n28), .IN3(n167), .QN(n921) );
  NAND3X0 U1058 ( .IN1(n141), .IN2(n43), .IN3(n163), .QN(n507) );
  NAND3X0 U1061 ( .IN1(n81), .IN2(n129), .IN3(n167), .QN(n498) );
  NAND4X0 U1062 ( .IN1(n908), .IN2(n799), .IN3(n800), .IN4(n607), .QN(n1053)
         );
  NAND3X0 U1063 ( .IN1(n120), .IN2(n56), .IN3(n145), .QN(n607) );
  NAND3X0 U1065 ( .IN1(n124), .IN2(n168), .IN3(n62), .QN(n799) );
  NAND3X0 U1068 ( .IN1(n120), .IN2(n57), .IN3(n70), .QN(n908) );
  AND2X1 U3 ( .IN1(sample_address[6]), .IN2(n1272), .Q(n1) );
  OR4X4 U4 ( .IN1(n180), .IN2(n181), .IN3(n182), .IN4(n183), .Q(n179) );
  NAND3X1 U5 ( .IN1(n46), .IN2(n60), .IN3(n55), .QN(n212) );
  NOR2X0 U6 ( .IN1(sample_address[11]), .IN2(n466), .QN(chirp_im[4]) );
  OR2X4 U7 ( .IN1(sample_address[6]), .IN2(sample_address[5]), .Q(n96) );
  AND2X4 U8 ( .IN1(sample_address[6]), .IN2(sample_address[5]), .Q(n805) );
  NOR4X1 U9 ( .IN1(n467), .IN2(n468), .IN3(n469), .IN4(n470), .QN(n466) );
  NOR4X1 U10 ( .IN1(n525), .IN2(n526), .IN3(n527), .IN4(n528), .QN(n524) );
  DELLN1X2 U11 ( .INP(n1), .Z(n1094) );
  INVX0 U12 ( .INP(n660), .ZN(n2) );
  INVX0 U13 ( .INP(n2), .ZN(n3) );
  NAND2X2 U14 ( .IN1(n69), .IN2(n1242), .QN(n4) );
  NAND2X1 U15 ( .IN1(n5), .IN2(n92), .QN(n371) );
  INVX2 U16 ( .INP(n4), .ZN(n5) );
  INVX1 U17 ( .INP(n91), .ZN(n92) );
  NAND3X4 U18 ( .IN1(n224), .IN2(n217), .IN3(n371), .QN(n633) );
  NAND3X4 U19 ( .IN1(n371), .IN2(n506), .IN3(n507), .QN(n502) );
  NAND3X1 U20 ( .IN1(n934), .IN2(n372), .IN3(n371), .QN(n962) );
  NAND3X0 U21 ( .IN1(n47), .IN2(n116), .IN3(n391), .QN(n505) );
  NBUFFX2 U22 ( .INP(n41), .Z(n30) );
  NAND3X1 U23 ( .IN1(n1275), .IN2(n44), .IN3(n1147), .QN(n214) );
  NAND3X0 U24 ( .IN1(n1147), .IN2(n60), .IN3(n55), .QN(n223) );
  OA221X1 U25 ( .IN1(n219), .IN2(n1219), .IN3(n58), .IN4(n1221), .IN5(n570),
        .Q(n569) );
  NAND3X0 U26 ( .IN1(n721), .IN2(n465), .IN3(n720), .QN(n999) );
  NBUFFX2 U27 ( .INP(n1112), .Z(n155) );
  NAND3X1 U28 ( .IN1(n378), .IN2(n554), .IN3(n377), .QN(n557) );
  NBUFFX2 U29 ( .INP(n1112), .Z(n156) );
  NBUFFX2 U30 ( .INP(n1137), .Z(n1079) );
  NAND3X0 U31 ( .IN1(n65), .IN2(n88), .IN3(n1060), .QN(n344) );
  NAND3X0 U32 ( .IN1(n123), .IN2(n1091), .IN3(n68), .QN(n681) );
  AO22X1 U33 ( .IN1(n1175), .IN2(n1076), .IN3(n94), .IN4(n1051), .Q(n1050) );
  NAND3X1 U34 ( .IN1(n148), .IN2(n39), .IN3(n991), .QN(n721) );
  OAI22X1 U35 ( .IN1(n378), .IN2(n174), .IN3(n1111), .IN4(n988), .QN(n450) );
  NOR4X0 U36 ( .IN1(n326), .IN2(n327), .IN3(n328), .IN4(n287), .QN(n22) );
  NAND3X0 U37 ( .IN1(n1091), .IN2(n38), .IN3(n71), .QN(n302) );
  NAND4X0 U38 ( .IN1(n376), .IN2(n377), .IN3(n378), .IN4(n379), .QN(n368) );
  NAND4X0 U39 ( .IN1(n1185), .IN2(n371), .IN3(n372), .IN4(n1067), .QN(n370) );
  NBUFFX2 U40 ( .INP(n1112), .Z(n154) );
  OR4X1 U41 ( .IN1(n742), .IN2(n743), .IN3(n525), .IN4(n744), .Q(n689) );
  NOR2X0 U42 ( .IN1(sample_address[11]), .IN2(n284), .QN(chirp_re[1]) );
  NOR2X0 U43 ( .IN1(n177), .IN2(n7), .QN(n175) );
  AND2X1 U44 ( .IN1(sample_address[7]), .IN2(sample_address[8]), .Q(n1042) );
  NBUFFX2 U45 ( .INP(n392), .Z(n1106) );
  AND2X1 U46 ( .IN1(sample_address[8]), .IN2(n1270), .Q(n1041) );
  AND2X1 U47 ( .IN1(n879), .IN2(n1041), .Q(n836) );
  AND2X1 U48 ( .IN1(n1052), .IN2(n1041), .Q(n771) );
  AND2X1 U49 ( .IN1(n1042), .IN2(n1058), .Q(n806) );
  NAND3X1 U50 ( .IN1(n141), .IN2(n1257), .IN3(n122), .QN(n737) );
  AND2X1 U51 ( .IN1(sample_address[9]), .IN2(n1233), .Q(n1052) );
  NAND3X0 U52 ( .IN1(n168), .IN2(n29), .IN3(n47), .QN(n425) );
  AND4X1 U53 ( .IN1(n344), .IN2(n345), .IN3(n538), .IN4(n537), .Q(n839) );
  NBUFFX2 U54 ( .INP(n68), .Z(n62) );
  INVX0 U55 ( .INP(n144), .ZN(n34) );
  NBUFFX2 U56 ( .INP(n1097), .Z(n65) );
  NAND3X0 U57 ( .IN1(n1090), .IN2(n42), .IN3(n1102), .QN(n935) );
  NBUFFX2 U58 ( .INP(n64), .Z(n63) );
  NBUFFX2 U59 ( .INP(n1), .Z(n1095) );
  NAND3X0 U60 ( .IN1(n146), .IN2(n80), .IN3(n325), .QN(n738) );
  NAND3X0 U61 ( .IN1(n737), .IN2(n372), .IN3(n588), .QN(n1057) );
  NBUFFX2 U62 ( .INP(n43), .Z(n29) );
  NAND3X0 U63 ( .IN1(n90), .IN2(n1102), .IN3(n1070), .QN(n809) );
  NAND3X0 U64 ( .IN1(n120), .IN2(n162), .IN3(n147), .QN(n800) );
  NBUFFX2 U65 ( .INP(n427), .Z(n1073) );
  NBUFFX2 U66 ( .INP(n425), .Z(n50) );
  NAND3X0 U67 ( .IN1(n221), .IN2(n160), .IN3(n219), .QN(n207) );
  NOR4X0 U68 ( .IN1(n844), .IN2(n440), .IN3(n330), .IN4(n283), .QN(n843) );
  NAND3X0 U69 ( .IN1(n825), .IN2(n827), .IN3(n680), .QN(n870) );
  NAND3X0 U70 ( .IN1(n787), .IN2(n786), .IN3(n680), .QN(n869) );
  NOR4X0 U71 ( .IN1(n987), .IN2(n402), .IN3(n269), .IN4(n450), .QN(n969) );
  NAND3X0 U72 ( .IN1(n48), .IN2(n119), .IN3(n1063), .QN(n820) );
  NAND3X0 U73 ( .IN1(n145), .IN2(n82), .IN3(n1059), .QN(n827) );
  NAND3X0 U74 ( .IN1(n29), .IN2(n1257), .IN3(n73), .QN(n459) );
  NBUFFX2 U75 ( .INP(n31), .Z(n33) );
  NAND3X0 U76 ( .IN1(n47), .IN2(n36), .IN3(n1069), .QN(n532) );
  NBUFFX2 U77 ( .INP(n425), .Z(n51) );
  NAND4X0 U78 ( .IN1(n520), .IN2(n699), .IN3(n372), .IN4(n1067), .QN(n894) );
  NAND3X0 U79 ( .IN1(n1090), .IN2(n132), .IN3(n89), .QN(n697) );
  NAND3X0 U80 ( .IN1(n46), .IN2(n44), .IN3(n61), .QN(n218) );
  NAND3X0 U81 ( .IN1(n124), .IN2(n1104), .IN3(n1062), .QN(n353) );
  NAND3X0 U82 ( .IN1(n81), .IN2(n1104), .IN3(n1059), .QN(n352) );
  NAND3X2 U83 ( .IN1(n377), .IN2(n378), .IN3(n1185), .QN(n555) );
  NAND3X0 U84 ( .IN1(n145), .IN2(n86), .IN3(n490), .QN(n986) );
  NAND3X0 U85 ( .IN1(n126), .IN2(n1257), .IN3(n63), .QN(n745) );
  NAND3X0 U86 ( .IN1(n135), .IN2(n1257), .IN3(n121), .QN(n939) );
  NAND3X0 U87 ( .IN1(n48), .IN2(n117), .IN3(n1059), .QN(n538) );
  NAND3X0 U88 ( .IN1(n124), .IN2(n1104), .IN3(n1060), .QN(n786) );
  NAND3X0 U89 ( .IN1(n80), .IN2(n1104), .IN3(n1064), .QN(n787) );
  NAND3X0 U90 ( .IN1(n35), .IN2(n1257), .IN3(n1105), .QN(n520) );
  AOI222X1 U91 ( .IN1(n155), .IN2(n700), .IN3(n105), .IN4(n701), .IN5(n1196),
        .IN6(n78), .QN(n652) );
  NAND3X0 U92 ( .IN1(n345), .IN2(n344), .IN3(n571), .QN(n810) );
  NOR4X0 U93 ( .IN1(n180), .IN2(n337), .IN3(n812), .IN4(n813), .QN(n660) );
  AO221X1 U94 ( .IN1(n1089), .IN2(n801), .IN3(n1269), .IN4(n108), .IN5(n802),
        .Q(n664) );
  AND2X1 U95 ( .IN1(n733), .IN2(n731), .Q(n331) );
  NAND4X0 U96 ( .IN1(n1080), .IN2(n148), .IN3(n1091), .IN4(n41), .QN(n943) );
  NAND3X2 U97 ( .IN1(n504), .IN2(n378), .IN3(n505), .QN(n1011) );
  NAND2X1 U98 ( .IN1(n1082), .IN2(n998), .QN(n75) );
  NBUFFX2 U99 ( .INP(n359), .Z(n164) );
  NBUFFX2 U100 ( .INP(n225), .Z(n1114) );
  OAI22X1 U101 ( .IN1(n1217), .IN2(n601), .IN3(n217), .IN4(n637), .QN(n788) );
  NAND4X0 U102 ( .IN1(n191), .IN2(n1127), .IN3(n609), .IN4(n1115), .QN(n691)
         );
  AND3X1 U103 ( .IN1(n680), .IN2(n681), .IN3(n682), .Q(n679) );
  NAND4X0 U104 ( .IN1(n475), .IN2(n671), .IN3(n672), .IN4(n673), .QN(n670) );
  AND4X1 U105 ( .IN1(n1168), .IN2(n310), .IN3(n1120), .IN4(n311), .Q(n193) );
  OA221X1 U106 ( .IN1(n219), .IN2(n1068), .IN3(n221), .IN4(n816), .IN5(n222),
        .Q(n195) );
  OA221X1 U107 ( .IN1(n219), .IN2(n584), .IN3(n766), .IN4(n153), .IN5(n767),
        .Q(n765) );
  NOR4X0 U108 ( .IN1(n266), .IN2(n450), .IN3(n451), .IN4(n452), .QN(n20) );
  NOR4X0 U109 ( .IN1(n181), .IN2(n567), .IN3(n23), .IN4(n566), .QN(n565) );
  NBUFFX2 U110 ( .INP(n247), .Z(n1110) );
  NOR4X0 U111 ( .IN1(n364), .IN2(n365), .IN3(n366), .IN4(n367), .QN(n363) );
  NOR4X0 U112 ( .IN1(n264), .IN2(n265), .IN3(n266), .IN4(n267), .QN(n263) );
  NAND4X0 U113 ( .IN1(n578), .IN2(n576), .IN3(n577), .IN4(n1128), .QN(n23) );
  OR2X4 U114 ( .IN1(sample_address[4]), .IN2(sample_address[3]), .Q(n95) );
  OR2X4 U115 ( .IN1(n1273), .IN2(sample_address[3]), .Q(n99) );
  NOR4X0 U116 ( .IN1(n914), .IN2(n432), .IN3(n268), .IN4(n452), .QN(n913) );
  NAND3X1 U117 ( .IN1(n1147), .IN2(n44), .IN3(n61), .QN(n247) );
  NAND3X1 U118 ( .IN1(n61), .IN2(n46), .IN3(n55), .QN(n300) );
  NBUFFX2 U120 ( .INP(n1), .Z(n1092) );
  NBUFFX2 U121 ( .INP(n34), .Z(n35) );
  NBUFFX2 U122 ( .INP(n34), .Z(n36) );
  NBUFFX2 U123 ( .INP(n723), .Z(n1097) );
  NBUFFX2 U124 ( .INP(n392), .Z(n1107) );
  NBUFFX2 U125 ( .INP(n1097), .Z(n64) );
  NBUFFX2 U126 ( .INP(n1171), .Z(n1087) );
  NBUFFX2 U127 ( .INP(n218), .Z(n619) );
  NBUFFX2 U128 ( .INP(n1), .Z(n1093) );
  NBUFFX2 U129 ( .INP(n218), .Z(n992) );
  NBUFFX2 U130 ( .INP(n152), .Z(n94) );
  NBUFFX2 U131 ( .INP(n152), .Z(n93) );
  NBUFFX2 U132 ( .INP(n1171), .Z(n1088) );
  NBUFFX2 U133 ( .INP(n31), .Z(n32) );
  AOI22X1 U134 ( .IN1(n1192), .IN2(n112), .IN3(n1212), .IN4(n110), .QN(n6) );
  NBUFFX2 U135 ( .INP(n223), .Z(n170) );
  NBUFFX2 U136 ( .INP(n1242), .Z(n1090) );
  NBUFFX2 U137 ( .INP(n212), .Z(n1065) );
  NBUFFX2 U138 ( .INP(n247), .Z(n1111) );
  OR3X1 U139 ( .IN1(n176), .IN2(n179), .IN3(n178), .Q(n7) );
  NBUFFX2 U140 ( .INP(n491), .Z(n1103) );
  NBUFFX2 U141 ( .INP(n491), .Z(n1102) );
  NBUFFX2 U142 ( .INP(n491), .Z(n1104) );
  OR3X1 U143 ( .IN1(n580), .IN2(n1163), .IN3(n1236), .Q(n8) );
  AND3X1 U144 ( .IN1(n236), .IN2(n568), .IN3(n331), .Q(n9) );
  AND2X1 U145 ( .IN1(n1116), .IN2(n1120), .Q(n10) );
  AND2X1 U146 ( .IN1(n841), .IN2(n843), .Q(n11) );
  NBUFFX2 U147 ( .INP(n1137), .Z(n1077) );
  NAND3X0 U148 ( .IN1(n1275), .IN2(n54), .IN3(sample_address[0]), .QN(n225) );
  NBUFFX2 U149 ( .INP(n49), .Z(n1075) );
  NBUFFX2 U150 ( .INP(n49), .Z(n1076) );
  NBUFFX2 U151 ( .INP(n1242), .Z(n1091) );
  NBUFFX2 U152 ( .INP(n1108), .Z(n146) );
  OR2X1 U153 ( .IN1(n166), .IN2(n25), .Q(n12) );
  NAND2X1 U154 ( .IN1(n1065), .IN2(n107), .QN(n13) );
  NBUFFX2 U155 ( .INP(n218), .Z(n494) );
  NBUFFX2 U156 ( .INP(n1171), .Z(n1089) );
  INVX0 U157 ( .INP(n58), .ZN(n573) );
  AND2X1 U158 ( .IN1(n1172), .IN2(n14), .Q(chirp_re[0]) );
  NAND4X0 U159 ( .IN1(n22), .IN2(n20), .IN3(n21), .IN4(n19), .QN(n14) );
  NAND4X0 U160 ( .IN1(n481), .IN2(n1148), .IN3(n482), .IN4(n483), .QN(n15) );
  AND4X1 U161 ( .IN1(n16), .IN2(n374), .IN3(n754), .IN4(n638), .Q(n487) );
  AND3X1 U162 ( .IN1(n378), .IN2(n379), .IN3(n495), .Q(n16) );
  NOR2X0 U163 ( .IN1(n1066), .IN2(n17), .QN(n525) );
  AND4X1 U164 ( .IN1(n831), .IN2(n830), .IN3(n575), .IN4(n574), .Q(n17) );
  NBUFFX2 U165 ( .INP(n1167), .Z(n1084) );
  NBUFFX2 U166 ( .INP(n212), .Z(n1066) );
  NOR4X1 U167 ( .IN1(n285), .IN2(n286), .IN3(n287), .IN4(n288), .QN(n284) );
  OR2X1 U168 ( .IN1(n413), .IN2(n414), .Q(n406) );
  NAND4X0 U169 ( .IN1(n524), .IN2(n523), .IN3(n1169), .IN4(n1153), .QN(n18) );
  NBUFFX2 U170 ( .INP(n1130), .Z(n1074) );
  AOI221X1 U171 ( .IN1(n105), .IN2(n453), .IN3(n260), .IN4(n1135), .IN5(n454),
        .QN(n19) );
  AND4X1 U172 ( .IN1(n190), .IN2(n1121), .IN3(n255), .IN4(n354), .Q(n21) );
  INVX0 U173 ( .INP(n170), .ZN(n24) );
  INVX0 U174 ( .INP(n427), .ZN(n25) );
  INVX0 U175 ( .INP(n25), .ZN(n26) );
  NOR2X0 U176 ( .IN1(n1272), .IN2(sample_address[6]), .QN(n27) );
  NOR2X0 U177 ( .IN1(n1272), .IN2(sample_address[6]), .QN(n28) );
  INVX0 U178 ( .INP(n143), .ZN(n31) );
  INVX0 U179 ( .INP(n27), .ZN(n37) );
  INVX0 U180 ( .INP(n37), .ZN(n38) );
  INVX0 U181 ( .INP(n37), .ZN(n39) );
  INVX0 U182 ( .INP(n28), .ZN(n40) );
  INVX0 U183 ( .INP(n40), .ZN(n41) );
  INVX0 U184 ( .INP(n40), .ZN(n42) );
  INVX0 U185 ( .INP(n143), .ZN(n43) );
  AND2X1 U186 ( .IN1(n1111), .IN2(n619), .Q(n219) );
  NBUFFX4 U187 ( .INP(n54), .Z(n44) );
  NOR4X1 U188 ( .IN1(n335), .IN2(n336), .IN3(n337), .IN4(n18), .QN(n334) );
  NAND3X1 U189 ( .IN1(n61), .IN2(n1147), .IN3(n55), .QN(n359) );
  NOR4X0 U190 ( .IN1(n641), .IN2(n642), .IN3(n643), .IN4(n294), .QN(n624) );
  INVX0 U191 ( .INP(sample_address[0]), .ZN(n45) );
  INVX0 U192 ( .INP(n45), .ZN(n46) );
  NOR2X0 U193 ( .IN1(sample_address[11]), .IN2(n175), .QN(chirp_re[4]) );
  DELLN1X2 U194 ( .INP(n1108), .Z(n47) );
  DELLN1X2 U195 ( .INP(n1108), .Z(n48) );
  AND3X1 U196 ( .IN1(n344), .IN2(n224), .IN3(n345), .Q(n339) );
  NBUFFX4 U197 ( .INP(n491), .Z(n1105) );
  NAND3X4 U198 ( .IN1(n82), .IN2(n1104), .IN3(n1062), .QN(n546) );
  NAND3X1 U199 ( .IN1(n1096), .IN2(n1104), .IN3(n492), .QN(n224) );
  INVX0 U200 ( .INP(n359), .ZN(n49) );
  NOR4X0 U201 ( .IN1(n414), .IN2(n304), .IN3(n266), .IN4(n522), .QN(n968) );
  DELLN1X2 U202 ( .INP(n223), .Z(n171) );
  DELLN1X2 U203 ( .INP(n223), .Z(n172) );
  INVX0 U204 ( .INP(n1276), .ZN(n52) );
  INVX0 U205 ( .INP(n52), .ZN(n53) );
  NAND2X0 U206 ( .IN1(n1058), .IN2(n1041), .QN(n384) );
  AO21X1 U207 ( .IN1(n376), .IN2(n217), .IN3(n160), .Q(n552) );
  NAND3X2 U208 ( .IN1(n36), .IN2(n1257), .IN3(n147), .QN(n372) );
  INVX0 U209 ( .INP(sample_address[2]), .ZN(n54) );
  INVX0 U210 ( .INP(n54), .ZN(n55) );
  INVX0 U211 ( .INP(n114), .ZN(n56) );
  INVX0 U212 ( .INP(n114), .ZN(n57) );
  NAND2X1 U213 ( .IN1(n9), .IN2(n569), .QN(n181) );
  NOR2X0 U214 ( .IN1(n13), .IN2(n49), .QN(n58) );
  AND2X1 U215 ( .IN1(n192), .IN2(n59), .Q(n189) );
  AND3X1 U216 ( .IN1(n193), .IN2(n191), .IN3(n190), .Q(n59) );
  INVX0 U217 ( .INP(sample_address[1]), .ZN(n60) );
  INVX0 U218 ( .INP(n1275), .ZN(n61) );
  DELLN1X2 U219 ( .INP(n1108), .Z(n147) );
  NAND2X1 U220 ( .IN1(n684), .IN2(n685), .QN(n566) );
  NAND2X1 U221 ( .IN1(n11), .IN2(n842), .QN(n180) );
  INVX0 U222 ( .INP(n723), .ZN(n66) );
  INVX0 U223 ( .INP(n723), .ZN(n67) );
  INVX0 U224 ( .INP(n66), .ZN(n68) );
  INVX0 U225 ( .INP(n66), .ZN(n69) );
  INVX0 U226 ( .INP(n67), .ZN(n70) );
  INVX0 U227 ( .INP(n67), .ZN(n71) );
  INVX0 U228 ( .INP(n723), .ZN(n72) );
  INVX0 U229 ( .INP(n72), .ZN(n73) );
  INVX0 U230 ( .INP(n72), .ZN(n74) );
  NOR2X0 U231 ( .IN1(n1274), .IN2(n1273), .QN(n723) );
  NAND3X1 U232 ( .IN1(n33), .IN2(n1257), .IN3(n128), .QN(n226) );
  NAND3X1 U233 ( .IN1(n602), .IN2(n607), .IN3(n378), .QN(n604) );
  NAND3X1 U234 ( .IN1(n74), .IN2(n29), .IN3(n991), .QN(n736) );
  NAND3X1 U235 ( .IN1(n148), .IN2(n86), .IN3(n991), .QN(n714) );
  NAND3X1 U236 ( .IN1(n127), .IN2(n128), .IN3(n991), .QN(n682) );
  NAND3X1 U237 ( .IN1(n62), .IN2(n123), .IN3(n991), .QN(n400) );
  NAND3X1 U238 ( .IN1(n142), .IN2(n32), .IN3(n991), .QN(n703) );
  NAND3X1 U239 ( .IN1(n136), .IN2(n33), .IN3(n991), .QN(n381) );
  NAND3X1 U240 ( .IN1(n123), .IN2(n140), .IN3(n991), .QN(n378) );
  NAND2X0 U241 ( .IN1(n155), .IN2(n999), .QN(n76) );
  NAND3X0 U242 ( .IN1(n76), .IN2(n75), .IN3(n6), .QN(n643) );
  AND3X1 U243 ( .IN1(n971), .IN2(n970), .IN3(n969), .Q(n77) );
  AND2X1 U244 ( .IN1(n968), .IN2(n77), .Q(n672) );
  DELLN1X2 U245 ( .INP(n152), .Z(n151) );
  NAND3X0 U246 ( .IN1(n565), .IN2(n564), .IN3(n10), .QN(n468) );
  NOR2X0 U247 ( .IN1(n579), .IN2(n8), .QN(n578) );
  INVX0 U248 ( .INP(n494), .ZN(n78) );
  INVX0 U249 ( .INP(n1), .ZN(n79) );
  INVX0 U250 ( .INP(n79), .ZN(n80) );
  INVX0 U251 ( .INP(n79), .ZN(n81) );
  INVX0 U252 ( .INP(n79), .ZN(n82) );
  INVX0 U253 ( .INP(n1094), .ZN(n83) );
  INVX0 U254 ( .INP(n83), .ZN(n84) );
  INVX0 U255 ( .INP(n83), .ZN(n85) );
  INVX0 U256 ( .INP(n83), .ZN(n86) );
  INVX0 U257 ( .INP(n1095), .ZN(n87) );
  INVX0 U258 ( .INP(n87), .ZN(n88) );
  INVX0 U259 ( .INP(n87), .ZN(n89) );
  INVX0 U260 ( .INP(n87), .ZN(n90) );
  INVX0 U261 ( .INP(n1092), .ZN(n91) );
  DELLN1X2 U262 ( .INP(n152), .Z(n150) );
  NAND2X0 U263 ( .IN1(n1025), .IN2(n1071), .QN(n574) );
  NAND2X0 U264 ( .IN1(n1071), .IN2(n167), .QN(n396) );
  NAND2X0 U265 ( .IN1(n490), .IN2(n1072), .QN(n508) );
  NAND2X0 U266 ( .IN1(n1061), .IN2(n1072), .QN(n825) );
  DELLN1X2 U267 ( .INP(n1108), .Z(n145) );
  NAND2X0 U268 ( .IN1(n246), .IN2(n385), .QN(n431) );
  NAND2X0 U269 ( .IN1(n78), .IN2(n303), .QN(n1044) );
  NAND2X0 U270 ( .IN1(n908), .IN2(n909), .QN(n478) );
  NAND2X0 U271 ( .IN1(n819), .IN2(n820), .QN(n639) );
  NAND2X0 U272 ( .IN1(n47), .IN2(n28), .QN(n1031) );
  NAND2X0 U273 ( .IN1(n534), .IN2(n533), .QN(n315) );
  NAND2X0 U274 ( .IN1(n1063), .IN2(n1072), .QN(n547) );
  NAND2X0 U275 ( .IN1(n1110), .IN2(n164), .QN(n709) );
  NAND2X0 U276 ( .IN1(n1000), .IN2(n1066), .QN(n393) );
  INVX0 U277 ( .INP(n1083), .ZN(n104) );
  INVX0 U278 ( .INP(n1091), .ZN(n114) );
  NAND2X0 U279 ( .IN1(n325), .IN2(n1071), .QN(n360) );
  INVX0 U280 ( .INP(n1086), .ZN(n109) );
  INVX0 U281 ( .INP(n1085), .ZN(n107) );
  NAND2X0 U282 ( .IN1(n880), .IN2(n1058), .QN(n885) );
  INVX0 U283 ( .INP(n1102), .ZN(n137) );
  INVX0 U284 ( .INP(n1106), .ZN(n143) );
  INVX0 U285 ( .INP(n1107), .ZN(n144) );
  INVX0 U286 ( .INP(n1103), .ZN(n138) );
  INVX0 U287 ( .INP(n805), .ZN(n118) );
  NAND2X0 U288 ( .IN1(n1043), .IN2(n1058), .QN(n922) );
  INVX0 U289 ( .INP(n1111), .ZN(n152) );
  INVX0 U290 ( .INP(n198), .ZN(n1145) );
  INVX0 U291 ( .INP(n385), .ZN(n1210) );
  INVX0 U292 ( .INP(n279), .ZN(n1124) );
  NOR2X0 U293 ( .IN1(n154), .IN2(n1080), .QN(n198) );
  INVX0 U294 ( .INP(n219), .ZN(n1142) );
  INVX0 U295 ( .INP(n785), .ZN(n1120) );
  INVX0 U296 ( .INP(n242), .ZN(n1134) );
  INVX0 U297 ( .INP(n615), .ZN(n1206) );
  INVX0 U298 ( .INP(n741), .ZN(n1168) );
  INVX0 U299 ( .INP(n666), .ZN(n1169) );
  INVX0 U300 ( .INP(n321), .ZN(n102) );
  NOR2X0 U301 ( .IN1(n1268), .IN2(n951), .QN(n947) );
  NOR2X0 U302 ( .IN1(n1262), .IN2(n1255), .QN(n613) );
  NOR2X0 U303 ( .IN1(n1266), .IN2(n1238), .QN(n945) );
  INVX0 U304 ( .INP(n301), .ZN(n1189) );
  INVX0 U305 ( .INP(n321), .ZN(n103) );
  NOR2X0 U306 ( .IN1(n1264), .IN2(n1209), .QN(n246) );
  NOR2X0 U307 ( .IN1(n1265), .IN2(n1255), .QN(n766) );
  INVX0 U308 ( .INP(n259), .ZN(n1219) );
  NOR2X0 U309 ( .IN1(n1268), .IN2(n1211), .QN(n385) );
  NOR2X0 U310 ( .IN1(n1253), .IN2(n1264), .QN(n587) );
  NOR2X0 U311 ( .IN1(n1263), .IN2(n1212), .QN(n463) );
  NOR2X0 U312 ( .IN1(n1184), .IN2(n1198), .QN(n773) );
  NOR2X0 U313 ( .IN1(n1264), .IN2(n1196), .QN(n211) );
  NOR2X0 U314 ( .IN1(n1261), .IN2(n1204), .QN(n586) );
  NOR2X0 U315 ( .IN1(n1187), .IN2(n1234), .QN(n904) );
  NOR2X0 U316 ( .IN1(n634), .IN2(n206), .QN(n631) );
  INVX0 U317 ( .INP(n296), .ZN(n1165) );
  INVX0 U318 ( .INP(n209), .ZN(n1216) );
  NOR2X0 U319 ( .IN1(n1176), .IN2(n1190), .QN(n421) );
  NOR2X0 U320 ( .IN1(n1250), .IN2(n1203), .QN(n210) );
  NOR2X0 U321 ( .IN1(n208), .IN2(n209), .QN(n201) );
  NOR2X0 U322 ( .IN1(n258), .IN2(n639), .QN(n213) );
  NOR2X0 U323 ( .IN1(n1243), .IN2(n1259), .QN(n297) );
  INVX0 U324 ( .INP(n634), .ZN(n1218) );
  INVX0 U325 ( .INP(n556), .ZN(n1185) );
  INVX0 U326 ( .INP(n303), .ZN(n1179) );
  INVX0 U327 ( .INP(n320), .ZN(n1207) );
  INVX0 U328 ( .INP(n205), .ZN(n1217) );
  NOR4X0 U329 ( .IN1(n1196), .IN2(n1208), .IN3(n1183), .IN4(n1173), .QN(n979)
         );
  NOR2X0 U330 ( .IN1(n1249), .IN2(n1267), .QN(n683) );
  NOR2X0 U331 ( .IN1(n1230), .IN2(n1225), .QN(n857) );
  INVX0 U332 ( .INP(n200), .ZN(n1143) );
  NOR2X0 U333 ( .IN1(n1241), .IN2(n301), .QN(n299) );
  INVX0 U334 ( .INP(n249), .ZN(n1123) );
  NOR2X0 U335 ( .IN1(n1178), .IN2(n431), .QN(n430) );
  INVX0 U336 ( .INP(n221), .ZN(n1135) );
  INVX0 U337 ( .INP(n183), .ZN(n1159) );
  NOR2X0 U338 ( .IN1(n208), .IN2(n763), .QN(n874) );
  NOR2X0 U339 ( .IN1(n1231), .IN2(n258), .QN(n340) );
  INVX0 U340 ( .INP(n462), .ZN(n1180) );
  NOR2X0 U341 ( .IN1(n1186), .IN2(n1236), .QN(n429) );
  NAND2X0 U342 ( .IN1(n217), .IN2(n594), .QN(n593) );
  INVX0 U343 ( .INP(n581), .ZN(n1163) );
  OR3X1 U344 ( .IN1(n643), .IN2(n97), .IN3(n98), .Q(n414) );
  AND2X1 U345 ( .IN1(n1196), .IN2(n1085), .Q(n97) );
  AO222X1 U346 ( .IN1(n157), .IN2(n994), .IN3(n113), .IN4(n995), .IN5(n105),
        .IN6(n996), .Q(n98) );
  NAND2X0 U347 ( .IN1(n725), .IN2(n659), .QN(n927) );
  NOR2X0 U348 ( .IN1(n1229), .IN2(n346), .QN(n572) );
  OA21X1 U349 ( .IN1(n315), .IN2(n208), .IN3(n1088), .Q(n313) );
  INVX0 U350 ( .INP(n725), .ZN(n1244) );
  NAND2X0 U351 ( .IN1(n722), .IN2(n422), .QN(n931) );
  NAND2X0 U352 ( .IN1(n464), .IN2(n226), .QN(n932) );
  NAND2X0 U353 ( .IN1(n713), .IN2(n420), .QN(n1035) );
  NOR2X0 U354 ( .IN1(n1240), .IN2(n206), .QN(n203) );
  NOR4X0 U355 ( .IN1(n1241), .IN2(n1199), .IN3(n1228), .IN4(n205), .QN(n204)
         );
  INVX0 U356 ( .INP(n207), .ZN(n1136) );
  NAND2X0 U357 ( .IN1(n782), .IN2(n783), .QN(n781) );
  NOR2X0 U358 ( .IN1(n154), .IN2(n94), .QN(n200) );
  OA21X1 U359 ( .IN1(n1182), .IN2(n1174), .IN3(n94), .Q(n975) );
  NAND2X0 U360 ( .IN1(n458), .IN2(n349), .QN(n687) );
  INVX0 U361 ( .INP(n243), .ZN(n1125) );
  INVX0 U362 ( .INP(n185), .ZN(n1161) );
  INVX0 U363 ( .INP(n104), .ZN(n106) );
  INVX0 U364 ( .INP(n302), .ZN(n1241) );
  NAND2X0 U365 ( .IN1(n344), .IN2(n345), .QN(n824) );
  INVX0 U366 ( .INP(n278), .ZN(n1133) );
  INVX0 U367 ( .INP(n710), .ZN(n1235) );
  INVX0 U368 ( .INP(n371), .ZN(n1239) );
  NOR2X0 U369 ( .IN1(n1235), .IN2(n1177), .QN(n608) );
  INVX0 U370 ( .INP(n104), .ZN(n105) );
  INVX0 U371 ( .INP(n114), .ZN(n115) );
  NAND2X0 U372 ( .IN1(n697), .IN2(n707), .QN(n615) );
  NOR2X0 U373 ( .IN1(n1137), .IN2(n1082), .QN(n221) );
  NOR2X0 U374 ( .IN1(n1082), .IN2(n1074), .QN(n601) );
  NOR2X0 U375 ( .IN1(n573), .IN2(n101), .QN(n216) );
  OA21X1 U376 ( .IN1(n1239), .IN2(n431), .IN3(n24), .Q(n449) );
  INVX0 U377 ( .INP(n244), .ZN(n1116) );
  NOR4X0 U378 ( .IN1(n962), .IN2(n1267), .IN3(n1248), .IN4(n1249), .QN(n959)
         );
  NOR4X0 U379 ( .IN1(n501), .IN2(n502), .IN3(n1191), .IN4(n503), .QN(n484) );
  INVX0 U380 ( .INP(n505), .ZN(n1191) );
  NAND2X0 U381 ( .IN1(n504), .IN2(n375), .QN(n503) );
  INVX0 U382 ( .INP(n165), .ZN(n100) );
  INVX0 U383 ( .INP(n992), .ZN(n112) );
  INVX0 U384 ( .INP(n554), .ZN(n1240) );
  INVX0 U385 ( .INP(n226), .ZN(n1255) );
  NAND2X0 U386 ( .IN1(n507), .IN2(n509), .QN(n301) );
  NBUFFX2 U387 ( .INP(n1113), .Z(n158) );
  INVX0 U388 ( .INP(n935), .ZN(n1238) );
  NOR2X0 U389 ( .IN1(n1178), .IN2(n1187), .QN(n585) );
  INVX0 U390 ( .INP(n464), .ZN(n1237) );
  NAND2X0 U391 ( .IN1(n507), .IN2(n921), .QN(n1055) );
  NAND2X0 U392 ( .IN1(n445), .IN2(n1206), .QN(n479) );
  INVX0 U393 ( .INP(n171), .ZN(n101) );
  INVX0 U394 ( .INP(n308), .ZN(n1264) );
  INVX0 U395 ( .INP(n248), .ZN(n1228) );
  INVX0 U396 ( .INP(n520), .ZN(n1256) );
  NBUFFX2 U397 ( .INP(n1113), .Z(n157) );
  NAND2X0 U398 ( .IN1(n538), .IN2(n537), .QN(n259) );
  INVX0 U399 ( .INP(n394), .ZN(n1246) );
  INVX0 U400 ( .INP(n461), .ZN(n1192) );
  INVX0 U401 ( .INP(n498), .ZN(n1260) );
  NAND2X0 U402 ( .IN1(n248), .IN2(n546), .QN(n544) );
  OA21X1 U403 ( .IN1(n1227), .IN2(n1215), .IN3(n1076), .Q(n526) );
  NOR4X0 U404 ( .IN1(n957), .IN2(n1234), .IN3(n1252), .IN4(n1266), .QN(n956)
         );
  NAND2X0 U405 ( .IN1(n513), .IN2(n507), .QN(n957) );
  INVX0 U406 ( .INP(n619), .ZN(n113) );
  INVX0 U407 ( .INP(n607), .ZN(n1234) );
  INVX0 U408 ( .INP(n782), .ZN(n1184) );
  INVX0 U409 ( .INP(n497), .ZN(n1268) );
  NOR2X0 U410 ( .IN1(n412), .IN2(n1197), .QN(n446) );
  INVX0 U411 ( .INP(n217), .ZN(n1269) );
  INVX0 U412 ( .INP(n372), .ZN(n1252) );
  NOR2X0 U413 ( .IN1(n1215), .IN2(n863), .QN(n861) );
  OA21X1 U414 ( .IN1(n1211), .IN2(n976), .IN3(n1076), .Q(n973) );
  OA21X1 U415 ( .IN1(n1204), .IN2(n976), .IN3(n1084), .Q(n974) );
  NOR4X0 U416 ( .IN1(n496), .IN2(n1211), .IN3(n1243), .IN4(n1259), .QN(n485)
         );
  INVX0 U417 ( .INP(n398), .ZN(n1262) );
  NAND2X0 U418 ( .IN1(n725), .IN2(n724), .QN(n462) );
  NAND2X0 U419 ( .IN1(n561), .IN2(n560), .QN(n206) );
  INVX0 U420 ( .INP(n594), .ZN(n1265) );
  NAND2X0 U421 ( .IN1(n699), .IN2(n704), .QN(n320) );
  INVX0 U422 ( .INP(n422), .ZN(n1263) );
  NAND2X1 U423 ( .IN1(n830), .IN2(n831), .QN(n209) );
  INVX0 U424 ( .INP(n921), .ZN(n1261) );
  INVX0 U425 ( .INP(n680), .ZN(n1229) );
  NAND2X0 U426 ( .IN1(n399), .IN2(n401), .QN(n656) );
  NAND2X0 U427 ( .IN1(n398), .IN2(n461), .QN(n719) );
  INVX0 U428 ( .INP(n419), .ZN(n1245) );
  NOR2X0 U429 ( .IN1(n1214), .IN2(n863), .QN(n862) );
  NOR2X0 U430 ( .IN1(n1089), .IN2(n24), .QN(n628) );
  NAND2X0 U431 ( .IN1(n504), .IN2(n505), .QN(n303) );
  INVX0 U432 ( .INP(n506), .ZN(n1250) );
  INVX0 U433 ( .INP(n382), .ZN(n1194) );
  NOR2X0 U434 ( .IN1(n1248), .IN2(n1182), .QN(n445) );
  INVX0 U435 ( .INP(n783), .ZN(n1198) );
  NAND2X0 U436 ( .IN1(n343), .IN2(n342), .QN(n563) );
  NAND2X0 U437 ( .IN1(n786), .IN2(n787), .QN(n634) );
  INVX0 U438 ( .INP(n397), .ZN(n1247) );
  INVX0 U439 ( .INP(n754), .ZN(n1190) );
  INVX0 U440 ( .INP(n800), .ZN(n1243) );
  INVX0 U441 ( .INP(n465), .ZN(n1212) );
  INVX0 U442 ( .INP(n375), .ZN(n1183) );
  INVX0 U443 ( .INP(n978), .ZN(n1211) );
  INVX0 U444 ( .INP(n357), .ZN(n1236) );
  INVX0 U445 ( .INP(n420), .ZN(n1193) );
  NBUFFX2 U448 ( .INP(n220), .Z(n1068) );
  NAND2X0 U455 ( .IN1(n512), .IN2(n511), .QN(n556) );
  INVX0 U476 ( .INP(n473), .ZN(n1209) );
  NAND2X0 U480 ( .IN1(n357), .IN2(n939), .QN(n966) );
  INVX0 U486 ( .INP(n477), .ZN(n1188) );
  NOR2X0 U490 ( .IN1(n1170), .IN2(n1074), .QN(n637) );
  INVX0 U495 ( .INP(n319), .ZN(n1196) );
  INVX0 U497 ( .INP(n597), .ZN(n1187) );
  INVX0 U507 ( .INP(n934), .ZN(n1266) );
  INVX0 U517 ( .INP(n548), .ZN(n1231) );
  INVX0 U519 ( .INP(n760), .ZN(n1222) );
  INVX0 U538 ( .INP(n595), .ZN(n1174) );
  NAND2X0 U540 ( .IN1(n421), .IN2(n422), .QN(n417) );
  INVX0 U547 ( .INP(n436), .ZN(n1227) );
  NAND2X0 U555 ( .IN1(n419), .IN2(n420), .QN(n418) );
  NAND2X0 U556 ( .IN1(n395), .IN2(n707), .QN(n995) );
  NAND2X0 U560 ( .IN1(n422), .IN2(n465), .QN(n718) );
  NAND2X0 U564 ( .IN1(n574), .IN2(n575), .QN(n739) );
  INVX0 U565 ( .INP(n424), .ZN(n1181) );
  INVX0 U566 ( .INP(n374), .ZN(n1173) );
  NAND2X0 U575 ( .IN1(n536), .IN2(n535), .QN(n258) );
  INVX0 U582 ( .INP(n745), .ZN(n1253) );
  INVX0 U601 ( .INP(n986), .ZN(n1204) );
  INVX0 U617 ( .INP(n897), .ZN(n1248) );
  INVX0 U621 ( .INP(n495), .ZN(n1176) );
  INVX0 U631 ( .INP(n602), .ZN(n1249) );
  NAND2X0 U635 ( .IN1(n352), .IN2(n353), .QN(n686) );
  NAND2X0 U644 ( .IN1(n827), .IN2(n825), .QN(n763) );
  AND2X1 U655 ( .IN1(n865), .IN2(n864), .Q(n571) );
  INVX0 U671 ( .INP(n396), .ZN(n1258) );
  INVX0 U690 ( .INP(n349), .ZN(n1226) );
  INVX0 U700 ( .INP(n799), .ZN(n1259) );
  INVX0 U708 ( .INP(n809), .ZN(n1232) );
  INVX0 U741 ( .INP(n360), .ZN(n1186) );
  INVX0 U745 ( .INP(n713), .ZN(n1177) );
  INVX0 U750 ( .INP(n852), .ZN(n1225) );
  INVX0 U757 ( .INP(n596), .ZN(n1267) );
  INVX0 U758 ( .INP(n560), .ZN(n1213) );
  INVX0 U766 ( .INP(n508), .ZN(n1203) );
  INVX0 U771 ( .INP(n909), .ZN(n1175) );
  INVX0 U773 ( .INP(n598), .ZN(n1178) );
  INVX0 U774 ( .INP(n379), .ZN(n1197) );
  INVX0 U775 ( .INP(n939), .ZN(n1254) );
  INVX0 U776 ( .INP(n395), .ZN(n1208) );
  INVX0 U780 ( .INP(n761), .ZN(n1223) );
  INVX0 U782 ( .INP(n853), .ZN(n1230) );
  INVX0 U795 ( .INP(n335), .ZN(n1156) );
  NOR2X0 U808 ( .IN1(n741), .IN2(n726), .QN(n807) );
  INVX0 U809 ( .INP(n182), .ZN(n1127) );
  NAND2X0 U822 ( .IN1(n554), .IN2(n506), .QN(n803) );
  NAND2X0 U838 ( .IN1(n302), .IN2(n561), .QN(n804) );
  INVX0 U839 ( .INP(n245), .ZN(n1126) );
  INVX0 U859 ( .INP(n312), .ZN(n1140) );
  NOR4X0 U872 ( .IN1(n242), .IN2(n243), .IN3(n244), .IN4(n245), .QN(n241) );
  NBUFFX2 U876 ( .INP(n220), .Z(n1067) );
  OA21X1 U880 ( .IN1(n1253), .IN2(n1234), .IN3(n111), .Q(n742) );
  OA21X1 U881 ( .IN1(n1187), .IN2(n259), .IN3(n1087), .Q(n743) );
  NOR2X0 U888 ( .IN1(n1199), .IN2(n303), .QN(n298) );
  OA21X1 U897 ( .IN1(n1174), .IN2(n478), .IN3(n1084), .Q(n744) );
  NAND2X0 U903 ( .IN1(n594), .IN2(n978), .QN(n1005) );
  NAND2X0 U904 ( .IN1(n398), .IN2(n724), .QN(n998) );
  OA21X1 U905 ( .IN1(n1000), .IN2(n548), .IN3(n275), .Q(n568) );
  INVX0 U911 ( .INP(n563), .ZN(n1221) );
  NAND2X0 U912 ( .IN1(n594), .IN2(n702), .QN(n701) );
  NAND2X0 U913 ( .IN1(n595), .IN2(n379), .QN(n1001) );
  NAND2X0 U926 ( .IN1(n381), .IN2(n382), .QN(n1002) );
  OA21X1 U937 ( .IN1(n683), .IN2(n628), .IN3(n773), .Q(n764) );
  INVX0 U939 ( .INP(n267), .ZN(n1117) );
  NAND2X0 U943 ( .IN1(n595), .IN2(n597), .QN(n1048) );
  NAND2X0 U955 ( .IN1(n426), .IN2(n50), .QN(n925) );
  NAND2X0 U956 ( .IN1(n464), .IN2(n498), .QN(n926) );
  INVX0 U963 ( .INP(n566), .ZN(n1115) );
  NAND2X0 U974 ( .IN1(n1082), .IN2(n555), .QN(n551) );
  NAND2X0 U977 ( .IN1(n598), .IN2(n1008), .QN(n1007) );
  NAND2X0 U989 ( .IN1(n1071), .IN2(n57), .QN(n423) );
  NAND2X0 U991 ( .IN1(n348), .IN2(n350), .QN(n740) );
  NAND2X0 U992 ( .IN1(n897), .IN2(n698), .QN(n940) );
  NAND2X0 U993 ( .IN1(n864), .IN2(n865), .QN(n876) );
  NAND2X0 U995 ( .IN1(n24), .IN2(n539), .QN(n523) );
  INVX0 U1003 ( .INP(n550), .ZN(n1153) );
  INVX0 U1004 ( .INP(n173), .ZN(n1146) );
  NAND2X0 U1006 ( .IN1(n698), .IN2(n699), .QN(n695) );
  NAND2X0 U1008 ( .IN1(n697), .IN2(n520), .QN(n696) );
  NAND2X0 U1010 ( .IN1(n598), .IN2(n360), .QN(n1046) );
  NOR4X0 U1013 ( .IN1(n633), .IN2(n1195), .IN3(n1240), .IN4(n1210), .QN(n632)
         );
  INVX0 U1017 ( .INP(n211), .ZN(n1195) );
  NOR2X0 U1019 ( .IN1(n1240), .IN2(n953), .QN(n946) );
  NBUFFX2 U1022 ( .INP(n1137), .Z(n1078) );
  NOR2X0 U1023 ( .IN1(n1262), .IN2(n1238), .QN(n1032) );
  NOR4X0 U1025 ( .IN1(n544), .IN2(n1225), .IN3(n1224), .IN4(n1230), .QN(n543)
         );
  INVX0 U1032 ( .INP(n545), .ZN(n1224) );
  INVX0 U1034 ( .INP(n224), .ZN(n1215) );
  NOR4X0 U1035 ( .IN1(n958), .IN2(n1256), .IN3(n1261), .IN4(n1234), .QN(n955)
         );
  NAND2X0 U1041 ( .IN1(n681), .IN2(n698), .QN(n958) );
  NOR4X0 U1042 ( .IN1(n961), .IN2(n907), .IN3(n1243), .IN4(n1259), .QN(n960)
         );
  INVX0 U1043 ( .INP(n109), .ZN(n111) );
  NOR2X0 U1045 ( .IN1(n1201), .IN2(n1194), .QN(n977) );
  INVX0 U1047 ( .INP(n381), .ZN(n1201) );
  NAND2X0 U1048 ( .IN1(n587), .IN2(n588), .QN(n582) );
  NAND2X0 U1051 ( .IN1(n389), .IN2(n390), .QN(n388) );
  INVX0 U1053 ( .INP(n109), .ZN(n110) );
  NAND2X0 U1054 ( .IN1(n540), .IN2(n545), .QN(n846) );
  NAND3X0 U1055 ( .IN1(n168), .IN2(n82), .IN3(n73), .QN(n220) );
  INVX0 U1056 ( .INP(n702), .ZN(n1182) );
  INVX0 U1059 ( .INP(n1073), .ZN(n1271) );
  NAND2X1 U1060 ( .IN1(n322), .IN2(n1073), .QN(n374) );
  INVX0 U1064 ( .INP(n638), .ZN(n1199) );
  NAND2X0 U1066 ( .IN1(n1092), .IN2(n56), .QN(n519) );
  INVX0 U1067 ( .INP(n107), .ZN(n108) );
  INVX0 U1069 ( .INP(n400), .ZN(n1200) );
  NAND2X1 U1070 ( .IN1(n1069), .IN2(n1073), .QN(n349) );
  NBUFFX2 U1071 ( .INP(n1251), .Z(n163) );
  NBUFFX2 U1072 ( .INP(n1251), .Z(n161) );
  NBUFFX2 U1073 ( .INP(n1251), .Z(n162) );
  INVX0 U1074 ( .INP(n682), .ZN(n1202) );
  INVX0 U1075 ( .INP(n732), .ZN(n1214) );
  NOR2X0 U1076 ( .IN1(n993), .IN2(n682), .QN(n987) );
  INVX0 U1077 ( .INP(n923), .ZN(n1138) );
  INVX0 U1078 ( .INP(n440), .ZN(n1121) );
  NOR2X0 U1079 ( .IN1(n290), .IN2(n254), .QN(n354) );
  INVX0 U1080 ( .INP(n336), .ZN(n1164) );
  INVX0 U1081 ( .INP(n364), .ZN(n1157) );
  NAND2X0 U1082 ( .IN1(n154), .IN2(n380), .QN(n361) );
  NAND2X0 U1083 ( .IN1(n797), .IN2(n798), .QN(n796) );
  INVX0 U1084 ( .INP(n314), .ZN(n1154) );
  OA21X1 U1085 ( .IN1(n160), .IN2(n331), .IN3(n186), .Q(n255) );
  INVX0 U1086 ( .INP(n253), .ZN(n1155) );
  INVX0 U1087 ( .INP(n330), .ZN(n1122) );
  INVX0 U1088 ( .INP(n228), .ZN(n1141) );
  NAND2X0 U1089 ( .IN1(n773), .IN2(n638), .QN(n792) );
  NAND2X0 U1090 ( .IN1(n1088), .IN2(n674), .QN(n673) );
  INVX0 U1091 ( .INP(n274), .ZN(n1129) );
  INVX0 U1092 ( .INP(n366), .ZN(n1118) );
  NOR2X0 U1093 ( .IN1(n409), .IN2(n328), .QN(n1009) );
  INVX0 U1094 ( .INP(n270), .ZN(n1131) );
  INVX0 U1095 ( .INP(n238), .ZN(n1149) );
  NAND2X0 U1096 ( .IN1(n374), .IN2(n986), .QN(n1013) );
  NOR2X0 U1097 ( .IN1(n1223), .IN2(n1222), .QN(n759) );
  NAND2X0 U1098 ( .IN1(n463), .IN2(n398), .QN(n455) );
  OA21X1 U1099 ( .IN1(n1257), .IN2(n162), .IN3(n1087), .Q(n889) );
  NAND2X0 U1100 ( .IN1(n224), .IN2(n307), .QN(n260) );
  NAND2X0 U1101 ( .IN1(n1071), .IN2(n162), .QN(n373) );
  INVX0 U1102 ( .INP(n265), .ZN(n1128) );
  NOR2X0 U1103 ( .IN1(n295), .IN2(n413), .QN(n576) );
  NOR2X0 U1104 ( .IN1(n514), .IN2(n515), .QN(n482) );
  INVX0 U1105 ( .INP(n522), .ZN(n1148) );
  INVX0 U1106 ( .INP(n407), .ZN(n1160) );
  NOR4X0 U1107 ( .IN1(n972), .IN2(n973), .IN3(n974), .IN4(n975), .QN(n971) );
  INVX0 U1108 ( .INP(n294), .ZN(n1151) );
  NOR4X0 U1109 ( .IN1(n1201), .IN2(n1194), .IN3(n907), .IN4(n478), .QN(n903)
         );
  INVX0 U1110 ( .INP(n515), .ZN(n1162) );
  INVX0 U1111 ( .INP(n1112), .ZN(n160) );
  NAND2X0 U1112 ( .IN1(n1200), .IN2(n1078), .QN(n1026) );
  NOR2X0 U1113 ( .IN1(n1258), .IN2(n1247), .QN(n1029) );
  NAND2X0 U1114 ( .IN1(n24), .IN2(n462), .QN(n610) );
  NOR2X0 U1115 ( .IN1(n1192), .IN2(n606), .QN(n612) );
  NOR4X0 U1116 ( .IN1(n1256), .IN2(n320), .IN3(n208), .IN4(n206), .QN(n629) );
  INVX0 U1117 ( .INP(n448), .ZN(n1144) );
  NOR2X0 U1118 ( .IN1(n494), .IN2(n554), .QN(n641) );
  NAND2X0 U1119 ( .IN1(n1250), .IN2(n93), .QN(n915) );
  INVX0 U1120 ( .INP(n212), .ZN(n1167) );
  NOR2X0 U1121 ( .IN1(n1210), .IN2(n412), .QN(n775) );
  INVX0 U1122 ( .INP(n885), .ZN(n1242) );
  NAND2X0 U1123 ( .IN1(n1256), .IN2(n151), .QN(n442) );
  NOR2X0 U1124 ( .IN1(n448), .IN2(n449), .QN(n447) );
  NOR2X0 U1125 ( .IN1(n114), .IN2(n159), .QN(n883) );
  NAND2X0 U1126 ( .IN1(n464), .IN2(n419), .QN(n882) );
  INVX0 U1127 ( .INP(n494), .ZN(n1171) );
  NBUFFX2 U1128 ( .INP(n214), .Z(n173) );
  NOR4X0 U1129 ( .IN1(n603), .IN2(n604), .IN3(n605), .IN4(n606), .QN(n599) );
  NAND2X0 U1130 ( .IN1(n710), .IN2(n939), .QN(n937) );
  INVX0 U1131 ( .INP(n164), .ZN(n1130) );
  NAND2X0 U1132 ( .IN1(n710), .IN2(n308), .QN(n708) );
  INVX0 U1133 ( .INP(n170), .ZN(n1137) );
  NOR2X0 U1134 ( .IN1(n952), .IN2(n953), .QN(n949) );
  INVX0 U1135 ( .INP(n1112), .ZN(n159) );
  OA21X1 U1136 ( .IN1(n922), .IN2(n1271), .IN3(n607), .Q(n919) );
  OA21X1 U1137 ( .IN1(n53), .IN2(n1271), .IN3(n372), .Q(n920) );
  NOR2X0 U1138 ( .IN1(n462), .IN2(n556), .QN(n770) );
  NOR2X0 U1139 ( .IN1(n1196), .IN2(n606), .QN(n769) );
  NOR2X0 U1140 ( .IN1(n615), .IN2(n320), .QN(n768) );
  INVX0 U1141 ( .INP(n118), .ZN(n120) );
  NOR4X0 U1142 ( .IN1(n984), .IN2(n1199), .IN3(n1176), .IN4(n1190), .QN(n983)
         );
  NOR4X0 U1143 ( .IN1(n985), .IN2(n1198), .IN3(n1202), .IN4(n1184), .QN(n982)
         );
  INVX0 U1144 ( .INP(n137), .ZN(n142) );
  INVX0 U1145 ( .INP(n118), .ZN(n119) );
  INVX0 U1146 ( .INP(n137), .ZN(n141) );
  OA21X1 U1147 ( .IN1(n922), .IN2(n1271), .IN3(n596), .Q(n954) );
  NOR2X0 U1148 ( .IN1(n161), .IN2(n57), .QN(n489) );
  INVX0 U1149 ( .INP(n138), .ZN(n139) );
  INVX0 U1150 ( .INP(n118), .ZN(n116) );
  INVX0 U1151 ( .INP(n118), .ZN(n117) );
  NOR2X0 U1152 ( .IN1(n529), .IN2(n1110), .QN(n528) );
  NOR4X0 U1153 ( .IN1(n530), .IN2(n531), .IN3(n1223), .IN4(n1222), .QN(n529)
         );
  INVX0 U1154 ( .INP(n138), .ZN(n140) );
  NBUFFX2 U1155 ( .INP(n26), .Z(n1071) );
  NAND2X0 U1156 ( .IN1(n991), .IN2(n1071), .QN(n638) );
  NOR2X0 U1157 ( .IN1(n374), .IN2(n1110), .QN(n448) );
  NOR2X0 U1158 ( .IN1(n53), .IN2(n1271), .QN(n907) );
  INVX0 U1159 ( .INP(n152), .ZN(n153) );
  NBUFFX2 U1160 ( .INP(n26), .Z(n1072) );
  INVX0 U1161 ( .INP(n384), .ZN(n1257) );
  NBUFFX2 U1162 ( .INP(n1099), .Z(n125) );
  NOR2X0 U1163 ( .IN1(n1110), .IN2(n885), .QN(n778) );
  INVX0 U1164 ( .INP(n922), .ZN(n1251) );
  NBUFFX2 U1165 ( .INP(n1098), .Z(n126) );
  NBUFFX2 U1166 ( .INP(n1101), .Z(n129) );
  NBUFFX2 U1167 ( .INP(n1100), .Z(n131) );
  NBUFFX2 U1168 ( .INP(n1100), .Z(n130) );
  NBUFFX2 U1169 ( .INP(n1099), .Z(n123) );
  NBUFFX2 U1170 ( .INP(n1098), .Z(n121) );
  NBUFFX2 U1171 ( .INP(n1098), .Z(n122) );
  NBUFFX2 U1172 ( .INP(n1101), .Z(n135) );
  NBUFFX2 U1173 ( .INP(n1100), .Z(n128) );
  NBUFFX2 U1174 ( .INP(n1100), .Z(n133) );
  NBUFFX2 U1175 ( .INP(n1100), .Z(n132) );
  NBUFFX2 U1176 ( .INP(n1101), .Z(n136) );
  NBUFFX2 U1177 ( .INP(n1099), .Z(n124) );
  NBUFFX2 U1178 ( .INP(n1101), .Z(n134) );
  NBUFFX2 U1179 ( .INP(n806), .Z(n167) );
  NBUFFX2 U1180 ( .INP(n771), .Z(n338) );
  NBUFFX2 U1181 ( .INP(n806), .Z(n168) );
  NBUFFX2 U1182 ( .INP(n829), .Z(n1060) );
  NBUFFX2 U1183 ( .INP(n867), .Z(n492) );
  NBUFFX2 U1184 ( .INP(n806), .Z(n169) );
  NBUFFX2 U1185 ( .INP(n1099), .Z(n127) );
  NBUFFX2 U1186 ( .INP(n771), .Z(n325) );
  NBUFFX2 U1187 ( .INP(n829), .Z(n1059) );
  NBUFFX2 U1188 ( .INP(n772), .Z(n323) );
  NBUFFX2 U1189 ( .INP(n836), .Z(n1064) );
  NBUFFX2 U1190 ( .INP(n772), .Z(n324) );
  NBUFFX2 U1191 ( .INP(n771), .Z(n391) );
  NBUFFX2 U1192 ( .INP(n1108), .Z(n148) );
  NBUFFX2 U1193 ( .INP(n829), .Z(n1025) );
  NBUFFX2 U1194 ( .INP(n867), .Z(n490) );
  NBUFFX2 U1195 ( .INP(n772), .Z(n322) );
  NBUFFX2 U1196 ( .INP(n828), .Z(n1062) );
  NBUFFX2 U1197 ( .INP(n867), .Z(n493) );
  NBUFFX2 U1198 ( .INP(n840), .Z(n1069) );
  NBUFFX2 U1199 ( .INP(n836), .Z(n1063) );
  NOR2X0 U1200 ( .IN1(n223), .IN2(n885), .QN(n923) );
  NBUFFX2 U1201 ( .INP(n214), .Z(n174) );
  NBUFFX2 U1202 ( .INP(n828), .Z(n1061) );
  NBUFFX2 U1203 ( .INP(n840), .Z(n1070) );
  NBUFFX2 U1204 ( .INP(n214), .Z(n321) );
  NBUFFX2 U1205 ( .INP(n146), .Z(n149) );
  INVX0 U1206 ( .INP(n1085), .ZN(n993) );
  INVX0 U1207 ( .INP(n1085), .ZN(n1000) );
  INVX0 U1208 ( .INP(n402), .ZN(n1139) );
  NOR2X0 U1209 ( .IN1(n1178), .IN2(n1253), .QN(n358) );
  INVX0 U1210 ( .INP(n752), .ZN(n1158) );
  NAND2X0 U1211 ( .IN1(n1253), .IN2(n154), .QN(n403) );
  INVX0 U1212 ( .INP(n432), .ZN(n1152) );
  NOR4X0 U1213 ( .IN1(n185), .IN2(n406), .IN3(n289), .IN4(n407), .QN(n405) );
  NOR4X0 U1214 ( .IN1(n294), .IN2(n295), .IN3(n296), .IN4(n183), .QN(n293) );
  INVX0 U1215 ( .INP(n304), .ZN(n1150) );
  NAND2X0 U1216 ( .IN1(n1082), .IN2(n346), .QN(n332) );
  INVX0 U1217 ( .INP(n227), .ZN(n1166) );
  OA21X1 U1218 ( .IN1(n53), .IN2(n1271), .IN3(n385), .Q(n383) );
  NAND2X0 U1219 ( .IN1(n1228), .IN2(n1085), .QN(n871) );
  NOR2X0 U1220 ( .IN1(n315), .IN2(n205), .QN(n873) );
  INVX0 U1221 ( .INP(n365), .ZN(n1119) );
  NOR2X0 U1222 ( .IN1(n408), .IN2(n326), .QN(n881) );
  NAND2X0 U1223 ( .IN1(n379), .IN2(n371), .QN(n411) );
  OA21X1 U1224 ( .IN1(n1218), .IN2(n1110), .IN3(n282), .Q(n276) );
  INVX0 U1225 ( .INP(n283), .ZN(n1132) );
  NOR4X0 U1226 ( .IN1(n278), .IN2(n279), .IN3(n280), .IN4(n281), .QN(n277) );
  INVX0 U1227 ( .INP(n260), .ZN(n1205) );
  NOR2X0 U1228 ( .IN1(n258), .IN2(n259), .QN(n257) );
  NOR2X0 U1229 ( .IN1(n205), .IN2(n563), .QN(n678) );
  INVX0 U1230 ( .INP(n258), .ZN(n1220) );
  NOR2X0 U1231 ( .IN1(n246), .IN2(n1110), .QN(n1024) );
  OA21X1 U1232 ( .IN1(n53), .IN2(n1271), .IN3(n698), .Q(n899) );
  NAND2X0 U1233 ( .IN1(n421), .IN2(n498), .QN(n616) );
  NOR2X0 U1234 ( .IN1(n79), .IN2(n1065), .QN(n618) );
  NOR2X0 U1235 ( .IN1(n83), .IN2(n95), .QN(n1056) );
  OA21X1 U1236 ( .IN1(n516), .IN2(n517), .IN3(n103), .Q(n514) );
  INVX0 U1237 ( .INP(n300), .ZN(n1170) );
  NOR2X0 U1238 ( .IN1(n95), .IN2(n96), .QN(n427) );
  INVX0 U1239 ( .INP(n95), .ZN(n1108) );
  INVX0 U1240 ( .INP(n96), .ZN(n1099) );
  INVX0 U1241 ( .INP(n99), .ZN(n1100) );
  AND2X1 U1242 ( .IN1(n1052), .IN2(n1043), .Q(n991) );
  INVX0 U1243 ( .INP(n99), .ZN(n1101) );
  AND2X1 U1244 ( .IN1(n879), .IN2(n1043), .Q(n829) );
  AND2X1 U1245 ( .IN1(n1052), .IN2(n1042), .Q(n867) );
  AND2X1 U1246 ( .IN1(n1052), .IN2(n880), .Q(n772) );
  NBUFFX2 U1247 ( .INP(n805), .Z(n1096) );
  AND2X1 U1248 ( .IN1(n879), .IN2(n1042), .Q(n828) );
  AND2X1 U1249 ( .IN1(n879), .IN2(n880), .Q(n840) );
  NBUFFX2 U1250 ( .INP(n359), .Z(n165) );
  NBUFFX2 U1251 ( .INP(n359), .Z(n166) );
  NOR2X0 U1252 ( .IN1(n87), .IN2(n1000), .QN(n757) );
  OA21X1 U1253 ( .IN1(n230), .IN2(n231), .IN3(n1172), .Q(chirp_re[3]) );
  NOR4X0 U1254 ( .IN1(n99), .IN2(n114), .IN3(n159), .IN4(n96), .QN(n888) );
  NAND2X0 U1255 ( .IN1(n302), .IN2(n506), .QN(n886) );
  OA21X1 U1256 ( .IN1(n644), .IN2(n645), .IN3(n1172), .Q(chirp_im[3]) );
  NOR2X0 U1257 ( .IN1(n99), .IN2(n96), .QN(n895) );
  INVX0 U1258 ( .INP(sample_address[0]), .ZN(n1147) );
  INVX0 U1259 ( .INP(sample_address[1]), .ZN(n1275) );
  NOR2X0 U1260 ( .IN1(sample_address[9]), .IN2(sample_address[10]), .QN(n1058)
         );
  NOR2X0 U1261 ( .IN1(sample_address[8]), .IN2(sample_address[7]), .QN(n880)
         );
  NOR2X0 U1262 ( .IN1(n1272), .IN2(sample_address[6]), .QN(n392) );
  NOR2X0 U1263 ( .IN1(n1274), .IN2(sample_address[4]), .QN(n491) );
  INVX0 U1264 ( .INP(sample_address[3]), .ZN(n1274) );
  INVX0 U1265 ( .INP(sample_address[5]), .ZN(n1272) );
  INVX0 U1266 ( .INP(sample_address[4]), .ZN(n1273) );
  NOR2X0 U1267 ( .IN1(n1270), .IN2(sample_address[8]), .QN(n1043) );
  INVX0 U1268 ( .INP(sample_address[7]), .ZN(n1270) );
  INVX0 U1269 ( .INP(sample_address[10]), .ZN(n1233) );
  NOR2X0 U1270 ( .IN1(n1233), .IN2(sample_address[9]), .QN(n879) );
  NOR2X0 U1271 ( .IN1(sample_address[11]), .IN2(n746), .QN(chirp_im[1]) );
  NOR4X0 U1272 ( .IN1(n747), .IN2(n748), .IN3(n749), .IN4(n750), .QN(n746) );
  NOR2X0 U1273 ( .IN1(sample_address[11]), .IN2(n688), .QN(chirp_im[2]) );
  NOR4X0 U1274 ( .IN1(n689), .IN2(n690), .IN3(n691), .IN4(n692), .QN(n688) );
  NOR2X0 U1275 ( .IN1(sample_address[11]), .IN2(n250), .QN(chirp_re[2]) );
  NOR4X0 U1276 ( .IN1(n251), .IN2(n252), .IN3(n253), .IN4(n254), .QN(n250) );
  INVX0 U1277 ( .INP(sample_address[11]), .ZN(n1172) );
  NBUFFX2 U1278 ( .INP(n1146), .Z(n1080) );
  NBUFFX2 U1279 ( .INP(n1146), .Z(n1081) );
  NBUFFX2 U1280 ( .INP(n1167), .Z(n1082) );
  NBUFFX2 U1281 ( .INP(n1167), .Z(n1083) );
  NBUFFX2 U1282 ( .INP(n1170), .Z(n1085) );
  NBUFFX2 U1283 ( .INP(n1170), .Z(n1086) );
  INVX0 U1284 ( .INP(n96), .ZN(n1098) );
  INVX0 U1285 ( .INP(n1110), .ZN(n1109) );
  INVX0 U1286 ( .INP(n225), .ZN(n1112) );
  INVX0 U1287 ( .INP(n159), .ZN(n1113) );
  OA21X1 U119 ( .IN1(n789), .IN2(n790), .IN3(n1172), .Q(chirp_im[0]) );
  NAND4X1 U458 ( .IN1(n232), .IN2(n233), .IN3(n234), .IN4(n235), .QN(n231) );
  NAND3X1 U462 ( .IN1(n234), .IN2(n232), .IN3(n255), .QN(n252) );
  OR3X2 U469 ( .IN1(n289), .IN2(n238), .IN3(n290), .Q(n286) );
  DELLN2X2 U1288 ( .INP(n384), .Z(n1276) );
endmodule


module CSK_GEN_cart_N2_M6 ( clk, rstn, latch, DQPSK_RE, DQPSK_IM,
        sample_address, DAC_RE, DAC_IM );
  input [1:0] DQPSK_RE;
  input [1:0] DQPSK_IM;
  input [11:0] sample_address;
  output [5:0] DAC_RE;
  output [5:0] DAC_IM;
  input clk, rstn, latch;
  wire   n2, n3, n4, n5, n1, n6, n7;
  wire   [1:0] dqpsk_re_active;
  wire   [1:0] dqpsk_im_active;
  wire   [4:0] chirp_re;
  wire   [4:0] chirp_im;

  DFFARX1 dqpsk_im_active_reg_1_ ( .D(n5), .CLK(clk), .RSTB(rstn), .Q(
        dqpsk_im_active[1]) );
  DFFARX1 dqpsk_im_active_reg_0_ ( .D(n4), .CLK(clk), .RSTB(rstn), .Q(
        dqpsk_im_active[0]) );
  DFFARX1 dqpsk_re_active_reg_1_ ( .D(n3), .CLK(clk), .RSTB(rstn), .Q(
        dqpsk_re_active[1]) );
  DFFARX1 dqpsk_re_active_reg_0_ ( .D(n2), .CLK(clk), .RSTB(rstn), .Q(
        dqpsk_re_active[0]) );
  AO22X1 U2 ( .IN1(n7), .IN2(dqpsk_re_active[0]), .IN3(latch), .IN4(
        DQPSK_RE[0]), .Q(n2) );
  AO22X1 U3 ( .IN1(n7), .IN2(dqpsk_re_active[1]), .IN3(DQPSK_RE[1]), .IN4(
        latch), .Q(n3) );
  AO22X1 U4 ( .IN1(n7), .IN2(dqpsk_im_active[0]), .IN3(DQPSK_IM[0]), .IN4(
        latch), .Q(n4) );
  AO22X1 U5 ( .IN1(n7), .IN2(dqpsk_im_active[1]), .IN3(DQPSK_IM[1]), .IN4(
        latch), .Q(n5) );
  INVX0 U6 ( .INP(sample_address[8]), .ZN(n1) );
  INVX0 U7 ( .INP(n1), .ZN(n6) );
  INVX0 U8 ( .INP(latch), .ZN(n7) );
  complex_multiplier_c_WIDTH_12_WIDTH_25_OUT_WIDTH6 complex_multiplier_c (
        .a_real(dqpsk_re_active), .a_imag(dqpsk_im_active), .b_real(chirp_re),
        .b_imag(chirp_im), .y_real(DAC_RE), .y_imag(DAC_IM) );
  complex_exp_LUT_cart complex_exp_LUT ( .sample_address({sample_address[11:9],
        n6, sample_address[7:0]}), .chirp_re(chirp_re), .chirp_im(chirp_im) );
endmodule


module address_counter_N12_MAX1535_DW01_inc_0 ( A, SUM );
  input [11:0] A;
  output [11:0] SUM;

  wire   [11:2] carry;

  HADDX1 U1_1_10 ( .A0(A[10]), .B0(carry[10]), .C1(carry[11]), .SO(SUM[10]) );
  HADDX1 U1_1_7 ( .A0(A[7]), .B0(carry[7]), .C1(carry[8]), .SO(SUM[7]) );
  HADDX1 U1_1_9 ( .A0(A[9]), .B0(carry[9]), .C1(carry[10]), .SO(SUM[9]) );
  HADDX1 U1_1_8 ( .A0(A[8]), .B0(carry[8]), .C1(carry[9]), .SO(SUM[8]) );
  HADDX1 U1_1_6 ( .A0(A[6]), .B0(carry[6]), .C1(carry[7]), .SO(SUM[6]) );
  HADDX1 U1_1_4 ( .A0(A[4]), .B0(carry[4]), .C1(carry[5]), .SO(SUM[4]) );
  HADDX1 U1_1_2 ( .A0(A[2]), .B0(carry[2]), .C1(carry[3]), .SO(SUM[2]) );
  HADDX1 U1_1_1 ( .A0(A[1]), .B0(A[0]), .C1(carry[2]), .SO(SUM[1]) );
  HADDX1 U1_1_3 ( .A0(A[3]), .B0(carry[3]), .C1(carry[4]), .SO(SUM[3]) );
  HADDX2 U1_1_5 ( .A0(A[5]), .B0(carry[5]), .C1(carry[6]), .SO(SUM[5]) );
  XOR2X1 U1 ( .IN1(carry[11]), .IN2(A[11]), .Q(SUM[11]) );
  INVX0 U2 ( .INP(A[0]), .ZN(SUM[0]) );
endmodule


module address_counter_N12_MAX1535 ( clk, rstn, clear, enable, address );
  output [11:0] address;
  input clk, rstn, clear, enable;
  wire   n35, n36, n37, n38, N7, N9, N10, N11, N12, N13, N14, N15, N16, N17,
         N18, N19, N20, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n1, n2, n3, n5, n6, n7, n21, n22, n24, n26, n28, n29, n30,
         n31, n32, n33, n34;

  DFFARX1 address_reg_0_ ( .D(n20), .CLK(clk), .RSTB(rstn), .Q(n38), .QN(n26)
         );
  DFFARX1 address_reg_11_ ( .D(n9), .CLK(clk), .RSTB(rstn), .Q(address[11]) );
  DFFARX1 address_reg_10_ ( .D(n10), .CLK(clk), .RSTB(rstn), .Q(address[10])
         );
  DFFARX1 address_reg_9_ ( .D(n11), .CLK(clk), .RSTB(rstn), .Q(n35), .QN(n3)
         );
  DFFARX1 address_reg_8_ ( .D(n12), .CLK(clk), .RSTB(rstn), .Q(address[8]) );
  DFFARX1 address_reg_7_ ( .D(n13), .CLK(clk), .RSTB(rstn), .Q(address[7]) );
  DFFARX1 address_reg_6_ ( .D(n14), .CLK(clk), .RSTB(rstn), .Q(address[6]),
        .QN(n28) );
  DFFARX1 address_reg_5_ ( .D(n15), .CLK(clk), .RSTB(rstn), .Q(address[5]) );
  DFFARX1 address_reg_4_ ( .D(n16), .CLK(clk), .RSTB(rstn), .Q(address[4]) );
  DFFARX1 address_reg_3_ ( .D(n17), .CLK(clk), .RSTB(rstn), .Q(address[3]) );
  DFFARX1 address_reg_2_ ( .D(n18), .CLK(clk), .RSTB(rstn), .Q(n36), .QN(n24)
         );
  DFFARX1 address_reg_1_ ( .D(n19), .CLK(clk), .RSTB(rstn), .Q(n37), .QN(n22)
         );
  AO22X1 U17 ( .IN1(n36), .IN2(n21), .IN3(N11), .IN4(n6), .Q(n18) );
  AO22X1 U18 ( .IN1(n37), .IN2(n21), .IN3(N10), .IN4(n6), .Q(n19) );
  AND4X4 U3 ( .IN1(address[8]), .IN2(address[7]), .IN3(n29), .IN4(address[5]),
        .Q(n30) );
  INVX0 U4 ( .INP(n26), .ZN(address[0]) );
  AO22X1 U5 ( .IN1(address[5]), .IN2(n7), .IN3(N14), .IN4(n6), .Q(n15) );
  AO22X1 U6 ( .IN1(n29), .IN2(n7), .IN3(N15), .IN4(n5), .Q(n14) );
  AO22X1 U7 ( .IN1(address[7]), .IN2(n7), .IN3(N16), .IN4(n6), .Q(n13) );
  AO22X1 U8 ( .IN1(address[8]), .IN2(n21), .IN3(N17), .IN4(n5), .Q(n12) );
  AO22X1 U9 ( .IN1(address[10]), .IN2(n21), .IN3(N19), .IN4(n5), .Q(n10) );
  AO22X1 U10 ( .IN1(address[11]), .IN2(n7), .IN3(N20), .IN4(n5), .Q(n9) );
  AO22X1 U11 ( .IN1(n38), .IN2(n7), .IN3(N9), .IN4(n5), .Q(n20) );
  AO22X1 U12 ( .IN1(address[3]), .IN2(n7), .IN3(N12), .IN4(n5), .Q(n17) );
  AND4X1 U13 ( .IN1(address[4]), .IN2(address[3]), .IN3(n31), .IN4(n30), .Q(
        n32) );
  OR2X1 U14 ( .IN1(N7), .IN2(n8), .Q(n1) );
  NAND2X1 U15 ( .IN1(n34), .IN2(n8), .QN(n2) );
  INVX0 U16 ( .INP(n3), .ZN(address[9]) );
  INVX0 U19 ( .INP(n1), .ZN(n5) );
  INVX0 U20 ( .INP(n1), .ZN(n6) );
  INVX0 U21 ( .INP(n2), .ZN(n7) );
  INVX0 U22 ( .INP(n2), .ZN(n21) );
  AO22X1 U23 ( .IN1(address[4]), .IN2(n21), .IN3(N13), .IN4(n6), .Q(n16) );
  INVX0 U24 ( .INP(n24), .ZN(address[2]) );
  INVX0 U25 ( .INP(n22), .ZN(address[1]) );
  AO22X1 U26 ( .IN1(n35), .IN2(n21), .IN3(N18), .IN4(n6), .Q(n11) );
  INVX0 U27 ( .INP(n28), .ZN(n29) );
  INVX0 U28 ( .INP(clear), .ZN(n34) );
  NAND2X0 U29 ( .IN1(enable), .IN2(n34), .QN(n8) );
  AND3X1 U30 ( .IN1(n37), .IN2(n38), .IN3(n36), .Q(n31) );
  OA21X1 U31 ( .IN1(n32), .IN2(n35), .IN3(address[10]), .Q(n33) );
  OR2X1 U32 ( .IN1(n33), .IN2(address[11]), .Q(N7) );
  address_counter_N12_MAX1535_DW01_inc_0 add_23 ( .A({address[11:10], n35,
        address[8:7], n29, address[5:3], n36, n37, n38}), .SUM({N20, N19, N18,
        N17, N16, N15, N14, N13, N12, N11, N10, N9}) );
endmodule


module delay_LUT ( lut_addr, delay );
  input [3:0] lut_addr;
  output [6:0] delay;
  wire   n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n3, n4, n5, n16, n17,
         n18, n19;

  NAND3X0 U12 ( .IN1(n4), .IN2(n6), .IN3(n7), .QN(delay[5]) );
  NAND3X0 U13 ( .IN1(n9), .IN2(n10), .IN3(n7), .QN(delay[3]) );
  AND2X1 U14 ( .IN1(n11), .IN2(n12), .Q(n7) );
  NAND3X0 U15 ( .IN1(lut_addr[3]), .IN2(n3), .IN3(lut_addr[2]), .QN(n12) );
  NAND3X0 U16 ( .IN1(lut_addr[1]), .IN2(n3), .IN3(n13), .QN(n11) );
  OR2X1 U17 ( .IN1(n14), .IN2(lut_addr[1]), .Q(n9) );
  NAND3X0 U18 ( .IN1(n4), .IN2(n5), .IN3(n8), .QN(delay[2]) );
  AOI21X1 U19 ( .IN1(n13), .IN2(n4), .IN3(n16), .QN(n8) );
  NAND4X0 U20 ( .IN1(n4), .IN2(n10), .IN3(n6), .IN4(n14), .QN(delay[1]) );
  NAND3X0 U21 ( .IN1(n17), .IN2(n18), .IN3(n3), .QN(n14) );
  NAND3X0 U22 ( .IN1(lut_addr[1]), .IN2(n3), .IN3(n15), .QN(n6) );
  NAND3X0 U23 ( .IN1(n4), .IN2(n19), .IN3(n15), .QN(n10) );
  INVX0 U5 ( .INP(delay[6]), .ZN(n5) );
  NOR2X0 U6 ( .IN1(n19), .IN2(n14), .QN(delay[6]) );
  NAND2X1 U7 ( .IN1(n8), .IN2(n6), .QN(delay[4]) );
  INVX0 U8 ( .INP(n10), .ZN(n16) );
  NBUFFX2 U9 ( .INP(lut_addr[0]), .Z(n4) );
  NBUFFX2 U10 ( .INP(lut_addr[0]), .Z(n3) );
  INVX0 U11 ( .INP(lut_addr[1]), .ZN(n19) );
  INVX0 U24 ( .INP(lut_addr[2]), .ZN(n17) );
  NOR2X0 U25 ( .IN1(n18), .IN2(lut_addr[2]), .QN(n15) );
  NOR2X0 U26 ( .IN1(n17), .IN2(lut_addr[3]), .QN(n13) );
  INVX0 U27 ( .INP(lut_addr[3]), .ZN(n18) );
  INVX0 U3 ( .INP(1'b1), .ZN(delay[0]) );
endmodule


module timer_N7_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  HADDX1 U1_1_5 ( .A0(A[5]), .B0(carry[5]), .C1(carry[6]), .SO(SUM[5]) );
  HADDX1 U1_1_4 ( .A0(A[4]), .B0(carry[4]), .C1(carry[5]), .SO(SUM[4]) );
  HADDX1 U1_1_3 ( .A0(A[3]), .B0(carry[3]), .C1(carry[4]), .SO(SUM[3]) );
  HADDX1 U1_1_2 ( .A0(A[2]), .B0(carry[2]), .C1(carry[3]), .SO(SUM[2]) );
  HADDX1 U1_1_1 ( .A0(A[1]), .B0(A[0]), .C1(carry[2]), .SO(SUM[1]) );
  XOR2X1 U1 ( .IN1(carry[6]), .IN2(A[6]), .Q(SUM[6]) );
  INVX0 U2 ( .INP(A[0]), .ZN(SUM[0]) );
endmodule


module timer_N7_DW01_inc_1 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [6:2] carry;

  HADDX1 U1_1_6 ( .A0(A[6]), .B0(carry[6]), .C1(SUM[7]), .SO(SUM[6]) );
  HADDX1 U1_1_5 ( .A0(A[5]), .B0(carry[5]), .C1(carry[6]), .SO(SUM[5]) );
  HADDX1 U1_1_4 ( .A0(A[4]), .B0(carry[4]), .C1(carry[5]), .SO(SUM[4]) );
  HADDX1 U1_1_3 ( .A0(A[3]), .B0(carry[3]), .C1(carry[4]), .SO(SUM[3]) );
  HADDX1 U1_1_2 ( .A0(A[2]), .B0(carry[2]), .C1(carry[3]), .SO(SUM[2]) );
  HADDX1 U1_1_1 ( .A0(A[1]), .B0(A[0]), .C1(carry[2]), .SO(SUM[1]) );
  INVX0 U1 ( .INP(A[0]), .ZN(SUM[0]) );
endmodule


module timer_N7 ( clk, rstn, enable, time_limit, trig );
  input [6:0] time_limit;
  input clk, rstn, enable;
  output trig;
  wire   N7, N8, N9, N10, N11, N12, N13, N14, N15, N17, N18, N19, N20, N21,
         N22, N23, N31, N32, N33, N34, N35, N36, N37, N38, n8, n1, n2, n4, n5,
         n6, n7, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18;
  wire   [6:0] count;

  DFFARX1 count_reg_0_ ( .D(N32), .CLK(clk), .RSTB(rstn), .Q(count[0]) );
  DFFARX1 count_reg_6_ ( .D(N38), .CLK(clk), .RSTB(rstn), .Q(count[6]) );
  DFFARX1 trig_reg ( .D(N31), .CLK(clk), .RSTB(rstn), .Q(trig) );
  DFFARX1 count_reg_5_ ( .D(N37), .CLK(clk), .RSTB(rstn), .Q(count[5]) );
  DFFARX1 count_reg_4_ ( .D(N36), .CLK(clk), .RSTB(rstn), .Q(count[4]) );
  DFFARX1 count_reg_3_ ( .D(N35), .CLK(clk), .RSTB(rstn), .Q(count[3]) );
  DFFARX1 count_reg_2_ ( .D(N34), .CLK(clk), .RSTB(rstn), .Q(count[2]) );
  DFFARX1 count_reg_1_ ( .D(N33), .CLK(clk), .RSTB(rstn), .Q(count[1]) );
  AND2X1 U5 ( .IN1(N23), .IN2(n8), .Q(N38) );
  AND2X1 U9 ( .IN1(N22), .IN2(n8), .Q(N37) );
  AND2X1 U10 ( .IN1(N21), .IN2(n8), .Q(N36) );
  AND2X1 U11 ( .IN1(N20), .IN2(n8), .Q(N35) );
  AND2X1 U12 ( .IN1(N19), .IN2(n8), .Q(N34) );
  AND2X1 U13 ( .IN1(N18), .IN2(n8), .Q(N33) );
  AND2X1 U14 ( .IN1(N17), .IN2(n8), .Q(N32) );
  AND2X1 U15 ( .IN1(enable), .IN2(N15), .Q(N31) );
  INVX0 U3 ( .INP(time_limit[2]), .ZN(n15) );
  INVX0 U4 ( .INP(time_limit[6]), .ZN(n13) );
  NOR2X0 U6 ( .IN1(n18), .IN2(N15), .QN(n8) );
  INVX0 U7 ( .INP(enable), .ZN(n18) );
  INVX0 U16 ( .INP(time_limit[4]), .ZN(n14) );
  INVX0 U17 ( .INP(time_limit[5]), .ZN(n17) );
  INVX0 U18 ( .INP(N8), .ZN(n11) );
  INVX0 U19 ( .INP(N9), .ZN(n12) );
  INVX0 U20 ( .INP(time_limit[3]), .ZN(n16) );
  NOR2X0 U21 ( .IN1(time_limit[1]), .IN2(n11), .QN(n1) );
  NOR2X0 U22 ( .IN1(N7), .IN2(n1), .QN(n2) );
  AOI222X1 U23 ( .IN1(time_limit[2]), .IN2(n12), .IN3(n2), .IN4(time_limit[0]),
        .IN5(time_limit[1]), .IN6(n11), .QN(n4) );
  AO221X1 U24 ( .IN1(N9), .IN2(n15), .IN3(N10), .IN4(n16), .IN5(n4), .Q(n5) );
  OA221X1 U25 ( .IN1(N11), .IN2(n14), .IN3(N10), .IN4(n16), .IN5(n5), .Q(n6)
         );
  AO221X1 U26 ( .IN1(N11), .IN2(n14), .IN3(N12), .IN4(n17), .IN5(n6), .Q(n7)
         );
  OA221X1 U27 ( .IN1(N13), .IN2(n13), .IN3(N12), .IN4(n17), .IN5(n7), .Q(n10)
         );
  AND2X1 U28 ( .IN1(n13), .IN2(N13), .Q(n9) );
  OR3X1 U29 ( .IN1(N14), .IN2(n10), .IN3(n9), .Q(N15) );
  timer_N7_DW01_inc_0 add_23 ( .A(count), .SUM({N23, N22, N21, N20, N19, N18,
        N17}) );
  timer_N7_DW01_inc_1 add_18 ( .A({1'b0, count}), .SUM({N14, N13, N12, N11,
        N10, N9, N8, N7}) );
endmodule


module address_counter_N4_MAX15 ( clk, rstn, clear, enable, address );
  output [3:0] address;
  input clk, rstn, clear, enable;
  wire   n6, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n1, n2;

  DFFARX1 address_reg_0_ ( .D(n22), .CLK(clk), .RSTB(rstn), .Q(address[0]),
        .QN(n6) );
  DFFARX1 address_reg_2_ ( .D(n20), .CLK(clk), .RSTB(rstn), .Q(address[2]) );
  DFFARX1 address_reg_3_ ( .D(n19), .CLK(clk), .RSTB(rstn), .Q(address[3]) );
  DFFARX1 address_reg_1_ ( .D(n21), .CLK(clk), .RSTB(rstn), .Q(address[1]) );
  NAND3X0 U11 ( .IN1(address[2]), .IN2(n2), .IN3(n10), .QN(n9) );
  OAI21X1 U12 ( .IN1(n11), .IN2(n10), .IN3(address[3]), .QN(n8) );
  AO22X1 U13 ( .IN1(address[2]), .IN2(n11), .IN3(n12), .IN4(n10), .Q(n20) );
  AO21X1 U14 ( .IN1(n10), .IN2(n13), .IN3(n14), .Q(n11) );
  AO22X1 U15 ( .IN1(address[1]), .IN2(n15), .IN3(n16), .IN4(n10), .Q(n21) );
  AO21X1 U16 ( .IN1(n10), .IN2(n6), .IN3(n14), .Q(n15) );
  AO22X1 U17 ( .IN1(n14), .IN2(address[0]), .IN3(n10), .IN4(n6), .Q(n22) );
  AND3X1 U18 ( .IN1(address[2]), .IN2(n2), .IN3(address[3]), .Q(n18) );
  AND2X1 U19 ( .IN1(n1), .IN2(n17), .Q(n14) );
  INVX0 U3 ( .INP(clear), .ZN(n1) );
  INVX0 U4 ( .INP(n13), .ZN(n2) );
  NOR2X0 U5 ( .IN1(n17), .IN2(n18), .QN(n10) );
  NAND2X0 U6 ( .IN1(enable), .IN2(n1), .QN(n17) );
  NOR2X0 U7 ( .IN1(address[1]), .IN2(n6), .QN(n16) );
  NOR2X0 U8 ( .IN1(address[2]), .IN2(n13), .QN(n12) );
  NAND2X1 U9 ( .IN1(n8), .IN2(n9), .QN(n19) );
  NAND2X1 U10 ( .IN1(address[1]), .IN2(address[0]), .QN(n13) );
endmodule


module Modulation_FSM_cart ( clk, rstn, Ttick, frame_ready, mem_adderss_ovf,
        Ram_inc, Periodreg_inc, latch, Sample_inc, Timer_en, busy, clear );
  input clk, rstn, Ttick, frame_ready, mem_adderss_ovf;
  output Ram_inc, Periodreg_inc, latch, Sample_inc, Timer_en, busy, clear;
  wire   n5, n6, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n2,
         n3, n4, n7, n8, n21;
  wire   [1:0] state_reg;

  DFFARX1 state_reg_reg_0_ ( .D(n20), .CLK(clk), .RSTB(rstn), .Q(state_reg[0]),
        .QN(n6) );
  DFFARX1 state_reg_reg_1_ ( .D(n19), .CLK(clk), .RSTB(rstn), .Q(state_reg[1]),
        .QN(n5) );
  AO22X1 U19 ( .IN1(state_reg[1]), .IN2(n8), .IN3(mem_adderss_ovf), .IN4(n10),
        .Q(n9) );
  AO22X1 U20 ( .IN1(state_reg[0]), .IN2(n3), .IN3(n11), .IN4(n12), .Q(n20) );
  AO21X1 U21 ( .IN1(frame_ready), .IN2(n4), .IN3(n2), .Q(n12) );
  AOI22X1 U22 ( .IN1(n14), .IN2(n15), .IN3(Ttick), .IN4(n16), .QN(n13) );
  AO22X1 U23 ( .IN1(frame_ready), .IN2(n17), .IN3(n10), .IN4(n21), .Q(latch)
         );
  AO21X1 U24 ( .IN1(frame_ready), .IN2(n17), .IN3(n10), .Q(Ram_inc) );
  AO21X1 U25 ( .IN1(n4), .IN2(Ttick), .IN3(n2), .Q(n17) );
  AO22X1 U26 ( .IN1(mem_adderss_ovf), .IN2(n10), .IN3(n18), .IN4(frame_ready),
        .Q(Periodreg_inc) );
  NOR2X0 U3 ( .IN1(Sample_inc), .IN2(frame_ready), .QN(clear) );
  INVX0 U4 ( .INP(n14), .ZN(busy) );
  INVX0 U5 ( .INP(Sample_inc), .ZN(n2) );
  NOR2X0 U6 ( .IN1(n8), .IN2(n14), .QN(n10) );
  INVX0 U7 ( .INP(n15), .ZN(n4) );
  NOR2X0 U8 ( .IN1(n8), .IN2(n15), .QN(n18) );
  INVX0 U9 ( .INP(n11), .ZN(n3) );
  NOR2X0 U10 ( .IN1(n13), .IN2(clear), .QN(n11) );
  NAND2X1 U11 ( .IN1(state_reg[0]), .IN2(n5), .QN(n14) );
  INVX0 U12 ( .INP(Ttick), .ZN(n8) );
  NAND2X1 U13 ( .IN1(state_reg[1]), .IN2(n6), .QN(n15) );
  INVX0 U14 ( .INP(mem_adderss_ovf), .ZN(n21) );
  NAND2X1 U15 ( .IN1(n7), .IN2(n21), .QN(n16) );
  INVX0 U16 ( .INP(n14), .ZN(n7) );
  OA21X1 U17 ( .IN1(Ttick), .IN2(n6), .IN3(n9), .Q(n19) );
  NBUFFX2 U18 ( .INP(Sample_inc), .Z(Timer_en) );
  NAND2X0 U27 ( .IN1(n5), .IN2(n6), .QN(Sample_inc) );
endmodule


module Modulation_system_cart_N2 ( clk, rstn, frame_ready, I_data_in,
        Q_data_in, DAC_RE, DAC_IM, busy );
  input [3:0] I_data_in;
  input [3:0] Q_data_in;
  output [5:0] DAC_RE;
  output [5:0] DAC_IM;
  input clk, rstn, frame_ready;
  output busy;
  wire   mem_Address_2_, Ram_inc, D_Ram_inc, clear, I, Q, latch, Sample_inc,
         Timer_en, Ttick, Periodreg_inc, n1, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, SYNOPSYS_UNCONNECTED_1;
  wire   [1:0] Ram_Address;
  wire   [1:0] QPSK_RE;
  wire   [1:0] QPSK_IM;
  wire   [1:0] feedback_data_RE;
  wire   [1:0] feedback_data_IM;
  wire   [1:0] DQPSK_RE;
  wire   [1:0] DQPSK_IM;
  wire   [11:0] sample_address;
  wire   [3:0] Period_address;
  wire   [6:0] Period;

  INVX0 U1 ( .INP(busy), .ZN(n1) );
  INVX0 U2 ( .INP(clear), .ZN(n2) );
  INVX0 U3 ( .INP(n2), .ZN(n3) );
  INVX0 U4 ( .INP(sample_address[4]), .ZN(n4) );
  INVX0 U5 ( .INP(n4), .ZN(n5) );
  INVX0 U6 ( .INP(sample_address[3]), .ZN(n6) );
  INVX0 U7 ( .INP(n6), .ZN(n7) );
  INVX0 U8 ( .INP(sample_address[1]), .ZN(n8) );
  INVX0 U9 ( .INP(n8), .ZN(n9) );
  complex_multiplier_c_WIDTH_12_WIDTH_22_OUT_WIDTH2 complex_multiplier_c (
        .a_real(QPSK_RE), .a_imag(QPSK_IM), .b_real(feedback_data_RE),
        .b_imag(feedback_data_IM), .y_real(DQPSK_RE), .y_imag(DQPSK_IM) );
  dreg_N1 DeLAY_REG ( .clk(clk), .rstn(rstn), .data_in(Ram_inc), .dataout(
        D_Ram_inc) );
  address_counter_N3_MAX4 Address_A ( .clk(clk), .rstn(rstn), .clear(n3),
        .enable(D_Ram_inc), .address({mem_Address_2_, Ram_Address}) );
  bit_RAM_Depth4_1 I_bit_RAM ( .clk(clk), .rstn(rstn), .we(n1), .r_address(
        Ram_Address), .data_in(I_data_in), .data_out(I) );
  bit_RAM_Depth4_0 Q_bit_RAM ( .clk(clk), .rstn(rstn), .we(n1), .r_address(
        Ram_Address), .data_in(Q_data_in), .data_out(Q) );
  dqpsk_mapper_cartesian_N2 dqpsk_mapper ( .I(I), .Q(Q), .QPSK_RE(QPSK_RE),
        .QPSK_IM(QPSK_IM) );
  feedback_memory_cartesian_N2 feedback_memory ( .clk(clk), .rstn(rstn),
        .clear(clear), .we(latch), .datain_re(DQPSK_RE), .datain_im(DQPSK_IM),
        .address(Ram_Address), .dataout_re(feedback_data_RE), .dataout_im(
        feedback_data_IM) );
  CSK_GEN_cart_N2_M6 CSK_GEN ( .clk(clk), .rstn(rstn), .latch(latch),
        .DQPSK_RE(DQPSK_RE), .DQPSK_IM(DQPSK_IM), .sample_address({
        sample_address[11:8], n11, sample_address[6:5], n5, n7,
        sample_address[2], n9, sample_address[0]}), .DAC_RE(DAC_RE), .DAC_IM(
        DAC_IM) );
  address_counter_N12_MAX1535 Address_C ( .clk(clk), .rstn(rstn), .clear(clear), .enable(Sample_inc), .address(sample_address) );
  delay_LUT delay_LUT ( .lut_addr(Period_address), .delay({Period[6:1],
        SYNOPSYS_UNCONNECTED_1}) );
  timer_N7 delay_timer ( .clk(clk), .rstn(rstn), .enable(Timer_en),
        .time_limit({Period[6:1], 1'b0}), .trig(Ttick) );
  address_counter_N4_MAX15 Address_D ( .clk(clk), .rstn(rstn), .clear(n3),
        .enable(Periodreg_inc), .address(Period_address) );
  Modulation_FSM_cart control_unit ( .clk(clk), .rstn(rstn), .Ttick(Ttick),
        .frame_ready(frame_ready), .mem_adderss_ovf(mem_Address_2_), .Ram_inc(
        Ram_inc), .Periodreg_inc(Periodreg_inc), .latch(latch), .Sample_inc(
        Sample_inc), .Timer_en(Timer_en), .busy(busy), .clear(clear) );
  INVX0 U11 ( .INP(sample_address[7]), .ZN(n10) );
  INVX0 U12 ( .INP(n10), .ZN(n11) );
endmodule


module CSS_Transmitter_Top ( clk, rstn, start_Tx, rate, payloadLength,
        payload_we, payload_addr, payload_din, DAC_RE_cart, DAC_IM_cart,
        system_busy, len_err, final_ppdu_nibbles );
  input [7:0] payloadLength;
  input [6:0] payload_addr;
  input [7:0] payload_din;
  output [5:0] DAC_RE_cart;
  output [5:0] DAC_IM_cart;
  output [9:0] final_ppdu_nibbles;
  input clk, rstn, start_Tx, rate, payload_we;
  output system_busy, len_err;
  wire   framer_busy, mod_busy, n_0_net_, frame_ready;
  wire   [3:0] stream_i;
  wire   [3:0] stream_q;

  INVX1 U1 ( .INP(rstn), .ZN(n_0_net_) );
  OR2X1 U2 ( .IN1(framer_busy), .IN2(mod_busy), .Q(system_busy) );
  css_tx_framer u_framer ( .clk(clk), .reset(n_0_net_), .start_Tx(start_Tx),
        .rate(rate), .payloadLength(payloadLength), .payload_we(payload_we),
        .payload_addr(payload_addr), .payload_din(payload_din), .mod_busy(
        mod_busy), .frame_ready(frame_ready), .mod_nib_i(stream_i),
        .mod_nib_q(stream_q), .ppdu_nibbles(final_ppdu_nibbles), .len_err(
        len_err), .busy(framer_busy) );
  Modulation_system_cart_N2 Modulation_system_cart ( .clk(clk), .rstn(rstn),
        .frame_ready(frame_ready), .I_data_in(stream_i), .Q_data_in(stream_q),
        .DAC_RE(DAC_RE_cart), .DAC_IM(DAC_IM_cart), .busy(mod_busy) );
endmodule

