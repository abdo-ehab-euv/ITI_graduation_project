


module ppdu_ctrl_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  HADDX1 U1_1_6 ( .A0(A[6]), .B0(carry[6]), .C1(carry[7]), .SO(SUM[6]) );
  HADDX1 U1_1_5 ( .A0(A[5]), .B0(carry[5]), .C1(carry[6]), .SO(SUM[5]) );
  HADDX1 U1_1_3 ( .A0(A[3]), .B0(carry[3]), .C1(carry[4]), .SO(SUM[3]) );
  HADDX1 U1_1_1 ( .A0(A[1]), .B0(A[0]), .C1(carry[2]), .SO(SUM[1]) );
  HADDX1 U1_1_2 ( .A0(A[2]), .B0(carry[2]), .C1(carry[3]), .SO(SUM[2]) );
  HADDX1 U1_1_4 ( .A0(A[4]), .B0(carry[4]), .C1(carry[5]), .SO(SUM[4]) );
  XOR2X1 U1 ( .IN1(carry[7]), .IN2(A[7]), .Q(SUM[7]) );
  INVX0 U2 ( .INP(A[0]), .ZN(SUM[0]) );
endmodule


module ppdu_ctrl_DW01_inc_2 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;
  wire   n1;
  wire   [6:2] carry;

  HADDX1 U1_1_5 ( .A0(A[5]), .B0(carry[5]), .C1(carry[6]), .SO(SUM[5]) );
  HADDX1 U1_1_4 ( .A0(A[4]), .B0(carry[4]), .C1(carry[5]), .SO(SUM[4]) );
  HADDX1 U1_1_3 ( .A0(A[3]), .B0(carry[3]), .C1(carry[4]), .SO(SUM[3]) );
  HADDX1 U1_1_2 ( .A0(A[2]), .B0(carry[2]), .C1(carry[3]), .SO(SUM[2]) );
  HADDX1 U1_1_1 ( .A0(A[1]), .B0(A[0]), .C1(carry[2]), .SO(SUM[1]) );
  DELLN2X2 U1 ( .INP(A[0]), .Z(n1) );
  XOR2X1 U2 ( .IN1(carry[6]), .IN2(A[6]), .Q(SUM[6]) );
  INVX0 U3 ( .INP(n1), .ZN(SUM[0]) );
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
  wire   n257, start_prev, len_ok, phr_blk, half, N26, N28, busy_prev, N30,
         N31, N32, N33, N34, N35, N36, N37, win_0_, N66, N67, N68, N69, N70,
         N71, N72, N73, N78, N79, N80, N81, N82, N83, N84, N85, N86, N87, N88,
         N91, N92, N93, N94, N97, N98, N99, N100, N101, N102, N103, N104, n28,
         n32, n33, n39, n40, n41, n46, n47, n48, n49, n50, n51, n52, n53, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         sub_95_B_1_, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n29,
         n30, n31, n34, n35, n36, n37, n38, n42, n43, n44, n45, n54, n55, n65,
         n96, n97, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198,
         n199, n200, n201, n203, n204, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256;
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
  DFFX1 start_prev_reg ( .D(n171), .CLK(clk), .Q(start_prev) );
  DFFX1 len_err_reg ( .D(n170), .CLK(clk), .Q(len_err) );
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
  DFFX1 shr_cnt_reg_4_ ( .D(n136), .CLK(clk), .Q(shr_idx[4]) );
  DFFX1 shr_cnt_reg_0_ ( .D(n135), .CLK(clk), .Q(shr_idx[0]), .QN(n9) );
  DFFX1 shr_cnt_reg_1_ ( .D(n132), .CLK(clk), .Q(shr_idx[1]), .QN(n8) );
  DFFX1 shr_cnt_reg_2_ ( .D(n133), .CLK(clk), .Q(shr_idx[2]), .QN(n20) );
  DFFX1 shr_cnt_reg_3_ ( .D(n134), .CLK(clk), .Q(shr_idx[3]) );
  DFFX1 byte_idx_reg_0_ ( .D(n145), .CLK(clk), .Q(byte_idx[0]), .QN(n206) );
  DFFX1 byte_idx_reg_2_ ( .D(n143), .CLK(clk), .Q(byte_idx[2]), .QN(n181) );
  DFFX1 byte_idx_reg_3_ ( .D(n142), .CLK(clk), .Q(byte_idx[3]), .QN(n178) );
  DFFX1 byte_idx_reg_4_ ( .D(n141), .CLK(clk), .Q(byte_idx[4]), .QN(n55) );
  DFFX1 byte_idx_reg_5_ ( .D(n140), .CLK(clk), .Q(byte_idx[5]), .QN(n45) );
  DFFX1 byte_idx_reg_6_ ( .D(n139), .CLK(clk), .Q(byte_idx[6]), .QN(n38) );
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
  DFFX1 win_reg_1_ ( .D(n176), .CLK(clk), .QN(n33) );
  DFFX1 len_q_reg_6_ ( .D(n115), .CLK(clk), .Q(len_q[6]), .QN(n5) );
  DFFX1 len_q_reg_5_ ( .D(n114), .CLK(clk), .Q(len_q[5]), .QN(n12) );
  DFFX1 len_q_reg_4_ ( .D(n113), .CLK(clk), .Q(len_q[4]), .QN(n6) );
  DFFX1 len_q_reg_3_ ( .D(n112), .CLK(clk), .Q(len_q[3]), .QN(n11) );
  DFFX1 len_q_reg_2_ ( .D(n111), .CLK(clk), .Q(len_q[2]), .QN(n4) );
  DFFX1 len_q_reg_1_ ( .D(n110), .CLK(clk), .Q(len_q[1]) );
  DFFX1 len_q_reg_0_ ( .D(n109), .CLK(clk), .Q(len_q[0]), .QN(n10) );
  AO22X1 U83 ( .IN1(len_q[0]), .IN2(n209), .IN3(payloadLength[0]), .IN4(n48),
        .Q(n109) );
  AO22X1 U84 ( .IN1(len_q[1]), .IN2(n209), .IN3(payloadLength[1]), .IN4(n48),
        .Q(n110) );
  AO22X1 U86 ( .IN1(len_q[3]), .IN2(n209), .IN3(payloadLength[3]), .IN4(n48),
        .Q(n112) );
  AO22X1 U87 ( .IN1(len_q[4]), .IN2(n47), .IN3(payloadLength[4]), .IN4(n48),
        .Q(n113) );
  AO22X1 U88 ( .IN1(len_q[5]), .IN2(n47), .IN3(payloadLength[5]), .IN4(n48),
        .Q(n114) );
  AO22X1 U89 ( .IN1(len_q[6]), .IN2(n47), .IN3(payloadLength[6]), .IN4(n48),
        .Q(n115) );
  AO222X1 U91 ( .IN1(N73), .IN2(n49), .IN3(left_next[10]), .IN4(n196), .IN5(
        bits_left[10]), .IN6(n211), .Q(n117) );
  AO222X1 U92 ( .IN1(N72), .IN2(n49), .IN3(left_next[9]), .IN4(n196), .IN5(
        bits_left[9]), .IN6(n211), .Q(n118) );
  AO222X1 U93 ( .IN1(N71), .IN2(n49), .IN3(left_next[8]), .IN4(n197), .IN5(
        bits_left[8]), .IN6(n204), .Q(n119) );
  AO222X1 U94 ( .IN1(N70), .IN2(n49), .IN3(left_next[7]), .IN4(n196), .IN5(
        bits_left[7]), .IN6(n211), .Q(n120) );
  AO222X1 U95 ( .IN1(N69), .IN2(n49), .IN3(left_next[6]), .IN4(n197), .IN5(
        bits_left[6]), .IN6(n204), .Q(n121) );
  AO222X1 U96 ( .IN1(N68), .IN2(n49), .IN3(left_next[5]), .IN4(n196), .IN5(
        bits_left[5]), .IN6(n211), .Q(n122) );
  AO222X1 U97 ( .IN1(N67), .IN2(n49), .IN3(left_next[4]), .IN4(n197), .IN5(
        bits_left[4]), .IN6(n204), .Q(n123) );
  AO222X1 U98 ( .IN1(N66), .IN2(n49), .IN3(left_next[3]), .IN4(n212), .IN5(
        bits_left[3]), .IN6(n211), .Q(n124) );
  AO22X1 U104 ( .IN1(nib_idx[2]), .IN2(n57), .IN3(n58), .IN4(n56), .Q(n129) );
  AO21X1 U105 ( .IN1(n56), .IN2(n59), .IN3(n60), .Q(n57) );
  AO22X1 U106 ( .IN1(nib_idx[1]), .IN2(n61), .IN3(n62), .IN4(n56), .Q(n130) );
  AO21X1 U107 ( .IN1(n56), .IN2(n32), .IN3(n60), .Q(n61) );
  AO22X1 U108 ( .IN1(n60), .IN2(nib_idx[0]), .IN3(n56), .IN4(n32), .Q(n131) );
  AO22X1 U110 ( .IN1(shr_idx[1]), .IN2(n64), .IN3(N91), .IN4(n3), .Q(n132) );
  AO22X1 U111 ( .IN1(shr_idx[2]), .IN2(n64), .IN3(N92), .IN4(n3), .Q(n133) );
  AO22X1 U112 ( .IN1(shr_idx[3]), .IN2(n64), .IN3(N93), .IN4(n3), .Q(n134) );
  AO22X1 U113 ( .IN1(shr_idx[0]), .IN2(n64), .IN3(n9), .IN4(n3), .Q(n135) );
  AO22X1 U114 ( .IN1(shr_idx[4]), .IN2(n64), .IN3(N94), .IN4(n3), .Q(n136) );
  AO22X1 U115 ( .IN1(n233), .IN2(win_0_), .IN3(n67), .IN4(n239), .Q(n137) );
  AO22X1 U116 ( .IN1(byte_idx[7]), .IN2(n69), .IN3(N104), .IN4(n240), .Q(n138)
         );
  AO22X1 U119 ( .IN1(n69), .IN2(n65), .IN3(N101), .IN4(n240), .Q(n141) );
  AO22X1 U120 ( .IN1(n69), .IN2(n179), .IN3(N100), .IN4(n240), .Q(n142) );
  AO22X1 U121 ( .IN1(n69), .IN2(n182), .IN3(N99), .IN4(n240), .Q(n143) );
  AO22X1 U124 ( .IN1(ppdu_nibbles[9]), .IN2(n22), .IN3(wptr[9]), .IN4(n71),
        .Q(n146) );
  AO22X1 U125 ( .IN1(ppdu_nibbles[8]), .IN2(n22), .IN3(wptr[8]), .IN4(n71),
        .Q(n147) );
  AO22X1 U126 ( .IN1(ppdu_nibbles[7]), .IN2(n22), .IN3(wptr[7]), .IN4(n71),
        .Q(n148) );
  AO22X1 U127 ( .IN1(ppdu_nibbles[6]), .IN2(n22), .IN3(wptr[6]), .IN4(n71),
        .Q(n149) );
  AO22X1 U128 ( .IN1(ppdu_nibbles[5]), .IN2(n22), .IN3(wptr[5]), .IN4(n71),
        .Q(n150) );
  AO22X1 U129 ( .IN1(ppdu_nibbles[4]), .IN2(n22), .IN3(wptr[4]), .IN4(n71),
        .Q(n151) );
  AO22X1 U130 ( .IN1(ppdu_nibbles[3]), .IN2(n22), .IN3(wptr[3]), .IN4(n71),
        .Q(n152) );
  AO22X1 U131 ( .IN1(ppdu_nibbles[2]), .IN2(n22), .IN3(wptr[2]), .IN4(n71),
        .Q(n153) );
  AO22X1 U132 ( .IN1(ppdu_nibbles[1]), .IN2(n22), .IN3(wptr[1]), .IN4(n71),
        .Q(n154) );
  AO22X1 U133 ( .IN1(ppdu_nibbles[0]), .IN2(n22), .IN3(wptr[0]), .IN4(n71),
        .Q(n155) );
  AND3X1 U144 ( .IN1(n74), .IN2(n75), .IN3(n24), .Q(n73) );
  NAND3X0 U145 ( .IN1(n79), .IN2(n66), .IN3(n47), .QN(n75) );
  AO21X1 U146 ( .IN1(ppdu_done), .IN2(n81), .IN3(n72), .Q(n166) );
  AO22X1 U147 ( .IN1(n82), .IN2(phr_blk), .IN3(n83), .IN4(n241), .Q(n167) );
  AO22X1 U148 ( .IN1(load_cnt[0]), .IN2(n69), .IN3(n84), .IN4(n240), .Q(n168)
         );
  AND2X1 U149 ( .IN1(n28), .IN2(n85), .Q(n84) );
  AO22X1 U150 ( .IN1(n69), .IN2(load_cnt[1]), .IN3(n86), .IN4(load_cnt[0]),
        .Q(n169) );
  AO21X1 U151 ( .IN1(len_err), .IN2(n81), .IN3(n88), .Q(n170) );
  AO22X1 U152 ( .IN1(start_prev), .IN2(n81), .IN3(n23), .IN4(start_Tx), .Q(
        n171) );
  AO22X1 U153 ( .IN1(n89), .IN2(half), .IN3(n90), .IN4(n239), .Q(n172) );
  AO222X1 U155 ( .IN1(n242), .IN2(n193), .IN3(n93), .IN4(n92), .IN5(n234),
        .IN6(n35), .Q(n173) );
  AO222X1 U157 ( .IN1(n92), .IN2(n235), .IN3(n94), .IN4(n23), .IN5(n234),
        .IN6(state[2]), .Q(n175) );
  AO21X1 U158 ( .IN1(n95), .IN2(n23), .IN3(reset), .Q(n91) );
  OAI21X1 U161 ( .IN1(n99), .IN2(n33), .IN3(n100), .QN(n176) );
  NAND4X0 U162 ( .IN1(win_0_), .IN2(n239), .IN3(n68), .IN4(n33), .QN(n100) );
  AO21X1 U163 ( .IN1(n198), .IN2(n98), .IN3(n241), .Q(n68) );
  AOI21X1 U164 ( .IN1(n101), .IN2(n102), .IN3(n235), .QN(n98) );
  AO22X1 U165 ( .IN1(N28), .IN2(sub_95_B_1_), .IN3(n103), .IN4(n207), .Q(n93)
         );
  XNOR2X1 U166 ( .IN1(win_0_), .IN2(n104), .Q(n102) );
  XOR2X1 U167 ( .IN1(n33), .IN2(n105), .Q(n101) );
  NOR3X0 U169 ( .IN1(n78), .IN2(half), .IN3(sub_95_B_1_), .QN(il_hold_en) );
  NAND3X0 U171 ( .IN1(n108), .IN2(n207), .IN3(half), .QN(n107) );
  OR2X1 U173 ( .IN1(n80), .IN2(n245), .Q(frame_ready) );
  NOR3X0 U177 ( .IN1(n37), .IN2(state[2]), .IN3(n40), .QN(acc_preload) );
  HADDX1 add_229_U1_1_2 ( .A0(shr_idx[2]), .B0(add_229_carry[2]), .C1(
        add_229_carry[3]), .SO(N92) );
  HADDX1 add_229_U1_1_3 ( .A0(shr_idx[3]), .B0(add_229_carry[3]), .C1(
        add_229_carry[4]), .SO(N93) );
  FADDX1 sub_95_U2_3 ( .A(bits_left[3]), .B(n214), .CI(sub_95_carry[3]), .CO(
        sub_95_carry[4]), .S(left_next[3]) );
  DFFX1 half_reg ( .D(n172), .CLK(clk), .Q(half), .QN(n201) );
  DFFX1 win_reg_0_ ( .D(n137), .CLK(clk), .Q(win_0_) );
  DFFX1 k_reg_1_ ( .D(n130), .CLK(clk), .Q(nib_idx[1]), .QN(n194) );
  DFFX1 k_reg_2_ ( .D(n129), .CLK(clk), .Q(nib_idx[2]) );
  DFFX1 k_reg_3_ ( .D(n128), .CLK(clk), .Q(nib_idx[3]), .QN(n191) );
  DFFX1 bits_left_reg_2_ ( .D(n125), .CLK(clk), .Q(bits_left[2]) );
  DFFX1 bits_left_reg_1_ ( .D(n126), .CLK(clk), .Q(bits_left[1]) );
  DFFX1 bits_left_reg_3_ ( .D(n124), .CLK(clk), .Q(bits_left[3]) );
  DFFX1 bits_left_reg_11_ ( .D(n116), .CLK(clk), .Q(bits_left[11]) );
  DFFX1 bits_left_reg_0_ ( .D(n127), .CLK(clk), .Q(left_next[0]) );
  DFFX1 bits_left_reg_10_ ( .D(n117), .CLK(clk), .Q(bits_left[10]) );
  DFFX1 bits_left_reg_4_ ( .D(n123), .CLK(clk), .Q(bits_left[4]) );
  DFFX1 bits_left_reg_9_ ( .D(n118), .CLK(clk), .Q(bits_left[9]) );
  DFFX1 bits_left_reg_8_ ( .D(n119), .CLK(clk), .Q(bits_left[8]) );
  DFFX1 bits_left_reg_7_ ( .D(n120), .CLK(clk), .Q(bits_left[7]) );
  DFFX1 bits_left_reg_6_ ( .D(n121), .CLK(clk), .Q(bits_left[6]) );
  DFFX1 bits_left_reg_5_ ( .D(n122), .CLK(clk), .Q(bits_left[5]) );
  DFFX1 state_reg_0_ ( .D(n174), .CLK(clk), .Q(state[0]), .QN(n41) );
  DFFX1 state_reg_1_ ( .D(n173), .CLK(clk), .Q(state[1]), .QN(n40) );
  DFFX1 byte_idx_reg_1_ ( .D(n144), .CLK(clk), .Q(byte_idx[1]), .QN(n96) );
  DFFX1 state_reg_2_ ( .D(n175), .CLK(clk), .Q(state[2]), .QN(n39) );
  DFFX1 k_reg_0_ ( .D(n131), .CLK(clk), .Q(nib_idx[0]), .QN(n32) );
  DFFX1 rate_q_reg ( .D(n177), .CLK(clk), .Q(n257), .QN(sub_95_B_1_) );
  NBUFFX4 U3 ( .INP(n30), .Z(n188) );
  NBUFFX4 U4 ( .INP(n29), .Z(n190) );
  AO22X2 U5 ( .IN1(byte_idx[2]), .IN2(n36), .IN3(N33), .IN4(n190), .Q(
        ram_raddr[2]) );
  NAND2X0 U6 ( .IN1(n1), .IN2(n2), .QN(ram_raddr[1]) );
  NAND2X0 U7 ( .IN1(byte_idx[1]), .IN2(n27), .QN(n1) );
  NAND2X0 U8 ( .IN1(N32), .IN2(n26), .QN(n2) );
  DELLN1X2 U9 ( .INP(il_clear), .Z(acc_clear) );
  AO22X1 U10 ( .IN1(byte_idx[4]), .IN2(n180), .IN3(N35), .IN4(n29), .Q(
        ram_raddr[4]) );
  OR2X1 U11 ( .IN1(n80), .IN2(n245), .Q(n21) );
  AO221X1 U12 ( .IN1(n179), .IN2(n11), .IN3(byte_idx[4]), .IN4(n6), .IN5(n222),
        .Q(n223) );
  INVX0 U13 ( .INP(n257), .ZN(n214) );
  NOR4X0 U14 ( .IN1(n248), .IN2(payloadLength[7]), .IN3(busy), .IN4(start_prev), .QN(il_clear) );
  XNOR2X1 U15 ( .IN1(shr_last[3]), .IN2(shr_idx[3]), .Q(n228) );
  XNOR2X1 U16 ( .IN1(shr_last[4]), .IN2(shr_idx[4]), .Q(n229) );
  OAI22X1 U17 ( .IN1(n230), .IN2(n232), .IN3(shr_idx[1]), .IN4(n230), .QN(n186) );
  XOR2X1 U18 ( .IN1(shr_last[2]), .IN2(n20), .Q(n185) );
  NAND3X0 U19 ( .IN1(n40), .IN2(n37), .IN3(n34), .QN(n77) );
  NAND3X0 U20 ( .IN1(n40), .IN2(n34), .IN3(n41), .QN(busy) );
  NBUFFX2 U21 ( .INP(n50), .Z(n196) );
  NBUFFX2 U22 ( .INP(n50), .Z(n197) );
  NBUFFX2 U23 ( .INP(n50), .Z(n212) );
  NBUFFX2 U24 ( .INP(n213), .Z(n207) );
  NBUFFX2 U25 ( .INP(n70), .Z(n22) );
  NOR4X0 U26 ( .IN1(n237), .IN2(n34), .IN3(n41), .IN4(n35), .QN(n72) );
  HADDX1 U27 ( .A0(shr_idx[1]), .B0(shr_idx[0]), .C1(add_229_carry[2]), .SO(
        N91) );
  NBUFFX2 U28 ( .INP(n76), .Z(n23) );
  AO221X1 U29 ( .IN1(n83), .IN2(n193), .IN3(n234), .IN4(n37), .IN5(n92), .Q(
        n174) );
  NBUFFX2 U30 ( .INP(n195), .Z(n210) );
  AOI21X1 U31 ( .IN1(n53), .IN2(n207), .IN3(n208), .QN(n89) );
  AO22X1 U32 ( .IN1(len_q[2]), .IN2(n209), .IN3(payloadLength[2]), .IN4(n48),
        .Q(n111) );
  AO22X1 U33 ( .IN1(n238), .IN2(wptr[9]), .IN3(N87), .IN4(n73), .Q(n156) );
  AO22X1 U34 ( .IN1(n238), .IN2(wptr[8]), .IN3(N86), .IN4(n73), .Q(n157) );
  AO22X1 U35 ( .IN1(n238), .IN2(wptr[7]), .IN3(N85), .IN4(n73), .Q(n158) );
  AO22X1 U36 ( .IN1(n238), .IN2(wptr[6]), .IN3(N84), .IN4(n73), .Q(n159) );
  AO22X1 U37 ( .IN1(n238), .IN2(wptr[5]), .IN3(N83), .IN4(n73), .Q(n160) );
  AO22X1 U38 ( .IN1(n238), .IN2(wptr[4]), .IN3(N82), .IN4(n73), .Q(n161) );
  AO22X1 U39 ( .IN1(n238), .IN2(wptr[3]), .IN3(N81), .IN4(n73), .Q(n162) );
  AO22X1 U40 ( .IN1(n238), .IN2(wptr[2]), .IN3(N80), .IN4(n73), .Q(n163) );
  AO22X1 U41 ( .IN1(n238), .IN2(wptr[1]), .IN3(N79), .IN4(n73), .Q(n164) );
  AO22X1 U42 ( .IN1(n238), .IN2(wptr[0]), .IN3(N78), .IN4(n73), .Q(n165) );
  NOR4X0 U43 ( .IN1(start_prev), .IN2(len_ok), .IN3(n248), .IN4(n236), .QN(n88) );
  AO22X1 U44 ( .IN1(n209), .IN2(n207), .IN3(rate), .IN4(n48), .Q(n177) );
  AND2X1 U45 ( .IN1(n242), .IN2(n19), .Q(n3) );
  AND3X1 U46 ( .IN1(n184), .IN2(n187), .IN3(n186), .Q(n7) );
  NBUFFX2 U47 ( .INP(n204), .Z(n211) );
  AND2X1 U48 ( .IN1(n239), .IN2(n63), .Q(n56) );
  NBUFFX2 U49 ( .INP(n53), .Z(n198) );
  NAND2X1 U50 ( .IN1(state[0]), .IN2(n31), .QN(n46) );
  AND3X1 U51 ( .IN1(nib_idx[2]), .IN2(n247), .IN3(n56), .Q(n200) );
  NAND3X0 U52 ( .IN1(nib_idx[2]), .IN2(n247), .IN3(n192), .QN(n108) );
  NAND2X0 U53 ( .IN1(n7), .IN2(n185), .QN(n15) );
  INVX0 U54 ( .INP(sub_95_B_1_), .ZN(rate_q) );
  AND2X4 U55 ( .IN1(state[1]), .IN2(n39), .Q(n14) );
  AO22X1 U56 ( .IN1(byte_idx[5]), .IN2(n183), .IN3(N36), .IN4(n188), .Q(
        ram_raddr[5]) );
  AND2X1 U57 ( .IN1(n47), .IN2(n87), .Q(n69) );
  AO22X1 U58 ( .IN1(n69), .IN2(byte_idx[5]), .IN3(N102), .IN4(n240), .Q(n140)
         );
  AO22X1 U59 ( .IN1(n69), .IN2(n42), .IN3(N103), .IN4(n240), .Q(n139) );
  AO22X1 U60 ( .IN1(n69), .IN2(n43), .IN3(N97), .IN4(n240), .Q(n145) );
  NAND3X0 U61 ( .IN1(n41), .IN2(n40), .IN3(state[2]), .QN(n78) );
  OA222X1 U62 ( .IN1(n41), .IN2(n34), .IN3(n77), .IN4(n15), .IN5(n37), .IN6(
        n40), .Q(n17) );
  NAND2X0 U63 ( .IN1(n18), .IN2(n17), .QN(n16) );
  NAND2X0 U64 ( .IN1(n17), .IN2(n18), .QN(n95) );
  OA221X1 U65 ( .IN1(n36), .IN2(n85), .IN3(n98), .IN4(n63), .IN5(n244), .Q(n18) );
  OA21X1 U66 ( .IN1(n66), .IN2(N88), .IN3(n209), .Q(n64) );
  INVX0 U67 ( .INP(n64), .ZN(n19) );
  AND2X1 U68 ( .IN1(n14), .IN2(state[0]), .Q(n30) );
  NAND2X0 U69 ( .IN1(n107), .IN2(n246), .QN(n63) );
  NOR2X0 U70 ( .IN1(reset), .IN2(n72), .QN(n70) );
  NOR2X0 U71 ( .IN1(n106), .IN2(reset), .QN(n76) );
  NOR2X0 U72 ( .IN1(n106), .IN2(reset), .QN(n24) );
  AO22X1 U73 ( .IN1(n69), .IN2(byte_idx[1]), .IN3(N98), .IN4(n240), .Q(n144)
         );
  AO22X1 U74 ( .IN1(n43), .IN2(n189), .IN3(n190), .IN4(N31), .Q(ram_raddr[0])
         );
  AO22X1 U75 ( .IN1(n180), .IN2(byte_idx[3]), .IN3(N34), .IN4(n44), .Q(
        ram_raddr[3]) );
  AO22X1 U76 ( .IN1(byte_idx[6]), .IN2(n189), .IN3(N37), .IN4(n25), .Q(
        ram_raddr[6]) );
  INVX0 U77 ( .INP(n189), .ZN(n25) );
  INVX0 U78 ( .INP(n46), .ZN(n26) );
  INVX0 U79 ( .INP(n26), .ZN(n27) );
  INVX0 U80 ( .INP(n27), .ZN(n29) );
  AND2X1 U81 ( .IN1(state[1]), .IN2(n39), .Q(n31) );
  INVX0 U82 ( .INP(state[2]), .ZN(n34) );
  INVX0 U85 ( .INP(n40), .ZN(n35) );
  INVX0 U90 ( .INP(n44), .ZN(n36) );
  INVX0 U99 ( .INP(n41), .ZN(n37) );
  INVX0 U100 ( .INP(n38), .ZN(n42) );
  INVX0 U101 ( .INP(n206), .ZN(n43) );
  INVX0 U102 ( .INP(n46), .ZN(n44) );
  INVX0 U103 ( .INP(n45), .ZN(n54) );
  INVX0 U109 ( .INP(n55), .ZN(n65) );
  INVX0 U117 ( .INP(n96), .ZN(n97) );
  INVX0 U118 ( .INP(n178), .ZN(n179) );
  INVX0 U122 ( .INP(n30), .ZN(n180) );
  INVX0 U123 ( .INP(n181), .ZN(n182) );
  INVX0 U134 ( .INP(n188), .ZN(n183) );
  INVX0 U135 ( .INP(n44), .ZN(n189) );
  AND4X1 U136 ( .IN1(n184), .IN2(n185), .IN3(n186), .IN4(n187), .Q(N88) );
  AND2X1 U137 ( .IN1(n229), .IN2(n228), .Q(n184) );
  OAI22X1 U138 ( .IN1(shr_last[1]), .IN2(n231), .IN3(n231), .IN4(n8), .QN(n187) );
  INVX0 U139 ( .INP(n191), .ZN(n192) );
  NAND2X1 U140 ( .IN1(left_next[0]), .IN2(n212), .QN(n255) );
  NAND2X0 U141 ( .IN1(bits_left[1]), .IN2(n204), .QN(n252) );
  NOR2X0 U142 ( .IN1(n208), .IN2(n198), .QN(n204) );
  AO21X1 U143 ( .IN1(n23), .IN2(n16), .IN3(reset), .Q(n193) );
  OR2X1 U154 ( .IN1(n194), .IN2(n32), .Q(n59) );
  NOR2X0 U156 ( .IN1(n208), .IN2(n198), .QN(n195) );
  NAND2X0 U159 ( .IN1(n251), .IN2(n252), .QN(n126) );
  NAND2X0 U160 ( .IN1(n255), .IN2(n256), .QN(n127) );
  NAND2X0 U168 ( .IN1(n253), .IN2(n254), .QN(n116) );
  INVX0 U170 ( .INP(n47), .ZN(n208) );
  NOR2X0 U172 ( .IN1(n195), .IN2(n236), .QN(n49) );
  INVX0 U174 ( .INP(n87), .ZN(n240) );
  NOR2X0 U175 ( .IN1(n208), .IN2(n239), .QN(n60) );
  INVX0 U176 ( .INP(n52), .ZN(n239) );
  INVX0 U178 ( .INP(n76), .ZN(n237) );
  INVX0 U179 ( .INP(n75), .ZN(n238) );
  NOR2X0 U180 ( .IN1(n237), .IN2(n47), .QN(n48) );
  INVX0 U181 ( .INP(n82), .ZN(n241) );
  NAND2X0 U182 ( .IN1(n245), .IN2(n24), .QN(n66) );
  INVX0 U183 ( .INP(n83), .ZN(n236) );
  INVX0 U184 ( .INP(mod_busy), .ZN(n243) );
  INVX0 U185 ( .INP(n214), .ZN(n213) );
  NOR2X0 U186 ( .IN1(n237), .IN2(n70), .QN(n71) );
  NAND2X0 U187 ( .IN1(n80), .IN2(n239), .QN(n79) );
  INVX0 U188 ( .INP(n208), .ZN(n209) );
  OA21X1 U189 ( .IN1(n87), .IN2(n85), .IN3(n209), .Q(n82) );
  INVX0 U190 ( .INP(il_clear), .ZN(n244) );
  INVX0 U191 ( .INP(n77), .ZN(buf_sel_shr) );
  INVX0 U192 ( .INP(n93), .ZN(n235) );
  INVX0 U193 ( .INP(payloadLength[0]), .ZN(N66) );
  NAND2X0 U194 ( .IN1(left_next[0]), .IN2(n210), .QN(n256) );
  NAND2X0 U195 ( .IN1(bits_left[11]), .IN2(n211), .QN(n254) );
  OR2X1 U196 ( .IN1(n199), .IN2(n200), .Q(n128) );
  OA21X1 U197 ( .IN1(n57), .IN2(n56), .IN3(nib_idx[3]), .Q(n199) );
  INVX0 U198 ( .INP(n66), .ZN(n242) );
  NOR2X0 U199 ( .IN1(nib_idx[1]), .IN2(n32), .QN(n62) );
  OA21X1 U200 ( .IN1(win_0_), .IN2(n52), .IN3(n68), .Q(n99) );
  NOR2X0 U201 ( .IN1(half), .IN2(n89), .QN(n90) );
  NOR2X0 U202 ( .IN1(win_0_), .IN2(n233), .QN(n67) );
  INVX0 U203 ( .INP(n68), .ZN(n233) );
  INVX0 U204 ( .INP(start_Tx), .ZN(n248) );
  OA21X1 U205 ( .IN1(sub_95_B_1_), .IN2(half), .IN3(n246), .Q(n80) );
  NOR2X0 U206 ( .IN1(il_clear), .IN2(reset), .QN(n47) );
  NOR2X0 U207 ( .IN1(load_cnt[1]), .IN2(n87), .QN(n86) );
  OA21X1 U208 ( .IN1(busy_prev), .IN2(n243), .IN3(n21), .Q(n106) );
  NOR2X0 U209 ( .IN1(reset), .IN2(n24), .QN(n81) );
  OR2X1 U210 ( .IN1(N26), .IN2(n201), .Q(n103) );
  NOR2X0 U211 ( .IN1(phr_blk), .IN2(n207), .QN(n105) );
  NAND2X1 U212 ( .IN1(phr_blk), .IN2(n207), .QN(n104) );
  INVX0 U213 ( .INP(byte_idx[1]), .ZN(n227) );
  NOR2X0 U214 ( .IN1(reset), .IN2(n243), .QN(N30) );
  NAND2X1 U215 ( .IN1(load_cnt[1]), .IN2(n28), .QN(n85) );
  INVX0 U216 ( .INP(shr_last[1]), .ZN(n232) );
  NAND2X0 U217 ( .IN1(bits_left[2]), .IN2(n51), .QN(n249) );
  NAND2X0 U218 ( .IN1(left_next[2]), .IN2(n212), .QN(n250) );
  NAND2X0 U219 ( .IN1(left_next[1]), .IN2(n212), .QN(n251) );
  NAND2X0 U220 ( .IN1(left_next[11]), .IN2(n197), .QN(n253) );
  NOR2X0 U221 ( .IN1(n51), .IN2(n52), .QN(n50) );
  INVX0 U222 ( .INP(n49), .ZN(n203) );
  NOR2X0 U223 ( .IN1(n106), .IN2(n63), .QN(acc_consume) );
  INVX0 U224 ( .INP(n59), .ZN(n247) );
  NOR2X0 U225 ( .IN1(n53), .IN2(n208), .QN(n51) );
  NOR2X0 U226 ( .IN1(n63), .IN2(n52), .QN(n53) );
  INVX0 U227 ( .INP(n36), .ZN(acc_load) );
  NOR2X0 U228 ( .IN1(nib_idx[2]), .IN2(n59), .QN(n58) );
  NAND2X0 U229 ( .IN1(n77), .IN2(n78), .QN(n74) );
  INVX0 U230 ( .INP(n78), .ZN(n246) );
  NOR2X0 U231 ( .IN1(n237), .IN2(busy), .QN(n83) );
  INVX0 U232 ( .INP(n77), .ZN(n245) );
  AND2X1 U233 ( .IN1(n91), .IN2(n239), .Q(n92) );
  NAND2X0 U234 ( .IN1(n24), .IN2(n246), .QN(n52) );
  INVX0 U235 ( .INP(n91), .ZN(n234) );
  OA21X1 U236 ( .IN1(acc_load), .IN2(acc_preload), .IN3(n193), .Q(n94) );
  NAND2X0 U237 ( .IN1(n24), .IN2(acc_load), .QN(n87) );
  AND2X1 U238 ( .IN1(add_205_carry[9]), .IN2(payloadLength[6]), .Q(N73) );
  XOR2X1 U239 ( .IN1(payloadLength[6]), .IN2(add_205_carry[9]), .Q(N72) );
  AND2X1 U240 ( .IN1(add_205_carry[8]), .IN2(payloadLength[5]), .Q(
        add_205_carry[9]) );
  XOR2X1 U241 ( .IN1(payloadLength[5]), .IN2(add_205_carry[8]), .Q(N71) );
  AND2X1 U242 ( .IN1(add_205_carry[7]), .IN2(payloadLength[4]), .Q(
        add_205_carry[8]) );
  XOR2X1 U243 ( .IN1(payloadLength[4]), .IN2(add_205_carry[7]), .Q(N70) );
  AND2X1 U244 ( .IN1(add_205_carry[6]), .IN2(payloadLength[3]), .Q(
        add_205_carry[7]) );
  XOR2X1 U245 ( .IN1(payloadLength[3]), .IN2(add_205_carry[6]), .Q(N69) );
  AND2X1 U246 ( .IN1(add_205_carry[5]), .IN2(payloadLength[2]), .Q(
        add_205_carry[6]) );
  XOR2X1 U247 ( .IN1(payloadLength[2]), .IN2(add_205_carry[5]), .Q(N68) );
  AND2X1 U248 ( .IN1(payloadLength[0]), .IN2(payloadLength[1]), .Q(
        add_205_carry[5]) );
  XOR2X1 U249 ( .IN1(payloadLength[1]), .IN2(payloadLength[0]), .Q(N67) );
  XNOR2X1 U250 ( .IN1(bits_left[11]), .IN2(sub_95_carry[11]), .Q(left_next[11]) );
  OR2X1 U251 ( .IN1(bits_left[10]), .IN2(sub_95_carry[10]), .Q(
        sub_95_carry[11]) );
  XNOR2X1 U252 ( .IN1(sub_95_carry[10]), .IN2(bits_left[10]), .Q(left_next[10]) );
  OR2X1 U253 ( .IN1(bits_left[9]), .IN2(sub_95_carry[9]), .Q(sub_95_carry[10])
         );
  XNOR2X1 U254 ( .IN1(sub_95_carry[9]), .IN2(bits_left[9]), .Q(left_next[9])
         );
  OR2X1 U255 ( .IN1(bits_left[8]), .IN2(sub_95_carry[8]), .Q(sub_95_carry[9])
         );
  XNOR2X1 U256 ( .IN1(sub_95_carry[8]), .IN2(bits_left[8]), .Q(left_next[8])
         );
  OR2X1 U257 ( .IN1(bits_left[7]), .IN2(sub_95_carry[7]), .Q(sub_95_carry[8])
         );
  XNOR2X1 U258 ( .IN1(sub_95_carry[7]), .IN2(bits_left[7]), .Q(left_next[7])
         );
  OR2X1 U259 ( .IN1(bits_left[6]), .IN2(sub_95_carry[6]), .Q(sub_95_carry[7])
         );
  XNOR2X1 U260 ( .IN1(sub_95_carry[6]), .IN2(bits_left[6]), .Q(left_next[6])
         );
  OR2X1 U261 ( .IN1(bits_left[5]), .IN2(sub_95_carry[5]), .Q(sub_95_carry[6])
         );
  XNOR2X1 U262 ( .IN1(sub_95_carry[5]), .IN2(bits_left[5]), .Q(left_next[5])
         );
  OR2X1 U263 ( .IN1(bits_left[4]), .IN2(sub_95_carry[4]), .Q(sub_95_carry[5])
         );
  XNOR2X1 U264 ( .IN1(sub_95_carry[4]), .IN2(bits_left[4]), .Q(left_next[4])
         );
  AND2X1 U265 ( .IN1(sub_95_carry[2]), .IN2(bits_left[2]), .Q(sub_95_carry[3])
         );
  XOR2X1 U266 ( .IN1(bits_left[2]), .IN2(sub_95_carry[2]), .Q(left_next[2]) );
  OR2X1 U267 ( .IN1(bits_left[1]), .IN2(n207), .Q(sub_95_carry[2]) );
  XNOR2X1 U268 ( .IN1(n207), .IN2(bits_left[1]), .Q(left_next[1]) );
  XOR2X1 U269 ( .IN1(add_229_carry[4]), .IN2(shr_idx[4]), .Q(N94) );
  INVX0 U270 ( .INP(left_next[11]), .ZN(N28) );
  OR3X1 U271 ( .IN1(left_next[9]), .IN2(left_next[8]), .IN3(left_next[7]), .Q(
        n215) );
  OR4X1 U272 ( .IN1(left_next[6]), .IN2(left_next[5]), .IN3(left_next[4]),
        .IN4(n215), .Q(n217) );
  OR3X1 U273 ( .IN1(left_next[3]), .IN2(left_next[2]), .IN3(left_next[1]), .Q(
        n216) );
  NOR4X0 U274 ( .IN1(n217), .IN2(n216), .IN3(left_next[10]), .IN4(left_next[0]), .QN(n218) );
  NOR2X0 U275 ( .IN1(left_next[11]), .IN2(n218), .QN(N26) );
  INVX0 U276 ( .INP(payloadLength[7]), .ZN(len_ok) );
  NOR2X0 U277 ( .IN1(n10), .IN2(n43), .QN(n220) );
  AND2X1 U278 ( .IN1(n227), .IN2(n220), .Q(n219) );
  OAI222X1 U279 ( .IN1(n220), .IN2(n227), .IN3(len_q[1]), .IN4(n219), .IN5(
        len_q[2]), .IN6(n181), .QN(n221) );
  OA221X1 U280 ( .IN1(byte_idx[3]), .IN2(n11), .IN3(n182), .IN4(n4), .IN5(n221), .Q(n222) );
  OA221X1 U281 ( .IN1(byte_idx[5]), .IN2(n12), .IN3(n65), .IN4(n6), .IN5(n223),
        .Q(n224) );
  AO221X1 U282 ( .IN1(byte_idx[5]), .IN2(n12), .IN3(byte_idx[6]), .IN4(n5),
        .IN5(n224), .Q(n225) );
  OA21X1 U283 ( .IN1(n42), .IN2(n5), .IN3(n225), .Q(n226) );
  NOR2X0 U284 ( .IN1(byte_idx[7]), .IN2(n226), .QN(acc_byte_vld) );
  NOR2X0 U285 ( .IN1(n9), .IN2(shr_last[0]), .QN(n230) );
  AND2X1 U286 ( .IN1(shr_last[0]), .IN2(n9), .Q(n231) );
  NAND3X0 U287 ( .IN1(n249), .IN2(n203), .IN3(n250), .QN(n125) );
  ppdu_ctrl_DW01_inc_0 add_246 ( .A({byte_idx[7], n42, byte_idx[5], n65, n179,
        n182, byte_idx[1], n43}), .SUM({N104, N103, N102, N101, N100, N99, N98,
        N97}) );
  ppdu_ctrl_DW01_inc_2 add_133 ( .A({byte_idx[6], n54, byte_idx[4:2], n97,
        byte_idx[0]}), .SUM({N37, N36, N35, N34, N33, N32, N31}) );
  ppdu_ctrl_DW01_inc_3 r149 ( .A(wptr), .SUM({N87, N86, N85, N84, N83, N82,
        N81, N80, N79, N78}) );
endmodule


module payload_ram_bank8x8_15 ( clk, we, waddr, wdata, raddr, rdata );
  input [2:0] waddr;
  input [7:0] wdata;
  input [2:0] raddr;
  output [7:0] rdata;
  input clk, we;
  wire   n12, n13, n14, n16, n17, n18, n19, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n15, n20, n21, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172;
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
  AO22X1 U14 ( .IN1(n93), .IN2(n172), .IN3(mem[0]), .IN4(n163), .Q(n22) );
  AO22X1 U15 ( .IN1(n91), .IN2(n172), .IN3(mem[1]), .IN4(n163), .Q(n23) );
  AO22X1 U16 ( .IN1(n89), .IN2(n172), .IN3(mem[2]), .IN4(n163), .Q(n24) );
  AO22X1 U17 ( .IN1(n87), .IN2(n172), .IN3(mem[3]), .IN4(n163), .Q(n25) );
  AO22X1 U18 ( .IN1(n21), .IN2(n172), .IN3(mem[4]), .IN4(n163), .Q(n26) );
  AO22X1 U19 ( .IN1(n15), .IN2(n172), .IN3(mem[5]), .IN4(n162), .Q(n27) );
  AO22X1 U20 ( .IN1(n10), .IN2(n172), .IN3(mem[6]), .IN4(n162), .Q(n28) );
  AO22X1 U21 ( .IN1(n8), .IN2(n172), .IN3(mem[7]), .IN4(n162), .Q(n29) );
  AO22X1 U23 ( .IN1(n94), .IN2(n93), .IN3(mem[8]), .IN4(n161), .Q(n30) );
  AO22X1 U24 ( .IN1(n94), .IN2(n91), .IN3(mem[9]), .IN4(n161), .Q(n31) );
  AO22X1 U25 ( .IN1(n94), .IN2(n89), .IN3(mem[10]), .IN4(n161), .Q(n32) );
  AO22X1 U26 ( .IN1(n94), .IN2(n87), .IN3(mem[11]), .IN4(n161), .Q(n33) );
  AO22X1 U27 ( .IN1(n94), .IN2(n21), .IN3(mem[12]), .IN4(n161), .Q(n34) );
  AO22X1 U28 ( .IN1(n94), .IN2(n15), .IN3(mem[13]), .IN4(n160), .Q(n35) );
  AO22X1 U29 ( .IN1(n94), .IN2(n10), .IN3(mem[14]), .IN4(n160), .Q(n36) );
  AO22X1 U30 ( .IN1(n94), .IN2(n8), .IN3(mem[15]), .IN4(n160), .Q(n37) );
  AO22X1 U32 ( .IN1(n171), .IN2(n93), .IN3(mem[16]), .IN4(n159), .Q(n38) );
  AO22X1 U33 ( .IN1(n171), .IN2(n91), .IN3(mem[17]), .IN4(n159), .Q(n39) );
  AO22X1 U34 ( .IN1(n171), .IN2(n89), .IN3(mem[18]), .IN4(n159), .Q(n40) );
  AO22X1 U35 ( .IN1(n171), .IN2(n87), .IN3(mem[19]), .IN4(n159), .Q(n41) );
  AO22X1 U36 ( .IN1(n171), .IN2(n21), .IN3(mem[20]), .IN4(n159), .Q(n42) );
  AO22X1 U37 ( .IN1(n171), .IN2(n15), .IN3(mem[21]), .IN4(n159), .Q(n43) );
  AO22X1 U38 ( .IN1(n171), .IN2(n10), .IN3(mem[22]), .IN4(n159), .Q(n44) );
  AO22X1 U39 ( .IN1(n171), .IN2(n8), .IN3(mem[23]), .IN4(n1), .Q(n45) );
  AO22X1 U41 ( .IN1(n97), .IN2(n93), .IN3(mem[24]), .IN4(n158), .Q(n46) );
  AO22X1 U42 ( .IN1(n97), .IN2(n91), .IN3(mem[25]), .IN4(n158), .Q(n47) );
  AO22X1 U43 ( .IN1(n97), .IN2(n89), .IN3(mem[26]), .IN4(n158), .Q(n48) );
  AO22X1 U44 ( .IN1(n97), .IN2(n87), .IN3(mem[27]), .IN4(n158), .Q(n49) );
  AO22X1 U45 ( .IN1(n97), .IN2(n21), .IN3(mem[28]), .IN4(n158), .Q(n50) );
  AO22X1 U46 ( .IN1(n97), .IN2(n15), .IN3(mem[29]), .IN4(n157), .Q(n51) );
  AO22X1 U47 ( .IN1(n97), .IN2(n10), .IN3(mem[30]), .IN4(n157), .Q(n52) );
  AO22X1 U48 ( .IN1(n97), .IN2(n8), .IN3(mem[31]), .IN4(n157), .Q(n53) );
  AO22X1 U51 ( .IN1(n169), .IN2(n93), .IN3(mem[32]), .IN4(n156), .Q(n54) );
  AO22X1 U52 ( .IN1(n169), .IN2(n91), .IN3(mem[33]), .IN4(n156), .Q(n55) );
  AO22X1 U53 ( .IN1(n169), .IN2(n89), .IN3(mem[34]), .IN4(n156), .Q(n56) );
  AO22X1 U54 ( .IN1(n169), .IN2(n87), .IN3(mem[35]), .IN4(n156), .Q(n57) );
  AO22X1 U55 ( .IN1(n169), .IN2(n21), .IN3(mem[36]), .IN4(n156), .Q(n58) );
  AO22X1 U56 ( .IN1(n169), .IN2(n15), .IN3(mem[37]), .IN4(n155), .Q(n59) );
  AO22X1 U57 ( .IN1(n169), .IN2(n10), .IN3(mem[38]), .IN4(n155), .Q(n60) );
  AO22X1 U58 ( .IN1(n169), .IN2(n8), .IN3(mem[39]), .IN4(n155), .Q(n61) );
  AO22X1 U60 ( .IN1(n95), .IN2(n93), .IN3(mem[40]), .IN4(n154), .Q(n62) );
  AO22X1 U61 ( .IN1(n95), .IN2(n91), .IN3(mem[41]), .IN4(n154), .Q(n63) );
  AO22X1 U62 ( .IN1(n95), .IN2(n89), .IN3(mem[42]), .IN4(n154), .Q(n64) );
  AO22X1 U63 ( .IN1(n95), .IN2(n87), .IN3(mem[43]), .IN4(n154), .Q(n65) );
  AO22X1 U64 ( .IN1(n95), .IN2(n21), .IN3(mem[44]), .IN4(n154), .Q(n66) );
  AO22X1 U65 ( .IN1(n95), .IN2(n15), .IN3(mem[45]), .IN4(n153), .Q(n67) );
  AO22X1 U66 ( .IN1(n95), .IN2(n10), .IN3(mem[46]), .IN4(n153), .Q(n68) );
  AO22X1 U67 ( .IN1(n95), .IN2(wdata[7]), .IN3(mem[47]), .IN4(n153), .Q(n69)
         );
  AO22X1 U69 ( .IN1(n168), .IN2(n93), .IN3(mem[48]), .IN4(n152), .Q(n70) );
  AO22X1 U70 ( .IN1(n168), .IN2(n91), .IN3(mem[49]), .IN4(n152), .Q(n71) );
  AO22X1 U71 ( .IN1(n168), .IN2(n89), .IN3(mem[50]), .IN4(n152), .Q(n72) );
  AO22X1 U72 ( .IN1(n168), .IN2(n87), .IN3(mem[51]), .IN4(n152), .Q(n73) );
  AO22X1 U73 ( .IN1(n168), .IN2(n21), .IN3(mem[52]), .IN4(n152), .Q(n74) );
  AO22X1 U74 ( .IN1(n168), .IN2(n15), .IN3(mem[53]), .IN4(n152), .Q(n75) );
  AO22X1 U75 ( .IN1(n168), .IN2(n10), .IN3(mem[54]), .IN4(n152), .Q(n76) );
  AO22X1 U76 ( .IN1(n168), .IN2(n8), .IN3(mem[55]), .IN4(n2), .Q(n77) );
  AO22X1 U78 ( .IN1(n167), .IN2(wdata[0]), .IN3(mem[56]), .IN4(n151), .Q(n78)
         );
  AO22X1 U79 ( .IN1(n167), .IN2(wdata[1]), .IN3(mem[57]), .IN4(n151), .Q(n79)
         );
  AO22X1 U80 ( .IN1(n167), .IN2(wdata[2]), .IN3(mem[58]), .IN4(n151), .Q(n80)
         );
  AO22X1 U81 ( .IN1(n167), .IN2(wdata[3]), .IN3(mem[59]), .IN4(n151), .Q(n81)
         );
  AO22X1 U82 ( .IN1(n167), .IN2(wdata[4]), .IN3(mem[60]), .IN4(n151), .Q(n82)
         );
  AO22X1 U83 ( .IN1(n167), .IN2(wdata[5]), .IN3(mem[61]), .IN4(n151), .Q(n83)
         );
  AO22X1 U84 ( .IN1(n167), .IN2(wdata[6]), .IN3(mem[62]), .IN4(n151), .Q(n84)
         );
  AO22X1 U85 ( .IN1(n167), .IN2(n8), .IN3(mem[63]), .IN4(n96), .Q(n85) );
  NBUFFX2 U2 ( .INP(n128), .Z(n139) );
  NBUFFX2 U3 ( .INP(n125), .Z(n143) );
  NBUFFX2 U4 ( .INP(n129), .Z(n144) );
  NBUFFX2 U5 ( .INP(n126), .Z(n150) );
  NBUFFX2 U6 ( .INP(n128), .Z(n6) );
  NBUFFX2 U7 ( .INP(n126), .Z(n149) );
  NAND3X1 U8 ( .IN1(n165), .IN2(n166), .IN3(n13), .QN(n16) );
  NAND3X1 U9 ( .IN1(waddr[1]), .IN2(n165), .IN3(n18), .QN(n19) );
  OAI22X1 U10 ( .IN1(n4), .IN2(n135), .IN3(n5), .IN4(n3), .QN(rdata[0]) );
  AOI221X1 U11 ( .IN1(mem[16]), .IN2(n137), .IN3(mem[0]), .IN4(n139), .IN5(n98), .QN(n4) );
  NBUFFX2 U12 ( .INP(n125), .Z(n147) );
  NBUFFX2 U13 ( .INP(n126), .Z(n140) );
  NBUFFX2 U22 ( .INP(n125), .Z(n142) );
  NBUFFX2 U31 ( .INP(n129), .Z(n137) );
  NBUFFX2 U40 ( .INP(n125), .Z(n148) );
  NBUFFX2 U49 ( .INP(n126), .Z(n141) );
  NBUFFX2 U50 ( .INP(n129), .Z(n145) );
  NBUFFX2 U59 ( .INP(n129), .Z(n136) );
  NBUFFX2 U68 ( .INP(n1), .Z(n159) );
  NBUFFX2 U77 ( .INP(n2), .Z(n152) );
  NBUFFX2 U86 ( .INP(n96), .Z(n151) );
  NAND3X0 U87 ( .IN1(n165), .IN2(n166), .IN3(n18), .QN(n96) );
  AND2X4 U88 ( .IN1(we), .IN2(waddr[2]), .Q(n13) );
  NAND3X0 U89 ( .IN1(n13), .IN2(n166), .IN3(n164), .QN(n1) );
  NAND3X0 U90 ( .IN1(n164), .IN2(n166), .IN3(n18), .QN(n2) );
  NAND3X0 U91 ( .IN1(waddr[1]), .IN2(n164), .IN3(n18), .QN(n17) );
  NAND3X0 U92 ( .IN1(n164), .IN2(n13), .IN3(waddr[1]), .QN(n12) );
  NBUFFX2 U93 ( .INP(raddr[0]), .Z(n3) );
  AOI221X1 U94 ( .IN1(mem[24]), .IN2(n137), .IN3(mem[8]), .IN4(n139), .IN5(n99), .QN(n5) );
  INVX0 U95 ( .INP(wdata[7]), .ZN(n7) );
  INVX0 U96 ( .INP(n7), .ZN(n8) );
  INVX0 U97 ( .INP(wdata[6]), .ZN(n9) );
  INVX0 U98 ( .INP(n9), .ZN(n10) );
  INVX0 U99 ( .INP(wdata[5]), .ZN(n11) );
  INVX0 U100 ( .INP(n11), .ZN(n15) );
  INVX0 U101 ( .INP(wdata[4]), .ZN(n20) );
  INVX0 U102 ( .INP(n20), .ZN(n21) );
  INVX0 U103 ( .INP(wdata[3]), .ZN(n86) );
  INVX0 U104 ( .INP(n86), .ZN(n87) );
  INVX0 U105 ( .INP(wdata[2]), .ZN(n88) );
  INVX0 U106 ( .INP(n88), .ZN(n89) );
  INVX0 U107 ( .INP(wdata[1]), .ZN(n90) );
  INVX0 U108 ( .INP(n90), .ZN(n91) );
  INVX0 U109 ( .INP(wdata[0]), .ZN(n92) );
  INVX0 U110 ( .INP(n92), .ZN(n93) );
  INVX0 U111 ( .INP(n14), .ZN(n94) );
  INVX0 U112 ( .INP(n19), .ZN(n95) );
  INVX0 U113 ( .INP(n16), .ZN(n97) );
  INVX0 U114 ( .INP(n162), .ZN(n172) );
  INVX0 U115 ( .INP(n155), .ZN(n169) );
  INVX0 U116 ( .INP(n1), .ZN(n171) );
  INVX0 U117 ( .INP(n2), .ZN(n168) );
  INVX0 U118 ( .INP(n96), .ZN(n167) );
  NBUFFX2 U119 ( .INP(n128), .Z(n138) );
  NBUFFX2 U120 ( .INP(n16), .Z(n157) );
  NBUFFX2 U121 ( .INP(n12), .Z(n162) );
  NBUFFX2 U122 ( .INP(n14), .Z(n160) );
  NBUFFX2 U123 ( .INP(n17), .Z(n155) );
  NBUFFX2 U124 ( .INP(n19), .Z(n153) );
  NBUFFX2 U125 ( .INP(n16), .Z(n158) );
  NBUFFX2 U126 ( .INP(n14), .Z(n161) );
  NBUFFX2 U127 ( .INP(n12), .Z(n163) );
  NBUFFX2 U128 ( .INP(n17), .Z(n156) );
  NBUFFX2 U129 ( .INP(n19), .Z(n154) );
  NAND3X1 U130 ( .IN1(n13), .IN2(n165), .IN3(waddr[1]), .QN(n14) );
  NOR2X0 U131 ( .IN1(n170), .IN2(waddr[2]), .QN(n18) );
  INVX0 U132 ( .INP(we), .ZN(n170) );
  NOR2X0 U133 ( .IN1(n132), .IN2(raddr[1]), .QN(n129) );
  NOR2X0 U134 ( .IN1(raddr[1]), .IN2(n133), .QN(n125) );
  AO22X1 U135 ( .IN1(mem[32]), .IN2(n141), .IN3(mem[48]), .IN4(n143), .Q(n98)
         );
  AO22X1 U136 ( .IN1(mem[40]), .IN2(n140), .IN3(mem[56]), .IN4(n148), .Q(n99)
         );
  AO22X1 U137 ( .IN1(mem[33]), .IN2(n149), .IN3(mem[49]), .IN4(n143), .Q(n100)
         );
  AO221X1 U138 ( .IN1(mem[17]), .IN2(n144), .IN3(mem[1]), .IN4(n6), .IN5(n100),
        .Q(n103) );
  AO22X1 U139 ( .IN1(mem[41]), .IN2(n149), .IN3(mem[57]), .IN4(n142), .Q(n101)
         );
  AO221X1 U140 ( .IN1(mem[25]), .IN2(n144), .IN3(mem[9]), .IN4(n6), .IN5(n101),
        .Q(n102) );
  AO22X1 U141 ( .IN1(n103), .IN2(raddr[0]), .IN3(n102), .IN4(n135), .Q(
        rdata[1]) );
  AO22X1 U142 ( .IN1(mem[34]), .IN2(n150), .IN3(mem[50]), .IN4(n147), .Q(n104)
         );
  AO221X1 U143 ( .IN1(mem[18]), .IN2(n136), .IN3(mem[2]), .IN4(n139), .IN5(
        n104), .Q(n107) );
  AO22X1 U144 ( .IN1(mem[42]), .IN2(n150), .IN3(mem[58]), .IN4(n143), .Q(n105)
         );
  AO221X1 U145 ( .IN1(mem[26]), .IN2(n136), .IN3(mem[10]), .IN4(n138), .IN5(
        n105), .Q(n106) );
  AO22X1 U146 ( .IN1(n107), .IN2(n3), .IN3(n106), .IN4(n135), .Q(rdata[2]) );
  AO221X1 U147 ( .IN1(mem[19]), .IN2(n145), .IN3(mem[3]), .IN4(n146), .IN5(
        n108), .Q(n111) );
  AO22X1 U148 ( .IN1(mem[43]), .IN2(n140), .IN3(mem[59]), .IN4(n147), .Q(n109)
         );
  AO221X1 U149 ( .IN1(mem[27]), .IN2(n145), .IN3(mem[11]), .IN4(n138), .IN5(
        n109), .Q(n110) );
  AO22X1 U150 ( .IN1(n111), .IN2(n3), .IN3(n110), .IN4(n135), .Q(rdata[3]) );
  AO22X1 U151 ( .IN1(mem[36]), .IN2(n149), .IN3(mem[52]), .IN4(n147), .Q(n112)
         );
  AO221X1 U152 ( .IN1(mem[20]), .IN2(n144), .IN3(mem[4]), .IN4(n146), .IN5(
        n112), .Q(n115) );
  AO22X1 U153 ( .IN1(mem[44]), .IN2(n150), .IN3(mem[60]), .IN4(n148), .Q(n113)
         );
  AO221X1 U154 ( .IN1(mem[28]), .IN2(n144), .IN3(mem[12]), .IN4(n6), .IN5(n113), .Q(n114) );
  AO22X1 U155 ( .IN1(n115), .IN2(raddr[0]), .IN3(n114), .IN4(n135), .Q(
        rdata[4]) );
  AO22X1 U156 ( .IN1(mem[37]), .IN2(n150), .IN3(mem[53]), .IN4(n148), .Q(n116)
         );
  AO221X1 U157 ( .IN1(mem[21]), .IN2(n137), .IN3(mem[5]), .IN4(n146), .IN5(
        n116), .Q(n119) );
  AO22X1 U158 ( .IN1(mem[45]), .IN2(n140), .IN3(mem[61]), .IN4(n142), .Q(n117)
         );
  AO221X1 U159 ( .IN1(mem[29]), .IN2(n136), .IN3(mem[13]), .IN4(n138), .IN5(
        n117), .Q(n118) );
  AO22X1 U160 ( .IN1(n119), .IN2(n3), .IN3(n118), .IN4(n135), .Q(rdata[5]) );
  AO22X1 U161 ( .IN1(mem[38]), .IN2(n140), .IN3(mem[54]), .IN4(n142), .Q(n120)
         );
  AO221X1 U162 ( .IN1(mem[22]), .IN2(n137), .IN3(mem[6]), .IN4(n146), .IN5(
        n120), .Q(n123) );
  AO22X1 U163 ( .IN1(mem[46]), .IN2(n141), .IN3(mem[62]), .IN4(n143), .Q(n121)
         );
  AO221X1 U164 ( .IN1(mem[30]), .IN2(n145), .IN3(mem[14]), .IN4(n6), .IN5(n121), .Q(n122) );
  AO22X1 U165 ( .IN1(n123), .IN2(n3), .IN3(n122), .IN4(n135), .Q(rdata[6]) );
  AO22X1 U166 ( .IN1(mem[39]), .IN2(n141), .IN3(mem[55]), .IN4(n148), .Q(n124)
         );
  AO221X1 U167 ( .IN1(mem[23]), .IN2(n145), .IN3(mem[7]), .IN4(n146), .IN5(
        n124), .Q(n131) );
  AO22X1 U168 ( .IN1(mem[47]), .IN2(n149), .IN3(mem[63]), .IN4(n147), .Q(n127)
         );
  AO221X1 U169 ( .IN1(mem[31]), .IN2(n136), .IN3(mem[15]), .IN4(n138), .IN5(
        n127), .Q(n130) );
  AO22X1 U170 ( .IN1(n3), .IN2(n131), .IN3(n130), .IN4(n135), .Q(rdata[7]) );
  INVX0 U171 ( .INP(raddr[2]), .ZN(n132) );
  INVX0 U172 ( .INP(n132), .ZN(n133) );
  INVX0 U173 ( .INP(raddr[1]), .ZN(n134) );
  INVX0 U174 ( .INP(raddr[0]), .ZN(n135) );
  NOR2X0 U175 ( .IN1(n132), .IN2(n134), .QN(n128) );
  NOR2X0 U176 ( .IN1(n134), .IN2(n133), .QN(n126) );
  NOR2X0 U177 ( .IN1(n132), .IN2(n134), .QN(n146) );
  AO22X1 U178 ( .IN1(mem[35]), .IN2(n141), .IN3(mem[51]), .IN4(n142), .Q(n108)
         );
  INVX0 U179 ( .INP(n165), .ZN(n164) );
  INVX0 U180 ( .INP(waddr[0]), .ZN(n165) );
  INVX0 U181 ( .INP(waddr[1]), .ZN(n166) );
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
         n258, n259, n260;
  wire   [63:0] mem;

  DFFX1 mem_reg_0__7_ ( .D(n187), .CLK(clk), .Q(mem[63]) );
  DFFX1 mem_reg_0__6_ ( .D(n188), .CLK(clk), .Q(mem[62]) );
  DFFX1 mem_reg_0__5_ ( .D(n189), .CLK(clk), .Q(mem[61]) );
  DFFX1 mem_reg_0__4_ ( .D(n190), .CLK(clk), .Q(mem[60]) );
  DFFX1 mem_reg_0__3_ ( .D(n191), .CLK(clk), .Q(mem[59]) );
  DFFX1 mem_reg_0__2_ ( .D(n192), .CLK(clk), .Q(mem[58]) );
  DFFX1 mem_reg_0__1_ ( .D(n193), .CLK(clk), .Q(mem[57]) );
  DFFX1 mem_reg_0__0_ ( .D(n194), .CLK(clk), .Q(mem[56]) );
  DFFX1 mem_reg_1__7_ ( .D(n195), .CLK(clk), .Q(mem[55]) );
  DFFX1 mem_reg_1__6_ ( .D(n196), .CLK(clk), .Q(mem[54]) );
  DFFX1 mem_reg_1__5_ ( .D(n197), .CLK(clk), .Q(mem[53]) );
  DFFX1 mem_reg_1__4_ ( .D(n198), .CLK(clk), .Q(mem[52]) );
  DFFX1 mem_reg_1__3_ ( .D(n199), .CLK(clk), .Q(mem[51]) );
  DFFX1 mem_reg_1__2_ ( .D(n200), .CLK(clk), .Q(mem[50]) );
  DFFX1 mem_reg_1__1_ ( .D(n201), .CLK(clk), .Q(mem[49]) );
  DFFX1 mem_reg_1__0_ ( .D(n202), .CLK(clk), .Q(mem[48]) );
  DFFX1 mem_reg_2__7_ ( .D(n203), .CLK(clk), .Q(mem[47]) );
  DFFX1 mem_reg_2__6_ ( .D(n204), .CLK(clk), .Q(mem[46]) );
  DFFX1 mem_reg_2__5_ ( .D(n205), .CLK(clk), .Q(mem[45]) );
  DFFX1 mem_reg_2__4_ ( .D(n206), .CLK(clk), .Q(mem[44]) );
  DFFX1 mem_reg_2__3_ ( .D(n207), .CLK(clk), .Q(mem[43]) );
  DFFX1 mem_reg_2__2_ ( .D(n208), .CLK(clk), .Q(mem[42]) );
  DFFX1 mem_reg_2__1_ ( .D(n209), .CLK(clk), .Q(mem[41]) );
  DFFX1 mem_reg_2__0_ ( .D(n210), .CLK(clk), .Q(mem[40]) );
  DFFX1 mem_reg_3__7_ ( .D(n211), .CLK(clk), .Q(mem[39]) );
  DFFX1 mem_reg_3__6_ ( .D(n212), .CLK(clk), .Q(mem[38]) );
  DFFX1 mem_reg_3__5_ ( .D(n213), .CLK(clk), .Q(mem[37]) );
  DFFX1 mem_reg_3__4_ ( .D(n214), .CLK(clk), .Q(mem[36]) );
  DFFX1 mem_reg_3__3_ ( .D(n215), .CLK(clk), .Q(mem[35]) );
  DFFX1 mem_reg_3__2_ ( .D(n216), .CLK(clk), .Q(mem[34]) );
  DFFX1 mem_reg_3__1_ ( .D(n217), .CLK(clk), .Q(mem[33]) );
  DFFX1 mem_reg_3__0_ ( .D(n218), .CLK(clk), .Q(mem[32]) );
  DFFX1 mem_reg_4__7_ ( .D(n219), .CLK(clk), .Q(mem[31]) );
  DFFX1 mem_reg_4__6_ ( .D(n220), .CLK(clk), .Q(mem[30]) );
  DFFX1 mem_reg_4__5_ ( .D(n221), .CLK(clk), .Q(mem[29]) );
  DFFX1 mem_reg_4__4_ ( .D(n222), .CLK(clk), .Q(mem[28]) );
  DFFX1 mem_reg_4__3_ ( .D(n223), .CLK(clk), .Q(mem[27]) );
  DFFX1 mem_reg_4__2_ ( .D(n224), .CLK(clk), .Q(mem[26]) );
  DFFX1 mem_reg_4__1_ ( .D(n225), .CLK(clk), .Q(mem[25]) );
  DFFX1 mem_reg_4__0_ ( .D(n226), .CLK(clk), .Q(mem[24]) );
  DFFX1 mem_reg_5__7_ ( .D(n227), .CLK(clk), .Q(mem[23]) );
  DFFX1 mem_reg_5__6_ ( .D(n228), .CLK(clk), .Q(mem[22]) );
  DFFX1 mem_reg_5__5_ ( .D(n229), .CLK(clk), .Q(mem[21]) );
  DFFX1 mem_reg_5__4_ ( .D(n230), .CLK(clk), .Q(mem[20]) );
  DFFX1 mem_reg_5__3_ ( .D(n231), .CLK(clk), .Q(mem[19]) );
  DFFX1 mem_reg_5__2_ ( .D(n232), .CLK(clk), .Q(mem[18]) );
  DFFX1 mem_reg_5__1_ ( .D(n233), .CLK(clk), .Q(mem[17]) );
  DFFX1 mem_reg_5__0_ ( .D(n234), .CLK(clk), .Q(mem[16]) );
  DFFX1 mem_reg_6__7_ ( .D(n235), .CLK(clk), .Q(mem[15]) );
  DFFX1 mem_reg_6__6_ ( .D(n236), .CLK(clk), .Q(mem[14]) );
  DFFX1 mem_reg_6__5_ ( .D(n237), .CLK(clk), .Q(mem[13]) );
  DFFX1 mem_reg_6__4_ ( .D(n238), .CLK(clk), .Q(mem[12]) );
  DFFX1 mem_reg_6__3_ ( .D(n239), .CLK(clk), .Q(mem[11]) );
  DFFX1 mem_reg_6__2_ ( .D(n240), .CLK(clk), .Q(mem[10]) );
  DFFX1 mem_reg_6__1_ ( .D(n241), .CLK(clk), .Q(mem[9]) );
  DFFX1 mem_reg_6__0_ ( .D(n242), .CLK(clk), .Q(mem[8]) );
  DFFX1 mem_reg_7__7_ ( .D(n243), .CLK(clk), .Q(mem[7]) );
  DFFX1 mem_reg_7__6_ ( .D(n244), .CLK(clk), .Q(mem[6]) );
  DFFX1 mem_reg_7__5_ ( .D(n245), .CLK(clk), .Q(mem[5]) );
  DFFX1 mem_reg_7__4_ ( .D(n246), .CLK(clk), .Q(mem[4]) );
  DFFX1 mem_reg_7__3_ ( .D(n247), .CLK(clk), .Q(mem[3]) );
  DFFX1 mem_reg_7__2_ ( .D(n248), .CLK(clk), .Q(mem[2]) );
  DFFX1 mem_reg_7__1_ ( .D(n249), .CLK(clk), .Q(mem[1]) );
  DFFX1 mem_reg_7__0_ ( .D(n250), .CLK(clk), .Q(mem[0]) );
  AO22X1 U14 ( .IN1(n98), .IN2(n186), .IN3(mem[0]), .IN4(n174), .Q(n250) );
  AO22X1 U15 ( .IN1(n96), .IN2(n158), .IN3(mem[1]), .IN4(n174), .Q(n249) );
  AO22X1 U16 ( .IN1(n94), .IN2(n186), .IN3(mem[2]), .IN4(n174), .Q(n248) );
  AO22X1 U17 ( .IN1(n92), .IN2(n158), .IN3(mem[3]), .IN4(n174), .Q(n247) );
  AO22X1 U18 ( .IN1(wdata[4]), .IN2(n186), .IN3(mem[4]), .IN4(n174), .Q(n246)
         );
  AO22X1 U19 ( .IN1(n88), .IN2(n158), .IN3(mem[5]), .IN4(n173), .Q(n245) );
  AO22X1 U20 ( .IN1(wdata[6]), .IN2(n186), .IN3(mem[6]), .IN4(n173), .Q(n244)
         );
  AO22X1 U21 ( .IN1(n10), .IN2(n158), .IN3(mem[7]), .IN4(n173), .Q(n243) );
  AO22X1 U23 ( .IN1(n185), .IN2(n98), .IN3(mem[8]), .IN4(n172), .Q(n242) );
  AO22X1 U24 ( .IN1(n157), .IN2(n96), .IN3(mem[9]), .IN4(n172), .Q(n241) );
  AO22X1 U25 ( .IN1(n185), .IN2(n94), .IN3(mem[10]), .IN4(n172), .Q(n240) );
  AO22X1 U26 ( .IN1(n157), .IN2(n92), .IN3(mem[11]), .IN4(n172), .Q(n239) );
  AO22X1 U27 ( .IN1(n185), .IN2(n90), .IN3(mem[12]), .IN4(n172), .Q(n238) );
  AO22X1 U28 ( .IN1(n157), .IN2(n88), .IN3(mem[13]), .IN4(n171), .Q(n237) );
  AO22X1 U29 ( .IN1(n185), .IN2(n86), .IN3(mem[14]), .IN4(n171), .Q(n236) );
  AO22X1 U30 ( .IN1(n157), .IN2(n10), .IN3(mem[15]), .IN4(n171), .Q(n235) );
  AO22X1 U32 ( .IN1(n184), .IN2(n98), .IN3(mem[16]), .IN4(n170), .Q(n234) );
  AO22X1 U33 ( .IN1(n153), .IN2(n96), .IN3(mem[17]), .IN4(n170), .Q(n233) );
  AO22X1 U34 ( .IN1(n184), .IN2(n94), .IN3(mem[18]), .IN4(n170), .Q(n232) );
  AO22X1 U35 ( .IN1(n153), .IN2(n92), .IN3(mem[19]), .IN4(n170), .Q(n231) );
  AO22X1 U36 ( .IN1(n184), .IN2(n90), .IN3(mem[20]), .IN4(n170), .Q(n230) );
  AO22X1 U37 ( .IN1(n153), .IN2(n88), .IN3(mem[21]), .IN4(n169), .Q(n229) );
  AO22X1 U38 ( .IN1(n184), .IN2(n86), .IN3(mem[22]), .IN4(n169), .Q(n228) );
  AO22X1 U39 ( .IN1(n153), .IN2(n10), .IN3(mem[23]), .IN4(n169), .Q(n227) );
  AO22X1 U41 ( .IN1(n183), .IN2(n98), .IN3(mem[24]), .IN4(n168), .Q(n226) );
  AO22X1 U42 ( .IN1(n156), .IN2(n96), .IN3(mem[25]), .IN4(n168), .Q(n225) );
  AO22X1 U43 ( .IN1(n183), .IN2(n94), .IN3(mem[26]), .IN4(n168), .Q(n224) );
  AO22X1 U44 ( .IN1(n156), .IN2(n92), .IN3(mem[27]), .IN4(n168), .Q(n223) );
  AO22X1 U45 ( .IN1(n183), .IN2(n90), .IN3(mem[28]), .IN4(n168), .Q(n222) );
  AO22X1 U46 ( .IN1(n156), .IN2(n88), .IN3(mem[29]), .IN4(n167), .Q(n221) );
  AO22X1 U47 ( .IN1(n183), .IN2(n86), .IN3(mem[30]), .IN4(n167), .Q(n220) );
  AO22X1 U48 ( .IN1(n156), .IN2(n10), .IN3(mem[31]), .IN4(n167), .Q(n219) );
  AO22X1 U51 ( .IN1(n181), .IN2(n98), .IN3(mem[32]), .IN4(n166), .Q(n218) );
  AO22X1 U52 ( .IN1(n152), .IN2(n96), .IN3(mem[33]), .IN4(n166), .Q(n217) );
  AO22X1 U53 ( .IN1(n181), .IN2(n94), .IN3(mem[34]), .IN4(n166), .Q(n216) );
  AO22X1 U54 ( .IN1(n152), .IN2(n92), .IN3(mem[35]), .IN4(n166), .Q(n215) );
  AO22X1 U55 ( .IN1(n181), .IN2(n90), .IN3(mem[36]), .IN4(n166), .Q(n214) );
  AO22X1 U56 ( .IN1(n152), .IN2(n88), .IN3(mem[37]), .IN4(n165), .Q(n213) );
  AO22X1 U57 ( .IN1(n181), .IN2(n86), .IN3(mem[38]), .IN4(n165), .Q(n212) );
  AO22X1 U58 ( .IN1(n152), .IN2(n10), .IN3(mem[39]), .IN4(n165), .Q(n211) );
  AO22X1 U60 ( .IN1(n180), .IN2(n98), .IN3(mem[40]), .IN4(n164), .Q(n210) );
  AO22X1 U61 ( .IN1(n151), .IN2(n96), .IN3(mem[41]), .IN4(n164), .Q(n209) );
  AO22X1 U62 ( .IN1(n180), .IN2(n94), .IN3(mem[42]), .IN4(n164), .Q(n208) );
  AO22X1 U63 ( .IN1(n151), .IN2(n92), .IN3(mem[43]), .IN4(n164), .Q(n207) );
  AO22X1 U64 ( .IN1(n180), .IN2(n90), .IN3(mem[44]), .IN4(n164), .Q(n206) );
  AO22X1 U65 ( .IN1(n151), .IN2(n88), .IN3(mem[45]), .IN4(n163), .Q(n205) );
  AO22X1 U66 ( .IN1(n180), .IN2(n86), .IN3(mem[46]), .IN4(n163), .Q(n204) );
  AO22X1 U67 ( .IN1(n151), .IN2(n10), .IN3(mem[47]), .IN4(n163), .Q(n203) );
  AO22X1 U69 ( .IN1(n179), .IN2(n98), .IN3(mem[48]), .IN4(n162), .Q(n202) );
  AO22X1 U70 ( .IN1(n155), .IN2(n96), .IN3(mem[49]), .IN4(n162), .Q(n201) );
  AO22X1 U71 ( .IN1(n179), .IN2(n94), .IN3(mem[50]), .IN4(n162), .Q(n200) );
  AO22X1 U72 ( .IN1(n155), .IN2(n92), .IN3(mem[51]), .IN4(n162), .Q(n199) );
  AO22X1 U73 ( .IN1(n179), .IN2(n90), .IN3(mem[52]), .IN4(n162), .Q(n198) );
  AO22X1 U74 ( .IN1(n155), .IN2(n88), .IN3(mem[53]), .IN4(n161), .Q(n197) );
  AO22X1 U75 ( .IN1(n179), .IN2(n86), .IN3(mem[54]), .IN4(n161), .Q(n196) );
  AO22X1 U76 ( .IN1(n155), .IN2(n10), .IN3(mem[55]), .IN4(n161), .Q(n195) );
  AO22X1 U78 ( .IN1(n178), .IN2(n98), .IN3(mem[56]), .IN4(n160), .Q(n194) );
  AO22X1 U79 ( .IN1(n154), .IN2(n96), .IN3(mem[57]), .IN4(n160), .Q(n193) );
  AO22X1 U80 ( .IN1(n178), .IN2(n94), .IN3(mem[58]), .IN4(n160), .Q(n192) );
  AO22X1 U81 ( .IN1(n154), .IN2(n92), .IN3(mem[59]), .IN4(n160), .Q(n191) );
  AO22X1 U82 ( .IN1(n178), .IN2(n90), .IN3(mem[60]), .IN4(n160), .Q(n190) );
  AO22X1 U83 ( .IN1(n154), .IN2(n88), .IN3(mem[61]), .IN4(n159), .Q(n189) );
  AO22X1 U84 ( .IN1(n178), .IN2(n86), .IN3(mem[62]), .IN4(n159), .Q(n188) );
  AO22X1 U85 ( .IN1(n154), .IN2(n10), .IN3(mem[63]), .IN4(n159), .Q(n187) );
  NBUFFX4 U2 ( .INP(n257), .Z(n169) );
  DELLN1X2 U3 ( .INP(n257), .Z(n170) );
  NAND3X1 U4 ( .IN1(n259), .IN2(n177), .IN3(n175), .QN(n257) );
  NBUFFX4 U5 ( .INP(n252), .Z(n161) );
  DELLN1X2 U6 ( .INP(n252), .Z(n162) );
  NAND3X1 U7 ( .IN1(n175), .IN2(n177), .IN3(n254), .QN(n252) );
  NBUFFX4 U8 ( .INP(n251), .Z(n159) );
  DELLN1X2 U9 ( .INP(n251), .Z(n160) );
  NAND3X2 U10 ( .IN1(n176), .IN2(n177), .IN3(n254), .QN(n251) );
  NAND2X1 U11 ( .IN1(n176), .IN2(n259), .QN(n1) );
  NAND2X0 U12 ( .IN1(n2), .IN2(n177), .QN(n256) );
  INVX0 U13 ( .INP(n1), .ZN(n2) );
  DELLN1X2 U22 ( .INP(n256), .Z(n168) );
  NBUFFX4 U31 ( .INP(n256), .Z(n167) );
  INVX0 U40 ( .INP(n100), .ZN(n141) );
  AND2X1 U49 ( .IN1(we), .IN2(waddr[2]), .Q(n259) );
  AO22X1 U50 ( .IN1(mem[32]), .IN2(n148), .IN3(mem[48]), .IN4(n150), .Q(n102)
         );
  NBUFFX2 U59 ( .INP(n131), .Z(n8) );
  NBUFFX2 U68 ( .INP(n132), .Z(n6) );
  NBUFFX2 U77 ( .INP(n131), .Z(n149) );
  NBUFFX2 U86 ( .INP(n132), .Z(n147) );
  NBUFFX2 U87 ( .INP(n135), .Z(n143) );
  NBUFFX2 U88 ( .INP(n132), .Z(n5) );
  NBUFFX2 U89 ( .INP(n131), .Z(n7) );
  NBUFFX2 U90 ( .INP(n135), .Z(n4) );
  NBUFFX2 U91 ( .INP(n131), .Z(n150) );
  NBUFFX2 U92 ( .INP(n132), .Z(n148) );
  NBUFFX2 U93 ( .INP(n135), .Z(n3) );
  INVX0 U94 ( .INP(n97), .ZN(n98) );
  INVX0 U95 ( .INP(n95), .ZN(n96) );
  INVX0 U96 ( .INP(n93), .ZN(n94) );
  INVX0 U97 ( .INP(n91), .ZN(n92) );
  INVX0 U98 ( .INP(n89), .ZN(n90) );
  INVX0 U99 ( .INP(n87), .ZN(n88) );
  INVX0 U100 ( .INP(n11), .ZN(n86) );
  INVX0 U101 ( .INP(n9), .ZN(n10) );
  NAND3X0 U102 ( .IN1(waddr[1]), .IN2(n176), .IN3(n254), .QN(n253) );
  NAND3X0 U103 ( .IN1(n259), .IN2(n176), .IN3(waddr[1]), .QN(n258) );
  NAND3X0 U104 ( .IN1(waddr[1]), .IN2(n175), .IN3(n254), .QN(n255) );
  NAND3X0 U105 ( .IN1(n175), .IN2(n259), .IN3(waddr[1]), .QN(n260) );
  INVX0 U106 ( .INP(wdata[7]), .ZN(n9) );
  INVX0 U107 ( .INP(wdata[6]), .ZN(n11) );
  INVX0 U108 ( .INP(wdata[5]), .ZN(n87) );
  INVX0 U109 ( .INP(wdata[4]), .ZN(n89) );
  INVX0 U110 ( .INP(wdata[3]), .ZN(n91) );
  INVX0 U111 ( .INP(wdata[2]), .ZN(n93) );
  INVX0 U112 ( .INP(wdata[1]), .ZN(n95) );
  INVX0 U113 ( .INP(wdata[0]), .ZN(n97) );
  INVX0 U114 ( .INP(raddr[0]), .ZN(n99) );
  INVX0 U115 ( .INP(n99), .ZN(n100) );
  INVX0 U116 ( .INP(n99), .ZN(n101) );
  INVX0 U117 ( .INP(n173), .ZN(n186) );
  INVX0 U118 ( .INP(n171), .ZN(n185) );
  INVX0 U119 ( .INP(n167), .ZN(n183) );
  INVX0 U120 ( .INP(n161), .ZN(n179) );
  INVX0 U121 ( .INP(n159), .ZN(n178) );
  INVX0 U122 ( .INP(n169), .ZN(n184) );
  INVX0 U123 ( .INP(n165), .ZN(n181) );
  INVX0 U124 ( .INP(n163), .ZN(n180) );
  NBUFFX2 U125 ( .INP(n134), .Z(n146) );
  NBUFFX2 U126 ( .INP(n134), .Z(n144) );
  NBUFFX2 U127 ( .INP(n134), .Z(n145) );
  NBUFFX2 U128 ( .INP(n260), .Z(n173) );
  NBUFFX2 U129 ( .INP(n258), .Z(n171) );
  NBUFFX2 U130 ( .INP(n260), .Z(n174) );
  NBUFFX2 U131 ( .INP(n258), .Z(n172) );
  NBUFFX2 U132 ( .INP(n255), .Z(n166) );
  NBUFFX2 U133 ( .INP(n253), .Z(n164) );
  NBUFFX2 U134 ( .INP(n255), .Z(n165) );
  NBUFFX2 U135 ( .INP(n253), .Z(n163) );
  NOR2X0 U136 ( .IN1(n140), .IN2(n139), .QN(n132) );
  NBUFFX2 U137 ( .INP(n135), .Z(n142) );
  NOR2X0 U138 ( .IN1(n182), .IN2(waddr[2]), .QN(n254) );
  INVX0 U139 ( .INP(we), .ZN(n182) );
  NOR2X0 U140 ( .IN1(n138), .IN2(raddr[1]), .QN(n135) );
  NOR2X0 U141 ( .IN1(raddr[1]), .IN2(n139), .QN(n131) );
  AO221X1 U142 ( .IN1(mem[16]), .IN2(n143), .IN3(mem[0]), .IN4(n146), .IN5(
        n102), .Q(n105) );
  AO22X1 U143 ( .IN1(mem[40]), .IN2(n148), .IN3(mem[56]), .IN4(n149), .Q(n103)
         );
  AO221X1 U144 ( .IN1(mem[24]), .IN2(n4), .IN3(mem[8]), .IN4(n146), .IN5(n103),
        .Q(n104) );
  AO22X1 U145 ( .IN1(n105), .IN2(n101), .IN3(n104), .IN4(n141), .Q(rdata[0])
         );
  AO22X1 U146 ( .IN1(mem[33]), .IN2(n6), .IN3(mem[49]), .IN4(n150), .Q(n106)
         );
  AO221X1 U147 ( .IN1(mem[17]), .IN2(n143), .IN3(mem[1]), .IN4(n146), .IN5(
        n106), .Q(n109) );
  AO22X1 U148 ( .IN1(mem[41]), .IN2(n6), .IN3(mem[57]), .IN4(n150), .Q(n107)
         );
  AO221X1 U149 ( .IN1(mem[25]), .IN2(n3), .IN3(mem[9]), .IN4(n146), .IN5(n107),
        .Q(n108) );
  AO22X1 U150 ( .IN1(n109), .IN2(n101), .IN3(n108), .IN4(n141), .Q(rdata[1])
         );
  AO22X1 U151 ( .IN1(mem[34]), .IN2(n5), .IN3(mem[50]), .IN4(n8), .Q(n110) );
  AO221X1 U152 ( .IN1(mem[18]), .IN2(n143), .IN3(mem[2]), .IN4(n146), .IN5(
        n110), .Q(n113) );
  AO22X1 U153 ( .IN1(mem[42]), .IN2(n5), .IN3(mem[58]), .IN4(n8), .Q(n111) );
  AO221X1 U154 ( .IN1(mem[26]), .IN2(n4), .IN3(mem[10]), .IN4(n146), .IN5(n111), .Q(n112) );
  AO22X1 U155 ( .IN1(n113), .IN2(n101), .IN3(n112), .IN4(n141), .Q(rdata[2])
         );
  AO22X1 U156 ( .IN1(mem[35]), .IN2(n147), .IN3(mem[51]), .IN4(n7), .Q(n114)
         );
  AO221X1 U157 ( .IN1(mem[19]), .IN2(n143), .IN3(mem[3]), .IN4(n144), .IN5(
        n114), .Q(n117) );
  AO22X1 U158 ( .IN1(mem[43]), .IN2(n147), .IN3(mem[59]), .IN4(n7), .Q(n115)
         );
  AO221X1 U159 ( .IN1(mem[27]), .IN2(n142), .IN3(mem[11]), .IN4(n145), .IN5(
        n115), .Q(n116) );
  AO22X1 U160 ( .IN1(n117), .IN2(n101), .IN3(n116), .IN4(n141), .Q(rdata[3])
         );
  AO22X1 U161 ( .IN1(mem[36]), .IN2(n6), .IN3(mem[52]), .IN4(n8), .Q(n118) );
  AO221X1 U162 ( .IN1(mem[20]), .IN2(n3), .IN3(mem[4]), .IN4(n144), .IN5(n118),
        .Q(n121) );
  AO22X1 U163 ( .IN1(mem[44]), .IN2(n6), .IN3(mem[60]), .IN4(n8), .Q(n119) );
  AO221X1 U164 ( .IN1(mem[28]), .IN2(n142), .IN3(mem[12]), .IN4(n145), .IN5(
        n119), .Q(n120) );
  AO22X1 U165 ( .IN1(n121), .IN2(n101), .IN3(n120), .IN4(n141), .Q(rdata[4])
         );
  AO22X1 U166 ( .IN1(mem[37]), .IN2(n5), .IN3(mem[53]), .IN4(n7), .Q(n122) );
  AO221X1 U167 ( .IN1(mem[21]), .IN2(n4), .IN3(mem[5]), .IN4(n144), .IN5(n122),
        .Q(n125) );
  AO22X1 U168 ( .IN1(mem[45]), .IN2(n5), .IN3(mem[61]), .IN4(n7), .Q(n123) );
  AO221X1 U169 ( .IN1(mem[29]), .IN2(n3), .IN3(mem[13]), .IN4(n145), .IN5(n123), .Q(n124) );
  AO22X1 U170 ( .IN1(n125), .IN2(n101), .IN3(n124), .IN4(n141), .Q(rdata[5])
         );
  AO22X1 U171 ( .IN1(mem[38]), .IN2(n147), .IN3(mem[54]), .IN4(n149), .Q(n126)
         );
  AO221X1 U172 ( .IN1(mem[22]), .IN2(n142), .IN3(mem[6]), .IN4(n144), .IN5(
        n126), .Q(n129) );
  AO22X1 U173 ( .IN1(mem[46]), .IN2(n147), .IN3(mem[62]), .IN4(n149), .Q(n127)
         );
  AO221X1 U174 ( .IN1(mem[30]), .IN2(n4), .IN3(mem[14]), .IN4(n145), .IN5(n127), .Q(n128) );
  AO22X1 U175 ( .IN1(n129), .IN2(n101), .IN3(n128), .IN4(n141), .Q(rdata[6])
         );
  AO22X1 U176 ( .IN1(mem[39]), .IN2(n148), .IN3(mem[55]), .IN4(n149), .Q(n130)
         );
  AO221X1 U177 ( .IN1(mem[23]), .IN2(n3), .IN3(mem[7]), .IN4(n144), .IN5(n130),
        .Q(n137) );
  AO22X1 U178 ( .IN1(mem[47]), .IN2(n148), .IN3(mem[63]), .IN4(n150), .Q(n133)
         );
  AO221X1 U179 ( .IN1(mem[31]), .IN2(n142), .IN3(mem[15]), .IN4(n145), .IN5(
        n133), .Q(n136) );
  AO22X1 U180 ( .IN1(n101), .IN2(n137), .IN3(n136), .IN4(n141), .Q(rdata[7])
         );
  INVX0 U181 ( .INP(raddr[2]), .ZN(n138) );
  INVX0 U182 ( .INP(n138), .ZN(n139) );
  INVX0 U183 ( .INP(raddr[1]), .ZN(n140) );
  NOR2X0 U184 ( .IN1(n138), .IN2(n140), .QN(n134) );
  INVX0 U185 ( .INP(n163), .ZN(n151) );
  INVX0 U186 ( .INP(n165), .ZN(n152) );
  INVX0 U187 ( .INP(n169), .ZN(n153) );
  INVX0 U188 ( .INP(n159), .ZN(n154) );
  INVX0 U189 ( .INP(n161), .ZN(n155) );
  INVX0 U190 ( .INP(n167), .ZN(n156) );
  INVX0 U191 ( .INP(n171), .ZN(n157) );
  INVX0 U192 ( .INP(n173), .ZN(n158) );
  INVX0 U193 ( .INP(n176), .ZN(n175) );
  INVX0 U194 ( .INP(waddr[0]), .ZN(n176) );
  INVX0 U195 ( .INP(waddr[1]), .ZN(n177) );
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
  AO22X1 U14 ( .IN1(wdata[0]), .IN2(n166), .IN3(mem[0]), .IN4(n157), .Q(n230)
         );
  AO22X1 U15 ( .IN1(wdata[1]), .IN2(n166), .IN3(mem[1]), .IN4(n157), .Q(n229)
         );
  AO22X1 U16 ( .IN1(wdata[2]), .IN2(n166), .IN3(mem[2]), .IN4(n157), .Q(n228)
         );
  AO22X1 U17 ( .IN1(wdata[3]), .IN2(n166), .IN3(mem[3]), .IN4(n157), .Q(n227)
         );
  AO22X1 U18 ( .IN1(wdata[4]), .IN2(n166), .IN3(mem[4]), .IN4(n157), .Q(n226)
         );
  AO22X1 U19 ( .IN1(wdata[5]), .IN2(n166), .IN3(mem[5]), .IN4(n156), .Q(n225)
         );
  AO22X1 U20 ( .IN1(wdata[6]), .IN2(n166), .IN3(mem[6]), .IN4(n156), .Q(n224)
         );
  AO22X1 U21 ( .IN1(wdata[7]), .IN2(n166), .IN3(mem[7]), .IN4(n156), .Q(n223)
         );
  AO22X1 U23 ( .IN1(n165), .IN2(wdata[0]), .IN3(mem[8]), .IN4(n155), .Q(n222)
         );
  AO22X1 U24 ( .IN1(n165), .IN2(wdata[1]), .IN3(mem[9]), .IN4(n155), .Q(n221)
         );
  AO22X1 U25 ( .IN1(n165), .IN2(wdata[2]), .IN3(mem[10]), .IN4(n155), .Q(n220)
         );
  AO22X1 U26 ( .IN1(n165), .IN2(wdata[3]), .IN3(mem[11]), .IN4(n155), .Q(n219)
         );
  AO22X1 U27 ( .IN1(n165), .IN2(wdata[4]), .IN3(mem[12]), .IN4(n155), .Q(n218)
         );
  AO22X1 U28 ( .IN1(n165), .IN2(wdata[5]), .IN3(mem[13]), .IN4(n154), .Q(n217)
         );
  AO22X1 U29 ( .IN1(n165), .IN2(wdata[6]), .IN3(mem[14]), .IN4(n154), .Q(n216)
         );
  AO22X1 U30 ( .IN1(n165), .IN2(wdata[7]), .IN3(mem[15]), .IN4(n154), .Q(n215)
         );
  AO22X1 U32 ( .IN1(n137), .IN2(n8), .IN3(mem[16]), .IN4(n153), .Q(n214) );
  AO22X1 U33 ( .IN1(n137), .IN2(n7), .IN3(mem[17]), .IN4(n153), .Q(n213) );
  AO22X1 U34 ( .IN1(n137), .IN2(n6), .IN3(mem[18]), .IN4(n153), .Q(n212) );
  AO22X1 U35 ( .IN1(n137), .IN2(n5), .IN3(mem[19]), .IN4(n153), .Q(n211) );
  AO22X1 U36 ( .IN1(n137), .IN2(n4), .IN3(mem[20]), .IN4(n153), .Q(n210) );
  AO22X1 U37 ( .IN1(n137), .IN2(n3), .IN3(mem[21]), .IN4(n152), .Q(n209) );
  AO22X1 U38 ( .IN1(n137), .IN2(n2), .IN3(mem[22]), .IN4(n152), .Q(n208) );
  AO22X1 U39 ( .IN1(n137), .IN2(n1), .IN3(mem[23]), .IN4(n152), .Q(n207) );
  AO22X1 U41 ( .IN1(n164), .IN2(n8), .IN3(mem[24]), .IN4(n151), .Q(n206) );
  AO22X1 U42 ( .IN1(n164), .IN2(n7), .IN3(mem[25]), .IN4(n151), .Q(n205) );
  AO22X1 U43 ( .IN1(n164), .IN2(n6), .IN3(mem[26]), .IN4(n151), .Q(n204) );
  AO22X1 U44 ( .IN1(n164), .IN2(n5), .IN3(mem[27]), .IN4(n151), .Q(n203) );
  AO22X1 U45 ( .IN1(n164), .IN2(n4), .IN3(mem[28]), .IN4(n151), .Q(n202) );
  AO22X1 U46 ( .IN1(n164), .IN2(n3), .IN3(mem[29]), .IN4(n150), .Q(n201) );
  AO22X1 U47 ( .IN1(n164), .IN2(n2), .IN3(mem[30]), .IN4(n150), .Q(n200) );
  AO22X1 U48 ( .IN1(n164), .IN2(n1), .IN3(mem[31]), .IN4(n150), .Q(n199) );
  AND2X1 U50 ( .IN1(we), .IN2(waddr[2]), .Q(n239) );
  AO22X1 U51 ( .IN1(n162), .IN2(n8), .IN3(mem[32]), .IN4(n149), .Q(n198) );
  AO22X1 U52 ( .IN1(n162), .IN2(n7), .IN3(mem[33]), .IN4(n149), .Q(n197) );
  AO22X1 U53 ( .IN1(n162), .IN2(n6), .IN3(mem[34]), .IN4(n149), .Q(n196) );
  AO22X1 U54 ( .IN1(n162), .IN2(n5), .IN3(mem[35]), .IN4(n149), .Q(n195) );
  AO22X1 U55 ( .IN1(n162), .IN2(n4), .IN3(mem[36]), .IN4(n149), .Q(n194) );
  AO22X1 U56 ( .IN1(n162), .IN2(n3), .IN3(mem[37]), .IN4(n148), .Q(n193) );
  AO22X1 U57 ( .IN1(n162), .IN2(n2), .IN3(mem[38]), .IN4(n148), .Q(n192) );
  AO22X1 U58 ( .IN1(n162), .IN2(n1), .IN3(mem[39]), .IN4(n148), .Q(n191) );
  AO22X1 U60 ( .IN1(n161), .IN2(n8), .IN3(mem[40]), .IN4(n147), .Q(n190) );
  AO22X1 U61 ( .IN1(n161), .IN2(n7), .IN3(mem[41]), .IN4(n147), .Q(n189) );
  AO22X1 U62 ( .IN1(n161), .IN2(n6), .IN3(mem[42]), .IN4(n147), .Q(n188) );
  AO22X1 U63 ( .IN1(n161), .IN2(n5), .IN3(mem[43]), .IN4(n147), .Q(n187) );
  AO22X1 U64 ( .IN1(n161), .IN2(n4), .IN3(mem[44]), .IN4(n147), .Q(n186) );
  AO22X1 U65 ( .IN1(n161), .IN2(n3), .IN3(mem[45]), .IN4(n146), .Q(n185) );
  AO22X1 U66 ( .IN1(n161), .IN2(n2), .IN3(mem[46]), .IN4(n146), .Q(n184) );
  AO22X1 U67 ( .IN1(n161), .IN2(n1), .IN3(mem[47]), .IN4(n146), .Q(n183) );
  AO22X1 U69 ( .IN1(n139), .IN2(n8), .IN3(mem[48]), .IN4(n145), .Q(n182) );
  AO22X1 U70 ( .IN1(n139), .IN2(n7), .IN3(mem[49]), .IN4(n145), .Q(n181) );
  AO22X1 U71 ( .IN1(n139), .IN2(n6), .IN3(mem[50]), .IN4(n145), .Q(n180) );
  AO22X1 U72 ( .IN1(n139), .IN2(n5), .IN3(mem[51]), .IN4(n145), .Q(n179) );
  AO22X1 U73 ( .IN1(n139), .IN2(n4), .IN3(mem[52]), .IN4(n145), .Q(n178) );
  AO22X1 U74 ( .IN1(n139), .IN2(n3), .IN3(mem[53]), .IN4(n144), .Q(n177) );
  AO22X1 U75 ( .IN1(n139), .IN2(n2), .IN3(mem[54]), .IN4(n144), .Q(n176) );
  AO22X1 U76 ( .IN1(n139), .IN2(n1), .IN3(mem[55]), .IN4(n144), .Q(n175) );
  AO22X1 U78 ( .IN1(n138), .IN2(n8), .IN3(mem[56]), .IN4(n143), .Q(n174) );
  AO22X1 U79 ( .IN1(n138), .IN2(n7), .IN3(mem[57]), .IN4(n143), .Q(n173) );
  AO22X1 U80 ( .IN1(n138), .IN2(n6), .IN3(mem[58]), .IN4(n143), .Q(n172) );
  AO22X1 U81 ( .IN1(n138), .IN2(n5), .IN3(mem[59]), .IN4(n143), .Q(n171) );
  AO22X1 U82 ( .IN1(n138), .IN2(n4), .IN3(mem[60]), .IN4(n143), .Q(n170) );
  AO22X1 U83 ( .IN1(n138), .IN2(n3), .IN3(mem[61]), .IN4(n142), .Q(n169) );
  AO22X1 U84 ( .IN1(n138), .IN2(n2), .IN3(mem[62]), .IN4(n142), .Q(n168) );
  AO22X1 U85 ( .IN1(n138), .IN2(n1), .IN3(mem[63]), .IN4(n142), .Q(n167) );
  NBUFFX2 U2 ( .INP(n119), .Z(n87) );
  NBUFFX2 U3 ( .INP(n121), .Z(n132) );
  NBUFFX2 U4 ( .INP(n122), .Z(n129) );
  NBUFFX2 U5 ( .INP(n118), .Z(n136) );
  NBUFFX2 U6 ( .INP(n119), .Z(n133) );
  NBUFFX2 U7 ( .INP(n118), .Z(n135) );
  AO22X1 U8 ( .IN1(mem[38]), .IN2(n133), .IN3(mem[54]), .IN4(n135), .Q(n113)
         );
  NBUFFX2 U9 ( .INP(n122), .Z(n86) );
  NBUFFX2 U10 ( .INP(n122), .Z(n11) );
  NBUFFX2 U11 ( .INP(n122), .Z(n128) );
  AOI221X1 U12 ( .IN1(mem[24]), .IN2(n129), .IN3(mem[8]), .IN4(n132), .IN5(n92), .QN(n10) );
  AOI221X1 U13 ( .IN1(mem[16]), .IN2(n129), .IN3(mem[0]), .IN4(n132), .IN5(n91), .QN(n9) );
  AO22X1 U22 ( .IN1(n96), .IN2(n141), .IN3(n95), .IN4(n140), .Q(rdata[1]) );
  AO22X1 U31 ( .IN1(n104), .IN2(n141), .IN3(n103), .IN4(n140), .Q(rdata[3]) );
  AO22X1 U40 ( .IN1(n108), .IN2(n141), .IN3(n107), .IN4(n140), .Q(rdata[4]) );
  AO22X1 U49 ( .IN1(n116), .IN2(n141), .IN3(n115), .IN4(n140), .Q(rdata[6]) );
  NBUFFX4 U59 ( .INP(wdata[6]), .Z(n2) );
  NBUFFX4 U68 ( .INP(wdata[3]), .Z(n5) );
  NBUFFX4 U77 ( .INP(wdata[2]), .Z(n6) );
  NBUFFX4 U86 ( .INP(wdata[1]), .Z(n7) );
  NBUFFX4 U87 ( .INP(wdata[0]), .Z(n8) );
  INVX0 U88 ( .INP(n140), .ZN(n141) );
  NAND3X0 U89 ( .IN1(n239), .IN2(n159), .IN3(waddr[1]), .QN(n238) );
  NAND3X0 U90 ( .IN1(waddr[1]), .IN2(n159), .IN3(n234), .QN(n233) );
  NAND3X0 U91 ( .IN1(n158), .IN2(n239), .IN3(waddr[1]), .QN(n240) );
  NAND3X0 U92 ( .IN1(waddr[1]), .IN2(n158), .IN3(n234), .QN(n235) );
  NBUFFX2 U93 ( .INP(n118), .Z(n90) );
  NBUFFX2 U94 ( .INP(n118), .Z(n89) );
  NBUFFX2 U95 ( .INP(n119), .Z(n88) );
  NBUFFX2 U96 ( .INP(n119), .Z(n134) );
  NBUFFX2 U97 ( .INP(wdata[7]), .Z(n1) );
  NBUFFX2 U98 ( .INP(wdata[5]), .Z(n3) );
  NBUFFX2 U99 ( .INP(wdata[4]), .Z(n4) );
  OAI22X1 U100 ( .IN1(n9), .IN2(n140), .IN3(n10), .IN4(n141), .QN(rdata[0]) );
  INVX0 U101 ( .INP(n150), .ZN(n164) );
  INVX0 U102 ( .INP(n156), .ZN(n166) );
  INVX0 U103 ( .INP(n154), .ZN(n165) );
  NBUFFX2 U104 ( .INP(n237), .Z(n153) );
  NBUFFX2 U105 ( .INP(n232), .Z(n144) );
  NBUFFX2 U106 ( .INP(n231), .Z(n142) );
  NBUFFX2 U107 ( .INP(n236), .Z(n150) );
  NBUFFX2 U108 ( .INP(n237), .Z(n152) );
  NBUFFX2 U109 ( .INP(n236), .Z(n151) );
  NBUFFX2 U110 ( .INP(n232), .Z(n145) );
  NBUFFX2 U111 ( .INP(n231), .Z(n143) );
  NBUFFX2 U112 ( .INP(n240), .Z(n157) );
  NBUFFX2 U113 ( .INP(n238), .Z(n155) );
  NBUFFX2 U114 ( .INP(n240), .Z(n156) );
  NBUFFX2 U115 ( .INP(n238), .Z(n154) );
  NBUFFX2 U116 ( .INP(n235), .Z(n149) );
  NBUFFX2 U117 ( .INP(n233), .Z(n147) );
  NBUFFX2 U118 ( .INP(n235), .Z(n148) );
  NBUFFX2 U119 ( .INP(n233), .Z(n146) );
  NAND3X0 U120 ( .IN1(n159), .IN2(n160), .IN3(n239), .QN(n236) );
  NAND3X0 U121 ( .IN1(n158), .IN2(n160), .IN3(n234), .QN(n232) );
  NAND3X0 U122 ( .IN1(n159), .IN2(n160), .IN3(n234), .QN(n231) );
  NAND3X0 U123 ( .IN1(n239), .IN2(n160), .IN3(n158), .QN(n237) );
  NOR2X0 U124 ( .IN1(n163), .IN2(waddr[2]), .QN(n234) );
  INVX0 U125 ( .INP(we), .ZN(n163) );
  AO22X1 U126 ( .IN1(mem[41]), .IN2(n87), .IN3(mem[57]), .IN4(n89), .Q(n94) );
  AO22X1 U127 ( .IN1(mem[42]), .IN2(n87), .IN3(mem[58]), .IN4(n89), .Q(n98) );
  AO22X1 U128 ( .IN1(mem[43]), .IN2(n133), .IN3(mem[59]), .IN4(n135), .Q(n102)
         );
  AO22X1 U129 ( .IN1(mem[33]), .IN2(n88), .IN3(mem[49]), .IN4(n90), .Q(n93) );
  AO22X1 U130 ( .IN1(mem[34]), .IN2(n134), .IN3(mem[50]), .IN4(n136), .Q(n97)
         );
  AO22X1 U131 ( .IN1(mem[35]), .IN2(n134), .IN3(mem[51]), .IN4(n136), .Q(n101)
         );
  NOR2X0 U132 ( .IN1(n125), .IN2(raddr[1]), .QN(n122) );
  NOR2X0 U133 ( .IN1(raddr[1]), .IN2(n126), .QN(n118) );
  AO22X1 U134 ( .IN1(mem[32]), .IN2(n88), .IN3(mem[48]), .IN4(n90), .Q(n91) );
  AO22X1 U135 ( .IN1(mem[40]), .IN2(n88), .IN3(mem[56]), .IN4(n90), .Q(n92) );
  AO221X1 U136 ( .IN1(mem[17]), .IN2(n86), .IN3(mem[1]), .IN4(n132), .IN5(n93),
        .Q(n96) );
  AO221X1 U137 ( .IN1(mem[25]), .IN2(n11), .IN3(mem[9]), .IN4(n132), .IN5(n94),
        .Q(n95) );
  AO221X1 U138 ( .IN1(mem[18]), .IN2(n128), .IN3(mem[2]), .IN4(n132), .IN5(n97), .Q(n100) );
  AO221X1 U139 ( .IN1(mem[26]), .IN2(n86), .IN3(mem[10]), .IN4(n132), .IN5(n98), .Q(n99) );
  AO22X1 U140 ( .IN1(n100), .IN2(n141), .IN3(n99), .IN4(n140), .Q(rdata[2]) );
  AO221X1 U141 ( .IN1(mem[19]), .IN2(n129), .IN3(mem[3]), .IN4(n130), .IN5(
        n101), .Q(n104) );
  AO221X1 U142 ( .IN1(mem[27]), .IN2(n128), .IN3(mem[11]), .IN4(n131), .IN5(
        n102), .Q(n103) );
  AO22X1 U143 ( .IN1(mem[36]), .IN2(n88), .IN3(mem[52]), .IN4(n90), .Q(n105)
         );
  AO221X1 U144 ( .IN1(mem[20]), .IN2(n11), .IN3(mem[4]), .IN4(n130), .IN5(n105), .Q(n108) );
  AO22X1 U145 ( .IN1(mem[44]), .IN2(n133), .IN3(mem[60]), .IN4(n135), .Q(n106)
         );
  AO221X1 U146 ( .IN1(mem[28]), .IN2(n128), .IN3(mem[12]), .IN4(n131), .IN5(
        n106), .Q(n107) );
  AO22X1 U147 ( .IN1(mem[37]), .IN2(n134), .IN3(mem[53]), .IN4(n136), .Q(n109)
         );
  AO221X1 U148 ( .IN1(mem[21]), .IN2(n86), .IN3(mem[5]), .IN4(n130), .IN5(n109), .Q(n112) );
  AO22X1 U149 ( .IN1(mem[45]), .IN2(n87), .IN3(mem[61]), .IN4(n89), .Q(n110)
         );
  AO221X1 U150 ( .IN1(mem[29]), .IN2(n11), .IN3(mem[13]), .IN4(n131), .IN5(
        n110), .Q(n111) );
  AO22X1 U151 ( .IN1(n112), .IN2(n141), .IN3(n111), .IN4(n140), .Q(rdata[5])
         );
  AO221X1 U152 ( .IN1(mem[22]), .IN2(n128), .IN3(mem[6]), .IN4(n130), .IN5(
        n113), .Q(n116) );
  AO22X1 U153 ( .IN1(mem[46]), .IN2(n133), .IN3(mem[62]), .IN4(n135), .Q(n114)
         );
  AO221X1 U154 ( .IN1(mem[30]), .IN2(n86), .IN3(mem[14]), .IN4(n131), .IN5(
        n114), .Q(n115) );
  AO22X1 U155 ( .IN1(mem[39]), .IN2(n87), .IN3(mem[55]), .IN4(n89), .Q(n117)
         );
  AO221X1 U156 ( .IN1(mem[23]), .IN2(n11), .IN3(mem[7]), .IN4(n130), .IN5(n117), .Q(n124) );
  AO22X1 U157 ( .IN1(mem[47]), .IN2(n134), .IN3(mem[63]), .IN4(n89), .Q(n120)
         );
  AO221X1 U158 ( .IN1(mem[31]), .IN2(n128), .IN3(mem[15]), .IN4(n131), .IN5(
        n120), .Q(n123) );
  AO22X1 U159 ( .IN1(n141), .IN2(n124), .IN3(n123), .IN4(n140), .Q(rdata[7])
         );
  INVX0 U160 ( .INP(raddr[2]), .ZN(n125) );
  INVX0 U161 ( .INP(n125), .ZN(n126) );
  INVX0 U162 ( .INP(raddr[1]), .ZN(n127) );
  NBUFFX2 U163 ( .INP(n121), .Z(n130) );
  NBUFFX2 U164 ( .INP(n121), .Z(n131) );
  NOR2X0 U165 ( .IN1(n127), .IN2(n126), .QN(n119) );
  NOR2X0 U166 ( .IN1(n125), .IN2(n127), .QN(n121) );
  INVX0 U167 ( .INP(n146), .ZN(n161) );
  INVX0 U168 ( .INP(n148), .ZN(n162) );
  INVX0 U169 ( .INP(n152), .ZN(n137) );
  INVX0 U170 ( .INP(n142), .ZN(n138) );
  INVX0 U171 ( .INP(n144), .ZN(n139) );
  INVX0 U172 ( .INP(raddr[0]), .ZN(n140) );
  INVX0 U173 ( .INP(n159), .ZN(n158) );
  INVX0 U174 ( .INP(waddr[0]), .ZN(n159) );
  INVX0 U175 ( .INP(waddr[1]), .ZN(n160) );
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
         n247, n248, n249, n250, n251, n252, n253, n254, n255, n256, n257,
         n258, n259, n260, n261;
  wire   [63:0] mem;

  DFFX1 mem_reg_0__7_ ( .D(n188), .CLK(clk), .Q(mem[63]) );
  DFFX1 mem_reg_0__6_ ( .D(n189), .CLK(clk), .Q(mem[62]) );
  DFFX1 mem_reg_0__5_ ( .D(n190), .CLK(clk), .Q(mem[61]) );
  DFFX1 mem_reg_0__4_ ( .D(n191), .CLK(clk), .Q(mem[60]) );
  DFFX1 mem_reg_0__3_ ( .D(n192), .CLK(clk), .Q(mem[59]) );
  DFFX1 mem_reg_0__2_ ( .D(n193), .CLK(clk), .Q(mem[58]) );
  DFFX1 mem_reg_0__1_ ( .D(n194), .CLK(clk), .Q(mem[57]) );
  DFFX1 mem_reg_0__0_ ( .D(n195), .CLK(clk), .Q(mem[56]) );
  DFFX1 mem_reg_1__7_ ( .D(n196), .CLK(clk), .Q(mem[55]) );
  DFFX1 mem_reg_1__6_ ( .D(n197), .CLK(clk), .Q(mem[54]) );
  DFFX1 mem_reg_1__5_ ( .D(n198), .CLK(clk), .Q(mem[53]) );
  DFFX1 mem_reg_1__4_ ( .D(n199), .CLK(clk), .Q(mem[52]), .QN(n90) );
  DFFX1 mem_reg_1__3_ ( .D(n200), .CLK(clk), .Q(mem[51]) );
  DFFX1 mem_reg_1__2_ ( .D(n201), .CLK(clk), .Q(mem[50]) );
  DFFX1 mem_reg_1__1_ ( .D(n202), .CLK(clk), .Q(mem[49]) );
  DFFX1 mem_reg_1__0_ ( .D(n203), .CLK(clk), .Q(mem[48]) );
  DFFX1 mem_reg_2__7_ ( .D(n204), .CLK(clk), .Q(mem[47]) );
  DFFX1 mem_reg_2__6_ ( .D(n205), .CLK(clk), .Q(mem[46]) );
  DFFX1 mem_reg_2__5_ ( .D(n206), .CLK(clk), .Q(mem[45]) );
  DFFX1 mem_reg_2__4_ ( .D(n207), .CLK(clk), .Q(mem[44]) );
  DFFX1 mem_reg_2__3_ ( .D(n208), .CLK(clk), .Q(mem[43]) );
  DFFX1 mem_reg_2__2_ ( .D(n209), .CLK(clk), .Q(mem[42]) );
  DFFX1 mem_reg_2__1_ ( .D(n210), .CLK(clk), .Q(mem[41]) );
  DFFX1 mem_reg_2__0_ ( .D(n211), .CLK(clk), .Q(mem[40]) );
  DFFX1 mem_reg_3__7_ ( .D(n212), .CLK(clk), .Q(mem[39]) );
  DFFX1 mem_reg_3__6_ ( .D(n213), .CLK(clk), .Q(mem[38]) );
  DFFX1 mem_reg_3__5_ ( .D(n214), .CLK(clk), .Q(mem[37]) );
  DFFX1 mem_reg_3__4_ ( .D(n215), .CLK(clk), .Q(mem[36]), .QN(n89) );
  DFFX1 mem_reg_3__3_ ( .D(n216), .CLK(clk), .Q(mem[35]) );
  DFFX1 mem_reg_3__2_ ( .D(n217), .CLK(clk), .Q(mem[34]) );
  DFFX1 mem_reg_3__1_ ( .D(n218), .CLK(clk), .Q(mem[33]) );
  DFFX1 mem_reg_3__0_ ( .D(n219), .CLK(clk), .Q(mem[32]) );
  DFFX1 mem_reg_4__7_ ( .D(n220), .CLK(clk), .Q(mem[31]) );
  DFFX1 mem_reg_4__6_ ( .D(n221), .CLK(clk), .Q(mem[30]) );
  DFFX1 mem_reg_4__5_ ( .D(n222), .CLK(clk), .Q(mem[29]) );
  DFFX1 mem_reg_4__4_ ( .D(n223), .CLK(clk), .Q(mem[28]) );
  DFFX1 mem_reg_4__3_ ( .D(n224), .CLK(clk), .Q(mem[27]) );
  DFFX1 mem_reg_4__2_ ( .D(n225), .CLK(clk), .Q(mem[26]) );
  DFFX1 mem_reg_4__1_ ( .D(n226), .CLK(clk), .Q(mem[25]) );
  DFFX1 mem_reg_4__0_ ( .D(n227), .CLK(clk), .Q(mem[24]) );
  DFFX1 mem_reg_5__7_ ( .D(n228), .CLK(clk), .Q(mem[23]) );
  DFFX1 mem_reg_5__6_ ( .D(n229), .CLK(clk), .Q(mem[22]) );
  DFFX1 mem_reg_5__5_ ( .D(n230), .CLK(clk), .Q(mem[21]) );
  DFFX1 mem_reg_5__4_ ( .D(n231), .CLK(clk), .Q(mem[20]) );
  DFFX1 mem_reg_5__3_ ( .D(n232), .CLK(clk), .Q(mem[19]) );
  DFFX1 mem_reg_5__2_ ( .D(n233), .CLK(clk), .Q(mem[18]) );
  DFFX1 mem_reg_5__1_ ( .D(n234), .CLK(clk), .Q(mem[17]) );
  DFFX1 mem_reg_5__0_ ( .D(n235), .CLK(clk), .Q(mem[16]) );
  DFFX1 mem_reg_6__7_ ( .D(n236), .CLK(clk), .Q(mem[15]) );
  DFFX1 mem_reg_6__6_ ( .D(n237), .CLK(clk), .Q(mem[14]) );
  DFFX1 mem_reg_6__5_ ( .D(n238), .CLK(clk), .Q(mem[13]) );
  DFFX1 mem_reg_6__4_ ( .D(n239), .CLK(clk), .Q(mem[12]) );
  DFFX1 mem_reg_6__3_ ( .D(n240), .CLK(clk), .Q(mem[11]) );
  DFFX1 mem_reg_6__2_ ( .D(n241), .CLK(clk), .Q(mem[10]) );
  DFFX1 mem_reg_6__1_ ( .D(n242), .CLK(clk), .Q(mem[9]) );
  DFFX1 mem_reg_6__0_ ( .D(n243), .CLK(clk), .Q(mem[8]) );
  DFFX1 mem_reg_7__7_ ( .D(n244), .CLK(clk), .Q(mem[7]) );
  DFFX1 mem_reg_7__6_ ( .D(n245), .CLK(clk), .Q(mem[6]) );
  DFFX1 mem_reg_7__5_ ( .D(n246), .CLK(clk), .Q(mem[5]) );
  DFFX1 mem_reg_7__4_ ( .D(n247), .CLK(clk), .Q(mem[4]) );
  DFFX1 mem_reg_7__3_ ( .D(n248), .CLK(clk), .Q(mem[3]) );
  DFFX1 mem_reg_7__2_ ( .D(n249), .CLK(clk), .Q(mem[2]) );
  DFFX1 mem_reg_7__1_ ( .D(n250), .CLK(clk), .Q(mem[1]) );
  DFFX1 mem_reg_7__0_ ( .D(n251), .CLK(clk), .Q(mem[0]) );
  AO22X1 U14 ( .IN1(wdata[0]), .IN2(n153), .IN3(mem[0]), .IN4(n178), .Q(n251)
         );
  AO22X1 U15 ( .IN1(wdata[1]), .IN2(n153), .IN3(mem[1]), .IN4(n178), .Q(n250)
         );
  AO22X1 U16 ( .IN1(wdata[2]), .IN2(n153), .IN3(mem[2]), .IN4(n178), .Q(n249)
         );
  AO22X1 U17 ( .IN1(wdata[3]), .IN2(n154), .IN3(mem[3]), .IN4(n178), .Q(n248)
         );
  AO22X1 U18 ( .IN1(wdata[4]), .IN2(n153), .IN3(mem[4]), .IN4(n178), .Q(n247)
         );
  AO22X1 U19 ( .IN1(wdata[5]), .IN2(n154), .IN3(mem[5]), .IN4(n177), .Q(n246)
         );
  AO22X1 U20 ( .IN1(wdata[6]), .IN2(n153), .IN3(mem[6]), .IN4(n177), .Q(n245)
         );
  AO22X1 U21 ( .IN1(wdata[7]), .IN2(n154), .IN3(mem[7]), .IN4(n177), .Q(n244)
         );
  AO22X1 U23 ( .IN1(n187), .IN2(n9), .IN3(mem[8]), .IN4(n176), .Q(n243) );
  AO22X1 U24 ( .IN1(n152), .IN2(n8), .IN3(mem[9]), .IN4(n176), .Q(n242) );
  AO22X1 U25 ( .IN1(n187), .IN2(n7), .IN3(mem[10]), .IN4(n176), .Q(n241) );
  AO22X1 U26 ( .IN1(n152), .IN2(n6), .IN3(mem[11]), .IN4(n176), .Q(n240) );
  AO22X1 U27 ( .IN1(n187), .IN2(wdata[4]), .IN3(mem[12]), .IN4(n176), .Q(n239)
         );
  AO22X1 U28 ( .IN1(n152), .IN2(n5), .IN3(mem[13]), .IN4(n175), .Q(n238) );
  AO22X1 U29 ( .IN1(n187), .IN2(wdata[6]), .IN3(mem[14]), .IN4(n175), .Q(n237)
         );
  AO22X1 U30 ( .IN1(n152), .IN2(n4), .IN3(mem[15]), .IN4(n175), .Q(n236) );
  AO22X1 U32 ( .IN1(n186), .IN2(n9), .IN3(mem[16]), .IN4(n174), .Q(n235) );
  AO22X1 U33 ( .IN1(n155), .IN2(n8), .IN3(mem[17]), .IN4(n174), .Q(n234) );
  AO22X1 U34 ( .IN1(n186), .IN2(n7), .IN3(mem[18]), .IN4(n174), .Q(n233) );
  AO22X1 U35 ( .IN1(n155), .IN2(n6), .IN3(mem[19]), .IN4(n174), .Q(n232) );
  AO22X1 U36 ( .IN1(n186), .IN2(n11), .IN3(mem[20]), .IN4(n174), .Q(n231) );
  AO22X1 U37 ( .IN1(n155), .IN2(n5), .IN3(mem[21]), .IN4(n173), .Q(n230) );
  AO22X1 U38 ( .IN1(n186), .IN2(n10), .IN3(mem[22]), .IN4(n173), .Q(n229) );
  AO22X1 U39 ( .IN1(n155), .IN2(n4), .IN3(mem[23]), .IN4(n173), .Q(n228) );
  AO22X1 U41 ( .IN1(n185), .IN2(n9), .IN3(mem[24]), .IN4(n172), .Q(n227) );
  AO22X1 U42 ( .IN1(n158), .IN2(n8), .IN3(mem[25]), .IN4(n172), .Q(n226) );
  AO22X1 U43 ( .IN1(n185), .IN2(n7), .IN3(mem[26]), .IN4(n172), .Q(n225) );
  AO22X1 U44 ( .IN1(n158), .IN2(n6), .IN3(mem[27]), .IN4(n172), .Q(n224) );
  AO22X1 U45 ( .IN1(n185), .IN2(n11), .IN3(mem[28]), .IN4(n172), .Q(n223) );
  AO22X1 U46 ( .IN1(n158), .IN2(n5), .IN3(mem[29]), .IN4(n171), .Q(n222) );
  AO22X1 U47 ( .IN1(n185), .IN2(n10), .IN3(mem[30]), .IN4(n171), .Q(n221) );
  AO22X1 U48 ( .IN1(n158), .IN2(n4), .IN3(mem[31]), .IN4(n171), .Q(n220) );
  AND2X1 U50 ( .IN1(we), .IN2(waddr[2]), .Q(n260) );
  AO22X1 U51 ( .IN1(n161), .IN2(wdata[0]), .IN3(mem[32]), .IN4(n170), .Q(n219)
         );
  AO22X1 U52 ( .IN1(n161), .IN2(wdata[1]), .IN3(mem[33]), .IN4(n170), .Q(n218)
         );
  AO22X1 U53 ( .IN1(n161), .IN2(wdata[2]), .IN3(mem[34]), .IN4(n170), .Q(n217)
         );
  AO22X1 U54 ( .IN1(n162), .IN2(wdata[3]), .IN3(mem[35]), .IN4(n170), .Q(n216)
         );
  AO22X1 U55 ( .IN1(n161), .IN2(n11), .IN3(mem[36]), .IN4(n170), .Q(n215) );
  AO22X1 U56 ( .IN1(n162), .IN2(wdata[5]), .IN3(mem[37]), .IN4(n169), .Q(n214)
         );
  AO22X1 U57 ( .IN1(n162), .IN2(n10), .IN3(mem[38]), .IN4(n169), .Q(n213) );
  AO22X1 U58 ( .IN1(n162), .IN2(wdata[7]), .IN3(mem[39]), .IN4(n169), .Q(n212)
         );
  AO22X1 U60 ( .IN1(n159), .IN2(n9), .IN3(mem[40]), .IN4(n168), .Q(n211) );
  AO22X1 U61 ( .IN1(n159), .IN2(n8), .IN3(mem[41]), .IN4(n168), .Q(n210) );
  AO22X1 U62 ( .IN1(n159), .IN2(n7), .IN3(mem[42]), .IN4(n168), .Q(n209) );
  AO22X1 U63 ( .IN1(n160), .IN2(n6), .IN3(mem[43]), .IN4(n168), .Q(n208) );
  AO22X1 U64 ( .IN1(n159), .IN2(n11), .IN3(mem[44]), .IN4(n168), .Q(n207) );
  AO22X1 U65 ( .IN1(n160), .IN2(n5), .IN3(mem[45]), .IN4(n167), .Q(n206) );
  AO22X1 U66 ( .IN1(n160), .IN2(n10), .IN3(mem[46]), .IN4(n167), .Q(n205) );
  AO22X1 U67 ( .IN1(n160), .IN2(n4), .IN3(mem[47]), .IN4(n167), .Q(n204) );
  AO22X1 U69 ( .IN1(n183), .IN2(n9), .IN3(mem[48]), .IN4(n166), .Q(n203) );
  AO22X1 U70 ( .IN1(n157), .IN2(n8), .IN3(mem[49]), .IN4(n166), .Q(n202) );
  AO22X1 U71 ( .IN1(n183), .IN2(n7), .IN3(mem[50]), .IN4(n166), .Q(n201) );
  AO22X1 U72 ( .IN1(n157), .IN2(n6), .IN3(mem[51]), .IN4(n166), .Q(n200) );
  AO22X1 U73 ( .IN1(n183), .IN2(n11), .IN3(mem[52]), .IN4(n166), .Q(n199) );
  AO22X1 U74 ( .IN1(n157), .IN2(n5), .IN3(mem[53]), .IN4(n165), .Q(n198) );
  AO22X1 U75 ( .IN1(n183), .IN2(n10), .IN3(mem[54]), .IN4(n165), .Q(n197) );
  AO22X1 U76 ( .IN1(n157), .IN2(n4), .IN3(mem[55]), .IN4(n165), .Q(n196) );
  AO22X1 U78 ( .IN1(n182), .IN2(n9), .IN3(mem[56]), .IN4(n164), .Q(n195) );
  AO22X1 U79 ( .IN1(n156), .IN2(n8), .IN3(mem[57]), .IN4(n164), .Q(n194) );
  AO22X1 U80 ( .IN1(n182), .IN2(n7), .IN3(mem[58]), .IN4(n164), .Q(n193) );
  AO22X1 U81 ( .IN1(n156), .IN2(n6), .IN3(mem[59]), .IN4(n164), .Q(n192) );
  AO22X1 U82 ( .IN1(n182), .IN2(n11), .IN3(mem[60]), .IN4(n164), .Q(n191) );
  AO22X1 U83 ( .IN1(n156), .IN2(n5), .IN3(mem[61]), .IN4(n163), .Q(n190) );
  AO22X1 U84 ( .IN1(n182), .IN2(n10), .IN3(mem[62]), .IN4(n163), .Q(n189) );
  AO22X1 U85 ( .IN1(n156), .IN2(n4), .IN3(mem[63]), .IN4(n163), .Q(n188) );
  AOI221X1 U2 ( .IN1(mem[18]), .IN2(n146), .IN3(mem[2]), .IN4(n148), .IN5(n120), .QN(n97) );
  NBUFFX2 U3 ( .INP(n148), .Z(n96) );
  NBUFFX2 U4 ( .INP(n137), .Z(n151) );
  NBUFFX2 U5 ( .INP(n138), .Z(n108) );
  NBUFFX2 U6 ( .INP(n86), .Z(n107) );
  NBUFFX2 U7 ( .INP(n86), .Z(n106) );
  NBUFFX2 U8 ( .INP(n141), .Z(n147) );
  AND2X1 U9 ( .IN1(raddr[0]), .IN2(n143), .Q(n93) );
  NAND3X0 U10 ( .IN1(n260), .IN2(n180), .IN3(n1), .QN(n259) );
  NAND3X0 U11 ( .IN1(n180), .IN2(n181), .IN3(n255), .QN(n252) );
  NAND3X0 U12 ( .IN1(n180), .IN2(n181), .IN3(n260), .QN(n257) );
  NBUFFX2 U13 ( .INP(n138), .Z(n149) );
  NBUFFX2 U22 ( .INP(n109), .Z(n150) );
  NAND3X0 U31 ( .IN1(n179), .IN2(n260), .IN3(waddr[1]), .QN(n261) );
  NBUFFX2 U40 ( .INP(n140), .Z(n148) );
  NAND3X0 U49 ( .IN1(waddr[1]), .IN2(n180), .IN3(n255), .QN(n254) );
  NBUFFX2 U59 ( .INP(raddr[0]), .Z(n99) );
  NBUFFX2 U68 ( .INP(n137), .Z(n110) );
  NBUFFX2 U77 ( .INP(n137), .Z(n111) );
  NOR2X0 U86 ( .IN1(n87), .IN2(n145), .QN(n137) );
  NAND3X0 U87 ( .IN1(waddr[1]), .IN2(n179), .IN3(n255), .QN(n256) );
  NBUFFX2 U88 ( .INP(n138), .Z(n109) );
  INVX0 U89 ( .INP(n181), .ZN(n1) );
  INVX0 U90 ( .INP(n1), .ZN(n2) );
  INVX0 U91 ( .INP(n95), .ZN(n3) );
  NBUFFX2 U92 ( .INP(wdata[7]), .Z(n4) );
  NBUFFX2 U93 ( .INP(wdata[5]), .Z(n5) );
  NBUFFX2 U94 ( .INP(wdata[3]), .Z(n6) );
  NBUFFX2 U95 ( .INP(wdata[2]), .Z(n7) );
  NBUFFX2 U96 ( .INP(wdata[1]), .Z(n8) );
  NBUFFX2 U97 ( .INP(wdata[0]), .Z(n9) );
  NBUFFX2 U98 ( .INP(wdata[6]), .Z(n10) );
  NBUFFX2 U99 ( .INP(wdata[4]), .Z(n11) );
  AOI221X1 U100 ( .IN1(mem[26]), .IN2(n107), .IN3(mem[10]), .IN4(n96), .IN5(
        n121), .QN(n98) );
  OAI22X1 U101 ( .IN1(n97), .IN2(n100), .IN3(n99), .IN4(n98), .QN(rdata[2]) );
  NOR2X0 U102 ( .IN1(n144), .IN2(n87), .QN(n86) );
  INVX0 U103 ( .INP(n101), .ZN(n87) );
  INVX0 U104 ( .INP(n104), .ZN(n88) );
  OAI22X1 U105 ( .IN1(n91), .IN2(n100), .IN3(n99), .IN4(n92), .QN(rdata[4]) );
  OAI22X1 U106 ( .IN1(n89), .IN2(n102), .IN3(n90), .IN4(n103), .QN(n126) );
  AOI221X1 U107 ( .IN1(mem[20]), .IN2(n106), .IN3(mem[4]), .IN4(n88), .IN5(
        n126), .QN(n91) );
  AOI221X1 U108 ( .IN1(mem[28]), .IN2(n146), .IN3(mem[12]), .IN4(n105), .IN5(
        n127), .QN(n92) );
  AND2X1 U109 ( .IN1(n142), .IN2(n100), .Q(n94) );
  OR2X1 U110 ( .IN1(n93), .IN2(n94), .Q(rdata[7]) );
  INVX0 U111 ( .INP(n99), .ZN(n95) );
  INVX0 U112 ( .INP(n99), .ZN(n100) );
  INVX0 U113 ( .INP(raddr[1]), .ZN(n101) );
  INVX0 U114 ( .INP(n109), .ZN(n102) );
  INVX0 U115 ( .INP(n111), .ZN(n103) );
  INVX0 U116 ( .INP(n140), .ZN(n104) );
  INVX0 U117 ( .INP(n104), .ZN(n105) );
  AO22X1 U118 ( .IN1(mem[32]), .IN2(n109), .IN3(mem[48]), .IN4(n111), .Q(n112)
         );
  INVX0 U119 ( .INP(n165), .ZN(n183) );
  INVX0 U120 ( .INP(n163), .ZN(n182) );
  INVX0 U121 ( .INP(n173), .ZN(n186) );
  INVX0 U122 ( .INP(n171), .ZN(n185) );
  NBUFFX2 U123 ( .INP(n258), .Z(n174) );
  INVX0 U124 ( .INP(n175), .ZN(n187) );
  NBUFFX2 U125 ( .INP(n257), .Z(n171) );
  NBUFFX2 U126 ( .INP(n253), .Z(n165) );
  NBUFFX2 U127 ( .INP(n252), .Z(n163) );
  NBUFFX2 U128 ( .INP(n258), .Z(n173) );
  NBUFFX2 U129 ( .INP(n257), .Z(n172) );
  NBUFFX2 U130 ( .INP(n253), .Z(n166) );
  NBUFFX2 U131 ( .INP(n252), .Z(n164) );
  NOR2X0 U132 ( .IN1(n101), .IN2(n145), .QN(n138) );
  NBUFFX2 U133 ( .INP(n141), .Z(n146) );
  NBUFFX2 U134 ( .INP(n256), .Z(n170) );
  NBUFFX2 U135 ( .INP(n254), .Z(n168) );
  NBUFFX2 U136 ( .INP(n256), .Z(n169) );
  NBUFFX2 U137 ( .INP(n254), .Z(n167) );
  NAND3X0 U138 ( .IN1(n179), .IN2(n2), .IN3(n255), .QN(n253) );
  NAND3X0 U139 ( .IN1(n260), .IN2(n2), .IN3(n179), .QN(n258) );
  NBUFFX2 U140 ( .INP(n261), .Z(n177) );
  NBUFFX2 U141 ( .INP(n259), .Z(n175) );
  NBUFFX2 U142 ( .INP(n261), .Z(n178) );
  NBUFFX2 U143 ( .INP(n259), .Z(n176) );
  NOR2X0 U144 ( .IN1(n184), .IN2(waddr[2]), .QN(n255) );
  INVX0 U145 ( .INP(we), .ZN(n184) );
  NOR2X0 U146 ( .IN1(n144), .IN2(n87), .QN(n141) );
  AO221X1 U147 ( .IN1(mem[16]), .IN2(n147), .IN3(mem[0]), .IN4(n140), .IN5(
        n112), .Q(n115) );
  AO22X1 U148 ( .IN1(mem[40]), .IN2(n109), .IN3(mem[56]), .IN4(n111), .Q(n113)
         );
  AO221X1 U149 ( .IN1(mem[24]), .IN2(n147), .IN3(mem[8]), .IN4(n105), .IN5(
        n113), .Q(n114) );
  AO22X1 U150 ( .IN1(n115), .IN2(n3), .IN3(n114), .IN4(n95), .Q(rdata[0]) );
  AO22X1 U151 ( .IN1(mem[33]), .IN2(n149), .IN3(mem[49]), .IN4(n111), .Q(n116)
         );
  AO221X1 U152 ( .IN1(mem[17]), .IN2(n107), .IN3(mem[1]), .IN4(n96), .IN5(n116), .Q(n119) );
  AO22X1 U153 ( .IN1(mem[41]), .IN2(n149), .IN3(mem[57]), .IN4(n110), .Q(n117)
         );
  AO221X1 U154 ( .IN1(mem[25]), .IN2(n106), .IN3(mem[9]), .IN4(n96), .IN5(n117), .Q(n118) );
  AO22X1 U155 ( .IN1(n119), .IN2(n3), .IN3(n118), .IN4(n100), .Q(rdata[1]) );
  AO22X1 U156 ( .IN1(mem[34]), .IN2(n108), .IN3(mem[50]), .IN4(n110), .Q(n120)
         );
  AO22X1 U157 ( .IN1(mem[42]), .IN2(n108), .IN3(mem[58]), .IN4(n151), .Q(n121)
         );
  AO22X1 U158 ( .IN1(mem[35]), .IN2(n150), .IN3(mem[51]), .IN4(n151), .Q(n122)
         );
  AO221X1 U159 ( .IN1(mem[19]), .IN2(n147), .IN3(mem[3]), .IN4(n96), .IN5(n122), .Q(n125) );
  AO22X1 U160 ( .IN1(mem[43]), .IN2(n149), .IN3(mem[59]), .IN4(n110), .Q(n123)
         );
  AO221X1 U161 ( .IN1(mem[27]), .IN2(n146), .IN3(mem[11]), .IN4(n105), .IN5(
        n123), .Q(n124) );
  AO22X1 U162 ( .IN1(n125), .IN2(n3), .IN3(n124), .IN4(n100), .Q(rdata[3]) );
  AO22X1 U163 ( .IN1(mem[44]), .IN2(n108), .IN3(mem[60]), .IN4(n151), .Q(n127)
         );
  AO22X1 U164 ( .IN1(mem[37]), .IN2(n150), .IN3(mem[53]), .IN4(n111), .Q(n128)
         );
  AO221X1 U165 ( .IN1(mem[21]), .IN2(n107), .IN3(mem[5]), .IN4(n88), .IN5(n128), .Q(n131) );
  AO22X1 U166 ( .IN1(mem[45]), .IN2(n149), .IN3(mem[61]), .IN4(n110), .Q(n129)
         );
  AO221X1 U167 ( .IN1(mem[29]), .IN2(n106), .IN3(mem[13]), .IN4(n148), .IN5(
        n129), .Q(n130) );
  AO22X1 U168 ( .IN1(n131), .IN2(n3), .IN3(n130), .IN4(n100), .Q(rdata[5]) );
  AO22X1 U169 ( .IN1(mem[38]), .IN2(n149), .IN3(mem[54]), .IN4(n151), .Q(n132)
         );
  AO221X1 U170 ( .IN1(mem[22]), .IN2(n146), .IN3(mem[6]), .IN4(n88), .IN5(n132), .Q(n135) );
  AO22X1 U171 ( .IN1(mem[46]), .IN2(n108), .IN3(mem[62]), .IN4(n151), .Q(n133)
         );
  AO221X1 U172 ( .IN1(mem[30]), .IN2(n107), .IN3(mem[14]), .IN4(n105), .IN5(
        n133), .Q(n134) );
  AO22X1 U173 ( .IN1(n135), .IN2(n3), .IN3(n134), .IN4(n95), .Q(rdata[6]) );
  AO22X1 U174 ( .IN1(mem[39]), .IN2(n150), .IN3(mem[55]), .IN4(n110), .Q(n136)
         );
  AO221X1 U175 ( .IN1(mem[23]), .IN2(n106), .IN3(mem[7]), .IN4(n88), .IN5(n136), .Q(n143) );
  AO22X1 U176 ( .IN1(mem[47]), .IN2(n150), .IN3(mem[63]), .IN4(n137), .Q(n139)
         );
  AO221X1 U177 ( .IN1(mem[31]), .IN2(n146), .IN3(mem[15]), .IN4(n105), .IN5(
        n139), .Q(n142) );
  INVX0 U178 ( .INP(raddr[2]), .ZN(n144) );
  INVX0 U179 ( .INP(n144), .ZN(n145) );
  NOR2X0 U180 ( .IN1(n144), .IN2(n101), .QN(n140) );
  INVX0 U181 ( .INP(n175), .ZN(n152) );
  INVX0 U182 ( .INP(n261), .ZN(n153) );
  INVX0 U183 ( .INP(n177), .ZN(n154) );
  INVX0 U184 ( .INP(n173), .ZN(n155) );
  INVX0 U185 ( .INP(n163), .ZN(n156) );
  INVX0 U186 ( .INP(n165), .ZN(n157) );
  INVX0 U187 ( .INP(n171), .ZN(n158) );
  INVX0 U188 ( .INP(n167), .ZN(n159) );
  INVX0 U189 ( .INP(n167), .ZN(n160) );
  INVX0 U190 ( .INP(n169), .ZN(n161) );
  INVX0 U191 ( .INP(n169), .ZN(n162) );
  INVX0 U192 ( .INP(n180), .ZN(n179) );
  INVX0 U193 ( .INP(waddr[0]), .ZN(n180) );
  INVX0 U194 ( .INP(waddr[1]), .ZN(n181) );
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
  AO22X1 U14 ( .IN1(wdata[0]), .IN2(n5), .IN3(mem[0]), .IN4(n161), .Q(n235) );
  AO22X1 U15 ( .IN1(wdata[1]), .IN2(n5), .IN3(mem[1]), .IN4(n161), .Q(n234) );
  AO22X1 U16 ( .IN1(wdata[2]), .IN2(n5), .IN3(mem[2]), .IN4(n161), .Q(n233) );
  AO22X1 U17 ( .IN1(wdata[3]), .IN2(n5), .IN3(mem[3]), .IN4(n161), .Q(n232) );
  AO22X1 U18 ( .IN1(wdata[4]), .IN2(n5), .IN3(mem[4]), .IN4(n161), .Q(n231) );
  AO22X1 U19 ( .IN1(wdata[5]), .IN2(n5), .IN3(mem[5]), .IN4(n160), .Q(n230) );
  AO22X1 U20 ( .IN1(wdata[6]), .IN2(n5), .IN3(mem[6]), .IN4(n160), .Q(n229) );
  AO22X1 U21 ( .IN1(wdata[7]), .IN2(n5), .IN3(mem[7]), .IN4(n160), .Q(n228) );
  AO22X1 U23 ( .IN1(n171), .IN2(wdata[0]), .IN3(mem[8]), .IN4(n159), .Q(n227)
         );
  AO22X1 U24 ( .IN1(n171), .IN2(wdata[1]), .IN3(mem[9]), .IN4(n159), .Q(n226)
         );
  AO22X1 U25 ( .IN1(n171), .IN2(wdata[2]), .IN3(mem[10]), .IN4(n159), .Q(n225)
         );
  AO22X1 U26 ( .IN1(n171), .IN2(wdata[3]), .IN3(mem[11]), .IN4(n159), .Q(n224)
         );
  AO22X1 U27 ( .IN1(n171), .IN2(wdata[4]), .IN3(mem[12]), .IN4(n159), .Q(n223)
         );
  AO22X1 U28 ( .IN1(n171), .IN2(wdata[5]), .IN3(mem[13]), .IN4(n159), .Q(n222)
         );
  AO22X1 U29 ( .IN1(n171), .IN2(wdata[6]), .IN3(mem[14]), .IN4(n159), .Q(n221)
         );
  AO22X1 U30 ( .IN1(n171), .IN2(wdata[7]), .IN3(mem[15]), .IN4(n243), .Q(n220)
         );
  AO22X1 U32 ( .IN1(n3), .IN2(n89), .IN3(mem[16]), .IN4(n158), .Q(n219) );
  AO22X1 U33 ( .IN1(n3), .IN2(n88), .IN3(mem[17]), .IN4(n158), .Q(n218) );
  AO22X1 U34 ( .IN1(n3), .IN2(n87), .IN3(mem[18]), .IN4(n158), .Q(n217) );
  AO22X1 U35 ( .IN1(n3), .IN2(n86), .IN3(mem[19]), .IN4(n158), .Q(n216) );
  AO22X1 U36 ( .IN1(n2), .IN2(n11), .IN3(mem[20]), .IN4(n158), .Q(n215) );
  AO22X1 U37 ( .IN1(n2), .IN2(n10), .IN3(mem[21]), .IN4(n157), .Q(n214) );
  AO22X1 U38 ( .IN1(n2), .IN2(n9), .IN3(mem[22]), .IN4(n157), .Q(n213) );
  AO22X1 U39 ( .IN1(n2), .IN2(n8), .IN3(mem[23]), .IN4(n157), .Q(n212) );
  AO22X1 U41 ( .IN1(n169), .IN2(n89), .IN3(mem[24]), .IN4(n156), .Q(n211) );
  AO22X1 U42 ( .IN1(n169), .IN2(n88), .IN3(mem[25]), .IN4(n156), .Q(n210) );
  AO22X1 U43 ( .IN1(n169), .IN2(n87), .IN3(mem[26]), .IN4(n156), .Q(n209) );
  AO22X1 U44 ( .IN1(n169), .IN2(n86), .IN3(mem[27]), .IN4(n156), .Q(n208) );
  AO22X1 U45 ( .IN1(n169), .IN2(n11), .IN3(mem[28]), .IN4(n156), .Q(n207) );
  AO22X1 U46 ( .IN1(n169), .IN2(n10), .IN3(mem[29]), .IN4(n155), .Q(n206) );
  AO22X1 U47 ( .IN1(n169), .IN2(n9), .IN3(mem[30]), .IN4(n155), .Q(n205) );
  AO22X1 U48 ( .IN1(n169), .IN2(n8), .IN3(mem[31]), .IN4(n155), .Q(n204) );
  AO22X1 U51 ( .IN1(n4), .IN2(n89), .IN3(mem[32]), .IN4(n154), .Q(n203) );
  AO22X1 U52 ( .IN1(n4), .IN2(n88), .IN3(mem[33]), .IN4(n154), .Q(n202) );
  AO22X1 U53 ( .IN1(n4), .IN2(n87), .IN3(mem[34]), .IN4(n154), .Q(n201) );
  AO22X1 U54 ( .IN1(n4), .IN2(n86), .IN3(mem[35]), .IN4(n154), .Q(n200) );
  AO22X1 U55 ( .IN1(n4), .IN2(n11), .IN3(mem[36]), .IN4(n154), .Q(n199) );
  AO22X1 U56 ( .IN1(n4), .IN2(n10), .IN3(mem[37]), .IN4(n153), .Q(n198) );
  AO22X1 U57 ( .IN1(n4), .IN2(n9), .IN3(mem[38]), .IN4(n153), .Q(n197) );
  AO22X1 U58 ( .IN1(n4), .IN2(n8), .IN3(mem[39]), .IN4(n153), .Q(n196) );
  AO22X1 U60 ( .IN1(n167), .IN2(n89), .IN3(mem[40]), .IN4(n152), .Q(n195) );
  AO22X1 U61 ( .IN1(n167), .IN2(n88), .IN3(mem[41]), .IN4(n152), .Q(n194) );
  AO22X1 U62 ( .IN1(n167), .IN2(n87), .IN3(mem[42]), .IN4(n152), .Q(n193) );
  AO22X1 U63 ( .IN1(n167), .IN2(n86), .IN3(mem[43]), .IN4(n152), .Q(n192) );
  AO22X1 U64 ( .IN1(n167), .IN2(n11), .IN3(mem[44]), .IN4(n152), .Q(n191) );
  AO22X1 U65 ( .IN1(n167), .IN2(n10), .IN3(mem[45]), .IN4(n151), .Q(n190) );
  AO22X1 U66 ( .IN1(n167), .IN2(n9), .IN3(mem[46]), .IN4(n151), .Q(n189) );
  AO22X1 U67 ( .IN1(n167), .IN2(n8), .IN3(mem[47]), .IN4(n151), .Q(n188) );
  AO22X1 U69 ( .IN1(n166), .IN2(n89), .IN3(mem[48]), .IN4(n150), .Q(n187) );
  AO22X1 U70 ( .IN1(n166), .IN2(n88), .IN3(mem[49]), .IN4(n150), .Q(n186) );
  AO22X1 U71 ( .IN1(n166), .IN2(n87), .IN3(mem[50]), .IN4(n150), .Q(n185) );
  AO22X1 U72 ( .IN1(n166), .IN2(n86), .IN3(mem[51]), .IN4(n150), .Q(n184) );
  AO22X1 U73 ( .IN1(n166), .IN2(n11), .IN3(mem[52]), .IN4(n150), .Q(n183) );
  AO22X1 U74 ( .IN1(n166), .IN2(n10), .IN3(mem[53]), .IN4(n149), .Q(n182) );
  AO22X1 U75 ( .IN1(n166), .IN2(n9), .IN3(mem[54]), .IN4(n149), .Q(n181) );
  AO22X1 U76 ( .IN1(n166), .IN2(n8), .IN3(mem[55]), .IN4(n149), .Q(n180) );
  AO22X1 U78 ( .IN1(n165), .IN2(n89), .IN3(mem[56]), .IN4(n148), .Q(n179) );
  AO22X1 U79 ( .IN1(n165), .IN2(n88), .IN3(mem[57]), .IN4(n148), .Q(n178) );
  AO22X1 U80 ( .IN1(n165), .IN2(n87), .IN3(mem[58]), .IN4(n148), .Q(n177) );
  AO22X1 U81 ( .IN1(n165), .IN2(n86), .IN3(mem[59]), .IN4(n148), .Q(n176) );
  AO22X1 U82 ( .IN1(n165), .IN2(n11), .IN3(mem[60]), .IN4(n148), .Q(n175) );
  AO22X1 U83 ( .IN1(n165), .IN2(n10), .IN3(mem[61]), .IN4(n147), .Q(n174) );
  AO22X1 U84 ( .IN1(n165), .IN2(n9), .IN3(mem[62]), .IN4(n147), .Q(n173) );
  AO22X1 U85 ( .IN1(n165), .IN2(n8), .IN3(mem[63]), .IN4(n147), .Q(n172) );
  NAND3X1 U2 ( .IN1(waddr[1]), .IN2(n162), .IN3(n239), .QN(n240) );
  INVX0 U3 ( .INP(n170), .ZN(n1) );
  INVX0 U4 ( .INP(n1), .ZN(n2) );
  INVX0 U5 ( .INP(n1), .ZN(n3) );
  DELLN2X2 U6 ( .INP(n242), .Z(n158) );
  NBUFFX4 U7 ( .INP(n242), .Z(n157) );
  NAND3X1 U8 ( .IN1(n244), .IN2(n164), .IN3(n162), .QN(n242) );
  DELLN2X2 U9 ( .INP(n237), .Z(n150) );
  NBUFFX4 U10 ( .INP(n237), .Z(n149) );
  NAND3X1 U11 ( .IN1(n162), .IN2(n164), .IN3(n239), .QN(n237) );
  DELLN2X2 U12 ( .INP(n236), .Z(n148) );
  NBUFFX4 U13 ( .INP(n236), .Z(n147) );
  NAND3X1 U22 ( .IN1(n163), .IN2(n164), .IN3(n239), .QN(n236) );
  DELLN2X2 U31 ( .INP(n241), .Z(n156) );
  NBUFFX4 U40 ( .INP(n241), .Z(n155) );
  NAND3X1 U49 ( .IN1(n163), .IN2(n164), .IN3(n244), .QN(n241) );
  NBUFFX2 U50 ( .INP(n130), .Z(n91) );
  NBUFFX2 U59 ( .INP(n127), .Z(n94) );
  NBUFFX2 U68 ( .INP(n126), .Z(n95) );
  AO221X1 U77 ( .IN1(mem[16]), .IN2(n136), .IN3(mem[0]), .IN4(n140), .IN5(n97),
        .Q(n100) );
  NBUFFX2 U86 ( .INP(n129), .Z(n140) );
  NBUFFX2 U87 ( .INP(n127), .Z(n93) );
  NBUFFX2 U88 ( .INP(n126), .Z(n143) );
  NBUFFX2 U89 ( .INP(n130), .Z(n92) );
  NBUFFX2 U90 ( .INP(n127), .Z(n142) );
  NBUFFX2 U91 ( .INP(n130), .Z(n137) );
  NBUFFX2 U92 ( .INP(n126), .Z(n96) );
  NBUFFX2 U93 ( .INP(n127), .Z(n141) );
  NBUFFX2 U94 ( .INP(n126), .Z(n144) );
  NAND3X1 U95 ( .IN1(n162), .IN2(n244), .IN3(waddr[1]), .QN(n245) );
  AND2X1 U96 ( .IN1(we), .IN2(waddr[2]), .Q(n244) );
  AO22X1 U97 ( .IN1(mem[36]), .IN2(n94), .IN3(mem[52]), .IN4(n95), .Q(n113) );
  NBUFFX2 U98 ( .INP(n243), .Z(n159) );
  NAND3X0 U99 ( .IN1(n244), .IN2(n163), .IN3(waddr[1]), .QN(n243) );
  NBUFFX2 U100 ( .INP(n240), .Z(n153) );
  INVX0 U101 ( .INP(n153), .ZN(n4) );
  INVX0 U102 ( .INP(n245), .ZN(n5) );
  INVX0 U103 ( .INP(raddr[1]), .ZN(n6) );
  INVX0 U104 ( .INP(n6), .ZN(n7) );
  NBUFFX2 U105 ( .INP(wdata[7]), .Z(n8) );
  NBUFFX2 U106 ( .INP(wdata[6]), .Z(n9) );
  NBUFFX2 U107 ( .INP(wdata[5]), .Z(n10) );
  NBUFFX2 U108 ( .INP(wdata[4]), .Z(n11) );
  NBUFFX2 U109 ( .INP(wdata[3]), .Z(n86) );
  NBUFFX2 U110 ( .INP(wdata[2]), .Z(n87) );
  NBUFFX2 U111 ( .INP(wdata[1]), .Z(n88) );
  NBUFFX2 U112 ( .INP(wdata[0]), .Z(n89) );
  INVX0 U113 ( .INP(n135), .ZN(n90) );
  NOR2X0 U114 ( .IN1(n134), .IN2(n6), .QN(n127) );
  INVX0 U115 ( .INP(n155), .ZN(n169) );
  INVX0 U116 ( .INP(n157), .ZN(n170) );
  INVX0 U117 ( .INP(n149), .ZN(n166) );
  INVX0 U118 ( .INP(n147), .ZN(n165) );
  INVX0 U119 ( .INP(n151), .ZN(n167) );
  INVX0 U120 ( .INP(n243), .ZN(n171) );
  NBUFFX2 U121 ( .INP(n130), .Z(n136) );
  NBUFFX2 U122 ( .INP(n245), .Z(n160) );
  NBUFFX2 U123 ( .INP(n238), .Z(n151) );
  NBUFFX2 U124 ( .INP(n245), .Z(n161) );
  NBUFFX2 U125 ( .INP(n240), .Z(n154) );
  NBUFFX2 U126 ( .INP(n238), .Z(n152) );
  NAND3X0 U127 ( .IN1(waddr[1]), .IN2(n163), .IN3(n239), .QN(n238) );
  NOR2X0 U128 ( .IN1(n168), .IN2(waddr[2]), .QN(n239) );
  INVX0 U129 ( .INP(we), .ZN(n168) );
  NOR2X0 U130 ( .IN1(n133), .IN2(n7), .QN(n130) );
  NOR2X0 U131 ( .IN1(n7), .IN2(n134), .QN(n126) );
  AO22X1 U132 ( .IN1(mem[32]), .IN2(n94), .IN3(mem[48]), .IN4(n96), .Q(n97) );
  AO22X1 U133 ( .IN1(mem[40]), .IN2(n94), .IN3(mem[56]), .IN4(n96), .Q(n98) );
  AO221X1 U134 ( .IN1(mem[24]), .IN2(n92), .IN3(mem[8]), .IN4(n140), .IN5(n98),
        .Q(n99) );
  AO22X1 U135 ( .IN1(n100), .IN2(n90), .IN3(n99), .IN4(n135), .Q(rdata[0]) );
  AO22X1 U136 ( .IN1(mem[33]), .IN2(n93), .IN3(mem[49]), .IN4(n96), .Q(n101)
         );
  AO221X1 U137 ( .IN1(mem[17]), .IN2(n137), .IN3(mem[1]), .IN4(n140), .IN5(
        n101), .Q(n104) );
  AO22X1 U138 ( .IN1(mem[41]), .IN2(n93), .IN3(mem[57]), .IN4(n95), .Q(n102)
         );
  AO221X1 U139 ( .IN1(mem[25]), .IN2(n136), .IN3(mem[9]), .IN4(n140), .IN5(
        n102), .Q(n103) );
  AO22X1 U140 ( .IN1(n104), .IN2(n90), .IN3(n103), .IN4(n145), .Q(rdata[1]) );
  AO22X1 U141 ( .IN1(mem[34]), .IN2(n142), .IN3(mem[50]), .IN4(n95), .Q(n105)
         );
  AO221X1 U142 ( .IN1(mem[18]), .IN2(n137), .IN3(mem[2]), .IN4(n140), .IN5(
        n105), .Q(n108) );
  AO22X1 U143 ( .IN1(mem[42]), .IN2(n142), .IN3(mem[58]), .IN4(n143), .Q(n106)
         );
  AO221X1 U144 ( .IN1(mem[26]), .IN2(n92), .IN3(mem[10]), .IN4(n140), .IN5(
        n106), .Q(n107) );
  AO22X1 U145 ( .IN1(n108), .IN2(n90), .IN3(n107), .IN4(n145), .Q(rdata[2]) );
  AO22X1 U146 ( .IN1(mem[35]), .IN2(n141), .IN3(mem[51]), .IN4(n143), .Q(n109)
         );
  AO221X1 U147 ( .IN1(mem[19]), .IN2(n137), .IN3(mem[3]), .IN4(n138), .IN5(
        n109), .Q(n112) );
  AO22X1 U148 ( .IN1(mem[43]), .IN2(n141), .IN3(mem[59]), .IN4(n144), .Q(n110)
         );
  AO221X1 U149 ( .IN1(mem[27]), .IN2(n91), .IN3(mem[11]), .IN4(n139), .IN5(
        n110), .Q(n111) );
  AO22X1 U150 ( .IN1(n112), .IN2(n146), .IN3(n111), .IN4(n135), .Q(rdata[3])
         );
  AO221X1 U151 ( .IN1(mem[20]), .IN2(n91), .IN3(mem[4]), .IN4(n138), .IN5(n113), .Q(n116) );
  AO22X1 U152 ( .IN1(mem[44]), .IN2(n93), .IN3(mem[60]), .IN4(n143), .Q(n114)
         );
  AO221X1 U153 ( .IN1(mem[28]), .IN2(n136), .IN3(mem[12]), .IN4(n139), .IN5(
        n114), .Q(n115) );
  AO22X1 U154 ( .IN1(n116), .IN2(raddr[0]), .IN3(n115), .IN4(n145), .Q(
        rdata[4]) );
  AO22X1 U155 ( .IN1(mem[37]), .IN2(n93), .IN3(mem[53]), .IN4(n143), .Q(n117)
         );
  AO221X1 U156 ( .IN1(mem[21]), .IN2(n92), .IN3(mem[5]), .IN4(n138), .IN5(n117), .Q(n120) );
  AO22X1 U157 ( .IN1(mem[45]), .IN2(n142), .IN3(mem[61]), .IN4(n144), .Q(n118)
         );
  AO221X1 U158 ( .IN1(mem[29]), .IN2(n92), .IN3(mem[13]), .IN4(n139), .IN5(
        n118), .Q(n119) );
  AO22X1 U159 ( .IN1(n120), .IN2(n90), .IN3(n119), .IN4(n145), .Q(rdata[5]) );
  AO22X1 U160 ( .IN1(mem[38]), .IN2(n142), .IN3(mem[54]), .IN4(n144), .Q(n121)
         );
  AO221X1 U161 ( .IN1(mem[22]), .IN2(n137), .IN3(mem[6]), .IN4(n138), .IN5(
        n121), .Q(n124) );
  AO22X1 U162 ( .IN1(mem[46]), .IN2(n141), .IN3(mem[62]), .IN4(n96), .Q(n122)
         );
  AO221X1 U163 ( .IN1(mem[30]), .IN2(n91), .IN3(mem[14]), .IN4(n139), .IN5(
        n122), .Q(n123) );
  AO22X1 U164 ( .IN1(n124), .IN2(raddr[0]), .IN3(n123), .IN4(n145), .Q(
        rdata[6]) );
  AO22X1 U165 ( .IN1(mem[39]), .IN2(n141), .IN3(mem[55]), .IN4(n144), .Q(n125)
         );
  AO221X1 U166 ( .IN1(mem[23]), .IN2(n91), .IN3(mem[7]), .IN4(n138), .IN5(n125), .Q(n132) );
  AO22X1 U167 ( .IN1(mem[47]), .IN2(n94), .IN3(mem[63]), .IN4(n95), .Q(n128)
         );
  AO221X1 U168 ( .IN1(mem[31]), .IN2(n136), .IN3(mem[15]), .IN4(n139), .IN5(
        n128), .Q(n131) );
  AO22X1 U169 ( .IN1(n90), .IN2(n132), .IN3(n131), .IN4(n145), .Q(rdata[7]) );
  INVX0 U170 ( .INP(raddr[2]), .ZN(n133) );
  INVX0 U171 ( .INP(n133), .ZN(n134) );
  INVX0 U172 ( .INP(raddr[0]), .ZN(n135) );
  INVX0 U173 ( .INP(n146), .ZN(n145) );
  INVX0 U174 ( .INP(n135), .ZN(n146) );
  NOR2X0 U175 ( .IN1(n133), .IN2(n6), .QN(n129) );
  NBUFFX2 U176 ( .INP(n129), .Z(n138) );
  NBUFFX2 U177 ( .INP(n129), .Z(n139) );
  INVX0 U178 ( .INP(n163), .ZN(n162) );
  INVX0 U179 ( .INP(waddr[0]), .ZN(n163) );
  INVX0 U180 ( .INP(waddr[1]), .ZN(n164) );
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
         n247, n248, n249, n250;
  wire   [63:0] mem;

  DFFX1 mem_reg_0__7_ ( .D(n177), .CLK(clk), .Q(mem[63]) );
  DFFX1 mem_reg_0__6_ ( .D(n178), .CLK(clk), .Q(mem[62]) );
  DFFX1 mem_reg_0__5_ ( .D(n179), .CLK(clk), .Q(mem[61]) );
  DFFX1 mem_reg_0__4_ ( .D(n180), .CLK(clk), .Q(mem[60]) );
  DFFX1 mem_reg_0__3_ ( .D(n181), .CLK(clk), .Q(mem[59]) );
  DFFX1 mem_reg_0__2_ ( .D(n182), .CLK(clk), .Q(mem[58]) );
  DFFX1 mem_reg_0__1_ ( .D(n183), .CLK(clk), .Q(mem[57]) );
  DFFX1 mem_reg_0__0_ ( .D(n184), .CLK(clk), .Q(mem[56]) );
  DFFX1 mem_reg_1__7_ ( .D(n185), .CLK(clk), .Q(mem[55]) );
  DFFX1 mem_reg_1__6_ ( .D(n186), .CLK(clk), .Q(mem[54]) );
  DFFX1 mem_reg_1__5_ ( .D(n187), .CLK(clk), .Q(mem[53]) );
  DFFX1 mem_reg_1__4_ ( .D(n188), .CLK(clk), .Q(mem[52]) );
  DFFX1 mem_reg_1__3_ ( .D(n189), .CLK(clk), .Q(mem[51]) );
  DFFX1 mem_reg_1__2_ ( .D(n190), .CLK(clk), .Q(mem[50]) );
  DFFX1 mem_reg_1__1_ ( .D(n191), .CLK(clk), .Q(mem[49]) );
  DFFX1 mem_reg_1__0_ ( .D(n192), .CLK(clk), .Q(mem[48]) );
  DFFX1 mem_reg_2__7_ ( .D(n193), .CLK(clk), .Q(mem[47]) );
  DFFX1 mem_reg_2__6_ ( .D(n194), .CLK(clk), .Q(mem[46]) );
  DFFX1 mem_reg_2__5_ ( .D(n195), .CLK(clk), .Q(mem[45]) );
  DFFX1 mem_reg_2__4_ ( .D(n196), .CLK(clk), .Q(mem[44]) );
  DFFX1 mem_reg_2__3_ ( .D(n197), .CLK(clk), .Q(mem[43]) );
  DFFX1 mem_reg_2__2_ ( .D(n198), .CLK(clk), .Q(mem[42]) );
  DFFX1 mem_reg_2__1_ ( .D(n199), .CLK(clk), .Q(mem[41]) );
  DFFX1 mem_reg_2__0_ ( .D(n200), .CLK(clk), .Q(mem[40]) );
  DFFX1 mem_reg_3__7_ ( .D(n201), .CLK(clk), .Q(mem[39]) );
  DFFX1 mem_reg_3__6_ ( .D(n202), .CLK(clk), .Q(mem[38]) );
  DFFX1 mem_reg_3__5_ ( .D(n203), .CLK(clk), .Q(mem[37]) );
  DFFX1 mem_reg_3__4_ ( .D(n204), .CLK(clk), .Q(mem[36]) );
  DFFX1 mem_reg_3__3_ ( .D(n205), .CLK(clk), .Q(mem[35]) );
  DFFX1 mem_reg_3__2_ ( .D(n206), .CLK(clk), .Q(mem[34]) );
  DFFX1 mem_reg_3__1_ ( .D(n207), .CLK(clk), .Q(mem[33]) );
  DFFX1 mem_reg_3__0_ ( .D(n208), .CLK(clk), .Q(mem[32]) );
  DFFX1 mem_reg_4__7_ ( .D(n209), .CLK(clk), .Q(mem[31]) );
  DFFX1 mem_reg_4__6_ ( .D(n210), .CLK(clk), .Q(mem[30]) );
  DFFX1 mem_reg_4__5_ ( .D(n211), .CLK(clk), .Q(mem[29]) );
  DFFX1 mem_reg_4__4_ ( .D(n212), .CLK(clk), .Q(mem[28]) );
  DFFX1 mem_reg_4__3_ ( .D(n213), .CLK(clk), .Q(mem[27]) );
  DFFX1 mem_reg_4__2_ ( .D(n214), .CLK(clk), .Q(mem[26]) );
  DFFX1 mem_reg_4__1_ ( .D(n215), .CLK(clk), .Q(mem[25]) );
  DFFX1 mem_reg_4__0_ ( .D(n216), .CLK(clk), .Q(mem[24]) );
  DFFX1 mem_reg_5__7_ ( .D(n217), .CLK(clk), .Q(mem[23]) );
  DFFX1 mem_reg_5__6_ ( .D(n218), .CLK(clk), .Q(mem[22]) );
  DFFX1 mem_reg_5__5_ ( .D(n219), .CLK(clk), .Q(mem[21]) );
  DFFX1 mem_reg_5__4_ ( .D(n220), .CLK(clk), .Q(mem[20]) );
  DFFX1 mem_reg_5__3_ ( .D(n221), .CLK(clk), .Q(mem[19]) );
  DFFX1 mem_reg_5__2_ ( .D(n222), .CLK(clk), .Q(mem[18]) );
  DFFX1 mem_reg_5__1_ ( .D(n223), .CLK(clk), .Q(mem[17]) );
  DFFX1 mem_reg_5__0_ ( .D(n224), .CLK(clk), .Q(mem[16]) );
  DFFX1 mem_reg_6__7_ ( .D(n225), .CLK(clk), .Q(mem[15]) );
  DFFX1 mem_reg_6__6_ ( .D(n226), .CLK(clk), .Q(mem[14]) );
  DFFX1 mem_reg_6__5_ ( .D(n227), .CLK(clk), .Q(mem[13]) );
  DFFX1 mem_reg_6__4_ ( .D(n228), .CLK(clk), .Q(mem[12]) );
  DFFX1 mem_reg_6__3_ ( .D(n229), .CLK(clk), .Q(mem[11]) );
  DFFX1 mem_reg_6__2_ ( .D(n230), .CLK(clk), .Q(mem[10]) );
  DFFX1 mem_reg_6__1_ ( .D(n231), .CLK(clk), .Q(mem[9]) );
  DFFX1 mem_reg_6__0_ ( .D(n232), .CLK(clk), .Q(mem[8]) );
  DFFX1 mem_reg_7__7_ ( .D(n233), .CLK(clk), .Q(mem[7]) );
  DFFX1 mem_reg_7__6_ ( .D(n234), .CLK(clk), .Q(mem[6]) );
  DFFX1 mem_reg_7__5_ ( .D(n235), .CLK(clk), .Q(mem[5]) );
  DFFX1 mem_reg_7__4_ ( .D(n236), .CLK(clk), .Q(mem[4]) );
  DFFX1 mem_reg_7__3_ ( .D(n237), .CLK(clk), .Q(mem[3]) );
  DFFX1 mem_reg_7__2_ ( .D(n238), .CLK(clk), .Q(mem[2]) );
  DFFX1 mem_reg_7__1_ ( .D(n239), .CLK(clk), .Q(mem[1]) );
  DFFX1 mem_reg_7__0_ ( .D(n240), .CLK(clk), .Q(mem[0]) );
  AO22X1 U14 ( .IN1(wdata[0]), .IN2(n176), .IN3(mem[0]), .IN4(n164), .Q(n240)
         );
  AO22X1 U15 ( .IN1(wdata[1]), .IN2(n176), .IN3(mem[1]), .IN4(n164), .Q(n239)
         );
  AO22X1 U16 ( .IN1(wdata[2]), .IN2(n176), .IN3(mem[2]), .IN4(n164), .Q(n238)
         );
  AO22X1 U17 ( .IN1(wdata[3]), .IN2(n176), .IN3(mem[3]), .IN4(n164), .Q(n237)
         );
  AO22X1 U18 ( .IN1(wdata[4]), .IN2(n7), .IN3(mem[4]), .IN4(n164), .Q(n236) );
  AO22X1 U19 ( .IN1(wdata[5]), .IN2(n7), .IN3(mem[5]), .IN4(n163), .Q(n235) );
  AO22X1 U20 ( .IN1(wdata[6]), .IN2(n7), .IN3(mem[6]), .IN4(n163), .Q(n234) );
  AO22X1 U21 ( .IN1(wdata[7]), .IN2(n7), .IN3(mem[7]), .IN4(n163), .Q(n233) );
  AO22X1 U23 ( .IN1(n175), .IN2(wdata[0]), .IN3(mem[8]), .IN4(n162), .Q(n232)
         );
  AO22X1 U24 ( .IN1(n175), .IN2(wdata[1]), .IN3(mem[9]), .IN4(n162), .Q(n231)
         );
  AO22X1 U25 ( .IN1(n175), .IN2(wdata[2]), .IN3(mem[10]), .IN4(n162), .Q(n230)
         );
  AO22X1 U26 ( .IN1(n175), .IN2(wdata[3]), .IN3(mem[11]), .IN4(n162), .Q(n229)
         );
  AO22X1 U27 ( .IN1(n5), .IN2(wdata[4]), .IN3(mem[12]), .IN4(n162), .Q(n228)
         );
  AO22X1 U28 ( .IN1(n5), .IN2(wdata[5]), .IN3(mem[13]), .IN4(n161), .Q(n227)
         );
  AO22X1 U29 ( .IN1(n5), .IN2(wdata[6]), .IN3(mem[14]), .IN4(n161), .Q(n226)
         );
  AO22X1 U30 ( .IN1(n5), .IN2(wdata[7]), .IN3(mem[15]), .IN4(n161), .Q(n225)
         );
  AO22X1 U32 ( .IN1(n174), .IN2(n91), .IN3(mem[16]), .IN4(n160), .Q(n224) );
  AO22X1 U33 ( .IN1(n174), .IN2(n90), .IN3(mem[17]), .IN4(n160), .Q(n223) );
  AO22X1 U34 ( .IN1(n174), .IN2(n89), .IN3(mem[18]), .IN4(n160), .Q(n222) );
  AO22X1 U35 ( .IN1(n174), .IN2(n88), .IN3(mem[19]), .IN4(n160), .Q(n221) );
  AO22X1 U36 ( .IN1(n2), .IN2(n87), .IN3(mem[20]), .IN4(n160), .Q(n220) );
  AO22X1 U37 ( .IN1(n2), .IN2(n86), .IN3(mem[21]), .IN4(n159), .Q(n219) );
  AO22X1 U38 ( .IN1(n2), .IN2(n11), .IN3(mem[22]), .IN4(n159), .Q(n218) );
  AO22X1 U39 ( .IN1(n2), .IN2(n10), .IN3(mem[23]), .IN4(n159), .Q(n217) );
  AO22X1 U41 ( .IN1(n173), .IN2(n91), .IN3(mem[24]), .IN4(n158), .Q(n216) );
  AO22X1 U42 ( .IN1(n173), .IN2(n90), .IN3(mem[25]), .IN4(n158), .Q(n215) );
  AO22X1 U43 ( .IN1(n173), .IN2(n89), .IN3(mem[26]), .IN4(n158), .Q(n214) );
  AO22X1 U44 ( .IN1(n173), .IN2(n88), .IN3(mem[27]), .IN4(n158), .Q(n213) );
  AO22X1 U45 ( .IN1(n6), .IN2(n87), .IN3(mem[28]), .IN4(n158), .Q(n212) );
  AO22X1 U46 ( .IN1(n6), .IN2(n86), .IN3(mem[29]), .IN4(n157), .Q(n211) );
  AO22X1 U47 ( .IN1(n6), .IN2(n11), .IN3(mem[30]), .IN4(n157), .Q(n210) );
  AO22X1 U48 ( .IN1(n6), .IN2(n10), .IN3(mem[31]), .IN4(n157), .Q(n209) );
  AND2X1 U50 ( .IN1(we), .IN2(waddr[2]), .Q(n249) );
  AO22X1 U51 ( .IN1(n171), .IN2(n91), .IN3(mem[32]), .IN4(n156), .Q(n208) );
  AO22X1 U52 ( .IN1(n171), .IN2(n90), .IN3(mem[33]), .IN4(n156), .Q(n207) );
  AO22X1 U53 ( .IN1(n171), .IN2(n89), .IN3(mem[34]), .IN4(n156), .Q(n206) );
  AO22X1 U54 ( .IN1(n171), .IN2(n88), .IN3(mem[35]), .IN4(n156), .Q(n205) );
  AO22X1 U55 ( .IN1(n9), .IN2(n87), .IN3(mem[36]), .IN4(n156), .Q(n204) );
  AO22X1 U56 ( .IN1(n9), .IN2(n86), .IN3(mem[37]), .IN4(n155), .Q(n203) );
  AO22X1 U57 ( .IN1(n9), .IN2(n11), .IN3(mem[38]), .IN4(n155), .Q(n202) );
  AO22X1 U58 ( .IN1(n9), .IN2(n10), .IN3(mem[39]), .IN4(n155), .Q(n201) );
  AO22X1 U60 ( .IN1(n170), .IN2(n91), .IN3(mem[40]), .IN4(n154), .Q(n200) );
  AO22X1 U61 ( .IN1(n170), .IN2(n90), .IN3(mem[41]), .IN4(n154), .Q(n199) );
  AO22X1 U62 ( .IN1(n170), .IN2(n89), .IN3(mem[42]), .IN4(n154), .Q(n198) );
  AO22X1 U63 ( .IN1(n170), .IN2(n88), .IN3(mem[43]), .IN4(n154), .Q(n197) );
  AO22X1 U64 ( .IN1(n8), .IN2(n87), .IN3(mem[44]), .IN4(n154), .Q(n196) );
  AO22X1 U65 ( .IN1(n8), .IN2(n86), .IN3(mem[45]), .IN4(n153), .Q(n195) );
  AO22X1 U66 ( .IN1(n8), .IN2(n11), .IN3(mem[46]), .IN4(n153), .Q(n194) );
  AO22X1 U67 ( .IN1(n8), .IN2(n10), .IN3(mem[47]), .IN4(n153), .Q(n193) );
  AO22X1 U69 ( .IN1(n169), .IN2(n91), .IN3(mem[48]), .IN4(n152), .Q(n192) );
  AO22X1 U70 ( .IN1(n169), .IN2(n90), .IN3(mem[49]), .IN4(n152), .Q(n191) );
  AO22X1 U71 ( .IN1(n169), .IN2(n89), .IN3(mem[50]), .IN4(n152), .Q(n190) );
  AO22X1 U72 ( .IN1(n169), .IN2(n88), .IN3(mem[51]), .IN4(n152), .Q(n189) );
  AO22X1 U73 ( .IN1(n4), .IN2(n87), .IN3(mem[52]), .IN4(n152), .Q(n188) );
  AO22X1 U74 ( .IN1(n4), .IN2(n86), .IN3(mem[53]), .IN4(n151), .Q(n187) );
  AO22X1 U75 ( .IN1(n4), .IN2(n11), .IN3(mem[54]), .IN4(n151), .Q(n186) );
  AO22X1 U76 ( .IN1(n4), .IN2(n10), .IN3(mem[55]), .IN4(n151), .Q(n185) );
  AO22X1 U78 ( .IN1(n168), .IN2(n91), .IN3(mem[56]), .IN4(n150), .Q(n184) );
  AO22X1 U79 ( .IN1(n168), .IN2(n90), .IN3(mem[57]), .IN4(n150), .Q(n183) );
  AO22X1 U80 ( .IN1(n168), .IN2(n89), .IN3(mem[58]), .IN4(n150), .Q(n182) );
  AO22X1 U81 ( .IN1(n168), .IN2(n88), .IN3(mem[59]), .IN4(n150), .Q(n181) );
  AO22X1 U82 ( .IN1(n3), .IN2(n87), .IN3(mem[60]), .IN4(n150), .Q(n180) );
  AO22X1 U83 ( .IN1(n3), .IN2(n86), .IN3(mem[61]), .IN4(n149), .Q(n179) );
  AO22X1 U84 ( .IN1(n3), .IN2(n11), .IN3(mem[62]), .IN4(n149), .Q(n178) );
  AO22X1 U85 ( .IN1(n3), .IN2(n10), .IN3(mem[63]), .IN4(n149), .Q(n177) );
  DELLN1X2 U2 ( .INP(raddr[1]), .Z(n92) );
  NBUFFX4 U3 ( .INP(n132), .Z(n144) );
  NBUFFX2 U4 ( .INP(n133), .Z(n95) );
  AO22X1 U5 ( .IN1(n93), .IN2(n135), .IN3(n134), .IN4(n139), .Q(rdata[7]) );
  NBUFFX2 U6 ( .INP(n133), .Z(n141) );
  NBUFFX2 U7 ( .INP(n130), .Z(n146) );
  NBUFFX2 U8 ( .INP(n129), .Z(n98) );
  NBUFFX2 U9 ( .INP(n130), .Z(n97) );
  NBUFFX2 U10 ( .INP(n133), .Z(n94) );
  NBUFFX2 U11 ( .INP(n130), .Z(n96) );
  NBUFFX2 U12 ( .INP(n129), .Z(n148) );
  NBUFFX2 U13 ( .INP(n130), .Z(n145) );
  NBUFFX2 U22 ( .INP(n129), .Z(n99) );
  NAND3X1 U31 ( .IN1(n165), .IN2(n249), .IN3(waddr[1]), .QN(n250) );
  NAND3X1 U40 ( .IN1(n249), .IN2(n166), .IN3(waddr[1]), .QN(n248) );
  NAND3X0 U49 ( .IN1(n166), .IN2(n167), .IN3(n249), .QN(n246) );
  NAND3X0 U59 ( .IN1(n165), .IN2(n167), .IN3(n244), .QN(n242) );
  NAND3X0 U68 ( .IN1(n166), .IN2(n167), .IN3(n244), .QN(n241) );
  NBUFFX2 U77 ( .INP(n247), .Z(n159) );
  NBUFFX2 U86 ( .INP(n92), .Z(n1) );
  INVX0 U87 ( .INP(n247), .ZN(n2) );
  NAND3X0 U88 ( .IN1(n249), .IN2(n167), .IN3(n165), .QN(n247) );
  INVX0 U89 ( .INP(n241), .ZN(n3) );
  INVX0 U90 ( .INP(n242), .ZN(n4) );
  INVX0 U91 ( .INP(n248), .ZN(n5) );
  INVX0 U92 ( .INP(n246), .ZN(n6) );
  INVX0 U93 ( .INP(n250), .ZN(n7) );
  INVX0 U94 ( .INP(n243), .ZN(n8) );
  NAND3X1 U95 ( .IN1(waddr[1]), .IN2(n166), .IN3(n244), .QN(n243) );
  INVX0 U96 ( .INP(n245), .ZN(n9) );
  NAND3X1 U97 ( .IN1(waddr[1]), .IN2(n165), .IN3(n244), .QN(n245) );
  NBUFFX2 U98 ( .INP(wdata[7]), .Z(n10) );
  NBUFFX2 U99 ( .INP(wdata[6]), .Z(n11) );
  NBUFFX2 U100 ( .INP(wdata[5]), .Z(n86) );
  NBUFFX2 U101 ( .INP(wdata[4]), .Z(n87) );
  NBUFFX2 U102 ( .INP(wdata[3]), .Z(n88) );
  NBUFFX2 U103 ( .INP(wdata[2]), .Z(n89) );
  NBUFFX2 U104 ( .INP(wdata[1]), .Z(n90) );
  NBUFFX2 U105 ( .INP(wdata[0]), .Z(n91) );
  NBUFFX4 U106 ( .INP(n132), .Z(n143) );
  NBUFFX4 U107 ( .INP(n132), .Z(n142) );
  NBUFFX2 U108 ( .INP(raddr[0]), .Z(n93) );
  NBUFFX2 U109 ( .INP(n133), .Z(n140) );
  INVX0 U110 ( .INP(n157), .ZN(n173) );
  INVX0 U111 ( .INP(n159), .ZN(n174) );
  INVX0 U112 ( .INP(n151), .ZN(n169) );
  INVX0 U113 ( .INP(n149), .ZN(n168) );
  NBUFFX2 U114 ( .INP(n129), .Z(n147) );
  INVX0 U115 ( .INP(n163), .ZN(n176) );
  INVX0 U116 ( .INP(n155), .ZN(n171) );
  INVX0 U117 ( .INP(n153), .ZN(n170) );
  INVX0 U118 ( .INP(n161), .ZN(n175) );
  NBUFFX2 U119 ( .INP(n246), .Z(n157) );
  NBUFFX2 U120 ( .INP(n242), .Z(n151) );
  NBUFFX2 U121 ( .INP(n241), .Z(n149) );
  NBUFFX2 U122 ( .INP(n246), .Z(n158) );
  NBUFFX2 U123 ( .INP(n247), .Z(n160) );
  NBUFFX2 U124 ( .INP(n242), .Z(n152) );
  NBUFFX2 U125 ( .INP(n241), .Z(n150) );
  NBUFFX2 U126 ( .INP(n248), .Z(n161) );
  NBUFFX2 U127 ( .INP(n250), .Z(n163) );
  NBUFFX2 U128 ( .INP(n245), .Z(n155) );
  NBUFFX2 U129 ( .INP(n243), .Z(n153) );
  NBUFFX2 U130 ( .INP(n250), .Z(n164) );
  NBUFFX2 U131 ( .INP(n248), .Z(n162) );
  NBUFFX2 U132 ( .INP(n245), .Z(n156) );
  NBUFFX2 U133 ( .INP(n243), .Z(n154) );
  NOR2X0 U134 ( .IN1(n172), .IN2(waddr[2]), .QN(n244) );
  INVX0 U135 ( .INP(we), .ZN(n172) );
  NOR2X0 U136 ( .IN1(n136), .IN2(n1), .QN(n133) );
  NOR2X0 U137 ( .IN1(n1), .IN2(n137), .QN(n129) );
  AO22X1 U138 ( .IN1(mem[32]), .IN2(n96), .IN3(mem[48]), .IN4(n98), .Q(n100)
         );
  AO221X1 U139 ( .IN1(mem[16]), .IN2(n95), .IN3(mem[0]), .IN4(n144), .IN5(n100), .Q(n103) );
  AO22X1 U140 ( .IN1(mem[40]), .IN2(n97), .IN3(mem[56]), .IN4(n147), .Q(n101)
         );
  AO221X1 U141 ( .IN1(mem[24]), .IN2(n94), .IN3(mem[8]), .IN4(n144), .IN5(n101), .Q(n102) );
  AO22X1 U142 ( .IN1(n103), .IN2(raddr[0]), .IN3(n102), .IN4(n139), .Q(
        rdata[0]) );
  AO22X1 U143 ( .IN1(mem[33]), .IN2(n96), .IN3(mem[49]), .IN4(n148), .Q(n104)
         );
  AO221X1 U144 ( .IN1(mem[17]), .IN2(n141), .IN3(mem[1]), .IN4(n144), .IN5(
        n104), .Q(n107) );
  AO22X1 U145 ( .IN1(mem[41]), .IN2(n145), .IN3(mem[57]), .IN4(n147), .Q(n105)
         );
  AO221X1 U146 ( .IN1(mem[25]), .IN2(n94), .IN3(mem[9]), .IN4(n144), .IN5(n105), .Q(n106) );
  AO22X1 U147 ( .IN1(n107), .IN2(n93), .IN3(n106), .IN4(n139), .Q(rdata[1]) );
  AO22X1 U148 ( .IN1(mem[34]), .IN2(n145), .IN3(mem[50]), .IN4(n148), .Q(n108)
         );
  AO221X1 U149 ( .IN1(mem[18]), .IN2(n141), .IN3(mem[2]), .IN4(n144), .IN5(
        n108), .Q(n111) );
  AO22X1 U150 ( .IN1(mem[42]), .IN2(n146), .IN3(mem[58]), .IN4(n98), .Q(n109)
         );
  AO221X1 U151 ( .IN1(mem[26]), .IN2(n95), .IN3(mem[10]), .IN4(n144), .IN5(
        n109), .Q(n110) );
  AO22X1 U152 ( .IN1(n111), .IN2(raddr[0]), .IN3(n110), .IN4(n139), .Q(
        rdata[2]) );
  AO22X1 U153 ( .IN1(mem[35]), .IN2(n146), .IN3(mem[51]), .IN4(n148), .Q(n112)
         );
  AO221X1 U154 ( .IN1(mem[19]), .IN2(n141), .IN3(mem[3]), .IN4(n142), .IN5(
        n112), .Q(n115) );
  AO22X1 U155 ( .IN1(mem[43]), .IN2(n97), .IN3(mem[59]), .IN4(n99), .Q(n113)
         );
  AO221X1 U156 ( .IN1(mem[27]), .IN2(n141), .IN3(mem[11]), .IN4(n143), .IN5(
        n113), .Q(n114) );
  AO22X1 U157 ( .IN1(n115), .IN2(n93), .IN3(n114), .IN4(n139), .Q(rdata[3]) );
  AO22X1 U158 ( .IN1(mem[36]), .IN2(n146), .IN3(mem[52]), .IN4(n147), .Q(n116)
         );
  AO221X1 U159 ( .IN1(mem[20]), .IN2(n95), .IN3(mem[4]), .IN4(n142), .IN5(n116), .Q(n119) );
  AO22X1 U160 ( .IN1(mem[44]), .IN2(n146), .IN3(mem[60]), .IN4(n147), .Q(n117)
         );
  AO221X1 U161 ( .IN1(mem[28]), .IN2(n94), .IN3(mem[12]), .IN4(n143), .IN5(
        n117), .Q(n118) );
  AO22X1 U162 ( .IN1(n119), .IN2(n93), .IN3(n118), .IN4(n139), .Q(rdata[4]) );
  AO22X1 U163 ( .IN1(mem[37]), .IN2(n97), .IN3(mem[53]), .IN4(n98), .Q(n120)
         );
  AO221X1 U164 ( .IN1(mem[21]), .IN2(n140), .IN3(mem[5]), .IN4(n142), .IN5(
        n120), .Q(n123) );
  AO22X1 U165 ( .IN1(mem[45]), .IN2(n97), .IN3(mem[61]), .IN4(n98), .Q(n121)
         );
  AO221X1 U166 ( .IN1(mem[29]), .IN2(n95), .IN3(mem[13]), .IN4(n143), .IN5(
        n121), .Q(n122) );
  AO22X1 U167 ( .IN1(n123), .IN2(n93), .IN3(n122), .IN4(n139), .Q(rdata[5]) );
  AO22X1 U168 ( .IN1(mem[38]), .IN2(n96), .IN3(mem[54]), .IN4(n99), .Q(n124)
         );
  AO221X1 U169 ( .IN1(mem[22]), .IN2(n94), .IN3(mem[6]), .IN4(n142), .IN5(n124), .Q(n127) );
  AO22X1 U170 ( .IN1(mem[46]), .IN2(n96), .IN3(mem[62]), .IN4(n99), .Q(n125)
         );
  AO221X1 U171 ( .IN1(mem[30]), .IN2(n140), .IN3(mem[14]), .IN4(n143), .IN5(
        n125), .Q(n126) );
  AO22X1 U172 ( .IN1(n127), .IN2(n93), .IN3(n126), .IN4(n139), .Q(rdata[6]) );
  AO22X1 U173 ( .IN1(mem[39]), .IN2(n145), .IN3(mem[55]), .IN4(n148), .Q(n128)
         );
  AO221X1 U174 ( .IN1(mem[23]), .IN2(n140), .IN3(mem[7]), .IN4(n142), .IN5(
        n128), .Q(n135) );
  AO22X1 U175 ( .IN1(mem[47]), .IN2(n145), .IN3(mem[63]), .IN4(n99), .Q(n131)
         );
  AO221X1 U176 ( .IN1(mem[31]), .IN2(n140), .IN3(mem[15]), .IN4(n143), .IN5(
        n131), .Q(n134) );
  INVX0 U177 ( .INP(raddr[2]), .ZN(n136) );
  INVX0 U178 ( .INP(n136), .ZN(n137) );
  INVX0 U179 ( .INP(n92), .ZN(n138) );
  INVX0 U180 ( .INP(raddr[0]), .ZN(n139) );
  NOR2X0 U181 ( .IN1(n136), .IN2(n138), .QN(n132) );
  NOR2X0 U182 ( .IN1(n138), .IN2(n137), .QN(n130) );
  INVX0 U183 ( .INP(n166), .ZN(n165) );
  INVX0 U184 ( .INP(waddr[0]), .ZN(n166) );
  INVX0 U185 ( .INP(waddr[1]), .ZN(n167) );
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
  AO22X1 U14 ( .IN1(wdata[0]), .IN2(n175), .IN3(mem[0]), .IN4(n164), .Q(n239)
         );
  AO22X1 U15 ( .IN1(wdata[1]), .IN2(n175), .IN3(mem[1]), .IN4(n164), .Q(n238)
         );
  AO22X1 U16 ( .IN1(wdata[2]), .IN2(n175), .IN3(mem[2]), .IN4(n164), .Q(n237)
         );
  AO22X1 U17 ( .IN1(wdata[3]), .IN2(n175), .IN3(mem[3]), .IN4(n164), .Q(n236)
         );
  AO22X1 U18 ( .IN1(wdata[4]), .IN2(n175), .IN3(mem[4]), .IN4(n164), .Q(n235)
         );
  AO22X1 U19 ( .IN1(wdata[5]), .IN2(n175), .IN3(mem[5]), .IN4(n164), .Q(n234)
         );
  AO22X1 U20 ( .IN1(wdata[6]), .IN2(n175), .IN3(mem[6]), .IN4(n164), .Q(n233)
         );
  AO22X1 U21 ( .IN1(wdata[7]), .IN2(n175), .IN3(mem[7]), .IN4(n164), .Q(n232)
         );
  AO22X1 U23 ( .IN1(n174), .IN2(n86), .IN3(mem[8]), .IN4(n163), .Q(n231) );
  AO22X1 U24 ( .IN1(n174), .IN2(n11), .IN3(mem[9]), .IN4(n163), .Q(n230) );
  AO22X1 U25 ( .IN1(n174), .IN2(n10), .IN3(mem[10]), .IN4(n163), .Q(n229) );
  AO22X1 U26 ( .IN1(n174), .IN2(n9), .IN3(mem[11]), .IN4(n163), .Q(n228) );
  AO22X1 U27 ( .IN1(n174), .IN2(n88), .IN3(mem[12]), .IN4(n163), .Q(n227) );
  AO22X1 U28 ( .IN1(n174), .IN2(n8), .IN3(mem[13]), .IN4(n162), .Q(n226) );
  AO22X1 U29 ( .IN1(n174), .IN2(n87), .IN3(mem[14]), .IN4(n162), .Q(n225) );
  AO22X1 U30 ( .IN1(n174), .IN2(n7), .IN3(mem[15]), .IN4(n162), .Q(n224) );
  AO22X1 U32 ( .IN1(n173), .IN2(n86), .IN3(mem[16]), .IN4(n161), .Q(n223) );
  AO22X1 U33 ( .IN1(n173), .IN2(n11), .IN3(mem[17]), .IN4(n161), .Q(n222) );
  AO22X1 U34 ( .IN1(n173), .IN2(n10), .IN3(mem[18]), .IN4(n161), .Q(n221) );
  AO22X1 U35 ( .IN1(n173), .IN2(n9), .IN3(mem[19]), .IN4(n161), .Q(n220) );
  AO22X1 U36 ( .IN1(n90), .IN2(n88), .IN3(mem[20]), .IN4(n161), .Q(n219) );
  AO22X1 U37 ( .IN1(n90), .IN2(n8), .IN3(mem[21]), .IN4(n160), .Q(n218) );
  AO22X1 U38 ( .IN1(n90), .IN2(n87), .IN3(mem[22]), .IN4(n160), .Q(n217) );
  AO22X1 U39 ( .IN1(n90), .IN2(n7), .IN3(mem[23]), .IN4(n160), .Q(n216) );
  AO22X1 U41 ( .IN1(n172), .IN2(n86), .IN3(mem[24]), .IN4(n159), .Q(n215) );
  AO22X1 U42 ( .IN1(n172), .IN2(n11), .IN3(mem[25]), .IN4(n159), .Q(n214) );
  AO22X1 U43 ( .IN1(n172), .IN2(n10), .IN3(mem[26]), .IN4(n159), .Q(n213) );
  AO22X1 U44 ( .IN1(n91), .IN2(n9), .IN3(mem[27]), .IN4(n159), .Q(n212) );
  AO22X1 U45 ( .IN1(n91), .IN2(n88), .IN3(mem[28]), .IN4(n159), .Q(n211) );
  AO22X1 U46 ( .IN1(n91), .IN2(n8), .IN3(mem[29]), .IN4(n158), .Q(n210) );
  AO22X1 U47 ( .IN1(n91), .IN2(n87), .IN3(mem[30]), .IN4(n158), .Q(n209) );
  AO22X1 U48 ( .IN1(n91), .IN2(n7), .IN3(mem[31]), .IN4(n158), .Q(n208) );
  AO22X1 U51 ( .IN1(n170), .IN2(n86), .IN3(mem[32]), .IN4(n157), .Q(n207) );
  AO22X1 U52 ( .IN1(n170), .IN2(n11), .IN3(mem[33]), .IN4(n157), .Q(n206) );
  AO22X1 U53 ( .IN1(n170), .IN2(n10), .IN3(mem[34]), .IN4(n157), .Q(n205) );
  AO22X1 U54 ( .IN1(n170), .IN2(n9), .IN3(mem[35]), .IN4(n157), .Q(n204) );
  AO22X1 U55 ( .IN1(n5), .IN2(n88), .IN3(mem[36]), .IN4(n157), .Q(n203) );
  AO22X1 U56 ( .IN1(n5), .IN2(n8), .IN3(mem[37]), .IN4(n156), .Q(n202) );
  AO22X1 U57 ( .IN1(n5), .IN2(n87), .IN3(mem[38]), .IN4(n156), .Q(n201) );
  AO22X1 U58 ( .IN1(n5), .IN2(n7), .IN3(mem[39]), .IN4(n156), .Q(n200) );
  AO22X1 U60 ( .IN1(n6), .IN2(wdata[0]), .IN3(mem[40]), .IN4(n155), .Q(n199)
         );
  AO22X1 U61 ( .IN1(n6), .IN2(wdata[1]), .IN3(mem[41]), .IN4(n155), .Q(n198)
         );
  AO22X1 U62 ( .IN1(n6), .IN2(wdata[2]), .IN3(mem[42]), .IN4(n155), .Q(n197)
         );
  AO22X1 U63 ( .IN1(n6), .IN2(wdata[3]), .IN3(mem[43]), .IN4(n155), .Q(n196)
         );
  AO22X1 U64 ( .IN1(n6), .IN2(wdata[4]), .IN3(mem[44]), .IN4(n155), .Q(n195)
         );
  AO22X1 U65 ( .IN1(n6), .IN2(wdata[5]), .IN3(mem[45]), .IN4(n154), .Q(n194)
         );
  AO22X1 U66 ( .IN1(n6), .IN2(wdata[6]), .IN3(mem[46]), .IN4(n154), .Q(n193)
         );
  AO22X1 U67 ( .IN1(n6), .IN2(wdata[7]), .IN3(mem[47]), .IN4(n154), .Q(n192)
         );
  AO22X1 U69 ( .IN1(n169), .IN2(n86), .IN3(mem[48]), .IN4(n153), .Q(n191) );
  AO22X1 U70 ( .IN1(n169), .IN2(n11), .IN3(mem[49]), .IN4(n153), .Q(n190) );
  AO22X1 U71 ( .IN1(n169), .IN2(n10), .IN3(mem[50]), .IN4(n153), .Q(n189) );
  AO22X1 U72 ( .IN1(n169), .IN2(n9), .IN3(mem[51]), .IN4(n153), .Q(n188) );
  AO22X1 U73 ( .IN1(n4), .IN2(n88), .IN3(mem[52]), .IN4(n153), .Q(n187) );
  AO22X1 U74 ( .IN1(n4), .IN2(n8), .IN3(mem[53]), .IN4(n152), .Q(n186) );
  AO22X1 U75 ( .IN1(n4), .IN2(n87), .IN3(mem[54]), .IN4(n152), .Q(n185) );
  AO22X1 U76 ( .IN1(n4), .IN2(n7), .IN3(mem[55]), .IN4(n152), .Q(n184) );
  AO22X1 U78 ( .IN1(n168), .IN2(n86), .IN3(mem[56]), .IN4(n151), .Q(n183) );
  AO22X1 U79 ( .IN1(n168), .IN2(n11), .IN3(mem[57]), .IN4(n151), .Q(n182) );
  AO22X1 U80 ( .IN1(n168), .IN2(n10), .IN3(mem[58]), .IN4(n151), .Q(n181) );
  AO22X1 U81 ( .IN1(n168), .IN2(n9), .IN3(mem[59]), .IN4(n151), .Q(n180) );
  AO22X1 U82 ( .IN1(n3), .IN2(n88), .IN3(mem[60]), .IN4(n151), .Q(n179) );
  AO22X1 U83 ( .IN1(n3), .IN2(n8), .IN3(mem[61]), .IN4(n150), .Q(n178) );
  AO22X1 U84 ( .IN1(n3), .IN2(n87), .IN3(mem[62]), .IN4(n150), .Q(n177) );
  AO22X1 U85 ( .IN1(n3), .IN2(n7), .IN3(mem[63]), .IN4(n150), .Q(n176) );
  NBUFFX2 U2 ( .INP(raddr[1]), .Z(n89) );
  AND2X1 U3 ( .IN1(we), .IN2(n2), .Q(n248) );
  NBUFFX2 U4 ( .INP(n126), .Z(n136) );
  NBUFFX2 U5 ( .INP(n123), .Z(n139) );
  NBUFFX2 U6 ( .INP(n124), .Z(n137) );
  NBUFFX2 U7 ( .INP(n123), .Z(n140) );
  NBUFFX2 U8 ( .INP(n124), .Z(n138) );
  NBUFFX2 U9 ( .INP(n127), .Z(n148) );
  NBUFFX2 U10 ( .INP(n123), .Z(n144) );
  NBUFFX2 U11 ( .INP(n124), .Z(n146) );
  NBUFFX2 U12 ( .INP(n127), .Z(n134) );
  NBUFFX2 U13 ( .INP(n123), .Z(n145) );
  NBUFFX2 U22 ( .INP(n124), .Z(n147) );
  NBUFFX2 U31 ( .INP(n127), .Z(n149) );
  NBUFFX2 U40 ( .INP(n127), .Z(n133) );
  NBUFFX2 U49 ( .INP(n126), .Z(n135) );
  NAND3X1 U50 ( .IN1(n248), .IN2(n166), .IN3(waddr[1]), .QN(n247) );
  NAND3X0 U59 ( .IN1(n248), .IN2(n167), .IN3(n165), .QN(n246) );
  NAND3X0 U68 ( .IN1(n166), .IN2(n167), .IN3(n248), .QN(n245) );
  NAND3X1 U77 ( .IN1(waddr[1]), .IN2(n165), .IN3(n243), .QN(n244) );
  NAND3X0 U86 ( .IN1(n165), .IN2(n167), .IN3(n243), .QN(n241) );
  NAND3X0 U87 ( .IN1(n166), .IN2(n167), .IN3(n243), .QN(n240) );
  NBUFFX2 U88 ( .INP(n249), .Z(n164) );
  INVX0 U89 ( .INP(n142), .ZN(n141) );
  INVX0 U90 ( .INP(waddr[2]), .ZN(n1) );
  INVX0 U91 ( .INP(n1), .ZN(n2) );
  NAND3X1 U92 ( .IN1(n165), .IN2(n248), .IN3(waddr[1]), .QN(n249) );
  INVX0 U93 ( .INP(n240), .ZN(n3) );
  INVX0 U94 ( .INP(n241), .ZN(n4) );
  INVX0 U95 ( .INP(n244), .ZN(n5) );
  INVX0 U96 ( .INP(n242), .ZN(n6) );
  NAND3X1 U97 ( .IN1(waddr[1]), .IN2(n166), .IN3(n243), .QN(n242) );
  NBUFFX2 U98 ( .INP(wdata[7]), .Z(n7) );
  NBUFFX2 U99 ( .INP(wdata[5]), .Z(n8) );
  NBUFFX2 U100 ( .INP(wdata[3]), .Z(n9) );
  NBUFFX2 U101 ( .INP(wdata[2]), .Z(n10) );
  NBUFFX2 U102 ( .INP(wdata[1]), .Z(n11) );
  NBUFFX2 U103 ( .INP(wdata[0]), .Z(n86) );
  NBUFFX2 U104 ( .INP(wdata[6]), .Z(n87) );
  NBUFFX2 U105 ( .INP(wdata[4]), .Z(n88) );
  INVX0 U106 ( .INP(n246), .ZN(n90) );
  INVX0 U107 ( .INP(n245), .ZN(n91) );
  NAND2X0 U108 ( .IN1(mem[33]), .IN2(n137), .QN(n92) );
  NAND2X0 U109 ( .IN1(mem[49]), .IN2(n139), .QN(n93) );
  NAND2X1 U110 ( .IN1(n92), .IN2(n93), .QN(n98) );
  INVX0 U111 ( .INP(n158), .ZN(n172) );
  INVX0 U112 ( .INP(n160), .ZN(n173) );
  INVX0 U113 ( .INP(n152), .ZN(n169) );
  INVX0 U114 ( .INP(n150), .ZN(n168) );
  INVX0 U115 ( .INP(n249), .ZN(n175) );
  INVX0 U116 ( .INP(n156), .ZN(n170) );
  INVX0 U117 ( .INP(n247), .ZN(n174) );
  NBUFFX2 U118 ( .INP(n245), .Z(n158) );
  NBUFFX2 U119 ( .INP(n246), .Z(n160) );
  NBUFFX2 U120 ( .INP(n241), .Z(n152) );
  NBUFFX2 U121 ( .INP(n240), .Z(n150) );
  NBUFFX2 U122 ( .INP(n245), .Z(n159) );
  NBUFFX2 U123 ( .INP(n246), .Z(n161) );
  NBUFFX2 U124 ( .INP(n241), .Z(n153) );
  NBUFFX2 U125 ( .INP(n240), .Z(n151) );
  NBUFFX2 U126 ( .INP(n247), .Z(n162) );
  NBUFFX2 U127 ( .INP(n244), .Z(n156) );
  NBUFFX2 U128 ( .INP(n242), .Z(n154) );
  NBUFFX2 U129 ( .INP(n162), .Z(n163) );
  NBUFFX2 U130 ( .INP(n244), .Z(n157) );
  NBUFFX2 U131 ( .INP(n242), .Z(n155) );
  NOR2X0 U132 ( .IN1(n171), .IN2(n2), .QN(n243) );
  INVX0 U133 ( .INP(we), .ZN(n171) );
  NOR2X0 U134 ( .IN1(n130), .IN2(n89), .QN(n127) );
  NOR2X0 U135 ( .IN1(n89), .IN2(n131), .QN(n123) );
  AO22X1 U136 ( .IN1(mem[32]), .IN2(n137), .IN3(mem[48]), .IN4(n139), .Q(n94)
         );
  AO221X1 U137 ( .IN1(mem[16]), .IN2(n148), .IN3(mem[0]), .IN4(n136), .IN5(n94), .Q(n97) );
  AO22X1 U138 ( .IN1(mem[40]), .IN2(n146), .IN3(mem[56]), .IN4(n144), .Q(n95)
         );
  AO221X1 U139 ( .IN1(mem[24]), .IN2(n133), .IN3(mem[8]), .IN4(n136), .IN5(n95), .Q(n96) );
  AO22X1 U140 ( .IN1(n97), .IN2(n141), .IN3(n96), .IN4(n142), .Q(rdata[0]) );
  AO221X1 U141 ( .IN1(mem[17]), .IN2(n149), .IN3(mem[1]), .IN4(n136), .IN5(n98), .Q(n101) );
  AO22X1 U142 ( .IN1(mem[41]), .IN2(n146), .IN3(mem[57]), .IN4(n144), .Q(n99)
         );
  AO221X1 U143 ( .IN1(mem[25]), .IN2(n149), .IN3(mem[9]), .IN4(n136), .IN5(n99), .Q(n100) );
  AO22X1 U144 ( .IN1(n101), .IN2(n141), .IN3(n100), .IN4(n142), .Q(rdata[1])
         );
  AO22X1 U145 ( .IN1(mem[34]), .IN2(n138), .IN3(mem[50]), .IN4(n140), .Q(n102)
         );
  AO221X1 U146 ( .IN1(mem[18]), .IN2(n148), .IN3(mem[2]), .IN4(n136), .IN5(
        n102), .Q(n105) );
  AO22X1 U147 ( .IN1(mem[42]), .IN2(n147), .IN3(mem[58]), .IN4(n145), .Q(n103)
         );
  AO221X1 U148 ( .IN1(mem[26]), .IN2(n148), .IN3(mem[10]), .IN4(n136), .IN5(
        n103), .Q(n104) );
  AO22X1 U149 ( .IN1(n105), .IN2(n141), .IN3(n104), .IN4(n142), .Q(rdata[2])
         );
  AO22X1 U150 ( .IN1(mem[35]), .IN2(n146), .IN3(mem[51]), .IN4(n144), .Q(n106)
         );
  AO221X1 U151 ( .IN1(mem[19]), .IN2(n134), .IN3(mem[3]), .IN4(n143), .IN5(
        n106), .Q(n109) );
  AO22X1 U152 ( .IN1(mem[43]), .IN2(n137), .IN3(mem[59]), .IN4(n139), .Q(n107)
         );
  AO221X1 U153 ( .IN1(mem[27]), .IN2(n133), .IN3(mem[11]), .IN4(n135), .IN5(
        n107), .Q(n108) );
  AO22X1 U154 ( .IN1(n109), .IN2(n141), .IN3(n108), .IN4(n142), .Q(rdata[3])
         );
  AO22X1 U155 ( .IN1(mem[36]), .IN2(n147), .IN3(mem[52]), .IN4(n145), .Q(n110)
         );
  AO221X1 U156 ( .IN1(mem[20]), .IN2(n134), .IN3(mem[4]), .IN4(n143), .IN5(
        n110), .Q(n113) );
  AO22X1 U157 ( .IN1(mem[44]), .IN2(n138), .IN3(mem[60]), .IN4(n140), .Q(n111)
         );
  AO221X1 U158 ( .IN1(mem[28]), .IN2(n149), .IN3(mem[12]), .IN4(n135), .IN5(
        n111), .Q(n112) );
  AO22X1 U159 ( .IN1(n113), .IN2(n141), .IN3(n112), .IN4(n142), .Q(rdata[4])
         );
  AO22X1 U160 ( .IN1(mem[37]), .IN2(n137), .IN3(mem[53]), .IN4(n139), .Q(n114)
         );
  AO221X1 U161 ( .IN1(mem[21]), .IN2(n134), .IN3(mem[5]), .IN4(n143), .IN5(
        n114), .Q(n117) );
  AO22X1 U162 ( .IN1(mem[45]), .IN2(n146), .IN3(mem[61]), .IN4(n144), .Q(n115)
         );
  AO221X1 U163 ( .IN1(mem[29]), .IN2(n148), .IN3(mem[13]), .IN4(n135), .IN5(
        n115), .Q(n116) );
  AO22X1 U164 ( .IN1(n117), .IN2(n141), .IN3(n116), .IN4(n142), .Q(rdata[5])
         );
  AO22X1 U165 ( .IN1(mem[38]), .IN2(n138), .IN3(mem[54]), .IN4(n140), .Q(n118)
         );
  AO221X1 U166 ( .IN1(mem[22]), .IN2(n134), .IN3(mem[6]), .IN4(n143), .IN5(
        n118), .Q(n121) );
  AO22X1 U167 ( .IN1(mem[46]), .IN2(n147), .IN3(mem[62]), .IN4(n145), .Q(n119)
         );
  AO221X1 U168 ( .IN1(mem[30]), .IN2(n133), .IN3(mem[14]), .IN4(n135), .IN5(
        n119), .Q(n120) );
  AO22X1 U169 ( .IN1(n121), .IN2(n141), .IN3(n120), .IN4(n142), .Q(rdata[6])
         );
  AO22X1 U170 ( .IN1(mem[39]), .IN2(n138), .IN3(mem[55]), .IN4(n140), .Q(n122)
         );
  AO221X1 U171 ( .IN1(mem[23]), .IN2(n133), .IN3(mem[7]), .IN4(n143), .IN5(
        n122), .Q(n129) );
  AO22X1 U172 ( .IN1(mem[47]), .IN2(n147), .IN3(mem[63]), .IN4(n145), .Q(n125)
         );
  AO221X1 U173 ( .IN1(mem[31]), .IN2(n149), .IN3(mem[15]), .IN4(n135), .IN5(
        n125), .Q(n128) );
  AO22X1 U174 ( .IN1(n129), .IN2(n141), .IN3(n128), .IN4(n142), .Q(rdata[7])
         );
  INVX0 U175 ( .INP(raddr[2]), .ZN(n130) );
  INVX0 U176 ( .INP(n130), .ZN(n131) );
  INVX0 U177 ( .INP(n89), .ZN(n132) );
  INVX0 U178 ( .INP(raddr[0]), .ZN(n142) );
  NOR2X0 U179 ( .IN1(n130), .IN2(n132), .QN(n126) );
  NOR2X0 U180 ( .IN1(n132), .IN2(n131), .QN(n124) );
  NOR2X0 U181 ( .IN1(n130), .IN2(n132), .QN(n143) );
  INVX0 U182 ( .INP(n166), .ZN(n165) );
  INVX0 U183 ( .INP(waddr[0]), .ZN(n166) );
  INVX0 U184 ( .INP(waddr[1]), .ZN(n167) );
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
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246,
         n247, n248, n249, n250, n251, n252, n253, n254, n255, n256, n257,
         n258, n259, n260, n261;
  wire   [63:0] mem;

  DFFX1 mem_reg_0__7_ ( .D(n188), .CLK(clk), .Q(mem[63]) );
  DFFX1 mem_reg_0__6_ ( .D(n189), .CLK(clk), .Q(mem[62]) );
  DFFX1 mem_reg_0__5_ ( .D(n190), .CLK(clk), .Q(mem[61]) );
  DFFX1 mem_reg_0__4_ ( .D(n191), .CLK(clk), .Q(mem[60]) );
  DFFX1 mem_reg_0__3_ ( .D(n192), .CLK(clk), .Q(mem[59]) );
  DFFX1 mem_reg_0__2_ ( .D(n193), .CLK(clk), .Q(mem[58]) );
  DFFX1 mem_reg_0__1_ ( .D(n194), .CLK(clk), .Q(mem[57]) );
  DFFX1 mem_reg_0__0_ ( .D(n195), .CLK(clk), .Q(mem[56]) );
  DFFX1 mem_reg_1__7_ ( .D(n196), .CLK(clk), .Q(mem[55]) );
  DFFX1 mem_reg_1__6_ ( .D(n197), .CLK(clk), .Q(mem[54]) );
  DFFX1 mem_reg_1__5_ ( .D(n198), .CLK(clk), .Q(mem[53]) );
  DFFX1 mem_reg_1__4_ ( .D(n199), .CLK(clk), .Q(mem[52]) );
  DFFX1 mem_reg_1__3_ ( .D(n200), .CLK(clk), .Q(mem[51]) );
  DFFX1 mem_reg_1__2_ ( .D(n201), .CLK(clk), .Q(mem[50]) );
  DFFX1 mem_reg_1__1_ ( .D(n202), .CLK(clk), .Q(mem[49]) );
  DFFX1 mem_reg_1__0_ ( .D(n203), .CLK(clk), .Q(mem[48]) );
  DFFX1 mem_reg_2__7_ ( .D(n204), .CLK(clk), .Q(mem[47]) );
  DFFX1 mem_reg_2__6_ ( .D(n205), .CLK(clk), .Q(mem[46]) );
  DFFX1 mem_reg_2__5_ ( .D(n206), .CLK(clk), .Q(mem[45]) );
  DFFX1 mem_reg_2__4_ ( .D(n207), .CLK(clk), .Q(mem[44]) );
  DFFX1 mem_reg_2__3_ ( .D(n208), .CLK(clk), .Q(mem[43]) );
  DFFX1 mem_reg_2__2_ ( .D(n209), .CLK(clk), .Q(mem[42]) );
  DFFX1 mem_reg_2__1_ ( .D(n210), .CLK(clk), .Q(mem[41]) );
  DFFX1 mem_reg_2__0_ ( .D(n211), .CLK(clk), .Q(mem[40]) );
  DFFX1 mem_reg_3__7_ ( .D(n212), .CLK(clk), .Q(mem[39]) );
  DFFX1 mem_reg_3__6_ ( .D(n213), .CLK(clk), .Q(mem[38]) );
  DFFX1 mem_reg_3__5_ ( .D(n214), .CLK(clk), .Q(mem[37]) );
  DFFX1 mem_reg_3__4_ ( .D(n215), .CLK(clk), .Q(mem[36]) );
  DFFX1 mem_reg_3__3_ ( .D(n216), .CLK(clk), .Q(mem[35]) );
  DFFX1 mem_reg_3__2_ ( .D(n217), .CLK(clk), .Q(mem[34]) );
  DFFX1 mem_reg_3__1_ ( .D(n218), .CLK(clk), .Q(mem[33]) );
  DFFX1 mem_reg_3__0_ ( .D(n219), .CLK(clk), .Q(mem[32]) );
  DFFX1 mem_reg_4__7_ ( .D(n220), .CLK(clk), .Q(mem[31]) );
  DFFX1 mem_reg_4__6_ ( .D(n221), .CLK(clk), .Q(mem[30]) );
  DFFX1 mem_reg_4__5_ ( .D(n222), .CLK(clk), .Q(mem[29]) );
  DFFX1 mem_reg_4__4_ ( .D(n223), .CLK(clk), .Q(mem[28]) );
  DFFX1 mem_reg_4__3_ ( .D(n224), .CLK(clk), .Q(mem[27]) );
  DFFX1 mem_reg_4__2_ ( .D(n225), .CLK(clk), .Q(mem[26]) );
  DFFX1 mem_reg_4__1_ ( .D(n226), .CLK(clk), .Q(mem[25]) );
  DFFX1 mem_reg_4__0_ ( .D(n227), .CLK(clk), .Q(mem[24]) );
  DFFX1 mem_reg_5__7_ ( .D(n228), .CLK(clk), .Q(mem[23]) );
  DFFX1 mem_reg_5__6_ ( .D(n229), .CLK(clk), .Q(mem[22]) );
  DFFX1 mem_reg_5__5_ ( .D(n230), .CLK(clk), .Q(mem[21]) );
  DFFX1 mem_reg_5__4_ ( .D(n231), .CLK(clk), .Q(mem[20]) );
  DFFX1 mem_reg_5__3_ ( .D(n232), .CLK(clk), .Q(mem[19]) );
  DFFX1 mem_reg_5__2_ ( .D(n233), .CLK(clk), .Q(mem[18]) );
  DFFX1 mem_reg_5__1_ ( .D(n234), .CLK(clk), .Q(mem[17]) );
  DFFX1 mem_reg_5__0_ ( .D(n235), .CLK(clk), .Q(mem[16]) );
  DFFX1 mem_reg_6__7_ ( .D(n236), .CLK(clk), .Q(mem[15]) );
  DFFX1 mem_reg_6__6_ ( .D(n237), .CLK(clk), .Q(mem[14]) );
  DFFX1 mem_reg_6__5_ ( .D(n238), .CLK(clk), .Q(mem[13]) );
  DFFX1 mem_reg_6__4_ ( .D(n239), .CLK(clk), .Q(mem[12]) );
  DFFX1 mem_reg_6__3_ ( .D(n240), .CLK(clk), .Q(mem[11]) );
  DFFX1 mem_reg_6__2_ ( .D(n241), .CLK(clk), .Q(mem[10]) );
  DFFX1 mem_reg_6__1_ ( .D(n242), .CLK(clk), .Q(mem[9]) );
  DFFX1 mem_reg_6__0_ ( .D(n243), .CLK(clk), .Q(mem[8]) );
  DFFX1 mem_reg_7__7_ ( .D(n244), .CLK(clk), .Q(mem[7]) );
  DFFX1 mem_reg_7__6_ ( .D(n245), .CLK(clk), .Q(mem[6]) );
  DFFX1 mem_reg_7__5_ ( .D(n246), .CLK(clk), .Q(mem[5]) );
  DFFX1 mem_reg_7__4_ ( .D(n247), .CLK(clk), .Q(mem[4]) );
  DFFX1 mem_reg_7__3_ ( .D(n248), .CLK(clk), .Q(mem[3]) );
  DFFX1 mem_reg_7__2_ ( .D(n249), .CLK(clk), .Q(mem[2]) );
  DFFX1 mem_reg_7__1_ ( .D(n250), .CLK(clk), .Q(mem[1]) );
  DFFX1 mem_reg_7__0_ ( .D(n251), .CLK(clk), .Q(mem[0]) );
  AO22X1 U14 ( .IN1(n106), .IN2(n187), .IN3(mem[0]), .IN4(n175), .Q(n251) );
  AO22X1 U15 ( .IN1(n104), .IN2(n187), .IN3(mem[1]), .IN4(n175), .Q(n250) );
  AO22X1 U16 ( .IN1(n102), .IN2(n187), .IN3(mem[2]), .IN4(n175), .Q(n249) );
  AO22X1 U17 ( .IN1(n100), .IN2(n187), .IN3(mem[3]), .IN4(n175), .Q(n248) );
  AO22X1 U18 ( .IN1(n98), .IN2(n9), .IN3(mem[4]), .IN4(n175), .Q(n247) );
  AO22X1 U19 ( .IN1(n96), .IN2(n9), .IN3(mem[5]), .IN4(n174), .Q(n246) );
  AO22X1 U20 ( .IN1(n94), .IN2(n9), .IN3(mem[6]), .IN4(n174), .Q(n245) );
  AO22X1 U21 ( .IN1(n92), .IN2(n9), .IN3(mem[7]), .IN4(n174), .Q(n244) );
  AO22X1 U23 ( .IN1(n186), .IN2(n106), .IN3(mem[8]), .IN4(n173), .Q(n243) );
  AO22X1 U24 ( .IN1(n186), .IN2(n104), .IN3(mem[9]), .IN4(n173), .Q(n242) );
  AO22X1 U25 ( .IN1(n186), .IN2(n102), .IN3(mem[10]), .IN4(n173), .Q(n241) );
  AO22X1 U26 ( .IN1(n186), .IN2(n100), .IN3(mem[11]), .IN4(n173), .Q(n240) );
  AO22X1 U27 ( .IN1(n10), .IN2(n98), .IN3(mem[12]), .IN4(n173), .Q(n239) );
  AO22X1 U28 ( .IN1(n10), .IN2(n96), .IN3(mem[13]), .IN4(n172), .Q(n238) );
  AO22X1 U29 ( .IN1(n10), .IN2(n94), .IN3(mem[14]), .IN4(n172), .Q(n237) );
  AO22X1 U30 ( .IN1(n10), .IN2(n92), .IN3(mem[15]), .IN4(n172), .Q(n236) );
  AO22X1 U32 ( .IN1(n89), .IN2(n106), .IN3(mem[16]), .IN4(n171), .Q(n235) );
  AO22X1 U33 ( .IN1(n89), .IN2(n104), .IN3(mem[17]), .IN4(n171), .Q(n234) );
  AO22X1 U34 ( .IN1(n89), .IN2(n102), .IN3(mem[18]), .IN4(n171), .Q(n233) );
  AO22X1 U35 ( .IN1(n89), .IN2(n100), .IN3(mem[19]), .IN4(n171), .Q(n232) );
  AO22X1 U36 ( .IN1(n89), .IN2(n98), .IN3(mem[20]), .IN4(n171), .Q(n231) );
  AO22X1 U41 ( .IN1(n90), .IN2(n106), .IN3(mem[24]), .IN4(n169), .Q(n227) );
  AO22X1 U42 ( .IN1(n90), .IN2(n104), .IN3(mem[25]), .IN4(n169), .Q(n226) );
  AO22X1 U43 ( .IN1(n90), .IN2(n102), .IN3(mem[26]), .IN4(n169), .Q(n225) );
  AO22X1 U44 ( .IN1(n90), .IN2(n100), .IN3(mem[27]), .IN4(n169), .Q(n224) );
  AO22X1 U45 ( .IN1(n90), .IN2(n98), .IN3(mem[28]), .IN4(n169), .Q(n223) );
  AO22X1 U51 ( .IN1(n182), .IN2(n106), .IN3(mem[32]), .IN4(n167), .Q(n219) );
  AO22X1 U52 ( .IN1(n182), .IN2(n104), .IN3(mem[33]), .IN4(n167), .Q(n218) );
  AO22X1 U53 ( .IN1(n182), .IN2(n102), .IN3(mem[34]), .IN4(n167), .Q(n217) );
  AO22X1 U54 ( .IN1(n86), .IN2(n100), .IN3(mem[35]), .IN4(n167), .Q(n216) );
  AO22X1 U55 ( .IN1(n86), .IN2(n98), .IN3(mem[36]), .IN4(n167), .Q(n215) );
  AO22X1 U56 ( .IN1(n86), .IN2(n96), .IN3(mem[37]), .IN4(n166), .Q(n214) );
  AO22X1 U57 ( .IN1(n86), .IN2(n94), .IN3(mem[38]), .IN4(n166), .Q(n213) );
  AO22X1 U58 ( .IN1(n86), .IN2(n92), .IN3(mem[39]), .IN4(n166), .Q(n212) );
  AO22X1 U60 ( .IN1(n181), .IN2(n106), .IN3(mem[40]), .IN4(n165), .Q(n211) );
  AO22X1 U61 ( .IN1(n181), .IN2(n104), .IN3(mem[41]), .IN4(n165), .Q(n210) );
  AO22X1 U62 ( .IN1(n181), .IN2(n102), .IN3(mem[42]), .IN4(n165), .Q(n209) );
  AO22X1 U63 ( .IN1(n11), .IN2(n100), .IN3(mem[43]), .IN4(n165), .Q(n208) );
  AO22X1 U64 ( .IN1(n11), .IN2(n98), .IN3(mem[44]), .IN4(n165), .Q(n207) );
  AO22X1 U65 ( .IN1(n11), .IN2(n96), .IN3(mem[45]), .IN4(n164), .Q(n206) );
  AO22X1 U66 ( .IN1(n11), .IN2(n94), .IN3(mem[46]), .IN4(n164), .Q(n205) );
  AO22X1 U67 ( .IN1(n11), .IN2(n92), .IN3(mem[47]), .IN4(n164), .Q(n204) );
  AO22X1 U69 ( .IN1(n180), .IN2(n106), .IN3(mem[48]), .IN4(n163), .Q(n203) );
  AO22X1 U70 ( .IN1(n180), .IN2(n104), .IN3(mem[49]), .IN4(n163), .Q(n202) );
  AO22X1 U71 ( .IN1(n180), .IN2(n102), .IN3(mem[50]), .IN4(n163), .Q(n201) );
  AO22X1 U72 ( .IN1(n87), .IN2(n100), .IN3(mem[51]), .IN4(n163), .Q(n200) );
  AO22X1 U73 ( .IN1(n87), .IN2(n98), .IN3(mem[52]), .IN4(n163), .Q(n199) );
  AO22X1 U74 ( .IN1(n87), .IN2(n96), .IN3(mem[53]), .IN4(n162), .Q(n198) );
  AO22X1 U75 ( .IN1(n87), .IN2(n94), .IN3(mem[54]), .IN4(n162), .Q(n197) );
  AO22X1 U76 ( .IN1(n87), .IN2(n92), .IN3(mem[55]), .IN4(n162), .Q(n196) );
  AO22X1 U78 ( .IN1(n179), .IN2(n106), .IN3(mem[56]), .IN4(n161), .Q(n195) );
  AO22X1 U79 ( .IN1(n179), .IN2(n104), .IN3(mem[57]), .IN4(n161), .Q(n194) );
  AO22X1 U80 ( .IN1(n179), .IN2(n102), .IN3(mem[58]), .IN4(n161), .Q(n193) );
  AO22X1 U81 ( .IN1(n88), .IN2(n100), .IN3(mem[59]), .IN4(n161), .Q(n192) );
  AO22X1 U82 ( .IN1(n88), .IN2(n98), .IN3(mem[60]), .IN4(n161), .Q(n191) );
  AO22X1 U83 ( .IN1(n88), .IN2(n96), .IN3(mem[61]), .IN4(n160), .Q(n190) );
  AO22X1 U84 ( .IN1(n88), .IN2(n94), .IN3(mem[62]), .IN4(n160), .Q(n189) );
  AO22X1 U85 ( .IN1(n88), .IN2(n92), .IN3(mem[63]), .IN4(n160), .Q(n188) );
  NAND2X1 U2 ( .IN1(mem[32]), .IN2(n152), .QN(n1) );
  NAND2X0 U3 ( .IN1(mem[48]), .IN2(n154), .QN(n2) );
  AND2X1 U4 ( .IN1(n1), .IN2(n2), .Q(n3) );
  NBUFFX4 U5 ( .INP(n138), .Z(n152) );
  NBUFFX4 U6 ( .INP(n137), .Z(n154) );
  AND2X1 U7 ( .IN1(we), .IN2(waddr[2]), .Q(n260) );
  NBUFFX2 U8 ( .INP(n140), .Z(n150) );
  NBUFFX2 U9 ( .INP(n138), .Z(n151) );
  NBUFFX2 U10 ( .INP(n141), .Z(n147) );
  NBUFFX2 U11 ( .INP(n138), .Z(n156) );
  NBUFFX2 U12 ( .INP(n138), .Z(n157) );
  NBUFFX2 U13 ( .INP(n140), .Z(n149) );
  NBUFFX2 U22 ( .INP(n141), .Z(n146) );
  NBUFFX2 U31 ( .INP(n141), .Z(n108) );
  NBUFFX2 U37 ( .INP(n140), .Z(n148) );
  NAND3X0 U38 ( .IN1(n176), .IN2(n260), .IN3(n8), .QN(n261) );
  NAND3X0 U39 ( .IN1(n260), .IN2(n177), .IN3(n8), .QN(n259) );
  NAND3X0 U40 ( .IN1(n260), .IN2(n178), .IN3(n176), .QN(n258) );
  NAND3X0 U46 ( .IN1(n177), .IN2(n178), .IN3(n260), .QN(n257) );
  NAND3X0 U47 ( .IN1(n8), .IN2(n176), .IN3(n255), .QN(n256) );
  NAND3X0 U48 ( .IN1(n8), .IN2(n177), .IN3(n255), .QN(n254) );
  NAND3X0 U49 ( .IN1(n176), .IN2(n178), .IN3(n255), .QN(n253) );
  NAND3X0 U50 ( .IN1(n177), .IN2(n178), .IN3(n255), .QN(n252) );
  NBUFFX2 U59 ( .INP(n261), .Z(n175) );
  NBUFFX2 U68 ( .INP(n261), .Z(n174) );
  NBUFFX2 U77 ( .INP(n259), .Z(n172) );
  NBUFFX2 U86 ( .INP(n258), .Z(n171) );
  NBUFFX2 U87 ( .INP(n258), .Z(n170) );
  NBUFFX2 U88 ( .INP(n253), .Z(n162) );
  AO22X1 U89 ( .IN1(n185), .IN2(n96), .IN3(mem[21]), .IN4(n170), .Q(n230) );
  AO22X1 U90 ( .IN1(n185), .IN2(n94), .IN3(mem[22]), .IN4(n170), .Q(n229) );
  AO22X1 U91 ( .IN1(n185), .IN2(n92), .IN3(mem[23]), .IN4(n170), .Q(n228) );
  AO22X1 U92 ( .IN1(n184), .IN2(n96), .IN3(mem[29]), .IN4(n168), .Q(n222) );
  AO22X1 U93 ( .IN1(n184), .IN2(n94), .IN3(mem[30]), .IN4(n168), .Q(n221) );
  AO22X1 U94 ( .IN1(n184), .IN2(n92), .IN3(mem[31]), .IN4(n168), .Q(n220) );
  INVX0 U95 ( .INP(n158), .ZN(n159) );
  NBUFFX2 U96 ( .INP(n137), .Z(n153) );
  NAND2X1 U97 ( .IN1(mem[16]), .IN2(n107), .QN(n4) );
  NAND2X0 U98 ( .IN1(mem[0]), .IN2(n150), .QN(n5) );
  NAND3X0 U99 ( .IN1(n4), .IN2(n5), .IN3(n3), .QN(n111) );
  NBUFFX2 U100 ( .INP(n141), .Z(n107) );
  INVX0 U101 ( .INP(raddr[1]), .ZN(n6) );
  INVX0 U102 ( .INP(n6), .ZN(n7) );
  INVX0 U103 ( .INP(n178), .ZN(n8) );
  INVX0 U104 ( .INP(n261), .ZN(n9) );
  INVX0 U105 ( .INP(n259), .ZN(n10) );
  INVX0 U106 ( .INP(n254), .ZN(n11) );
  INVX0 U107 ( .INP(n256), .ZN(n86) );
  INVX0 U108 ( .INP(n253), .ZN(n87) );
  INVX0 U109 ( .INP(n252), .ZN(n88) );
  INVX0 U110 ( .INP(n258), .ZN(n89) );
  INVX0 U111 ( .INP(n257), .ZN(n90) );
  INVX0 U112 ( .INP(wdata[7]), .ZN(n91) );
  INVX0 U113 ( .INP(n91), .ZN(n92) );
  INVX0 U114 ( .INP(wdata[6]), .ZN(n93) );
  INVX0 U115 ( .INP(n93), .ZN(n94) );
  INVX0 U116 ( .INP(wdata[5]), .ZN(n95) );
  INVX0 U117 ( .INP(n95), .ZN(n96) );
  INVX0 U118 ( .INP(wdata[4]), .ZN(n97) );
  INVX0 U119 ( .INP(n97), .ZN(n98) );
  INVX0 U120 ( .INP(wdata[3]), .ZN(n99) );
  INVX0 U121 ( .INP(n99), .ZN(n100) );
  INVX0 U122 ( .INP(wdata[2]), .ZN(n101) );
  INVX0 U123 ( .INP(n101), .ZN(n102) );
  INVX0 U124 ( .INP(wdata[1]), .ZN(n103) );
  INVX0 U125 ( .INP(n103), .ZN(n104) );
  INVX0 U126 ( .INP(wdata[0]), .ZN(n105) );
  INVX0 U127 ( .INP(n105), .ZN(n106) );
  NBUFFX2 U128 ( .INP(n137), .Z(n155) );
  INVX0 U129 ( .INP(n170), .ZN(n185) );
  INVX0 U130 ( .INP(n162), .ZN(n180) );
  INVX0 U131 ( .INP(n160), .ZN(n179) );
  INVX0 U132 ( .INP(n168), .ZN(n184) );
  INVX0 U133 ( .INP(n166), .ZN(n182) );
  INVX0 U134 ( .INP(n164), .ZN(n181) );
  INVX0 U135 ( .INP(n172), .ZN(n186) );
  NBUFFX2 U136 ( .INP(n252), .Z(n160) );
  INVX0 U137 ( .INP(n174), .ZN(n187) );
  NBUFFX2 U138 ( .INP(n257), .Z(n168) );
  NBUFFX2 U139 ( .INP(n253), .Z(n163) );
  NBUFFX2 U140 ( .INP(n252), .Z(n161) );
  NBUFFX2 U141 ( .INP(n257), .Z(n169) );
  NBUFFX2 U142 ( .INP(n256), .Z(n166) );
  NBUFFX2 U143 ( .INP(n254), .Z(n164) );
  NBUFFX2 U144 ( .INP(n259), .Z(n173) );
  NBUFFX2 U145 ( .INP(n256), .Z(n167) );
  NBUFFX2 U146 ( .INP(n254), .Z(n165) );
  NOR2X0 U147 ( .IN1(n183), .IN2(waddr[2]), .QN(n255) );
  INVX0 U148 ( .INP(we), .ZN(n183) );
  AO22X1 U149 ( .IN1(mem[39]), .IN2(n157), .IN3(mem[55]), .IN4(n155), .Q(n136)
         );
  NOR2X0 U150 ( .IN1(n144), .IN2(n7), .QN(n141) );
  NOR2X0 U151 ( .IN1(n7), .IN2(n145), .QN(n137) );
  AO22X1 U152 ( .IN1(mem[40]), .IN2(n152), .IN3(mem[56]), .IN4(n154), .Q(n109)
         );
  AO221X1 U153 ( .IN1(mem[24]), .IN2(n146), .IN3(mem[8]), .IN4(n150), .IN5(
        n109), .Q(n110) );
  AO22X1 U154 ( .IN1(n111), .IN2(n159), .IN3(n110), .IN4(n158), .Q(rdata[0])
         );
  AO22X1 U155 ( .IN1(mem[33]), .IN2(n157), .IN3(mem[49]), .IN4(n153), .Q(n112)
         );
  AO221X1 U156 ( .IN1(mem[17]), .IN2(n146), .IN3(mem[1]), .IN4(n150), .IN5(
        n112), .Q(n115) );
  AO221X1 U157 ( .IN1(mem[25]), .IN2(n107), .IN3(mem[9]), .IN4(n150), .IN5(
        n113), .Q(n114) );
  AO22X1 U158 ( .IN1(n115), .IN2(n159), .IN3(n114), .IN4(n158), .Q(rdata[1])
         );
  AO22X1 U159 ( .IN1(mem[34]), .IN2(n152), .IN3(mem[50]), .IN4(n153), .Q(n116)
         );
  AO221X1 U160 ( .IN1(mem[18]), .IN2(n147), .IN3(mem[2]), .IN4(n150), .IN5(
        n116), .Q(n119) );
  AO22X1 U161 ( .IN1(mem[42]), .IN2(n152), .IN3(mem[58]), .IN4(n155), .Q(n117)
         );
  AO221X1 U162 ( .IN1(mem[26]), .IN2(n147), .IN3(mem[10]), .IN4(n150), .IN5(
        n117), .Q(n118) );
  AO22X1 U163 ( .IN1(n119), .IN2(n159), .IN3(n118), .IN4(n158), .Q(rdata[2])
         );
  AO22X1 U164 ( .IN1(mem[35]), .IN2(n151), .IN3(mem[51]), .IN4(n153), .Q(n120)
         );
  AO221X1 U165 ( .IN1(mem[19]), .IN2(n147), .IN3(mem[3]), .IN4(n148), .IN5(
        n120), .Q(n123) );
  AO22X1 U166 ( .IN1(mem[43]), .IN2(n151), .IN3(mem[59]), .IN4(n155), .Q(n121)
         );
  AO221X1 U167 ( .IN1(mem[27]), .IN2(n147), .IN3(mem[11]), .IN4(n149), .IN5(
        n121), .Q(n122) );
  AO22X1 U168 ( .IN1(n123), .IN2(n159), .IN3(n122), .IN4(n158), .Q(rdata[3])
         );
  AO22X1 U169 ( .IN1(mem[36]), .IN2(n151), .IN3(mem[52]), .IN4(n153), .Q(n124)
         );
  AO221X1 U170 ( .IN1(mem[20]), .IN2(n107), .IN3(mem[4]), .IN4(n148), .IN5(
        n124), .Q(n127) );
  AO22X1 U171 ( .IN1(mem[44]), .IN2(n156), .IN3(mem[60]), .IN4(n154), .Q(n125)
         );
  AO221X1 U172 ( .IN1(mem[28]), .IN2(n108), .IN3(mem[12]), .IN4(n149), .IN5(
        n125), .Q(n126) );
  AO22X1 U173 ( .IN1(n127), .IN2(n159), .IN3(n126), .IN4(n158), .Q(rdata[4])
         );
  AO221X1 U174 ( .IN1(mem[21]), .IN2(n108), .IN3(mem[5]), .IN4(n148), .IN5(
        n128), .Q(n131) );
  AO22X1 U175 ( .IN1(mem[45]), .IN2(n157), .IN3(mem[61]), .IN4(n155), .Q(n129)
         );
  AO221X1 U176 ( .IN1(mem[29]), .IN2(n146), .IN3(mem[13]), .IN4(n149), .IN5(
        n129), .Q(n130) );
  AO22X1 U177 ( .IN1(n131), .IN2(n159), .IN3(n130), .IN4(n158), .Q(rdata[5])
         );
  AO221X1 U178 ( .IN1(mem[22]), .IN2(n107), .IN3(mem[6]), .IN4(n148), .IN5(
        n132), .Q(n135) );
  AO22X1 U179 ( .IN1(mem[46]), .IN2(n156), .IN3(mem[62]), .IN4(n154), .Q(n133)
         );
  AO221X1 U180 ( .IN1(mem[30]), .IN2(n108), .IN3(mem[14]), .IN4(n149), .IN5(
        n133), .Q(n134) );
  AO22X1 U181 ( .IN1(n135), .IN2(n159), .IN3(n134), .IN4(n158), .Q(rdata[6])
         );
  AO221X1 U182 ( .IN1(mem[23]), .IN2(n108), .IN3(mem[7]), .IN4(n148), .IN5(
        n136), .Q(n143) );
  AO22X1 U183 ( .IN1(mem[47]), .IN2(n157), .IN3(mem[63]), .IN4(n155), .Q(n139)
         );
  AO221X1 U184 ( .IN1(mem[31]), .IN2(n146), .IN3(mem[15]), .IN4(n149), .IN5(
        n139), .Q(n142) );
  AO22X1 U185 ( .IN1(n159), .IN2(n143), .IN3(n142), .IN4(n158), .Q(rdata[7])
         );
  INVX0 U186 ( .INP(raddr[2]), .ZN(n144) );
  INVX0 U187 ( .INP(n144), .ZN(n145) );
  NOR2X0 U188 ( .IN1(n144), .IN2(n6), .QN(n140) );
  NOR2X0 U189 ( .IN1(n6), .IN2(n145), .QN(n138) );
  AO22X1 U190 ( .IN1(mem[37]), .IN2(n156), .IN3(mem[53]), .IN4(n137), .Q(n128)
         );
  AO22X1 U191 ( .IN1(mem[38]), .IN2(n151), .IN3(mem[54]), .IN4(n153), .Q(n132)
         );
  AO22X1 U192 ( .IN1(mem[41]), .IN2(n156), .IN3(mem[57]), .IN4(n154), .Q(n113)
         );
  INVX0 U193 ( .INP(raddr[0]), .ZN(n158) );
  INVX0 U194 ( .INP(n177), .ZN(n176) );
  INVX0 U195 ( .INP(waddr[0]), .ZN(n177) );
  INVX0 U196 ( .INP(waddr[1]), .ZN(n178) );
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
  AO22X1 U14 ( .IN1(wdata[0]), .IN2(n6), .IN3(mem[0]), .IN4(n167), .Q(n239) );
  AO22X1 U15 ( .IN1(wdata[1]), .IN2(n6), .IN3(mem[1]), .IN4(n167), .Q(n238) );
  AO22X1 U16 ( .IN1(wdata[2]), .IN2(n6), .IN3(mem[2]), .IN4(n167), .Q(n237) );
  AO22X1 U17 ( .IN1(wdata[3]), .IN2(n6), .IN3(mem[3]), .IN4(n167), .Q(n236) );
  AO22X1 U18 ( .IN1(wdata[4]), .IN2(n6), .IN3(mem[4]), .IN4(n167), .Q(n235) );
  AO22X1 U19 ( .IN1(wdata[5]), .IN2(n6), .IN3(mem[5]), .IN4(n166), .Q(n234) );
  AO22X1 U20 ( .IN1(wdata[6]), .IN2(n6), .IN3(mem[6]), .IN4(n166), .Q(n233) );
  AO22X1 U21 ( .IN1(wdata[7]), .IN2(n6), .IN3(mem[7]), .IN4(n166), .Q(n232) );
  AO22X1 U23 ( .IN1(n175), .IN2(wdata[0]), .IN3(mem[8]), .IN4(n165), .Q(n231)
         );
  AO22X1 U24 ( .IN1(n175), .IN2(wdata[1]), .IN3(mem[9]), .IN4(n165), .Q(n230)
         );
  AO22X1 U25 ( .IN1(n175), .IN2(wdata[2]), .IN3(mem[10]), .IN4(n165), .Q(n229)
         );
  AO22X1 U26 ( .IN1(n175), .IN2(wdata[3]), .IN3(mem[11]), .IN4(n165), .Q(n228)
         );
  AO22X1 U27 ( .IN1(n175), .IN2(wdata[4]), .IN3(mem[12]), .IN4(n165), .Q(n227)
         );
  AO22X1 U28 ( .IN1(n175), .IN2(wdata[5]), .IN3(mem[13]), .IN4(n164), .Q(n226)
         );
  AO22X1 U29 ( .IN1(n175), .IN2(wdata[6]), .IN3(mem[14]), .IN4(n164), .Q(n225)
         );
  AO22X1 U30 ( .IN1(n175), .IN2(wdata[7]), .IN3(mem[15]), .IN4(n164), .Q(n224)
         );
  AO22X1 U32 ( .IN1(n174), .IN2(n101), .IN3(mem[16]), .IN4(n163), .Q(n223) );
  AO22X1 U33 ( .IN1(n174), .IN2(n99), .IN3(mem[17]), .IN4(n163), .Q(n222) );
  AO22X1 U34 ( .IN1(n174), .IN2(n97), .IN3(mem[18]), .IN4(n163), .Q(n221) );
  AO22X1 U35 ( .IN1(n174), .IN2(n95), .IN3(mem[19]), .IN4(n163), .Q(n220) );
  AO22X1 U36 ( .IN1(n174), .IN2(n93), .IN3(mem[20]), .IN4(n163), .Q(n219) );
  AO22X1 U37 ( .IN1(n174), .IN2(n91), .IN3(mem[21]), .IN4(n162), .Q(n218) );
  AO22X1 U38 ( .IN1(n174), .IN2(n89), .IN3(mem[22]), .IN4(n162), .Q(n217) );
  AO22X1 U39 ( .IN1(n174), .IN2(n87), .IN3(mem[23]), .IN4(n162), .Q(n216) );
  AO22X1 U41 ( .IN1(n4), .IN2(n101), .IN3(mem[24]), .IN4(n161), .Q(n215) );
  AO22X1 U42 ( .IN1(n4), .IN2(n99), .IN3(mem[25]), .IN4(n161), .Q(n214) );
  AO22X1 U43 ( .IN1(n4), .IN2(n97), .IN3(mem[26]), .IN4(n161), .Q(n213) );
  AO22X1 U44 ( .IN1(n4), .IN2(n95), .IN3(mem[27]), .IN4(n161), .Q(n212) );
  AO22X1 U45 ( .IN1(n4), .IN2(n93), .IN3(mem[28]), .IN4(n161), .Q(n211) );
  AO22X1 U46 ( .IN1(n4), .IN2(n91), .IN3(mem[29]), .IN4(n160), .Q(n210) );
  AO22X1 U47 ( .IN1(n4), .IN2(n89), .IN3(mem[30]), .IN4(n160), .Q(n209) );
  AO22X1 U48 ( .IN1(n4), .IN2(n87), .IN3(mem[31]), .IN4(n160), .Q(n208) );
  AO22X1 U51 ( .IN1(n172), .IN2(n101), .IN3(mem[32]), .IN4(n159), .Q(n207) );
  AO22X1 U52 ( .IN1(n172), .IN2(n99), .IN3(mem[33]), .IN4(n159), .Q(n206) );
  AO22X1 U53 ( .IN1(n172), .IN2(n97), .IN3(mem[34]), .IN4(n159), .Q(n205) );
  AO22X1 U54 ( .IN1(n172), .IN2(n95), .IN3(mem[35]), .IN4(n159), .Q(n204) );
  AO22X1 U55 ( .IN1(n172), .IN2(n93), .IN3(mem[36]), .IN4(n159), .Q(n203) );
  AO22X1 U56 ( .IN1(n172), .IN2(n91), .IN3(mem[37]), .IN4(n158), .Q(n202) );
  AO22X1 U57 ( .IN1(n172), .IN2(n89), .IN3(mem[38]), .IN4(n158), .Q(n201) );
  AO22X1 U58 ( .IN1(n172), .IN2(n87), .IN3(mem[39]), .IN4(n158), .Q(n200) );
  AO22X1 U60 ( .IN1(n171), .IN2(n101), .IN3(mem[40]), .IN4(n157), .Q(n199) );
  AO22X1 U61 ( .IN1(n171), .IN2(n99), .IN3(mem[41]), .IN4(n157), .Q(n198) );
  AO22X1 U62 ( .IN1(n171), .IN2(n97), .IN3(mem[42]), .IN4(n157), .Q(n197) );
  AO22X1 U63 ( .IN1(n171), .IN2(n95), .IN3(mem[43]), .IN4(n157), .Q(n196) );
  AO22X1 U64 ( .IN1(n171), .IN2(n93), .IN3(mem[44]), .IN4(n157), .Q(n195) );
  AO22X1 U65 ( .IN1(n171), .IN2(n91), .IN3(mem[45]), .IN4(n156), .Q(n194) );
  AO22X1 U66 ( .IN1(n171), .IN2(n89), .IN3(mem[46]), .IN4(n156), .Q(n193) );
  AO22X1 U67 ( .IN1(n171), .IN2(n87), .IN3(mem[47]), .IN4(n156), .Q(n192) );
  AO22X1 U69 ( .IN1(n3), .IN2(n101), .IN3(mem[48]), .IN4(n155), .Q(n191) );
  AO22X1 U70 ( .IN1(n3), .IN2(n99), .IN3(mem[49]), .IN4(n155), .Q(n190) );
  AO22X1 U71 ( .IN1(n3), .IN2(n97), .IN3(mem[50]), .IN4(n155), .Q(n189) );
  AO22X1 U72 ( .IN1(n3), .IN2(n95), .IN3(mem[51]), .IN4(n155), .Q(n188) );
  AO22X1 U73 ( .IN1(n1), .IN2(n93), .IN3(mem[52]), .IN4(n155), .Q(n187) );
  AO22X1 U74 ( .IN1(n1), .IN2(n91), .IN3(mem[53]), .IN4(n154), .Q(n186) );
  AO22X1 U75 ( .IN1(n1), .IN2(n89), .IN3(mem[54]), .IN4(n154), .Q(n185) );
  AO22X1 U76 ( .IN1(n1), .IN2(n87), .IN3(mem[55]), .IN4(n154), .Q(n184) );
  AO22X1 U78 ( .IN1(n2), .IN2(n101), .IN3(mem[56]), .IN4(n153), .Q(n183) );
  AO22X1 U79 ( .IN1(n2), .IN2(n99), .IN3(mem[57]), .IN4(n153), .Q(n182) );
  AO22X1 U80 ( .IN1(n2), .IN2(n97), .IN3(mem[58]), .IN4(n153), .Q(n181) );
  AO22X1 U81 ( .IN1(n2), .IN2(n95), .IN3(mem[59]), .IN4(n153), .Q(n180) );
  AO22X1 U82 ( .IN1(n2), .IN2(n93), .IN3(mem[60]), .IN4(n153), .Q(n179) );
  AO22X1 U83 ( .IN1(n2), .IN2(n91), .IN3(mem[61]), .IN4(n152), .Q(n178) );
  AO22X1 U84 ( .IN1(n2), .IN2(n89), .IN3(mem[62]), .IN4(n152), .Q(n177) );
  AO22X1 U85 ( .IN1(n2), .IN2(n87), .IN3(mem[63]), .IN4(n152), .Q(n176) );
  INVX0 U2 ( .INP(n241), .ZN(n1) );
  NAND3X4 U3 ( .IN1(n168), .IN2(n170), .IN3(n243), .QN(n241) );
  NBUFFX2 U4 ( .INP(n134), .Z(n146) );
  NBUFFX2 U5 ( .INP(n132), .Z(n147) );
  NBUFFX2 U6 ( .INP(n131), .Z(n149) );
  NAND3X1 U7 ( .IN1(n168), .IN2(n248), .IN3(waddr[1]), .QN(n249) );
  NAND3X0 U8 ( .IN1(n169), .IN2(n170), .IN3(n248), .QN(n245) );
  AO22X1 U9 ( .IN1(n105), .IN2(n5), .IN3(n104), .IN4(n141), .Q(rdata[0]) );
  NBUFFX2 U10 ( .INP(n146), .Z(n7) );
  NBUFFX2 U11 ( .INP(n131), .Z(n10) );
  NBUFFX2 U12 ( .INP(n132), .Z(n8) );
  NBUFFX2 U13 ( .INP(n131), .Z(n150) );
  NBUFFX2 U22 ( .INP(n132), .Z(n148) );
  NBUFFX2 U31 ( .INP(n132), .Z(n9) );
  NBUFFX2 U40 ( .INP(n131), .Z(n11) );
  NBUFFX2 U49 ( .INP(n134), .Z(n144) );
  NBUFFX2 U50 ( .INP(n134), .Z(n145) );
  NBUFFX2 U59 ( .INP(n244), .Z(n158) );
  AO22X1 U68 ( .IN1(n113), .IN2(n5), .IN3(n112), .IN4(n141), .Q(rdata[2]) );
  AO22X1 U77 ( .IN1(n121), .IN2(n5), .IN3(n120), .IN4(n141), .Q(rdata[4]) );
  INVX0 U86 ( .INP(n240), .ZN(n2) );
  NAND3X0 U87 ( .IN1(n169), .IN2(n170), .IN3(n243), .QN(n240) );
  INVX0 U88 ( .INP(n241), .ZN(n3) );
  NAND3X1 U89 ( .IN1(waddr[1]), .IN2(n168), .IN3(n243), .QN(n244) );
  AO22X2 U90 ( .IN1(n129), .IN2(n5), .IN3(n128), .IN4(n141), .Q(rdata[6]) );
  AO22X2 U91 ( .IN1(n109), .IN2(n5), .IN3(n108), .IN4(n141), .Q(rdata[1]) );
  AO22X2 U92 ( .IN1(n117), .IN2(n5), .IN3(n116), .IN4(n141), .Q(rdata[3]) );
  NAND3X1 U93 ( .IN1(waddr[1]), .IN2(n169), .IN3(n243), .QN(n242) );
  INVX0 U94 ( .INP(n245), .ZN(n4) );
  AND2X4 U95 ( .IN1(we), .IN2(waddr[2]), .Q(n248) );
  NBUFFX2 U96 ( .INP(raddr[0]), .Z(n5) );
  INVX0 U97 ( .INP(n249), .ZN(n6) );
  INVX0 U98 ( .INP(wdata[7]), .ZN(n86) );
  INVX0 U99 ( .INP(n86), .ZN(n87) );
  INVX0 U100 ( .INP(wdata[6]), .ZN(n88) );
  INVX0 U101 ( .INP(n88), .ZN(n89) );
  INVX0 U102 ( .INP(wdata[5]), .ZN(n90) );
  INVX0 U103 ( .INP(n90), .ZN(n91) );
  INVX0 U104 ( .INP(wdata[4]), .ZN(n92) );
  INVX0 U105 ( .INP(n92), .ZN(n93) );
  INVX0 U106 ( .INP(wdata[3]), .ZN(n94) );
  INVX0 U107 ( .INP(n94), .ZN(n95) );
  INVX0 U108 ( .INP(wdata[2]), .ZN(n96) );
  INVX0 U109 ( .INP(n96), .ZN(n97) );
  INVX0 U110 ( .INP(wdata[1]), .ZN(n98) );
  INVX0 U111 ( .INP(n98), .ZN(n99) );
  INVX0 U112 ( .INP(wdata[0]), .ZN(n100) );
  INVX0 U113 ( .INP(n100), .ZN(n101) );
  INVX0 U114 ( .INP(n246), .ZN(n174) );
  INVX0 U115 ( .INP(n158), .ZN(n172) );
  INVX0 U116 ( .INP(n156), .ZN(n171) );
  INVX0 U117 ( .INP(n164), .ZN(n175) );
  NBUFFX2 U118 ( .INP(n245), .Z(n160) );
  NBUFFX2 U119 ( .INP(n246), .Z(n162) );
  NBUFFX2 U120 ( .INP(n241), .Z(n154) );
  NBUFFX2 U121 ( .INP(n240), .Z(n152) );
  NBUFFX2 U122 ( .INP(n245), .Z(n161) );
  NBUFFX2 U123 ( .INP(n162), .Z(n163) );
  NBUFFX2 U124 ( .INP(n241), .Z(n155) );
  NBUFFX2 U125 ( .INP(n240), .Z(n153) );
  NBUFFX2 U126 ( .INP(n135), .Z(n142) );
  NBUFFX2 U127 ( .INP(n135), .Z(n143) );
  NBUFFX2 U128 ( .INP(n135), .Z(n151) );
  NAND3X0 U129 ( .IN1(n248), .IN2(n170), .IN3(n168), .QN(n246) );
  NBUFFX2 U130 ( .INP(n247), .Z(n164) );
  NBUFFX2 U131 ( .INP(n249), .Z(n166) );
  NBUFFX2 U132 ( .INP(n242), .Z(n156) );
  NBUFFX2 U133 ( .INP(n249), .Z(n167) );
  NBUFFX2 U134 ( .INP(n247), .Z(n165) );
  NBUFFX2 U135 ( .INP(n244), .Z(n159) );
  NBUFFX2 U136 ( .INP(n242), .Z(n157) );
  NAND3X1 U137 ( .IN1(n248), .IN2(n169), .IN3(waddr[1]), .QN(n247) );
  NOR2X0 U138 ( .IN1(n173), .IN2(waddr[2]), .QN(n243) );
  INVX0 U139 ( .INP(we), .ZN(n173) );
  NOR2X0 U140 ( .IN1(n138), .IN2(raddr[1]), .QN(n135) );
  NOR2X0 U141 ( .IN1(raddr[1]), .IN2(n139), .QN(n131) );
  AO22X1 U142 ( .IN1(mem[32]), .IN2(n147), .IN3(mem[48]), .IN4(n149), .Q(n102)
         );
  AO221X1 U143 ( .IN1(mem[16]), .IN2(n151), .IN3(mem[0]), .IN4(n146), .IN5(
        n102), .Q(n105) );
  AO22X1 U144 ( .IN1(mem[40]), .IN2(n9), .IN3(mem[56]), .IN4(n11), .Q(n103) );
  AO221X1 U145 ( .IN1(mem[24]), .IN2(n142), .IN3(mem[8]), .IN4(n146), .IN5(
        n103), .Q(n104) );
  AO22X1 U146 ( .IN1(mem[33]), .IN2(n148), .IN3(mem[49]), .IN4(n149), .Q(n106)
         );
  AO221X1 U147 ( .IN1(mem[17]), .IN2(n143), .IN3(mem[1]), .IN4(n7), .IN5(n106),
        .Q(n109) );
  AO22X1 U148 ( .IN1(mem[41]), .IN2(n8), .IN3(mem[57]), .IN4(n10), .Q(n107) );
  AO221X1 U149 ( .IN1(mem[25]), .IN2(n142), .IN3(mem[9]), .IN4(n7), .IN5(n107),
        .Q(n108) );
  AO22X1 U150 ( .IN1(mem[34]), .IN2(n147), .IN3(mem[50]), .IN4(n149), .Q(n110)
         );
  AO221X1 U151 ( .IN1(mem[18]), .IN2(n143), .IN3(mem[2]), .IN4(n146), .IN5(
        n110), .Q(n113) );
  AO22X1 U152 ( .IN1(mem[42]), .IN2(n9), .IN3(mem[58]), .IN4(n11), .Q(n111) );
  AO221X1 U153 ( .IN1(mem[26]), .IN2(n151), .IN3(mem[10]), .IN4(n7), .IN5(n111), .Q(n112) );
  AO22X1 U154 ( .IN1(mem[35]), .IN2(n148), .IN3(mem[51]), .IN4(n150), .Q(n114)
         );
  AO221X1 U155 ( .IN1(mem[19]), .IN2(n143), .IN3(mem[3]), .IN4(n144), .IN5(
        n114), .Q(n117) );
  AO22X1 U156 ( .IN1(mem[43]), .IN2(n8), .IN3(mem[59]), .IN4(n10), .Q(n115) );
  AO221X1 U157 ( .IN1(mem[27]), .IN2(n142), .IN3(mem[11]), .IN4(n145), .IN5(
        n115), .Q(n116) );
  AO22X1 U158 ( .IN1(mem[36]), .IN2(n148), .IN3(mem[52]), .IN4(n150), .Q(n118)
         );
  AO221X1 U159 ( .IN1(mem[20]), .IN2(n143), .IN3(mem[4]), .IN4(n144), .IN5(
        n118), .Q(n121) );
  AO22X1 U160 ( .IN1(mem[44]), .IN2(n147), .IN3(mem[60]), .IN4(n149), .Q(n119)
         );
  AO221X1 U161 ( .IN1(mem[28]), .IN2(n151), .IN3(mem[12]), .IN4(n145), .IN5(
        n119), .Q(n120) );
  AO22X1 U162 ( .IN1(mem[37]), .IN2(n9), .IN3(mem[53]), .IN4(n11), .Q(n122) );
  AO221X1 U163 ( .IN1(mem[21]), .IN2(n143), .IN3(mem[5]), .IN4(n144), .IN5(
        n122), .Q(n125) );
  AO22X1 U164 ( .IN1(mem[45]), .IN2(n148), .IN3(mem[61]), .IN4(n150), .Q(n123)
         );
  AO221X1 U165 ( .IN1(mem[29]), .IN2(n142), .IN3(mem[13]), .IN4(n145), .IN5(
        n123), .Q(n124) );
  AO22X1 U166 ( .IN1(n125), .IN2(raddr[0]), .IN3(n124), .IN4(n141), .Q(
        rdata[5]) );
  AO22X1 U167 ( .IN1(mem[38]), .IN2(n8), .IN3(mem[54]), .IN4(n10), .Q(n126) );
  AO221X1 U168 ( .IN1(mem[22]), .IN2(n143), .IN3(mem[6]), .IN4(n144), .IN5(
        n126), .Q(n129) );
  AO22X1 U169 ( .IN1(mem[46]), .IN2(n9), .IN3(mem[62]), .IN4(n11), .Q(n127) );
  AO221X1 U170 ( .IN1(mem[30]), .IN2(n151), .IN3(mem[14]), .IN4(n145), .IN5(
        n127), .Q(n128) );
  AO22X1 U171 ( .IN1(mem[39]), .IN2(n147), .IN3(mem[55]), .IN4(n150), .Q(n130)
         );
  AO221X1 U172 ( .IN1(mem[23]), .IN2(n151), .IN3(mem[7]), .IN4(n144), .IN5(
        n130), .Q(n137) );
  AO22X1 U173 ( .IN1(mem[47]), .IN2(n8), .IN3(mem[63]), .IN4(n10), .Q(n133) );
  AO221X1 U174 ( .IN1(mem[31]), .IN2(n142), .IN3(mem[15]), .IN4(n145), .IN5(
        n133), .Q(n136) );
  AO22X1 U175 ( .IN1(raddr[0]), .IN2(n137), .IN3(n136), .IN4(n141), .Q(
        rdata[7]) );
  INVX0 U176 ( .INP(raddr[2]), .ZN(n138) );
  INVX0 U177 ( .INP(n138), .ZN(n139) );
  INVX0 U178 ( .INP(raddr[1]), .ZN(n140) );
  INVX0 U179 ( .INP(raddr[0]), .ZN(n141) );
  NOR2X0 U180 ( .IN1(n138), .IN2(n140), .QN(n134) );
  NOR2X0 U181 ( .IN1(n140), .IN2(n139), .QN(n132) );
  INVX0 U182 ( .INP(n169), .ZN(n168) );
  INVX0 U183 ( .INP(waddr[0]), .ZN(n169) );
  INVX0 U184 ( .INP(waddr[1]), .ZN(n170) );
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
  AO22X1 U14 ( .IN1(wdata[0]), .IN2(n167), .IN3(mem[0]), .IN4(n156), .Q(n231)
         );
  AO22X1 U15 ( .IN1(wdata[1]), .IN2(n167), .IN3(mem[1]), .IN4(n156), .Q(n230)
         );
  AO22X1 U16 ( .IN1(wdata[2]), .IN2(n167), .IN3(mem[2]), .IN4(n156), .Q(n229)
         );
  AO22X1 U17 ( .IN1(wdata[3]), .IN2(n167), .IN3(mem[3]), .IN4(n156), .Q(n228)
         );
  AO22X1 U18 ( .IN1(wdata[4]), .IN2(n167), .IN3(mem[4]), .IN4(n156), .Q(n227)
         );
  AO22X1 U19 ( .IN1(wdata[5]), .IN2(n167), .IN3(mem[5]), .IN4(n155), .Q(n226)
         );
  AO22X1 U20 ( .IN1(wdata[6]), .IN2(n167), .IN3(mem[6]), .IN4(n155), .Q(n225)
         );
  AO22X1 U21 ( .IN1(wdata[7]), .IN2(n167), .IN3(mem[7]), .IN4(n155), .Q(n224)
         );
  AO22X1 U23 ( .IN1(n166), .IN2(wdata[0]), .IN3(mem[8]), .IN4(n154), .Q(n223)
         );
  AO22X1 U24 ( .IN1(n166), .IN2(wdata[1]), .IN3(mem[9]), .IN4(n154), .Q(n222)
         );
  AO22X1 U25 ( .IN1(n166), .IN2(wdata[2]), .IN3(mem[10]), .IN4(n154), .Q(n221)
         );
  AO22X1 U26 ( .IN1(n166), .IN2(wdata[3]), .IN3(mem[11]), .IN4(n154), .Q(n220)
         );
  AO22X1 U27 ( .IN1(n166), .IN2(wdata[4]), .IN3(mem[12]), .IN4(n154), .Q(n219)
         );
  AO22X1 U28 ( .IN1(n166), .IN2(wdata[5]), .IN3(mem[13]), .IN4(n153), .Q(n218)
         );
  AO22X1 U29 ( .IN1(n166), .IN2(wdata[6]), .IN3(mem[14]), .IN4(n153), .Q(n217)
         );
  AO22X1 U30 ( .IN1(n166), .IN2(wdata[7]), .IN3(mem[15]), .IN4(n153), .Q(n216)
         );
  AO22X1 U32 ( .IN1(n165), .IN2(n11), .IN3(mem[16]), .IN4(n152), .Q(n215) );
  AO22X1 U33 ( .IN1(n165), .IN2(n10), .IN3(mem[17]), .IN4(n152), .Q(n214) );
  AO22X1 U34 ( .IN1(n165), .IN2(n9), .IN3(mem[18]), .IN4(n152), .Q(n213) );
  AO22X1 U35 ( .IN1(n165), .IN2(n8), .IN3(mem[19]), .IN4(n152), .Q(n212) );
  AO22X1 U36 ( .IN1(n165), .IN2(n7), .IN3(mem[20]), .IN4(n152), .Q(n211) );
  AO22X1 U37 ( .IN1(n165), .IN2(n6), .IN3(mem[21]), .IN4(n151), .Q(n210) );
  AO22X1 U38 ( .IN1(n165), .IN2(n5), .IN3(mem[22]), .IN4(n151), .Q(n209) );
  AO22X1 U39 ( .IN1(n165), .IN2(n4), .IN3(mem[23]), .IN4(n151), .Q(n208) );
  AO22X1 U41 ( .IN1(n164), .IN2(n11), .IN3(mem[24]), .IN4(n150), .Q(n207) );
  AO22X1 U42 ( .IN1(n164), .IN2(n10), .IN3(mem[25]), .IN4(n150), .Q(n206) );
  AO22X1 U43 ( .IN1(n164), .IN2(n9), .IN3(mem[26]), .IN4(n150), .Q(n205) );
  AO22X1 U44 ( .IN1(n164), .IN2(n8), .IN3(mem[27]), .IN4(n150), .Q(n204) );
  AO22X1 U45 ( .IN1(n164), .IN2(n7), .IN3(mem[28]), .IN4(n150), .Q(n203) );
  AO22X1 U46 ( .IN1(n164), .IN2(n6), .IN3(mem[29]), .IN4(n149), .Q(n202) );
  AO22X1 U47 ( .IN1(n164), .IN2(n5), .IN3(mem[30]), .IN4(n149), .Q(n201) );
  AO22X1 U48 ( .IN1(n164), .IN2(n4), .IN3(mem[31]), .IN4(n149), .Q(n200) );
  AND2X1 U50 ( .IN1(we), .IN2(waddr[2]), .Q(n240) );
  AO22X1 U51 ( .IN1(n162), .IN2(n11), .IN3(mem[32]), .IN4(n148), .Q(n199) );
  AO22X1 U52 ( .IN1(n162), .IN2(n10), .IN3(mem[33]), .IN4(n148), .Q(n198) );
  AO22X1 U53 ( .IN1(n162), .IN2(n9), .IN3(mem[34]), .IN4(n148), .Q(n197) );
  AO22X1 U54 ( .IN1(n162), .IN2(n8), .IN3(mem[35]), .IN4(n148), .Q(n196) );
  AO22X1 U55 ( .IN1(n162), .IN2(n7), .IN3(mem[36]), .IN4(n148), .Q(n195) );
  AO22X1 U56 ( .IN1(n162), .IN2(n6), .IN3(mem[37]), .IN4(n147), .Q(n194) );
  AO22X1 U57 ( .IN1(n162), .IN2(n5), .IN3(mem[38]), .IN4(n147), .Q(n193) );
  AO22X1 U58 ( .IN1(n162), .IN2(n4), .IN3(mem[39]), .IN4(n147), .Q(n192) );
  AO22X1 U60 ( .IN1(n161), .IN2(n11), .IN3(mem[40]), .IN4(n146), .Q(n191) );
  AO22X1 U61 ( .IN1(n161), .IN2(n10), .IN3(mem[41]), .IN4(n146), .Q(n190) );
  AO22X1 U62 ( .IN1(n161), .IN2(n9), .IN3(mem[42]), .IN4(n146), .Q(n189) );
  AO22X1 U63 ( .IN1(n161), .IN2(n8), .IN3(mem[43]), .IN4(n146), .Q(n188) );
  AO22X1 U64 ( .IN1(n161), .IN2(n7), .IN3(mem[44]), .IN4(n146), .Q(n187) );
  AO22X1 U65 ( .IN1(n161), .IN2(n6), .IN3(mem[45]), .IN4(n145), .Q(n186) );
  AO22X1 U66 ( .IN1(n161), .IN2(n5), .IN3(mem[46]), .IN4(n145), .Q(n185) );
  AO22X1 U67 ( .IN1(n161), .IN2(n4), .IN3(mem[47]), .IN4(n145), .Q(n184) );
  AO22X1 U69 ( .IN1(n1), .IN2(n11), .IN3(mem[48]), .IN4(n144), .Q(n183) );
  AO22X1 U70 ( .IN1(n1), .IN2(n10), .IN3(mem[49]), .IN4(n144), .Q(n182) );
  AO22X1 U71 ( .IN1(n1), .IN2(n9), .IN3(mem[50]), .IN4(n144), .Q(n181) );
  AO22X1 U72 ( .IN1(n1), .IN2(n8), .IN3(mem[51]), .IN4(n144), .Q(n180) );
  AO22X1 U73 ( .IN1(n1), .IN2(n7), .IN3(mem[52]), .IN4(n144), .Q(n179) );
  AO22X1 U74 ( .IN1(n1), .IN2(n6), .IN3(mem[53]), .IN4(n143), .Q(n178) );
  AO22X1 U75 ( .IN1(n1), .IN2(n5), .IN3(mem[54]), .IN4(n143), .Q(n177) );
  AO22X1 U76 ( .IN1(n1), .IN2(n4), .IN3(mem[55]), .IN4(n143), .Q(n176) );
  AO22X1 U78 ( .IN1(n160), .IN2(n11), .IN3(mem[56]), .IN4(n142), .Q(n175) );
  AO22X1 U79 ( .IN1(n160), .IN2(n10), .IN3(mem[57]), .IN4(n142), .Q(n174) );
  AO22X1 U80 ( .IN1(n160), .IN2(n9), .IN3(mem[58]), .IN4(n142), .Q(n173) );
  AO22X1 U81 ( .IN1(n160), .IN2(n8), .IN3(mem[59]), .IN4(n142), .Q(n172) );
  AO22X1 U82 ( .IN1(n160), .IN2(n7), .IN3(mem[60]), .IN4(n142), .Q(n171) );
  AO22X1 U83 ( .IN1(n160), .IN2(n6), .IN3(mem[61]), .IN4(n141), .Q(n170) );
  AO22X1 U84 ( .IN1(n160), .IN2(n5), .IN3(mem[62]), .IN4(n141), .Q(n169) );
  AO22X1 U85 ( .IN1(n160), .IN2(n4), .IN3(mem[63]), .IN4(n141), .Q(n168) );
  NBUFFX2 U2 ( .INP(n122), .Z(n139) );
  NBUFFX2 U3 ( .INP(n123), .Z(n137) );
  NAND3X0 U4 ( .IN1(n240), .IN2(n159), .IN3(n157), .QN(n238) );
  NAND3X0 U5 ( .IN1(n158), .IN2(n159), .IN3(n240), .QN(n237) );
  NAND3X0 U6 ( .IN1(waddr[1]), .IN2(n157), .IN3(n235), .QN(n236) );
  NAND3X0 U7 ( .IN1(n157), .IN2(n159), .IN3(n235), .QN(n233) );
  NAND3X0 U8 ( .IN1(n158), .IN2(n159), .IN3(n235), .QN(n232) );
  NBUFFX2 U9 ( .INP(n122), .Z(n91) );
  NBUFFX2 U10 ( .INP(n123), .Z(n89) );
  NBUFFX2 U11 ( .INP(n126), .Z(n133) );
  NBUFFX2 U12 ( .INP(n122), .Z(n140) );
  NBUFFX2 U13 ( .INP(n123), .Z(n138) );
  NBUFFX2 U22 ( .INP(n126), .Z(n87) );
  NBUFFX2 U31 ( .INP(n122), .Z(n92) );
  NBUFFX2 U40 ( .INP(n123), .Z(n90) );
  NBUFFX2 U49 ( .INP(n126), .Z(n88) );
  NBUFFX2 U59 ( .INP(n125), .Z(n134) );
  NBUFFX2 U68 ( .INP(n125), .Z(n135) );
  NBUFFX2 U77 ( .INP(n238), .Z(n151) );
  NBUFFX2 U86 ( .INP(n236), .Z(n147) );
  INVX0 U87 ( .INP(n233), .ZN(n1) );
  INVX0 U88 ( .INP(raddr[1]), .ZN(n2) );
  INVX0 U89 ( .INP(n2), .ZN(n3) );
  NBUFFX2 U90 ( .INP(wdata[7]), .Z(n4) );
  NBUFFX2 U91 ( .INP(wdata[6]), .Z(n5) );
  NBUFFX2 U92 ( .INP(wdata[5]), .Z(n6) );
  NBUFFX2 U93 ( .INP(wdata[4]), .Z(n7) );
  NBUFFX2 U94 ( .INP(wdata[3]), .Z(n8) );
  NBUFFX2 U95 ( .INP(wdata[2]), .Z(n9) );
  NBUFFX2 U96 ( .INP(wdata[1]), .Z(n10) );
  NBUFFX2 U97 ( .INP(wdata[0]), .Z(n11) );
  NBUFFX2 U98 ( .INP(raddr[0]), .Z(n86) );
  NBUFFX2 U99 ( .INP(n125), .Z(n136) );
  NBUFFX2 U100 ( .INP(n126), .Z(n132) );
  INVX0 U101 ( .INP(n149), .ZN(n164) );
  INVX0 U102 ( .INP(n151), .ZN(n165) );
  INVX0 U103 ( .INP(n141), .ZN(n160) );
  INVX0 U104 ( .INP(n155), .ZN(n167) );
  INVX0 U105 ( .INP(n147), .ZN(n162) );
  INVX0 U106 ( .INP(n145), .ZN(n161) );
  INVX0 U107 ( .INP(n153), .ZN(n166) );
  NBUFFX2 U108 ( .INP(n237), .Z(n149) );
  NBUFFX2 U109 ( .INP(n233), .Z(n143) );
  NBUFFX2 U110 ( .INP(n232), .Z(n141) );
  NBUFFX2 U111 ( .INP(n237), .Z(n150) );
  NBUFFX2 U112 ( .INP(n238), .Z(n152) );
  NBUFFX2 U113 ( .INP(n233), .Z(n144) );
  NBUFFX2 U114 ( .INP(n232), .Z(n142) );
  NBUFFX2 U115 ( .INP(n239), .Z(n153) );
  NBUFFX2 U116 ( .INP(n241), .Z(n155) );
  NBUFFX2 U117 ( .INP(n234), .Z(n145) );
  NBUFFX2 U118 ( .INP(n241), .Z(n156) );
  NBUFFX2 U119 ( .INP(n239), .Z(n154) );
  NBUFFX2 U120 ( .INP(n236), .Z(n148) );
  NBUFFX2 U121 ( .INP(n234), .Z(n146) );
  NAND3X0 U122 ( .IN1(n157), .IN2(n240), .IN3(waddr[1]), .QN(n241) );
  NAND3X0 U123 ( .IN1(n240), .IN2(n158), .IN3(waddr[1]), .QN(n239) );
  NAND3X0 U124 ( .IN1(waddr[1]), .IN2(n158), .IN3(n235), .QN(n234) );
  NOR2X0 U125 ( .IN1(n163), .IN2(waddr[2]), .QN(n235) );
  INVX0 U126 ( .INP(we), .ZN(n163) );
  NOR2X0 U127 ( .IN1(n129), .IN2(n3), .QN(n126) );
  NOR2X0 U128 ( .IN1(n3), .IN2(n130), .QN(n122) );
  AO22X1 U129 ( .IN1(mem[32]), .IN2(n137), .IN3(mem[48]), .IN4(n139), .Q(n93)
         );
  AO221X1 U130 ( .IN1(mem[16]), .IN2(n88), .IN3(mem[0]), .IN4(n136), .IN5(n93),
        .Q(n96) );
  AO22X1 U131 ( .IN1(mem[40]), .IN2(n90), .IN3(mem[56]), .IN4(n92), .Q(n94) );
  AO221X1 U132 ( .IN1(mem[24]), .IN2(n132), .IN3(mem[8]), .IN4(n136), .IN5(n94), .Q(n95) );
  AO22X1 U133 ( .IN1(n96), .IN2(raddr[0]), .IN3(n95), .IN4(n131), .Q(rdata[0])
         );
  AO22X1 U134 ( .IN1(mem[33]), .IN2(n138), .IN3(mem[49]), .IN4(n139), .Q(n97)
         );
  AO221X1 U135 ( .IN1(mem[17]), .IN2(n133), .IN3(mem[1]), .IN4(n136), .IN5(n97), .Q(n100) );
  AO22X1 U136 ( .IN1(mem[41]), .IN2(n89), .IN3(mem[57]), .IN4(n91), .Q(n98) );
  AO221X1 U137 ( .IN1(mem[25]), .IN2(n88), .IN3(mem[9]), .IN4(n136), .IN5(n98),
        .Q(n99) );
  AO22X1 U138 ( .IN1(n100), .IN2(n86), .IN3(n99), .IN4(n131), .Q(rdata[1]) );
  AO22X1 U139 ( .IN1(mem[34]), .IN2(n137), .IN3(mem[50]), .IN4(n139), .Q(n101)
         );
  AO221X1 U140 ( .IN1(mem[18]), .IN2(n133), .IN3(mem[2]), .IN4(n136), .IN5(
        n101), .Q(n104) );
  AO22X1 U141 ( .IN1(mem[42]), .IN2(n90), .IN3(mem[58]), .IN4(n92), .Q(n102)
         );
  AO221X1 U142 ( .IN1(mem[26]), .IN2(n132), .IN3(mem[10]), .IN4(n136), .IN5(
        n102), .Q(n103) );
  AO22X1 U143 ( .IN1(n104), .IN2(n86), .IN3(n103), .IN4(n131), .Q(rdata[2]) );
  AO22X1 U144 ( .IN1(mem[35]), .IN2(n138), .IN3(mem[51]), .IN4(n140), .Q(n105)
         );
  AO221X1 U145 ( .IN1(mem[19]), .IN2(n133), .IN3(mem[3]), .IN4(n134), .IN5(
        n105), .Q(n108) );
  AO22X1 U146 ( .IN1(mem[43]), .IN2(n89), .IN3(mem[59]), .IN4(n91), .Q(n106)
         );
  AO221X1 U147 ( .IN1(mem[27]), .IN2(n87), .IN3(mem[11]), .IN4(n135), .IN5(
        n106), .Q(n107) );
  AO22X1 U148 ( .IN1(n108), .IN2(n86), .IN3(n107), .IN4(n131), .Q(rdata[3]) );
  AO22X1 U149 ( .IN1(mem[36]), .IN2(n138), .IN3(mem[52]), .IN4(n140), .Q(n109)
         );
  AO221X1 U150 ( .IN1(mem[20]), .IN2(n132), .IN3(mem[4]), .IN4(n134), .IN5(
        n109), .Q(n112) );
  AO22X1 U151 ( .IN1(mem[44]), .IN2(n137), .IN3(mem[60]), .IN4(n139), .Q(n110)
         );
  AO221X1 U152 ( .IN1(mem[28]), .IN2(n87), .IN3(mem[12]), .IN4(n135), .IN5(
        n110), .Q(n111) );
  AO22X1 U153 ( .IN1(n112), .IN2(n86), .IN3(n111), .IN4(n131), .Q(rdata[4]) );
  AO22X1 U154 ( .IN1(mem[37]), .IN2(n90), .IN3(mem[53]), .IN4(n92), .Q(n113)
         );
  AO221X1 U155 ( .IN1(mem[21]), .IN2(n87), .IN3(mem[5]), .IN4(n134), .IN5(n113), .Q(n116) );
  AO22X1 U156 ( .IN1(mem[45]), .IN2(n138), .IN3(mem[61]), .IN4(n140), .Q(n114)
         );
  AO221X1 U157 ( .IN1(mem[29]), .IN2(n88), .IN3(mem[13]), .IN4(n135), .IN5(
        n114), .Q(n115) );
  AO22X1 U158 ( .IN1(n116), .IN2(n86), .IN3(n115), .IN4(n131), .Q(rdata[5]) );
  AO22X1 U159 ( .IN1(mem[38]), .IN2(n89), .IN3(mem[54]), .IN4(n91), .Q(n117)
         );
  AO221X1 U160 ( .IN1(mem[22]), .IN2(n88), .IN3(mem[6]), .IN4(n134), .IN5(n117), .Q(n120) );
  AO22X1 U161 ( .IN1(mem[46]), .IN2(n90), .IN3(mem[62]), .IN4(n92), .Q(n118)
         );
  AO221X1 U162 ( .IN1(mem[30]), .IN2(n132), .IN3(mem[14]), .IN4(n135), .IN5(
        n118), .Q(n119) );
  AO22X1 U163 ( .IN1(n120), .IN2(n86), .IN3(n119), .IN4(n131), .Q(rdata[6]) );
  AO22X1 U164 ( .IN1(mem[39]), .IN2(n137), .IN3(mem[55]), .IN4(n140), .Q(n121)
         );
  AO221X1 U165 ( .IN1(mem[23]), .IN2(n133), .IN3(mem[7]), .IN4(n134), .IN5(
        n121), .Q(n128) );
  AO22X1 U166 ( .IN1(mem[47]), .IN2(n89), .IN3(mem[63]), .IN4(n91), .Q(n124)
         );
  AO221X1 U167 ( .IN1(mem[31]), .IN2(n87), .IN3(mem[15]), .IN4(n135), .IN5(
        n124), .Q(n127) );
  AO22X1 U168 ( .IN1(n128), .IN2(raddr[0]), .IN3(n127), .IN4(n131), .Q(
        rdata[7]) );
  INVX0 U169 ( .INP(raddr[2]), .ZN(n129) );
  INVX0 U170 ( .INP(n129), .ZN(n130) );
  INVX0 U171 ( .INP(raddr[0]), .ZN(n131) );
  NOR2X0 U172 ( .IN1(n2), .IN2(n129), .QN(n125) );
  NOR2X0 U173 ( .IN1(n2), .IN2(n130), .QN(n123) );
  INVX0 U174 ( .INP(n158), .ZN(n157) );
  INVX0 U175 ( .INP(waddr[0]), .ZN(n158) );
  INVX0 U176 ( .INP(waddr[1]), .ZN(n159) );
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
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246;
  wire   [63:0] mem;

  DFFX1 mem_reg_0__7_ ( .D(n173), .CLK(clk), .Q(mem[63]) );
  DFFX1 mem_reg_0__6_ ( .D(n174), .CLK(clk), .Q(mem[62]) );
  DFFX1 mem_reg_0__5_ ( .D(n175), .CLK(clk), .Q(mem[61]) );
  DFFX1 mem_reg_0__4_ ( .D(n176), .CLK(clk), .Q(mem[60]) );
  DFFX1 mem_reg_0__3_ ( .D(n177), .CLK(clk), .Q(mem[59]) );
  DFFX1 mem_reg_0__2_ ( .D(n178), .CLK(clk), .Q(mem[58]) );
  DFFX1 mem_reg_0__1_ ( .D(n179), .CLK(clk), .Q(mem[57]) );
  DFFX1 mem_reg_0__0_ ( .D(n180), .CLK(clk), .Q(mem[56]) );
  DFFX1 mem_reg_1__7_ ( .D(n181), .CLK(clk), .Q(mem[55]) );
  DFFX1 mem_reg_1__6_ ( .D(n182), .CLK(clk), .Q(mem[54]) );
  DFFX1 mem_reg_1__5_ ( .D(n183), .CLK(clk), .Q(mem[53]) );
  DFFX1 mem_reg_1__4_ ( .D(n184), .CLK(clk), .Q(mem[52]) );
  DFFX1 mem_reg_1__3_ ( .D(n185), .CLK(clk), .Q(mem[51]) );
  DFFX1 mem_reg_1__2_ ( .D(n186), .CLK(clk), .Q(mem[50]) );
  DFFX1 mem_reg_1__1_ ( .D(n187), .CLK(clk), .Q(mem[49]) );
  DFFX1 mem_reg_1__0_ ( .D(n188), .CLK(clk), .Q(mem[48]) );
  DFFX1 mem_reg_2__7_ ( .D(n189), .CLK(clk), .Q(mem[47]) );
  DFFX1 mem_reg_2__6_ ( .D(n190), .CLK(clk), .Q(mem[46]) );
  DFFX1 mem_reg_2__5_ ( .D(n191), .CLK(clk), .Q(mem[45]) );
  DFFX1 mem_reg_2__4_ ( .D(n192), .CLK(clk), .Q(mem[44]) );
  DFFX1 mem_reg_2__3_ ( .D(n193), .CLK(clk), .Q(mem[43]) );
  DFFX1 mem_reg_2__2_ ( .D(n194), .CLK(clk), .Q(mem[42]) );
  DFFX1 mem_reg_2__1_ ( .D(n195), .CLK(clk), .Q(mem[41]) );
  DFFX1 mem_reg_2__0_ ( .D(n196), .CLK(clk), .Q(mem[40]) );
  DFFX1 mem_reg_3__7_ ( .D(n197), .CLK(clk), .Q(mem[39]) );
  DFFX1 mem_reg_3__6_ ( .D(n198), .CLK(clk), .Q(mem[38]) );
  DFFX1 mem_reg_3__5_ ( .D(n199), .CLK(clk), .Q(mem[37]) );
  DFFX1 mem_reg_3__4_ ( .D(n200), .CLK(clk), .Q(mem[36]) );
  DFFX1 mem_reg_3__3_ ( .D(n201), .CLK(clk), .Q(mem[35]) );
  DFFX1 mem_reg_3__2_ ( .D(n202), .CLK(clk), .Q(mem[34]) );
  DFFX1 mem_reg_3__1_ ( .D(n203), .CLK(clk), .Q(mem[33]) );
  DFFX1 mem_reg_3__0_ ( .D(n204), .CLK(clk), .Q(mem[32]) );
  DFFX1 mem_reg_4__7_ ( .D(n205), .CLK(clk), .Q(mem[31]) );
  DFFX1 mem_reg_4__6_ ( .D(n206), .CLK(clk), .Q(mem[30]) );
  DFFX1 mem_reg_4__5_ ( .D(n207), .CLK(clk), .Q(mem[29]) );
  DFFX1 mem_reg_4__4_ ( .D(n208), .CLK(clk), .Q(mem[28]) );
  DFFX1 mem_reg_4__3_ ( .D(n209), .CLK(clk), .Q(mem[27]) );
  DFFX1 mem_reg_4__2_ ( .D(n210), .CLK(clk), .Q(mem[26]) );
  DFFX1 mem_reg_4__1_ ( .D(n211), .CLK(clk), .Q(mem[25]) );
  DFFX1 mem_reg_4__0_ ( .D(n212), .CLK(clk), .Q(mem[24]) );
  DFFX1 mem_reg_5__7_ ( .D(n213), .CLK(clk), .Q(mem[23]) );
  DFFX1 mem_reg_5__6_ ( .D(n214), .CLK(clk), .Q(mem[22]) );
  DFFX1 mem_reg_5__5_ ( .D(n215), .CLK(clk), .Q(mem[21]) );
  DFFX1 mem_reg_5__4_ ( .D(n216), .CLK(clk), .Q(mem[20]) );
  DFFX1 mem_reg_5__3_ ( .D(n217), .CLK(clk), .Q(mem[19]) );
  DFFX1 mem_reg_5__2_ ( .D(n218), .CLK(clk), .Q(mem[18]) );
  DFFX1 mem_reg_5__1_ ( .D(n219), .CLK(clk), .Q(mem[17]) );
  DFFX1 mem_reg_5__0_ ( .D(n220), .CLK(clk), .Q(mem[16]) );
  DFFX1 mem_reg_6__7_ ( .D(n221), .CLK(clk), .Q(mem[15]) );
  DFFX1 mem_reg_6__6_ ( .D(n222), .CLK(clk), .Q(mem[14]) );
  DFFX1 mem_reg_6__5_ ( .D(n223), .CLK(clk), .Q(mem[13]) );
  DFFX1 mem_reg_6__4_ ( .D(n224), .CLK(clk), .Q(mem[12]) );
  DFFX1 mem_reg_6__3_ ( .D(n225), .CLK(clk), .Q(mem[11]) );
  DFFX1 mem_reg_6__2_ ( .D(n226), .CLK(clk), .Q(mem[10]) );
  DFFX1 mem_reg_6__1_ ( .D(n227), .CLK(clk), .Q(mem[9]) );
  DFFX1 mem_reg_6__0_ ( .D(n228), .CLK(clk), .Q(mem[8]) );
  DFFX1 mem_reg_7__7_ ( .D(n229), .CLK(clk), .Q(mem[7]) );
  DFFX1 mem_reg_7__6_ ( .D(n230), .CLK(clk), .Q(mem[6]) );
  DFFX1 mem_reg_7__5_ ( .D(n231), .CLK(clk), .Q(mem[5]) );
  DFFX1 mem_reg_7__4_ ( .D(n232), .CLK(clk), .Q(mem[4]) );
  DFFX1 mem_reg_7__3_ ( .D(n233), .CLK(clk), .Q(mem[3]) );
  DFFX1 mem_reg_7__2_ ( .D(n234), .CLK(clk), .Q(mem[2]) );
  DFFX1 mem_reg_7__1_ ( .D(n235), .CLK(clk), .Q(mem[1]) );
  DFFX1 mem_reg_7__0_ ( .D(n236), .CLK(clk), .Q(mem[0]) );
  AO22X1 U14 ( .IN1(wdata[0]), .IN2(n2), .IN3(mem[0]), .IN4(n161), .Q(n236) );
  AO22X1 U15 ( .IN1(wdata[1]), .IN2(n2), .IN3(mem[1]), .IN4(n161), .Q(n235) );
  AO22X1 U16 ( .IN1(wdata[2]), .IN2(n2), .IN3(mem[2]), .IN4(n161), .Q(n234) );
  AO22X1 U17 ( .IN1(wdata[3]), .IN2(n2), .IN3(mem[3]), .IN4(n161), .Q(n233) );
  AO22X1 U18 ( .IN1(wdata[4]), .IN2(n2), .IN3(mem[4]), .IN4(n161), .Q(n232) );
  AO22X1 U19 ( .IN1(wdata[5]), .IN2(n2), .IN3(mem[5]), .IN4(n161), .Q(n231) );
  AO22X1 U20 ( .IN1(wdata[6]), .IN2(n2), .IN3(mem[6]), .IN4(n161), .Q(n230) );
  AO22X1 U21 ( .IN1(wdata[7]), .IN2(n2), .IN3(mem[7]), .IN4(n246), .Q(n229) );
  AO22X1 U23 ( .IN1(n172), .IN2(wdata[0]), .IN3(mem[8]), .IN4(n160), .Q(n228)
         );
  AO22X1 U24 ( .IN1(n172), .IN2(wdata[1]), .IN3(mem[9]), .IN4(n160), .Q(n227)
         );
  AO22X1 U25 ( .IN1(n172), .IN2(wdata[2]), .IN3(mem[10]), .IN4(n160), .Q(n226)
         );
  AO22X1 U26 ( .IN1(n172), .IN2(wdata[3]), .IN3(mem[11]), .IN4(n160), .Q(n225)
         );
  AO22X1 U27 ( .IN1(n172), .IN2(wdata[4]), .IN3(mem[12]), .IN4(n160), .Q(n224)
         );
  AO22X1 U28 ( .IN1(n172), .IN2(wdata[5]), .IN3(mem[13]), .IN4(n159), .Q(n223)
         );
  AO22X1 U29 ( .IN1(n172), .IN2(wdata[6]), .IN3(mem[14]), .IN4(n159), .Q(n222)
         );
  AO22X1 U30 ( .IN1(n172), .IN2(wdata[7]), .IN3(mem[15]), .IN4(n159), .Q(n221)
         );
  AO22X1 U32 ( .IN1(n171), .IN2(n10), .IN3(mem[16]), .IN4(n158), .Q(n220) );
  AO22X1 U33 ( .IN1(n171), .IN2(n9), .IN3(mem[17]), .IN4(n158), .Q(n219) );
  AO22X1 U34 ( .IN1(n171), .IN2(n8), .IN3(mem[18]), .IN4(n158), .Q(n218) );
  AO22X1 U35 ( .IN1(n171), .IN2(n7), .IN3(mem[19]), .IN4(n158), .Q(n217) );
  AO22X1 U36 ( .IN1(n88), .IN2(n6), .IN3(mem[20]), .IN4(n158), .Q(n216) );
  AO22X1 U37 ( .IN1(n88), .IN2(n5), .IN3(mem[21]), .IN4(n157), .Q(n215) );
  AO22X1 U38 ( .IN1(n88), .IN2(n4), .IN3(mem[22]), .IN4(n157), .Q(n214) );
  AO22X1 U39 ( .IN1(n88), .IN2(n3), .IN3(mem[23]), .IN4(n157), .Q(n213) );
  AO22X1 U41 ( .IN1(n170), .IN2(n10), .IN3(mem[24]), .IN4(n156), .Q(n212) );
  AO22X1 U42 ( .IN1(n170), .IN2(n9), .IN3(mem[25]), .IN4(n156), .Q(n211) );
  AO22X1 U43 ( .IN1(n170), .IN2(n8), .IN3(mem[26]), .IN4(n156), .Q(n210) );
  AO22X1 U44 ( .IN1(n170), .IN2(n7), .IN3(mem[27]), .IN4(n156), .Q(n209) );
  AO22X1 U45 ( .IN1(n89), .IN2(n6), .IN3(mem[28]), .IN4(n156), .Q(n208) );
  AO22X1 U46 ( .IN1(n89), .IN2(n5), .IN3(mem[29]), .IN4(n155), .Q(n207) );
  AO22X1 U47 ( .IN1(n89), .IN2(n4), .IN3(mem[30]), .IN4(n155), .Q(n206) );
  AO22X1 U48 ( .IN1(n89), .IN2(n3), .IN3(mem[31]), .IN4(n155), .Q(n205) );
  AND2X1 U50 ( .IN1(we), .IN2(waddr[2]), .Q(n245) );
  AO22X1 U51 ( .IN1(n168), .IN2(n10), .IN3(mem[32]), .IN4(n154), .Q(n204) );
  AO22X1 U52 ( .IN1(n168), .IN2(n9), .IN3(mem[33]), .IN4(n154), .Q(n203) );
  AO22X1 U53 ( .IN1(n168), .IN2(n8), .IN3(mem[34]), .IN4(n154), .Q(n202) );
  AO22X1 U54 ( .IN1(n168), .IN2(n7), .IN3(mem[35]), .IN4(n154), .Q(n201) );
  AO22X1 U55 ( .IN1(n168), .IN2(n6), .IN3(mem[36]), .IN4(n154), .Q(n200) );
  AO22X1 U56 ( .IN1(n168), .IN2(n5), .IN3(mem[37]), .IN4(n153), .Q(n199) );
  AO22X1 U57 ( .IN1(n168), .IN2(n4), .IN3(mem[38]), .IN4(n153), .Q(n198) );
  AO22X1 U58 ( .IN1(n168), .IN2(n3), .IN3(mem[39]), .IN4(n153), .Q(n197) );
  AO22X1 U60 ( .IN1(n167), .IN2(n10), .IN3(mem[40]), .IN4(n152), .Q(n196) );
  AO22X1 U61 ( .IN1(n167), .IN2(n9), .IN3(mem[41]), .IN4(n152), .Q(n195) );
  AO22X1 U62 ( .IN1(n167), .IN2(n8), .IN3(mem[42]), .IN4(n152), .Q(n194) );
  AO22X1 U63 ( .IN1(n167), .IN2(n7), .IN3(mem[43]), .IN4(n152), .Q(n193) );
  AO22X1 U64 ( .IN1(n167), .IN2(n6), .IN3(mem[44]), .IN4(n152), .Q(n192) );
  AO22X1 U65 ( .IN1(n167), .IN2(n5), .IN3(mem[45]), .IN4(n151), .Q(n191) );
  AO22X1 U66 ( .IN1(n167), .IN2(n4), .IN3(mem[46]), .IN4(n151), .Q(n190) );
  AO22X1 U67 ( .IN1(n167), .IN2(n3), .IN3(mem[47]), .IN4(n151), .Q(n189) );
  AO22X1 U69 ( .IN1(n166), .IN2(n10), .IN3(mem[48]), .IN4(n150), .Q(n188) );
  AO22X1 U70 ( .IN1(n166), .IN2(n9), .IN3(mem[49]), .IN4(n150), .Q(n187) );
  AO22X1 U71 ( .IN1(n166), .IN2(n8), .IN3(mem[50]), .IN4(n150), .Q(n186) );
  AO22X1 U72 ( .IN1(n166), .IN2(n7), .IN3(mem[51]), .IN4(n150), .Q(n185) );
  AO22X1 U73 ( .IN1(n87), .IN2(n6), .IN3(mem[52]), .IN4(n150), .Q(n184) );
  AO22X1 U74 ( .IN1(n87), .IN2(n5), .IN3(mem[53]), .IN4(n149), .Q(n183) );
  AO22X1 U75 ( .IN1(n87), .IN2(n4), .IN3(mem[54]), .IN4(n149), .Q(n182) );
  AO22X1 U76 ( .IN1(n87), .IN2(n3), .IN3(mem[55]), .IN4(n149), .Q(n181) );
  AO22X1 U78 ( .IN1(n165), .IN2(n10), .IN3(mem[56]), .IN4(n148), .Q(n180) );
  AO22X1 U79 ( .IN1(n165), .IN2(n9), .IN3(mem[57]), .IN4(n148), .Q(n179) );
  AO22X1 U80 ( .IN1(n165), .IN2(n8), .IN3(mem[58]), .IN4(n148), .Q(n178) );
  AO22X1 U81 ( .IN1(n86), .IN2(n7), .IN3(mem[59]), .IN4(n148), .Q(n177) );
  AO22X1 U82 ( .IN1(n86), .IN2(n6), .IN3(mem[60]), .IN4(n148), .Q(n176) );
  AO22X1 U83 ( .IN1(n86), .IN2(n5), .IN3(mem[61]), .IN4(n147), .Q(n175) );
  AO22X1 U84 ( .IN1(n86), .IN2(n4), .IN3(mem[62]), .IN4(n147), .Q(n174) );
  AO22X1 U85 ( .IN1(n86), .IN2(n3), .IN3(mem[63]), .IN4(n147), .Q(n173) );
  NBUFFX4 U2 ( .INP(n129), .Z(n140) );
  NBUFFX4 U3 ( .INP(n129), .Z(n139) );
  NBUFFX4 U4 ( .INP(n129), .Z(n138) );
  NBUFFX2 U5 ( .INP(n130), .Z(n137) );
  NBUFFX2 U6 ( .INP(n127), .Z(n142) );
  NBUFFX2 U7 ( .INP(n126), .Z(n144) );
  NAND3X0 U8 ( .IN1(n245), .IN2(n164), .IN3(n162), .QN(n243) );
  NAND3X0 U9 ( .IN1(n163), .IN2(n164), .IN3(n245), .QN(n242) );
  NAND3X0 U10 ( .IN1(n162), .IN2(n164), .IN3(n240), .QN(n238) );
  NAND3X0 U11 ( .IN1(n163), .IN2(n164), .IN3(n240), .QN(n237) );
  OAI22X1 U12 ( .IN1(n94), .IN2(n91), .IN3(n95), .IN4(n90), .QN(rdata[0]) );
  AOI221X1 U13 ( .IN1(mem[24]), .IN2(n98), .IN3(mem[8]), .IN4(n140), .IN5(n102), .QN(n95) );
  AOI221X1 U22 ( .IN1(mem[16]), .IN2(n97), .IN3(mem[0]), .IN4(n140), .IN5(n101), .QN(n94) );
  NBUFFX2 U31 ( .INP(n246), .Z(n161) );
  NBUFFX2 U40 ( .INP(n11), .Z(n2) );
  NBUFFX4 U49 ( .INP(wdata[4]), .Z(n6) );
  NBUFFX2 U59 ( .INP(raddr[0]), .Z(n96) );
  NAND3X1 U68 ( .IN1(n245), .IN2(n163), .IN3(waddr[1]), .QN(n244) );
  NAND2X0 U77 ( .IN1(we), .IN2(waddr[2]), .QN(n1) );
  NOR3X0 U86 ( .IN1(n163), .IN2(n1), .IN3(n164), .QN(n11) );
  INVX0 U87 ( .INP(n11), .ZN(n246) );
  NBUFFX2 U88 ( .INP(wdata[7]), .Z(n3) );
  NBUFFX2 U89 ( .INP(wdata[6]), .Z(n4) );
  NBUFFX2 U90 ( .INP(wdata[5]), .Z(n5) );
  NBUFFX2 U91 ( .INP(wdata[3]), .Z(n7) );
  NBUFFX2 U92 ( .INP(wdata[2]), .Z(n8) );
  NBUFFX2 U93 ( .INP(wdata[1]), .Z(n9) );
  NBUFFX2 U94 ( .INP(wdata[0]), .Z(n10) );
  INVX0 U95 ( .INP(n237), .ZN(n86) );
  INVX0 U96 ( .INP(n238), .ZN(n87) );
  INVX0 U97 ( .INP(n243), .ZN(n88) );
  INVX0 U98 ( .INP(n242), .ZN(n89) );
  AO22X1 U99 ( .IN1(n106), .IN2(n90), .IN3(n105), .IN4(n91), .Q(rdata[1]) );
  AO22X1 U100 ( .IN1(n116), .IN2(n90), .IN3(n115), .IN4(n91), .Q(rdata[4]) );
  INVX0 U101 ( .INP(n91), .ZN(n90) );
  AO22X1 U102 ( .IN1(n124), .IN2(n90), .IN3(n123), .IN4(n91), .Q(rdata[6]) );
  INVX0 U103 ( .INP(n96), .ZN(n91) );
  OAI22X2 U104 ( .IN1(n92), .IN2(n91), .IN3(n93), .IN4(n96), .QN(rdata[2]) );
  AOI221X2 U105 ( .IN1(mem[18]), .IN2(n137), .IN3(mem[2]), .IN4(n140), .IN5(
        n107), .QN(n92) );
  AOI221X2 U106 ( .IN1(mem[26]), .IN2(n137), .IN3(mem[10]), .IN4(n140), .IN5(
        n108), .QN(n93) );
  DELLN1X2 U107 ( .INP(n130), .Z(n97) );
  DELLN1X2 U108 ( .INP(n130), .Z(n98) );
  NBUFFX4 U109 ( .INP(n127), .Z(n99) );
  NBUFFX4 U110 ( .INP(n127), .Z(n100) );
  NBUFFX2 U111 ( .INP(n127), .Z(n141) );
  NBUFFX2 U112 ( .INP(n130), .Z(n136) );
  NBUFFX2 U113 ( .INP(n126), .Z(n146) );
  NBUFFX2 U114 ( .INP(n126), .Z(n145) );
  NAND3X1 U115 ( .IN1(waddr[1]), .IN2(n162), .IN3(n240), .QN(n241) );
  INVX0 U116 ( .INP(n155), .ZN(n170) );
  INVX0 U117 ( .INP(n157), .ZN(n171) );
  INVX0 U118 ( .INP(n149), .ZN(n166) );
  INVX0 U119 ( .INP(n147), .ZN(n165) );
  INVX0 U120 ( .INP(n153), .ZN(n168) );
  INVX0 U121 ( .INP(n151), .ZN(n167) );
  INVX0 U122 ( .INP(n159), .ZN(n172) );
  NBUFFX2 U123 ( .INP(n242), .Z(n155) );
  NBUFFX2 U124 ( .INP(n243), .Z(n157) );
  NBUFFX2 U125 ( .INP(n238), .Z(n149) );
  NBUFFX2 U126 ( .INP(n237), .Z(n147) );
  NBUFFX2 U127 ( .INP(n242), .Z(n156) );
  NBUFFX2 U128 ( .INP(n243), .Z(n158) );
  NBUFFX2 U129 ( .INP(n238), .Z(n150) );
  NBUFFX2 U130 ( .INP(n237), .Z(n148) );
  NBUFFX2 U131 ( .INP(n244), .Z(n159) );
  NBUFFX2 U132 ( .INP(n241), .Z(n153) );
  NBUFFX2 U133 ( .INP(n239), .Z(n151) );
  NBUFFX2 U134 ( .INP(n244), .Z(n160) );
  NBUFFX2 U135 ( .INP(n241), .Z(n154) );
  NBUFFX2 U136 ( .INP(n239), .Z(n152) );
  NAND3X0 U137 ( .IN1(waddr[1]), .IN2(n163), .IN3(n240), .QN(n239) );
  NOR2X0 U138 ( .IN1(n169), .IN2(waddr[2]), .QN(n240) );
  INVX0 U139 ( .INP(we), .ZN(n169) );
  AO22X1 U140 ( .IN1(mem[45]), .IN2(n99), .IN3(mem[61]), .IN4(n145), .Q(n118)
         );
  AO22X1 U141 ( .IN1(mem[44]), .IN2(n141), .IN3(mem[60]), .IN4(n146), .Q(n114)
         );
  AO22X1 U142 ( .IN1(mem[47]), .IN2(n99), .IN3(mem[63]), .IN4(n146), .Q(n128)
         );
  NOR2X0 U143 ( .IN1(n133), .IN2(raddr[1]), .QN(n130) );
  NOR2X0 U144 ( .IN1(raddr[1]), .IN2(n134), .QN(n126) );
  AO22X1 U145 ( .IN1(mem[32]), .IN2(n99), .IN3(mem[48]), .IN4(n143), .Q(n101)
         );
  AO22X1 U146 ( .IN1(mem[40]), .IN2(n100), .IN3(mem[56]), .IN4(n143), .Q(n102)
         );
  AO22X1 U147 ( .IN1(mem[33]), .IN2(n142), .IN3(mem[49]), .IN4(n144), .Q(n103)
         );
  AO221X1 U148 ( .IN1(mem[17]), .IN2(n98), .IN3(mem[1]), .IN4(n140), .IN5(n103), .Q(n106) );
  AO22X1 U149 ( .IN1(mem[41]), .IN2(n99), .IN3(mem[57]), .IN4(n146), .Q(n104)
         );
  AO221X1 U150 ( .IN1(mem[25]), .IN2(n136), .IN3(mem[9]), .IN4(n140), .IN5(
        n104), .Q(n105) );
  AO22X1 U151 ( .IN1(mem[34]), .IN2(n142), .IN3(mem[50]), .IN4(n144), .Q(n107)
         );
  AO22X1 U152 ( .IN1(mem[42]), .IN2(n100), .IN3(mem[58]), .IN4(n145), .Q(n108)
         );
  AO22X1 U153 ( .IN1(mem[35]), .IN2(n142), .IN3(mem[51]), .IN4(n144), .Q(n109)
         );
  AO221X1 U154 ( .IN1(mem[19]), .IN2(n137), .IN3(mem[3]), .IN4(n138), .IN5(
        n109), .Q(n112) );
  AO22X1 U155 ( .IN1(mem[43]), .IN2(n142), .IN3(mem[59]), .IN4(n143), .Q(n110)
         );
  AO221X1 U156 ( .IN1(mem[27]), .IN2(n137), .IN3(mem[11]), .IN4(n139), .IN5(
        n110), .Q(n111) );
  AO22X1 U157 ( .IN1(n112), .IN2(n90), .IN3(n111), .IN4(n91), .Q(rdata[3]) );
  AO221X1 U158 ( .IN1(mem[20]), .IN2(n136), .IN3(mem[4]), .IN4(n138), .IN5(
        n113), .Q(n116) );
  AO221X1 U159 ( .IN1(mem[28]), .IN2(n136), .IN3(mem[12]), .IN4(n139), .IN5(
        n114), .Q(n115) );
  AO221X1 U160 ( .IN1(mem[21]), .IN2(n97), .IN3(mem[5]), .IN4(n138), .IN5(n117), .Q(n120) );
  AO221X1 U161 ( .IN1(mem[29]), .IN2(n98), .IN3(mem[13]), .IN4(n139), .IN5(
        n118), .Q(n119) );
  AO22X1 U162 ( .IN1(n120), .IN2(n90), .IN3(n119), .IN4(n91), .Q(rdata[5]) );
  AO221X1 U163 ( .IN1(mem[22]), .IN2(n136), .IN3(mem[6]), .IN4(n138), .IN5(
        n121), .Q(n124) );
  AO221X1 U164 ( .IN1(mem[30]), .IN2(n97), .IN3(mem[14]), .IN4(n139), .IN5(
        n122), .Q(n123) );
  AO221X1 U165 ( .IN1(mem[23]), .IN2(n98), .IN3(mem[7]), .IN4(n138), .IN5(n125), .Q(n132) );
  AO221X1 U166 ( .IN1(mem[31]), .IN2(n97), .IN3(mem[15]), .IN4(n139), .IN5(
        n128), .Q(n131) );
  AO22X1 U167 ( .IN1(n96), .IN2(n132), .IN3(n131), .IN4(n91), .Q(rdata[7]) );
  INVX0 U168 ( .INP(raddr[2]), .ZN(n133) );
  INVX0 U169 ( .INP(n133), .ZN(n134) );
  INVX0 U170 ( .INP(raddr[1]), .ZN(n135) );
  NOR2X0 U171 ( .IN1(n133), .IN2(n135), .QN(n129) );
  NOR2X0 U172 ( .IN1(n135), .IN2(n134), .QN(n127) );
  NBUFFX2 U173 ( .INP(n126), .Z(n143) );
  AO22X1 U174 ( .IN1(mem[39]), .IN2(n141), .IN3(mem[55]), .IN4(n145), .Q(n125)
         );
  AO22X1 U175 ( .IN1(mem[38]), .IN2(n100), .IN3(mem[54]), .IN4(n144), .Q(n121)
         );
  AO22X1 U176 ( .IN1(mem[37]), .IN2(n141), .IN3(mem[53]), .IN4(n145), .Q(n117)
         );
  AO22X1 U177 ( .IN1(mem[36]), .IN2(n100), .IN3(mem[52]), .IN4(n143), .Q(n113)
         );
  AO22X1 U178 ( .IN1(mem[46]), .IN2(n141), .IN3(mem[62]), .IN4(n146), .Q(n122)
         );
  INVX0 U179 ( .INP(n163), .ZN(n162) );
  INVX0 U180 ( .INP(waddr[0]), .ZN(n163) );
  INVX0 U181 ( .INP(waddr[1]), .ZN(n164) );
endmodule


module payload_ram_bank8x8_4 ( clk, we, waddr, wdata, raddr, rdata );
  input [2:0] waddr;
  input [7:0] wdata;
  input [2:0] raddr;
  output [7:0] rdata;
  input clk, we;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n17, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n153, n154, n155, n156,
         n157, n158, n159, n160, n161, n162, n163, n164, n165, n166, n167,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247;
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
  AO22X1 U14 ( .IN1(n93), .IN2(n175), .IN3(mem[0]), .IN4(n164), .Q(n239) );
  AO22X1 U15 ( .IN1(n91), .IN2(n175), .IN3(mem[1]), .IN4(n164), .Q(n238) );
  AO22X1 U16 ( .IN1(n89), .IN2(n175), .IN3(mem[2]), .IN4(n164), .Q(n237) );
  AO22X1 U17 ( .IN1(n87), .IN2(n175), .IN3(mem[3]), .IN4(n164), .Q(n236) );
  AO22X1 U18 ( .IN1(n17), .IN2(n175), .IN3(mem[4]), .IN4(n164), .Q(n235) );
  AO22X1 U19 ( .IN1(n11), .IN2(n175), .IN3(mem[5]), .IN4(n164), .Q(n234) );
  AO22X1 U20 ( .IN1(n9), .IN2(n175), .IN3(mem[6]), .IN4(n164), .Q(n233) );
  AO22X1 U21 ( .IN1(n7), .IN2(n175), .IN3(mem[7]), .IN4(n164), .Q(n232) );
  AO22X1 U23 ( .IN1(n174), .IN2(n93), .IN3(mem[8]), .IN4(n163), .Q(n231) );
  AO22X1 U24 ( .IN1(n174), .IN2(n91), .IN3(mem[9]), .IN4(n163), .Q(n230) );
  AO22X1 U25 ( .IN1(n174), .IN2(n89), .IN3(mem[10]), .IN4(n163), .Q(n229) );
  AO22X1 U26 ( .IN1(n174), .IN2(n87), .IN3(mem[11]), .IN4(n163), .Q(n228) );
  AO22X1 U27 ( .IN1(n174), .IN2(n17), .IN3(mem[12]), .IN4(n163), .Q(n227) );
  AO22X1 U28 ( .IN1(n174), .IN2(n11), .IN3(mem[13]), .IN4(n162), .Q(n226) );
  AO22X1 U29 ( .IN1(n174), .IN2(n9), .IN3(mem[14]), .IN4(n162), .Q(n225) );
  AO22X1 U30 ( .IN1(n174), .IN2(n7), .IN3(mem[15]), .IN4(n162), .Q(n224) );
  AO22X1 U32 ( .IN1(n173), .IN2(wdata[0]), .IN3(mem[16]), .IN4(n161), .Q(n223)
         );
  AO22X1 U33 ( .IN1(n173), .IN2(wdata[1]), .IN3(mem[17]), .IN4(n161), .Q(n222)
         );
  AO22X1 U34 ( .IN1(n173), .IN2(wdata[2]), .IN3(mem[18]), .IN4(n161), .Q(n221)
         );
  AO22X1 U35 ( .IN1(n173), .IN2(n87), .IN3(mem[19]), .IN4(n161), .Q(n220) );
  AO22X1 U36 ( .IN1(n173), .IN2(n17), .IN3(mem[20]), .IN4(n161), .Q(n219) );
  AO22X1 U37 ( .IN1(n173), .IN2(n11), .IN3(mem[21]), .IN4(n160), .Q(n218) );
  AO22X1 U38 ( .IN1(n173), .IN2(n9), .IN3(mem[22]), .IN4(n160), .Q(n217) );
  AO22X1 U39 ( .IN1(n173), .IN2(n7), .IN3(mem[23]), .IN4(n160), .Q(n216) );
  AO22X1 U41 ( .IN1(n172), .IN2(n93), .IN3(mem[24]), .IN4(n159), .Q(n215) );
  AO22X1 U42 ( .IN1(n172), .IN2(n91), .IN3(mem[25]), .IN4(n159), .Q(n214) );
  AO22X1 U43 ( .IN1(n172), .IN2(n89), .IN3(mem[26]), .IN4(n159), .Q(n213) );
  AO22X1 U44 ( .IN1(n172), .IN2(n87), .IN3(mem[27]), .IN4(n159), .Q(n212) );
  AO22X1 U45 ( .IN1(n172), .IN2(n17), .IN3(mem[28]), .IN4(n159), .Q(n211) );
  AO22X1 U46 ( .IN1(n172), .IN2(n11), .IN3(mem[29]), .IN4(n158), .Q(n210) );
  AO22X1 U47 ( .IN1(n172), .IN2(n9), .IN3(mem[30]), .IN4(n158), .Q(n209) );
  AO22X1 U48 ( .IN1(n172), .IN2(n7), .IN3(mem[31]), .IN4(n158), .Q(n208) );
  AO22X1 U51 ( .IN1(n170), .IN2(n93), .IN3(mem[32]), .IN4(n157), .Q(n207) );
  AO22X1 U52 ( .IN1(n170), .IN2(n91), .IN3(mem[33]), .IN4(n157), .Q(n206) );
  AO22X1 U53 ( .IN1(n170), .IN2(n89), .IN3(mem[34]), .IN4(n157), .Q(n205) );
  AO22X1 U54 ( .IN1(n170), .IN2(n87), .IN3(mem[35]), .IN4(n157), .Q(n204) );
  AO22X1 U55 ( .IN1(n170), .IN2(n17), .IN3(mem[36]), .IN4(n157), .Q(n203) );
  AO22X1 U56 ( .IN1(n170), .IN2(n11), .IN3(mem[37]), .IN4(n157), .Q(n202) );
  AO22X1 U57 ( .IN1(n170), .IN2(n9), .IN3(mem[38]), .IN4(n157), .Q(n201) );
  AO22X1 U58 ( .IN1(n170), .IN2(n7), .IN3(mem[39]), .IN4(n157), .Q(n200) );
  AO22X1 U60 ( .IN1(n169), .IN2(n93), .IN3(mem[40]), .IN4(n156), .Q(n199) );
  AO22X1 U61 ( .IN1(n169), .IN2(n91), .IN3(mem[41]), .IN4(n156), .Q(n198) );
  AO22X1 U62 ( .IN1(n169), .IN2(n89), .IN3(mem[42]), .IN4(n156), .Q(n197) );
  AO22X1 U63 ( .IN1(n169), .IN2(n87), .IN3(mem[43]), .IN4(n156), .Q(n196) );
  AO22X1 U64 ( .IN1(n169), .IN2(wdata[4]), .IN3(mem[44]), .IN4(n156), .Q(n195)
         );
  AO22X1 U65 ( .IN1(n169), .IN2(wdata[5]), .IN3(mem[45]), .IN4(n155), .Q(n194)
         );
  AO22X1 U66 ( .IN1(n169), .IN2(wdata[6]), .IN3(mem[46]), .IN4(n155), .Q(n193)
         );
  AO22X1 U67 ( .IN1(n169), .IN2(wdata[7]), .IN3(mem[47]), .IN4(n155), .Q(n192)
         );
  AO22X1 U69 ( .IN1(n3), .IN2(n93), .IN3(mem[48]), .IN4(n154), .Q(n191) );
  AO22X1 U70 ( .IN1(n3), .IN2(n91), .IN3(mem[49]), .IN4(n154), .Q(n190) );
  AO22X1 U71 ( .IN1(n3), .IN2(n89), .IN3(mem[50]), .IN4(n154), .Q(n189) );
  AO22X1 U72 ( .IN1(n3), .IN2(wdata[3]), .IN3(mem[51]), .IN4(n154), .Q(n188)
         );
  AO22X1 U73 ( .IN1(n3), .IN2(n17), .IN3(mem[52]), .IN4(n154), .Q(n187) );
  AO22X1 U74 ( .IN1(n3), .IN2(n11), .IN3(mem[53]), .IN4(n153), .Q(n186) );
  AO22X1 U75 ( .IN1(n3), .IN2(n9), .IN3(mem[54]), .IN4(n153), .Q(n185) );
  AO22X1 U76 ( .IN1(n3), .IN2(n7), .IN3(mem[55]), .IN4(n153), .Q(n184) );
  AO22X1 U78 ( .IN1(n168), .IN2(n93), .IN3(mem[56]), .IN4(n152), .Q(n183) );
  AO22X1 U79 ( .IN1(n168), .IN2(n91), .IN3(mem[57]), .IN4(n152), .Q(n182) );
  AO22X1 U80 ( .IN1(n168), .IN2(n89), .IN3(mem[58]), .IN4(n152), .Q(n181) );
  AO22X1 U81 ( .IN1(n168), .IN2(n87), .IN3(mem[59]), .IN4(n152), .Q(n180) );
  AO22X1 U82 ( .IN1(n168), .IN2(n17), .IN3(mem[60]), .IN4(n152), .Q(n179) );
  AO22X1 U83 ( .IN1(n168), .IN2(n11), .IN3(mem[61]), .IN4(n151), .Q(n178) );
  AO22X1 U84 ( .IN1(n168), .IN2(n9), .IN3(mem[62]), .IN4(n151), .Q(n177) );
  AO22X1 U85 ( .IN1(n168), .IN2(n7), .IN3(mem[63]), .IN4(n151), .Q(n176) );
  NBUFFX2 U2 ( .INP(n128), .Z(n96) );
  NBUFFX2 U3 ( .INP(n127), .Z(n145) );
  NBUFFX2 U4 ( .INP(n131), .Z(n95) );
  AND2X1 U5 ( .IN1(we), .IN2(waddr[2]), .Q(n247) );
  NBUFFX2 U6 ( .INP(waddr[1]), .Z(n4) );
  NBUFFX2 U7 ( .INP(n130), .Z(n142) );
  NBUFFX2 U8 ( .INP(n128), .Z(n144) );
  NBUFFX2 U9 ( .INP(n127), .Z(n146) );
  NBUFFX2 U10 ( .INP(n127), .Z(n150) );
  NBUFFX2 U11 ( .INP(n127), .Z(n149) );
  NBUFFX2 U12 ( .INP(n128), .Z(n97) );
  NBUFFX2 U13 ( .INP(n142), .Z(n5) );
  NBUFFX2 U22 ( .INP(n131), .Z(n138) );
  NBUFFX2 U31 ( .INP(n131), .Z(n139) );
  NBUFFX2 U40 ( .INP(n130), .Z(n141) );
  AO221X1 U49 ( .IN1(mem[21]), .IN2(n95), .IN3(mem[5]), .IN4(n140), .IN5(n118),
        .Q(n121) );
  NBUFFX2 U50 ( .INP(n130), .Z(n140) );
  NBUFFX2 U59 ( .INP(n131), .Z(n94) );
  NBUFFX2 U68 ( .INP(n1), .Z(n164) );
  NBUFFX2 U77 ( .INP(n245), .Z(n160) );
  NBUFFX2 U86 ( .INP(n2), .Z(n157) );
  NBUFFX2 U87 ( .INP(n241), .Z(n153) );
  NAND3X0 U88 ( .IN1(n165), .IN2(n167), .IN3(n243), .QN(n241) );
  NBUFFX2 U89 ( .INP(n128), .Z(n143) );
  NAND3X0 U90 ( .IN1(n166), .IN2(n167), .IN3(n247), .QN(n244) );
  NAND3X0 U91 ( .IN1(n247), .IN2(n167), .IN3(n165), .QN(n245) );
  NAND3X0 U92 ( .IN1(n166), .IN2(n167), .IN3(n243), .QN(n240) );
  NAND3X0 U93 ( .IN1(n165), .IN2(n247), .IN3(n4), .QN(n1) );
  NAND3X0 U94 ( .IN1(n4), .IN2(n165), .IN3(n243), .QN(n2) );
  INVX0 U95 ( .INP(n153), .ZN(n3) );
  INVX0 U96 ( .INP(wdata[7]), .ZN(n6) );
  INVX0 U97 ( .INP(n6), .ZN(n7) );
  INVX0 U98 ( .INP(wdata[6]), .ZN(n8) );
  INVX0 U99 ( .INP(n8), .ZN(n9) );
  INVX0 U100 ( .INP(wdata[5]), .ZN(n10) );
  INVX0 U101 ( .INP(n10), .ZN(n11) );
  INVX0 U102 ( .INP(wdata[4]), .ZN(n12) );
  INVX0 U103 ( .INP(n12), .ZN(n17) );
  INVX0 U104 ( .INP(wdata[3]), .ZN(n86) );
  INVX0 U105 ( .INP(n86), .ZN(n87) );
  INVX0 U106 ( .INP(wdata[2]), .ZN(n88) );
  INVX0 U107 ( .INP(n88), .ZN(n89) );
  INVX0 U108 ( .INP(wdata[1]), .ZN(n90) );
  INVX0 U109 ( .INP(n90), .ZN(n91) );
  INVX0 U110 ( .INP(wdata[0]), .ZN(n92) );
  INVX0 U111 ( .INP(n92), .ZN(n93) );
  INVX0 U112 ( .INP(n158), .ZN(n172) );
  INVX0 U113 ( .INP(n160), .ZN(n173) );
  INVX0 U114 ( .INP(n151), .ZN(n168) );
  INVX0 U115 ( .INP(n1), .ZN(n175) );
  INVX0 U116 ( .INP(n2), .ZN(n170) );
  INVX0 U117 ( .INP(n155), .ZN(n169) );
  INVX0 U118 ( .INP(n246), .ZN(n174) );
  NBUFFX2 U119 ( .INP(n244), .Z(n158) );
  NBUFFX2 U120 ( .INP(n240), .Z(n151) );
  NBUFFX2 U121 ( .INP(n244), .Z(n159) );
  NBUFFX2 U122 ( .INP(n245), .Z(n161) );
  NBUFFX2 U123 ( .INP(n241), .Z(n154) );
  NBUFFX2 U124 ( .INP(n240), .Z(n152) );
  NBUFFX2 U125 ( .INP(n246), .Z(n162) );
  NBUFFX2 U126 ( .INP(n242), .Z(n155) );
  NBUFFX2 U127 ( .INP(n162), .Z(n163) );
  NBUFFX2 U128 ( .INP(n242), .Z(n156) );
  NAND3X0 U129 ( .IN1(n247), .IN2(n166), .IN3(n4), .QN(n246) );
  NAND3X0 U130 ( .IN1(n4), .IN2(n166), .IN3(n243), .QN(n242) );
  NOR2X0 U131 ( .IN1(n171), .IN2(waddr[2]), .QN(n243) );
  INVX0 U132 ( .INP(we), .ZN(n171) );
  AO22X1 U133 ( .IN1(mem[47]), .IN2(n97), .IN3(mem[63]), .IN4(n149), .Q(n129)
         );
  AO22X1 U134 ( .IN1(n143), .IN2(mem[44]), .IN3(mem[60]), .IN4(n150), .Q(n115)
         );
  AO22X1 U135 ( .IN1(mem[39]), .IN2(n144), .IN3(mem[55]), .IN4(n146), .Q(n126)
         );
  AO22X1 U136 ( .IN1(mem[36]), .IN2(n144), .IN3(mem[52]), .IN4(n146), .Q(n114)
         );
  AO22X1 U137 ( .IN1(mem[45]), .IN2(n96), .IN3(mem[61]), .IN4(n145), .Q(n119)
         );
  NOR2X0 U138 ( .IN1(n134), .IN2(raddr[1]), .QN(n131) );
  NOR2X0 U139 ( .IN1(raddr[1]), .IN2(n135), .QN(n127) );
  AO22X1 U140 ( .IN1(mem[32]), .IN2(n143), .IN3(mem[48]), .IN4(n146), .Q(n98)
         );
  AO221X1 U141 ( .IN1(mem[16]), .IN2(n95), .IN3(mem[0]), .IN4(n142), .IN5(n98),
        .Q(n101) );
  AO22X1 U142 ( .IN1(mem[40]), .IN2(n143), .IN3(mem[56]), .IN4(n146), .Q(n99)
         );
  AO221X1 U143 ( .IN1(mem[24]), .IN2(n95), .IN3(mem[8]), .IN4(n142), .IN5(n99),
        .Q(n100) );
  AO22X1 U144 ( .IN1(n101), .IN2(n147), .IN3(n100), .IN4(n137), .Q(rdata[0])
         );
  AO22X1 U145 ( .IN1(mem[33]), .IN2(n144), .IN3(mem[49]), .IN4(n150), .Q(n102)
         );
  AO221X1 U146 ( .IN1(mem[17]), .IN2(n138), .IN3(mem[1]), .IN4(n5), .IN5(n102),
        .Q(n105) );
  AO22X1 U147 ( .IN1(mem[41]), .IN2(n96), .IN3(mem[57]), .IN4(n150), .Q(n103)
         );
  AO221X1 U148 ( .IN1(mem[25]), .IN2(n138), .IN3(mem[9]), .IN4(n5), .IN5(n103),
        .Q(n104) );
  AO22X1 U149 ( .IN1(n105), .IN2(n147), .IN3(n104), .IN4(n137), .Q(rdata[1])
         );
  AO22X1 U150 ( .IN1(mem[34]), .IN2(n97), .IN3(mem[50]), .IN4(n149), .Q(n106)
         );
  AO221X1 U151 ( .IN1(mem[18]), .IN2(n139), .IN3(mem[2]), .IN4(n142), .IN5(
        n106), .Q(n109) );
  AO22X1 U152 ( .IN1(mem[42]), .IN2(n96), .IN3(mem[58]), .IN4(n149), .Q(n107)
         );
  AO221X1 U153 ( .IN1(mem[26]), .IN2(n139), .IN3(mem[10]), .IN4(n5), .IN5(n107), .Q(n108) );
  AO22X1 U154 ( .IN1(n109), .IN2(n147), .IN3(n108), .IN4(n137), .Q(rdata[2])
         );
  AO22X1 U155 ( .IN1(mem[35]), .IN2(n143), .IN3(mem[51]), .IN4(n145), .Q(n110)
         );
  AO221X1 U156 ( .IN1(mem[19]), .IN2(n139), .IN3(mem[3]), .IN4(n140), .IN5(
        n110), .Q(n113) );
  AO22X1 U157 ( .IN1(mem[43]), .IN2(n96), .IN3(mem[59]), .IN4(n145), .Q(n111)
         );
  AO221X1 U158 ( .IN1(mem[27]), .IN2(n139), .IN3(mem[11]), .IN4(n141), .IN5(
        n111), .Q(n112) );
  AO22X1 U159 ( .IN1(n113), .IN2(n147), .IN3(n112), .IN4(n137), .Q(rdata[3])
         );
  AO221X1 U160 ( .IN1(mem[20]), .IN2(n138), .IN3(mem[4]), .IN4(n140), .IN5(
        n114), .Q(n117) );
  AO221X1 U161 ( .IN1(mem[28]), .IN2(n138), .IN3(mem[12]), .IN4(n141), .IN5(
        n115), .Q(n116) );
  AO22X1 U162 ( .IN1(n117), .IN2(n147), .IN3(n116), .IN4(n137), .Q(rdata[4])
         );
  AO22X1 U163 ( .IN1(mem[37]), .IN2(n96), .IN3(mem[53]), .IN4(n145), .Q(n118)
         );
  AO221X1 U164 ( .IN1(mem[29]), .IN2(n95), .IN3(mem[13]), .IN4(n141), .IN5(
        n119), .Q(n120) );
  AO22X1 U165 ( .IN1(n121), .IN2(n147), .IN3(n120), .IN4(n137), .Q(rdata[5])
         );
  AO22X1 U166 ( .IN1(mem[38]), .IN2(n97), .IN3(mem[54]), .IN4(n150), .Q(n122)
         );
  AO221X1 U167 ( .IN1(mem[22]), .IN2(n94), .IN3(mem[6]), .IN4(n140), .IN5(n122), .Q(n125) );
  AO221X1 U168 ( .IN1(mem[30]), .IN2(n94), .IN3(mem[14]), .IN4(n141), .IN5(
        n123), .Q(n124) );
  AO22X1 U169 ( .IN1(n125), .IN2(n147), .IN3(n124), .IN4(n137), .Q(rdata[6])
         );
  AO221X1 U170 ( .IN1(mem[23]), .IN2(n94), .IN3(mem[7]), .IN4(n140), .IN5(n126), .Q(n133) );
  AO221X1 U171 ( .IN1(mem[31]), .IN2(n94), .IN3(mem[15]), .IN4(n141), .IN5(
        n129), .Q(n132) );
  AO22X1 U172 ( .IN1(n147), .IN2(n133), .IN3(n132), .IN4(n137), .Q(rdata[7])
         );
  INVX0 U173 ( .INP(raddr[2]), .ZN(n134) );
  INVX0 U174 ( .INP(n134), .ZN(n135) );
  INVX0 U175 ( .INP(raddr[1]), .ZN(n136) );
  INVX0 U176 ( .INP(raddr[0]), .ZN(n137) );
  NOR2X0 U177 ( .IN1(n134), .IN2(n136), .QN(n130) );
  INVX0 U178 ( .INP(n148), .ZN(n147) );
  INVX0 U179 ( .INP(raddr[0]), .ZN(n148) );
  NOR2X0 U180 ( .IN1(n136), .IN2(n135), .QN(n128) );
  AO22X1 U181 ( .IN1(n143), .IN2(mem[46]), .IN3(mem[62]), .IN4(n149), .Q(n123)
         );
  INVX0 U182 ( .INP(n166), .ZN(n165) );
  INVX0 U183 ( .INP(waddr[0]), .ZN(n166) );
  INVX0 U184 ( .INP(waddr[1]), .ZN(n167) );
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
  AO22X1 U14 ( .IN1(wdata[0]), .IN2(n89), .IN3(mem[0]), .IN4(n162), .Q(n235)
         );
  AO22X1 U15 ( .IN1(wdata[1]), .IN2(n89), .IN3(mem[1]), .IN4(n162), .Q(n234)
         );
  AO22X1 U16 ( .IN1(wdata[2]), .IN2(n89), .IN3(mem[2]), .IN4(n162), .Q(n233)
         );
  AO22X1 U17 ( .IN1(wdata[3]), .IN2(n89), .IN3(mem[3]), .IN4(n162), .Q(n232)
         );
  AO22X1 U18 ( .IN1(wdata[4]), .IN2(n89), .IN3(mem[4]), .IN4(n162), .Q(n231)
         );
  AO22X1 U19 ( .IN1(wdata[5]), .IN2(n89), .IN3(mem[5]), .IN4(n161), .Q(n230)
         );
  AO22X1 U20 ( .IN1(wdata[6]), .IN2(n89), .IN3(mem[6]), .IN4(n161), .Q(n229)
         );
  AO22X1 U21 ( .IN1(wdata[7]), .IN2(n89), .IN3(mem[7]), .IN4(n161), .Q(n228)
         );
  AO22X1 U23 ( .IN1(n171), .IN2(n88), .IN3(mem[8]), .IN4(n160), .Q(n227) );
  AO22X1 U24 ( .IN1(n171), .IN2(n87), .IN3(mem[9]), .IN4(n160), .Q(n226) );
  AO22X1 U25 ( .IN1(n171), .IN2(n86), .IN3(mem[10]), .IN4(n160), .Q(n225) );
  AO22X1 U26 ( .IN1(n171), .IN2(n11), .IN3(mem[11]), .IN4(n160), .Q(n224) );
  AO22X1 U27 ( .IN1(n171), .IN2(n10), .IN3(mem[12]), .IN4(n160), .Q(n223) );
  AO22X1 U28 ( .IN1(n171), .IN2(n9), .IN3(mem[13]), .IN4(n159), .Q(n222) );
  AO22X1 U29 ( .IN1(n171), .IN2(n8), .IN3(mem[14]), .IN4(n159), .Q(n221) );
  AO22X1 U30 ( .IN1(n171), .IN2(n7), .IN3(mem[15]), .IN4(n159), .Q(n220) );
  AO22X1 U32 ( .IN1(n170), .IN2(n88), .IN3(mem[16]), .IN4(n158), .Q(n219) );
  AO22X1 U33 ( .IN1(n170), .IN2(n87), .IN3(mem[17]), .IN4(n158), .Q(n218) );
  AO22X1 U34 ( .IN1(n170), .IN2(n86), .IN3(mem[18]), .IN4(n158), .Q(n217) );
  AO22X1 U35 ( .IN1(n170), .IN2(n11), .IN3(mem[19]), .IN4(n158), .Q(n216) );
  AO22X1 U36 ( .IN1(n90), .IN2(n10), .IN3(mem[20]), .IN4(n158), .Q(n215) );
  AO22X1 U37 ( .IN1(n90), .IN2(n9), .IN3(mem[21]), .IN4(n157), .Q(n214) );
  AO22X1 U38 ( .IN1(n90), .IN2(n8), .IN3(mem[22]), .IN4(n157), .Q(n213) );
  AO22X1 U39 ( .IN1(n90), .IN2(n7), .IN3(mem[23]), .IN4(n157), .Q(n212) );
  AO22X1 U41 ( .IN1(n169), .IN2(wdata[0]), .IN3(mem[24]), .IN4(n156), .Q(n211)
         );
  AO22X1 U42 ( .IN1(n169), .IN2(wdata[1]), .IN3(mem[25]), .IN4(n156), .Q(n210)
         );
  AO22X1 U43 ( .IN1(n169), .IN2(wdata[2]), .IN3(mem[26]), .IN4(n156), .Q(n209)
         );
  AO22X1 U44 ( .IN1(n91), .IN2(n11), .IN3(mem[27]), .IN4(n156), .Q(n208) );
  AO22X1 U45 ( .IN1(n91), .IN2(n10), .IN3(mem[28]), .IN4(n156), .Q(n207) );
  AO22X1 U46 ( .IN1(n91), .IN2(n9), .IN3(mem[29]), .IN4(n155), .Q(n206) );
  AO22X1 U47 ( .IN1(n91), .IN2(n8), .IN3(mem[30]), .IN4(n155), .Q(n205) );
  AO22X1 U48 ( .IN1(n91), .IN2(n7), .IN3(mem[31]), .IN4(n155), .Q(n204) );
  AO22X1 U51 ( .IN1(n3), .IN2(n88), .IN3(mem[32]), .IN4(n154), .Q(n203) );
  AO22X1 U52 ( .IN1(n3), .IN2(n87), .IN3(mem[33]), .IN4(n154), .Q(n202) );
  AO22X1 U53 ( .IN1(n3), .IN2(n86), .IN3(mem[34]), .IN4(n154), .Q(n201) );
  AO22X1 U54 ( .IN1(n3), .IN2(n11), .IN3(mem[35]), .IN4(n154), .Q(n200) );
  AO22X1 U55 ( .IN1(n3), .IN2(n10), .IN3(mem[36]), .IN4(n154), .Q(n199) );
  AO22X1 U56 ( .IN1(n3), .IN2(n9), .IN3(mem[37]), .IN4(n153), .Q(n198) );
  AO22X1 U57 ( .IN1(n3), .IN2(n8), .IN3(mem[38]), .IN4(n153), .Q(n197) );
  AO22X1 U58 ( .IN1(n3), .IN2(n7), .IN3(mem[39]), .IN4(n153), .Q(n196) );
  AO22X1 U60 ( .IN1(n4), .IN2(n88), .IN3(mem[40]), .IN4(n152), .Q(n195) );
  AO22X1 U61 ( .IN1(n4), .IN2(n87), .IN3(mem[41]), .IN4(n152), .Q(n194) );
  AO22X1 U62 ( .IN1(n4), .IN2(n86), .IN3(mem[42]), .IN4(n152), .Q(n193) );
  AO22X1 U63 ( .IN1(n4), .IN2(wdata[3]), .IN3(mem[43]), .IN4(n152), .Q(n192)
         );
  AO22X1 U64 ( .IN1(n4), .IN2(wdata[4]), .IN3(mem[44]), .IN4(n152), .Q(n191)
         );
  AO22X1 U65 ( .IN1(n4), .IN2(wdata[5]), .IN3(mem[45]), .IN4(n151), .Q(n190)
         );
  AO22X1 U66 ( .IN1(n4), .IN2(wdata[6]), .IN3(mem[46]), .IN4(n151), .Q(n189)
         );
  AO22X1 U67 ( .IN1(n4), .IN2(wdata[7]), .IN3(mem[47]), .IN4(n151), .Q(n188)
         );
  AO22X1 U69 ( .IN1(n167), .IN2(n88), .IN3(mem[48]), .IN4(n150), .Q(n187) );
  AO22X1 U70 ( .IN1(n167), .IN2(n87), .IN3(mem[49]), .IN4(n150), .Q(n186) );
  AO22X1 U71 ( .IN1(n167), .IN2(n86), .IN3(mem[50]), .IN4(n150), .Q(n185) );
  AO22X1 U72 ( .IN1(n167), .IN2(n11), .IN3(mem[51]), .IN4(n150), .Q(n184) );
  AO22X1 U73 ( .IN1(n2), .IN2(n10), .IN3(mem[52]), .IN4(n150), .Q(n183) );
  AO22X1 U74 ( .IN1(n2), .IN2(n9), .IN3(mem[53]), .IN4(n149), .Q(n182) );
  AO22X1 U75 ( .IN1(n2), .IN2(n8), .IN3(mem[54]), .IN4(n149), .Q(n181) );
  AO22X1 U76 ( .IN1(n2), .IN2(n7), .IN3(mem[55]), .IN4(n149), .Q(n180) );
  AO22X1 U78 ( .IN1(n166), .IN2(n88), .IN3(mem[56]), .IN4(n148), .Q(n179) );
  AO22X1 U79 ( .IN1(n166), .IN2(n87), .IN3(mem[57]), .IN4(n148), .Q(n178) );
  AO22X1 U80 ( .IN1(n166), .IN2(n86), .IN3(mem[58]), .IN4(n148), .Q(n177) );
  AO22X1 U81 ( .IN1(n166), .IN2(n11), .IN3(mem[59]), .IN4(n148), .Q(n176) );
  AO22X1 U82 ( .IN1(n1), .IN2(n10), .IN3(mem[60]), .IN4(n148), .Q(n175) );
  AO22X1 U83 ( .IN1(n1), .IN2(n9), .IN3(mem[61]), .IN4(n147), .Q(n174) );
  AO22X1 U84 ( .IN1(n1), .IN2(n8), .IN3(mem[62]), .IN4(n147), .Q(n173) );
  AO22X1 U85 ( .IN1(n1), .IN2(n7), .IN3(mem[63]), .IN4(n147), .Q(n172) );
  AND2X1 U2 ( .IN1(we), .IN2(waddr[2]), .Q(n244) );
  NBUFFX2 U3 ( .INP(n133), .Z(n139) );
  NBUFFX2 U4 ( .INP(n130), .Z(n144) );
  NBUFFX2 U5 ( .INP(n130), .Z(n97) );
  NBUFFX2 U6 ( .INP(n129), .Z(n99) );
  NBUFFX2 U7 ( .INP(n133), .Z(n94) );
  NBUFFX2 U8 ( .INP(n130), .Z(n96) );
  NBUFFX2 U9 ( .INP(n129), .Z(n98) );
  NBUFFX2 U10 ( .INP(n129), .Z(n146) );
  NBUFFX2 U11 ( .INP(n132), .Z(n140) );
  NBUFFX2 U12 ( .INP(n133), .Z(n95) );
  NBUFFX2 U13 ( .INP(n130), .Z(n143) );
  NBUFFX2 U22 ( .INP(n129), .Z(n145) );
  NBUFFX2 U31 ( .INP(n132), .Z(n141) );
  NAND3X0 U40 ( .IN1(n244), .IN2(n165), .IN3(n163), .QN(n242) );
  NAND3X0 U49 ( .IN1(n164), .IN2(n165), .IN3(n244), .QN(n241) );
  NAND3X0 U50 ( .IN1(n163), .IN2(n165), .IN3(n239), .QN(n237) );
  NAND3X0 U59 ( .IN1(n164), .IN2(n165), .IN3(n239), .QN(n236) );
  NBUFFX2 U68 ( .INP(n245), .Z(n162) );
  NBUFFX2 U77 ( .INP(n245), .Z(n161) );
  NAND3X1 U86 ( .IN1(n244), .IN2(n164), .IN3(waddr[1]), .QN(n243) );
  NAND3X1 U87 ( .IN1(n163), .IN2(n244), .IN3(waddr[1]), .QN(n245) );
  INVX0 U88 ( .INP(n236), .ZN(n1) );
  INVX0 U89 ( .INP(n237), .ZN(n2) );
  INVX0 U90 ( .INP(n240), .ZN(n3) );
  INVX0 U91 ( .INP(n238), .ZN(n4) );
  NAND3X1 U92 ( .IN1(waddr[1]), .IN2(n164), .IN3(n239), .QN(n238) );
  INVX0 U93 ( .INP(raddr[1]), .ZN(n5) );
  INVX0 U94 ( .INP(n5), .ZN(n6) );
  NBUFFX2 U95 ( .INP(wdata[7]), .Z(n7) );
  NBUFFX2 U96 ( .INP(wdata[6]), .Z(n8) );
  NBUFFX2 U97 ( .INP(wdata[5]), .Z(n9) );
  NBUFFX2 U98 ( .INP(wdata[4]), .Z(n10) );
  NBUFFX2 U99 ( .INP(wdata[3]), .Z(n11) );
  NBUFFX2 U100 ( .INP(wdata[2]), .Z(n86) );
  NBUFFX2 U101 ( .INP(wdata[1]), .Z(n87) );
  NBUFFX2 U102 ( .INP(wdata[0]), .Z(n88) );
  INVX0 U103 ( .INP(n245), .ZN(n89) );
  INVX0 U104 ( .INP(n242), .ZN(n90) );
  INVX0 U105 ( .INP(n241), .ZN(n91) );
  NBUFFX2 U106 ( .INP(raddr[0]), .Z(n92) );
  INVX0 U107 ( .INP(n92), .ZN(n93) );
  NBUFFX2 U108 ( .INP(n132), .Z(n142) );
  NBUFFX2 U109 ( .INP(n133), .Z(n138) );
  NAND3X1 U110 ( .IN1(waddr[1]), .IN2(n163), .IN3(n239), .QN(n240) );
  INVX0 U111 ( .INP(n155), .ZN(n169) );
  INVX0 U112 ( .INP(n157), .ZN(n170) );
  INVX0 U113 ( .INP(n149), .ZN(n167) );
  INVX0 U114 ( .INP(n147), .ZN(n166) );
  INVX0 U115 ( .INP(n243), .ZN(n171) );
  NBUFFX2 U116 ( .INP(n241), .Z(n155) );
  NBUFFX2 U117 ( .INP(n242), .Z(n157) );
  NBUFFX2 U118 ( .INP(n237), .Z(n149) );
  NBUFFX2 U119 ( .INP(n236), .Z(n147) );
  NBUFFX2 U120 ( .INP(n241), .Z(n156) );
  NBUFFX2 U121 ( .INP(n242), .Z(n158) );
  NBUFFX2 U122 ( .INP(n237), .Z(n150) );
  NBUFFX2 U123 ( .INP(n236), .Z(n148) );
  NBUFFX2 U124 ( .INP(n243), .Z(n159) );
  NBUFFX2 U125 ( .INP(n240), .Z(n153) );
  NBUFFX2 U126 ( .INP(n238), .Z(n151) );
  NBUFFX2 U127 ( .INP(n159), .Z(n160) );
  NBUFFX2 U128 ( .INP(n240), .Z(n154) );
  NBUFFX2 U129 ( .INP(n238), .Z(n152) );
  NOR2X0 U130 ( .IN1(n168), .IN2(waddr[2]), .QN(n239) );
  INVX0 U131 ( .INP(we), .ZN(n168) );
  NOR2X0 U132 ( .IN1(n136), .IN2(n6), .QN(n133) );
  NOR2X0 U133 ( .IN1(n6), .IN2(n137), .QN(n129) );
  AO22X1 U134 ( .IN1(mem[32]), .IN2(n96), .IN3(mem[48]), .IN4(n98), .Q(n100)
         );
  AO221X1 U135 ( .IN1(mem[16]), .IN2(n138), .IN3(mem[0]), .IN4(n142), .IN5(
        n100), .Q(n103) );
  AO22X1 U136 ( .IN1(mem[40]), .IN2(n97), .IN3(mem[56]), .IN4(n99), .Q(n101)
         );
  AO221X1 U137 ( .IN1(mem[24]), .IN2(n94), .IN3(mem[8]), .IN4(n142), .IN5(n101), .Q(n102) );
  AO22X1 U138 ( .IN1(n103), .IN2(raddr[0]), .IN3(n102), .IN4(n93), .Q(rdata[0]) );
  AO22X1 U139 ( .IN1(mem[33]), .IN2(n144), .IN3(mem[49]), .IN4(n145), .Q(n104)
         );
  AO221X1 U140 ( .IN1(mem[17]), .IN2(n139), .IN3(mem[1]), .IN4(n142), .IN5(
        n104), .Q(n107) );
  AO22X1 U141 ( .IN1(mem[41]), .IN2(n143), .IN3(mem[57]), .IN4(n145), .Q(n105)
         );
  AO221X1 U142 ( .IN1(mem[25]), .IN2(n94), .IN3(mem[9]), .IN4(n142), .IN5(n105), .Q(n106) );
  AO22X1 U143 ( .IN1(n107), .IN2(n92), .IN3(n106), .IN4(n93), .Q(rdata[1]) );
  AO22X1 U144 ( .IN1(mem[34]), .IN2(n143), .IN3(mem[50]), .IN4(n145), .Q(n108)
         );
  AO221X1 U145 ( .IN1(mem[18]), .IN2(n139), .IN3(mem[2]), .IN4(n142), .IN5(
        n108), .Q(n111) );
  AO22X1 U146 ( .IN1(mem[42]), .IN2(n97), .IN3(mem[58]), .IN4(n99), .Q(n109)
         );
  AO221X1 U147 ( .IN1(mem[26]), .IN2(n95), .IN3(mem[10]), .IN4(n142), .IN5(
        n109), .Q(n110) );
  AO22X1 U148 ( .IN1(n111), .IN2(raddr[0]), .IN3(n110), .IN4(n93), .Q(rdata[2]) );
  AO22X1 U149 ( .IN1(mem[35]), .IN2(n144), .IN3(mem[51]), .IN4(n146), .Q(n112)
         );
  AO221X1 U150 ( .IN1(mem[19]), .IN2(n139), .IN3(mem[3]), .IN4(n140), .IN5(
        n112), .Q(n115) );
  AO22X1 U151 ( .IN1(mem[43]), .IN2(n96), .IN3(mem[59]), .IN4(n98), .Q(n113)
         );
  AO221X1 U152 ( .IN1(mem[27]), .IN2(n139), .IN3(mem[11]), .IN4(n141), .IN5(
        n113), .Q(n114) );
  AO22X1 U153 ( .IN1(n115), .IN2(n92), .IN3(n114), .IN4(n93), .Q(rdata[3]) );
  AO22X1 U154 ( .IN1(mem[36]), .IN2(n144), .IN3(mem[52]), .IN4(n146), .Q(n116)
         );
  AO221X1 U155 ( .IN1(mem[20]), .IN2(n95), .IN3(mem[4]), .IN4(n140), .IN5(n116), .Q(n119) );
  AO22X1 U156 ( .IN1(mem[44]), .IN2(n144), .IN3(mem[60]), .IN4(n146), .Q(n117)
         );
  AO221X1 U157 ( .IN1(mem[28]), .IN2(n138), .IN3(mem[12]), .IN4(n141), .IN5(
        n117), .Q(n118) );
  AO22X1 U158 ( .IN1(n119), .IN2(n92), .IN3(n118), .IN4(n93), .Q(rdata[4]) );
  AO22X1 U159 ( .IN1(mem[37]), .IN2(n97), .IN3(mem[53]), .IN4(n99), .Q(n120)
         );
  AO221X1 U160 ( .IN1(mem[21]), .IN2(n138), .IN3(mem[5]), .IN4(n140), .IN5(
        n120), .Q(n123) );
  AO22X1 U161 ( .IN1(mem[45]), .IN2(n97), .IN3(mem[61]), .IN4(n99), .Q(n121)
         );
  AO221X1 U162 ( .IN1(mem[29]), .IN2(n94), .IN3(mem[13]), .IN4(n141), .IN5(
        n121), .Q(n122) );
  AO22X1 U163 ( .IN1(n123), .IN2(n92), .IN3(n122), .IN4(n93), .Q(rdata[5]) );
  AO22X1 U164 ( .IN1(mem[38]), .IN2(n96), .IN3(mem[54]), .IN4(n98), .Q(n124)
         );
  AO221X1 U165 ( .IN1(mem[22]), .IN2(n94), .IN3(mem[6]), .IN4(n140), .IN5(n124), .Q(n127) );
  AO22X1 U166 ( .IN1(mem[46]), .IN2(n96), .IN3(mem[62]), .IN4(n98), .Q(n125)
         );
  AO221X1 U167 ( .IN1(mem[30]), .IN2(n95), .IN3(mem[14]), .IN4(n141), .IN5(
        n125), .Q(n126) );
  AO22X1 U168 ( .IN1(n127), .IN2(n92), .IN3(n126), .IN4(n93), .Q(rdata[6]) );
  AO22X1 U169 ( .IN1(mem[39]), .IN2(n143), .IN3(mem[55]), .IN4(n146), .Q(n128)
         );
  AO221X1 U170 ( .IN1(mem[23]), .IN2(n95), .IN3(mem[7]), .IN4(n140), .IN5(n128), .Q(n135) );
  AO22X1 U171 ( .IN1(mem[47]), .IN2(n143), .IN3(mem[63]), .IN4(n145), .Q(n131)
         );
  AO221X1 U172 ( .IN1(mem[31]), .IN2(n138), .IN3(mem[15]), .IN4(n141), .IN5(
        n131), .Q(n134) );
  AO22X1 U173 ( .IN1(n135), .IN2(n92), .IN3(n134), .IN4(n93), .Q(rdata[7]) );
  INVX0 U174 ( .INP(raddr[2]), .ZN(n136) );
  INVX0 U175 ( .INP(n136), .ZN(n137) );
  NOR2X0 U176 ( .IN1(n136), .IN2(n5), .QN(n132) );
  NOR2X0 U177 ( .IN1(n5), .IN2(n137), .QN(n130) );
  INVX0 U178 ( .INP(n164), .ZN(n163) );
  INVX0 U179 ( .INP(waddr[0]), .ZN(n164) );
  INVX0 U180 ( .INP(waddr[1]), .ZN(n165) );
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
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246;
  wire   [63:0] mem;

  DFFX1 mem_reg_0__7_ ( .D(n173), .CLK(clk), .Q(mem[63]) );
  DFFX1 mem_reg_0__6_ ( .D(n174), .CLK(clk), .Q(mem[62]) );
  DFFX1 mem_reg_0__5_ ( .D(n175), .CLK(clk), .Q(mem[61]) );
  DFFX1 mem_reg_0__4_ ( .D(n176), .CLK(clk), .Q(mem[60]) );
  DFFX1 mem_reg_0__3_ ( .D(n177), .CLK(clk), .Q(mem[59]) );
  DFFX1 mem_reg_0__2_ ( .D(n178), .CLK(clk), .Q(mem[58]) );
  DFFX1 mem_reg_0__1_ ( .D(n179), .CLK(clk), .Q(mem[57]) );
  DFFX1 mem_reg_0__0_ ( .D(n180), .CLK(clk), .Q(mem[56]) );
  DFFX1 mem_reg_1__7_ ( .D(n181), .CLK(clk), .Q(mem[55]) );
  DFFX1 mem_reg_1__6_ ( .D(n182), .CLK(clk), .Q(mem[54]) );
  DFFX1 mem_reg_1__5_ ( .D(n183), .CLK(clk), .Q(mem[53]) );
  DFFX1 mem_reg_1__4_ ( .D(n184), .CLK(clk), .Q(mem[52]) );
  DFFX1 mem_reg_1__3_ ( .D(n185), .CLK(clk), .Q(mem[51]) );
  DFFX1 mem_reg_1__2_ ( .D(n186), .CLK(clk), .Q(mem[50]) );
  DFFX1 mem_reg_1__1_ ( .D(n187), .CLK(clk), .Q(mem[49]) );
  DFFX1 mem_reg_1__0_ ( .D(n188), .CLK(clk), .Q(mem[48]) );
  DFFX1 mem_reg_2__7_ ( .D(n189), .CLK(clk), .Q(mem[47]) );
  DFFX1 mem_reg_2__6_ ( .D(n190), .CLK(clk), .Q(mem[46]) );
  DFFX1 mem_reg_2__5_ ( .D(n191), .CLK(clk), .Q(mem[45]) );
  DFFX1 mem_reg_2__4_ ( .D(n192), .CLK(clk), .Q(mem[44]) );
  DFFX1 mem_reg_2__3_ ( .D(n193), .CLK(clk), .Q(mem[43]) );
  DFFX1 mem_reg_2__2_ ( .D(n194), .CLK(clk), .Q(mem[42]) );
  DFFX1 mem_reg_2__1_ ( .D(n195), .CLK(clk), .Q(mem[41]) );
  DFFX1 mem_reg_2__0_ ( .D(n196), .CLK(clk), .Q(mem[40]) );
  DFFX1 mem_reg_3__7_ ( .D(n197), .CLK(clk), .Q(mem[39]) );
  DFFX1 mem_reg_3__6_ ( .D(n198), .CLK(clk), .Q(mem[38]) );
  DFFX1 mem_reg_3__5_ ( .D(n199), .CLK(clk), .Q(mem[37]) );
  DFFX1 mem_reg_3__4_ ( .D(n200), .CLK(clk), .Q(mem[36]) );
  DFFX1 mem_reg_3__3_ ( .D(n201), .CLK(clk), .Q(mem[35]) );
  DFFX1 mem_reg_3__2_ ( .D(n202), .CLK(clk), .Q(mem[34]) );
  DFFX1 mem_reg_3__1_ ( .D(n203), .CLK(clk), .Q(mem[33]) );
  DFFX1 mem_reg_3__0_ ( .D(n204), .CLK(clk), .Q(mem[32]) );
  DFFX1 mem_reg_4__7_ ( .D(n205), .CLK(clk), .Q(mem[31]) );
  DFFX1 mem_reg_4__6_ ( .D(n206), .CLK(clk), .Q(mem[30]) );
  DFFX1 mem_reg_4__5_ ( .D(n207), .CLK(clk), .Q(mem[29]) );
  DFFX1 mem_reg_4__4_ ( .D(n208), .CLK(clk), .Q(mem[28]) );
  DFFX1 mem_reg_4__3_ ( .D(n209), .CLK(clk), .Q(mem[27]) );
  DFFX1 mem_reg_4__2_ ( .D(n210), .CLK(clk), .Q(mem[26]) );
  DFFX1 mem_reg_4__1_ ( .D(n211), .CLK(clk), .Q(mem[25]) );
  DFFX1 mem_reg_4__0_ ( .D(n212), .CLK(clk), .Q(mem[24]) );
  DFFX1 mem_reg_5__7_ ( .D(n213), .CLK(clk), .Q(mem[23]) );
  DFFX1 mem_reg_5__6_ ( .D(n214), .CLK(clk), .Q(mem[22]) );
  DFFX1 mem_reg_5__5_ ( .D(n215), .CLK(clk), .Q(mem[21]) );
  DFFX1 mem_reg_5__4_ ( .D(n216), .CLK(clk), .Q(mem[20]) );
  DFFX1 mem_reg_5__3_ ( .D(n217), .CLK(clk), .Q(mem[19]) );
  DFFX1 mem_reg_5__2_ ( .D(n218), .CLK(clk), .Q(mem[18]) );
  DFFX1 mem_reg_5__1_ ( .D(n219), .CLK(clk), .Q(mem[17]) );
  DFFX1 mem_reg_5__0_ ( .D(n220), .CLK(clk), .Q(mem[16]) );
  DFFX1 mem_reg_6__7_ ( .D(n221), .CLK(clk), .Q(mem[15]) );
  DFFX1 mem_reg_6__6_ ( .D(n222), .CLK(clk), .Q(mem[14]) );
  DFFX1 mem_reg_6__5_ ( .D(n223), .CLK(clk), .Q(mem[13]) );
  DFFX1 mem_reg_6__4_ ( .D(n224), .CLK(clk), .Q(mem[12]) );
  DFFX1 mem_reg_6__3_ ( .D(n225), .CLK(clk), .Q(mem[11]) );
  DFFX1 mem_reg_6__2_ ( .D(n226), .CLK(clk), .Q(mem[10]) );
  DFFX1 mem_reg_6__1_ ( .D(n227), .CLK(clk), .Q(mem[9]) );
  DFFX1 mem_reg_6__0_ ( .D(n228), .CLK(clk), .Q(mem[8]) );
  DFFX1 mem_reg_7__7_ ( .D(n229), .CLK(clk), .Q(mem[7]) );
  DFFX1 mem_reg_7__6_ ( .D(n230), .CLK(clk), .Q(mem[6]) );
  DFFX1 mem_reg_7__5_ ( .D(n231), .CLK(clk), .Q(mem[5]) );
  DFFX1 mem_reg_7__4_ ( .D(n232), .CLK(clk), .Q(mem[4]) );
  DFFX1 mem_reg_7__3_ ( .D(n233), .CLK(clk), .Q(mem[3]) );
  DFFX1 mem_reg_7__2_ ( .D(n234), .CLK(clk), .Q(mem[2]) );
  DFFX1 mem_reg_7__1_ ( .D(n235), .CLK(clk), .Q(mem[1]) );
  DFFX1 mem_reg_7__0_ ( .D(n236), .CLK(clk), .Q(mem[0]) );
  AO22X1 U14 ( .IN1(n89), .IN2(n172), .IN3(mem[0]), .IN4(n162), .Q(n236) );
  AO22X1 U15 ( .IN1(n88), .IN2(n172), .IN3(mem[1]), .IN4(n162), .Q(n235) );
  AO22X1 U16 ( .IN1(n87), .IN2(n172), .IN3(mem[2]), .IN4(n162), .Q(n234) );
  AO22X1 U17 ( .IN1(n86), .IN2(n172), .IN3(mem[3]), .IN4(n162), .Q(n233) );
  AO22X1 U18 ( .IN1(n11), .IN2(n172), .IN3(mem[4]), .IN4(n162), .Q(n232) );
  AO22X1 U19 ( .IN1(n10), .IN2(n172), .IN3(mem[5]), .IN4(n161), .Q(n231) );
  AO22X1 U20 ( .IN1(n9), .IN2(n172), .IN3(mem[6]), .IN4(n161), .Q(n230) );
  AO22X1 U21 ( .IN1(n8), .IN2(n172), .IN3(mem[7]), .IN4(n161), .Q(n229) );
  AO22X1 U23 ( .IN1(n171), .IN2(wdata[0]), .IN3(mem[8]), .IN4(n160), .Q(n228)
         );
  AO22X1 U24 ( .IN1(n171), .IN2(wdata[1]), .IN3(mem[9]), .IN4(n160), .Q(n227)
         );
  AO22X1 U25 ( .IN1(n171), .IN2(wdata[2]), .IN3(mem[10]), .IN4(n160), .Q(n226)
         );
  AO22X1 U26 ( .IN1(n171), .IN2(wdata[3]), .IN3(mem[11]), .IN4(n160), .Q(n225)
         );
  AO22X1 U27 ( .IN1(n171), .IN2(wdata[4]), .IN3(mem[12]), .IN4(n160), .Q(n224)
         );
  AO22X1 U29 ( .IN1(n171), .IN2(n9), .IN3(mem[14]), .IN4(n159), .Q(n222) );
  AO22X1 U32 ( .IN1(n170), .IN2(n89), .IN3(mem[16]), .IN4(n158), .Q(n220) );
  AO22X1 U33 ( .IN1(n170), .IN2(n88), .IN3(mem[17]), .IN4(n158), .Q(n219) );
  AO22X1 U34 ( .IN1(n170), .IN2(n87), .IN3(mem[18]), .IN4(n158), .Q(n218) );
  AO22X1 U35 ( .IN1(n170), .IN2(n86), .IN3(mem[19]), .IN4(n158), .Q(n217) );
  AO22X1 U36 ( .IN1(n170), .IN2(n11), .IN3(mem[20]), .IN4(n158), .Q(n216) );
  AO22X1 U37 ( .IN1(n170), .IN2(n10), .IN3(mem[21]), .IN4(n157), .Q(n215) );
  AO22X1 U38 ( .IN1(n170), .IN2(n9), .IN3(mem[22]), .IN4(n157), .Q(n214) );
  AO22X1 U39 ( .IN1(n170), .IN2(n8), .IN3(mem[23]), .IN4(n157), .Q(n213) );
  AO22X1 U41 ( .IN1(n169), .IN2(n89), .IN3(mem[24]), .IN4(n156), .Q(n212) );
  AO22X1 U42 ( .IN1(n169), .IN2(n88), .IN3(mem[25]), .IN4(n156), .Q(n211) );
  AO22X1 U43 ( .IN1(n169), .IN2(n87), .IN3(mem[26]), .IN4(n156), .Q(n210) );
  AO22X1 U44 ( .IN1(n169), .IN2(n86), .IN3(mem[27]), .IN4(n156), .Q(n209) );
  AO22X1 U45 ( .IN1(n169), .IN2(n11), .IN3(mem[28]), .IN4(n156), .Q(n208) );
  AO22X1 U46 ( .IN1(n169), .IN2(n10), .IN3(mem[29]), .IN4(n155), .Q(n207) );
  AO22X1 U47 ( .IN1(n169), .IN2(n9), .IN3(mem[30]), .IN4(n155), .Q(n206) );
  AO22X1 U48 ( .IN1(n169), .IN2(n8), .IN3(mem[31]), .IN4(n155), .Q(n205) );
  AND2X1 U50 ( .IN1(we), .IN2(waddr[2]), .Q(n245) );
  AO22X1 U51 ( .IN1(n146), .IN2(n89), .IN3(mem[32]), .IN4(n154), .Q(n204) );
  AO22X1 U52 ( .IN1(n146), .IN2(n88), .IN3(mem[33]), .IN4(n154), .Q(n203) );
  AO22X1 U53 ( .IN1(n146), .IN2(n87), .IN3(mem[34]), .IN4(n154), .Q(n202) );
  AO22X1 U54 ( .IN1(n146), .IN2(n86), .IN3(mem[35]), .IN4(n154), .Q(n201) );
  AO22X1 U55 ( .IN1(n146), .IN2(n11), .IN3(mem[36]), .IN4(n154), .Q(n200) );
  AO22X1 U56 ( .IN1(n146), .IN2(n10), .IN3(mem[37]), .IN4(n153), .Q(n199) );
  AO22X1 U57 ( .IN1(n146), .IN2(n9), .IN3(mem[38]), .IN4(n153), .Q(n198) );
  AO22X1 U58 ( .IN1(n146), .IN2(n8), .IN3(mem[39]), .IN4(n153), .Q(n197) );
  AO22X1 U60 ( .IN1(n145), .IN2(n89), .IN3(mem[40]), .IN4(n152), .Q(n196) );
  AO22X1 U61 ( .IN1(n145), .IN2(n88), .IN3(mem[41]), .IN4(n152), .Q(n195) );
  AO22X1 U62 ( .IN1(n145), .IN2(n87), .IN3(mem[42]), .IN4(n152), .Q(n194) );
  AO22X1 U63 ( .IN1(n145), .IN2(n86), .IN3(mem[43]), .IN4(n152), .Q(n193) );
  AO22X1 U64 ( .IN1(n145), .IN2(n11), .IN3(mem[44]), .IN4(n152), .Q(n192) );
  AO22X1 U65 ( .IN1(n145), .IN2(n10), .IN3(mem[45]), .IN4(n151), .Q(n191) );
  AO22X1 U66 ( .IN1(n145), .IN2(n9), .IN3(mem[46]), .IN4(n151), .Q(n190) );
  AO22X1 U67 ( .IN1(n145), .IN2(n8), .IN3(mem[47]), .IN4(n151), .Q(n189) );
  AO22X1 U69 ( .IN1(n167), .IN2(n89), .IN3(mem[48]), .IN4(n150), .Q(n188) );
  AO22X1 U70 ( .IN1(n167), .IN2(n88), .IN3(mem[49]), .IN4(n150), .Q(n187) );
  AO22X1 U71 ( .IN1(n167), .IN2(n87), .IN3(mem[50]), .IN4(n150), .Q(n186) );
  AO22X1 U72 ( .IN1(n167), .IN2(n86), .IN3(mem[51]), .IN4(n150), .Q(n185) );
  AO22X1 U73 ( .IN1(n167), .IN2(n11), .IN3(mem[52]), .IN4(n150), .Q(n184) );
  AO22X1 U74 ( .IN1(n167), .IN2(wdata[5]), .IN3(mem[53]), .IN4(n149), .Q(n183)
         );
  AO22X1 U75 ( .IN1(n167), .IN2(wdata[6]), .IN3(mem[54]), .IN4(n149), .Q(n182)
         );
  AO22X1 U76 ( .IN1(n167), .IN2(wdata[7]), .IN3(mem[55]), .IN4(n149), .Q(n181)
         );
  AO22X1 U78 ( .IN1(n166), .IN2(n89), .IN3(mem[56]), .IN4(n148), .Q(n180) );
  AO22X1 U79 ( .IN1(n166), .IN2(n88), .IN3(mem[57]), .IN4(n148), .Q(n179) );
  AO22X1 U80 ( .IN1(n166), .IN2(n87), .IN3(mem[58]), .IN4(n148), .Q(n178) );
  AO22X1 U81 ( .IN1(n166), .IN2(n86), .IN3(mem[59]), .IN4(n148), .Q(n177) );
  AO22X1 U82 ( .IN1(n166), .IN2(n11), .IN3(mem[60]), .IN4(n148), .Q(n176) );
  AO22X1 U83 ( .IN1(n166), .IN2(n10), .IN3(mem[61]), .IN4(n147), .Q(n175) );
  AO22X1 U84 ( .IN1(n166), .IN2(n9), .IN3(mem[62]), .IN4(n147), .Q(n174) );
  AO22X1 U85 ( .IN1(n166), .IN2(n8), .IN3(mem[63]), .IN4(n147), .Q(n173) );
  NAND2X0 U2 ( .IN1(n171), .IN2(n8), .QN(n1) );
  NAND2X0 U3 ( .IN1(mem[15]), .IN2(n159), .QN(n2) );
  NAND2X0 U4 ( .IN1(n1), .IN2(n2), .QN(n221) );
  NBUFFX4 U5 ( .INP(wdata[7]), .Z(n8) );
  NAND2X0 U6 ( .IN1(n171), .IN2(n10), .QN(n3) );
  NAND2X0 U7 ( .IN1(mem[13]), .IN2(n159), .QN(n4) );
  NAND2X0 U8 ( .IN1(n3), .IN2(n4), .QN(n223) );
  NBUFFX4 U9 ( .INP(wdata[5]), .Z(n10) );
  NBUFFX2 U10 ( .INP(n130), .Z(n138) );
  NBUFFX2 U11 ( .INP(n127), .Z(n142) );
  NBUFFX2 U12 ( .INP(n126), .Z(n96) );
  NBUFFX2 U13 ( .INP(n127), .Z(n94) );
  NBUFFX2 U22 ( .INP(n130), .Z(n92) );
  NBUFFX2 U28 ( .INP(n126), .Z(n95) );
  NBUFFX2 U30 ( .INP(n127), .Z(n93) );
  NBUFFX2 U31 ( .INP(n126), .Z(n144) );
  NBUFFX2 U40 ( .INP(n127), .Z(n141) );
  NBUFFX2 U49 ( .INP(n126), .Z(n143) );
  NBUFFX2 U59 ( .INP(n130), .Z(n91) );
  NAND3X0 U68 ( .IN1(n163), .IN2(n245), .IN3(waddr[1]), .QN(n246) );
  NAND3X0 U77 ( .IN1(n245), .IN2(n164), .IN3(n5), .QN(n244) );
  NBUFFX2 U86 ( .INP(n246), .Z(n162) );
  NBUFFX2 U87 ( .INP(n244), .Z(n160) );
  NBUFFX2 U88 ( .INP(n242), .Z(n156) );
  NBUFFX2 U89 ( .INP(n238), .Z(n150) );
  NAND3X0 U90 ( .IN1(n5), .IN2(n163), .IN3(n240), .QN(n241) );
  NAND3X0 U91 ( .IN1(n245), .IN2(n165), .IN3(n163), .QN(n243) );
  NAND3X0 U92 ( .IN1(n5), .IN2(n164), .IN3(n240), .QN(n239) );
  NAND3X0 U93 ( .IN1(n164), .IN2(n165), .IN3(n240), .QN(n237) );
  NAND3X0 U94 ( .IN1(n164), .IN2(n165), .IN3(n245), .QN(n242) );
  NBUFFX2 U95 ( .INP(waddr[1]), .Z(n5) );
  NBUFFX2 U96 ( .INP(raddr[0]), .Z(n6) );
  NOR2X0 U97 ( .IN1(n133), .IN2(n135), .QN(n7) );
  NBUFFX2 U98 ( .INP(wdata[6]), .Z(n9) );
  NBUFFX2 U99 ( .INP(wdata[4]), .Z(n11) );
  NBUFFX2 U100 ( .INP(wdata[3]), .Z(n86) );
  NBUFFX2 U101 ( .INP(wdata[2]), .Z(n87) );
  NBUFFX2 U102 ( .INP(wdata[1]), .Z(n88) );
  NBUFFX2 U103 ( .INP(wdata[0]), .Z(n89) );
  NBUFFX2 U104 ( .INP(n6), .Z(n90) );
  NBUFFX2 U105 ( .INP(n129), .Z(n139) );
  NBUFFX2 U106 ( .INP(n129), .Z(n140) );
  NBUFFX2 U107 ( .INP(n130), .Z(n137) );
  NAND3X0 U108 ( .IN1(n163), .IN2(n165), .IN3(n240), .QN(n238) );
  INVX0 U109 ( .INP(n161), .ZN(n172) );
  INVX0 U110 ( .INP(n159), .ZN(n171) );
  NBUFFX2 U111 ( .INP(n244), .Z(n159) );
  NBUFFX2 U112 ( .INP(n246), .Z(n161) );
  NBUFFX2 U113 ( .INP(n241), .Z(n154) );
  NBUFFX2 U114 ( .INP(n239), .Z(n152) );
  NBUFFX2 U115 ( .INP(n241), .Z(n153) );
  NBUFFX2 U116 ( .INP(n239), .Z(n151) );
  NBUFFX2 U117 ( .INP(n243), .Z(n158) );
  NBUFFX2 U118 ( .INP(n237), .Z(n148) );
  NOR2X0 U119 ( .IN1(n168), .IN2(waddr[2]), .QN(n240) );
  INVX0 U120 ( .INP(we), .ZN(n168) );
  NOR2X0 U121 ( .IN1(n133), .IN2(raddr[1]), .QN(n130) );
  NOR2X0 U122 ( .IN1(raddr[1]), .IN2(n134), .QN(n126) );
  AO22X1 U123 ( .IN1(mem[32]), .IN2(n93), .IN3(mem[48]), .IN4(n95), .Q(n97) );
  AO221X1 U124 ( .IN1(mem[16]), .IN2(n92), .IN3(mem[0]), .IN4(n7), .IN5(n97),
        .Q(n100) );
  AO22X1 U125 ( .IN1(mem[40]), .IN2(n94), .IN3(mem[56]), .IN4(n96), .Q(n98) );
  AO221X1 U126 ( .IN1(mem[24]), .IN2(n137), .IN3(mem[8]), .IN4(n7), .IN5(n98),
        .Q(n99) );
  AO22X1 U127 ( .IN1(n100), .IN2(n6), .IN3(n99), .IN4(n136), .Q(rdata[0]) );
  AO22X1 U128 ( .IN1(mem[33]), .IN2(n142), .IN3(mem[49]), .IN4(n143), .Q(n101)
         );
  AO221X1 U129 ( .IN1(mem[17]), .IN2(n138), .IN3(mem[1]), .IN4(n7), .IN5(n101),
        .Q(n104) );
  AO22X1 U130 ( .IN1(mem[41]), .IN2(n141), .IN3(mem[57]), .IN4(n143), .Q(n102)
         );
  AO221X1 U131 ( .IN1(mem[25]), .IN2(n91), .IN3(mem[9]), .IN4(n7), .IN5(n102),
        .Q(n103) );
  AO22X1 U132 ( .IN1(n104), .IN2(n90), .IN3(n103), .IN4(n136), .Q(rdata[1]) );
  AO22X1 U133 ( .IN1(mem[34]), .IN2(n141), .IN3(mem[50]), .IN4(n143), .Q(n105)
         );
  AO221X1 U134 ( .IN1(mem[18]), .IN2(n138), .IN3(mem[2]), .IN4(n7), .IN5(n105),
        .Q(n108) );
  AO22X1 U135 ( .IN1(mem[42]), .IN2(n94), .IN3(mem[58]), .IN4(n96), .Q(n106)
         );
  AO221X1 U136 ( .IN1(mem[26]), .IN2(n92), .IN3(mem[10]), .IN4(n7), .IN5(n106),
        .Q(n107) );
  AO22X1 U137 ( .IN1(n108), .IN2(n90), .IN3(n107), .IN4(n136), .Q(rdata[2]) );
  AO22X1 U138 ( .IN1(mem[35]), .IN2(n142), .IN3(mem[51]), .IN4(n144), .Q(n109)
         );
  AO221X1 U139 ( .IN1(mem[19]), .IN2(n138), .IN3(mem[3]), .IN4(n139), .IN5(
        n109), .Q(n112) );
  AO22X1 U140 ( .IN1(mem[43]), .IN2(n93), .IN3(mem[59]), .IN4(n95), .Q(n110)
         );
  AO221X1 U141 ( .IN1(mem[27]), .IN2(n138), .IN3(mem[11]), .IN4(n140), .IN5(
        n110), .Q(n111) );
  AO22X1 U142 ( .IN1(n112), .IN2(n90), .IN3(n111), .IN4(n136), .Q(rdata[3]) );
  AO22X1 U143 ( .IN1(mem[36]), .IN2(n142), .IN3(mem[52]), .IN4(n144), .Q(n113)
         );
  AO221X1 U144 ( .IN1(mem[20]), .IN2(n137), .IN3(mem[4]), .IN4(n139), .IN5(
        n113), .Q(n116) );
  AO22X1 U145 ( .IN1(mem[44]), .IN2(n142), .IN3(mem[60]), .IN4(n144), .Q(n114)
         );
  AO221X1 U146 ( .IN1(mem[28]), .IN2(n91), .IN3(mem[12]), .IN4(n140), .IN5(
        n114), .Q(n115) );
  AO22X1 U147 ( .IN1(n116), .IN2(n6), .IN3(n115), .IN4(n136), .Q(rdata[4]) );
  AO22X1 U148 ( .IN1(mem[37]), .IN2(n94), .IN3(mem[53]), .IN4(n96), .Q(n117)
         );
  AO221X1 U149 ( .IN1(mem[21]), .IN2(n91), .IN3(mem[5]), .IN4(n139), .IN5(n117), .Q(n120) );
  AO22X1 U150 ( .IN1(mem[45]), .IN2(n94), .IN3(mem[61]), .IN4(n96), .Q(n118)
         );
  AO221X1 U151 ( .IN1(mem[29]), .IN2(n92), .IN3(mem[13]), .IN4(n140), .IN5(
        n118), .Q(n119) );
  AO22X1 U152 ( .IN1(n120), .IN2(n90), .IN3(n119), .IN4(n136), .Q(rdata[5]) );
  AO22X1 U153 ( .IN1(mem[38]), .IN2(n93), .IN3(mem[54]), .IN4(n95), .Q(n121)
         );
  AO221X1 U154 ( .IN1(mem[22]), .IN2(n92), .IN3(mem[6]), .IN4(n139), .IN5(n121), .Q(n124) );
  AO22X1 U155 ( .IN1(mem[46]), .IN2(n93), .IN3(mem[62]), .IN4(n95), .Q(n122)
         );
  AO221X1 U156 ( .IN1(mem[30]), .IN2(n137), .IN3(mem[14]), .IN4(n140), .IN5(
        n122), .Q(n123) );
  AO22X1 U157 ( .IN1(n124), .IN2(n90), .IN3(n123), .IN4(n136), .Q(rdata[6]) );
  AO22X1 U158 ( .IN1(mem[39]), .IN2(n141), .IN3(mem[55]), .IN4(n144), .Q(n125)
         );
  AO221X1 U159 ( .IN1(mem[23]), .IN2(n137), .IN3(mem[7]), .IN4(n139), .IN5(
        n125), .Q(n132) );
  AO22X1 U160 ( .IN1(mem[47]), .IN2(n141), .IN3(mem[63]), .IN4(n143), .Q(n128)
         );
  AO221X1 U161 ( .IN1(mem[31]), .IN2(n91), .IN3(mem[15]), .IN4(n140), .IN5(
        n128), .Q(n131) );
  AO22X1 U162 ( .IN1(n132), .IN2(n90), .IN3(n131), .IN4(n136), .Q(rdata[7]) );
  INVX0 U163 ( .INP(raddr[2]), .ZN(n133) );
  INVX0 U164 ( .INP(n133), .ZN(n134) );
  INVX0 U165 ( .INP(raddr[1]), .ZN(n135) );
  INVX0 U166 ( .INP(raddr[0]), .ZN(n136) );
  NOR2X0 U167 ( .IN1(n133), .IN2(n135), .QN(n129) );
  NOR2X0 U168 ( .IN1(n135), .IN2(n134), .QN(n127) );
  INVX0 U169 ( .INP(n151), .ZN(n145) );
  INVX0 U170 ( .INP(n153), .ZN(n146) );
  NBUFFX2 U171 ( .INP(n237), .Z(n147) );
  INVX0 U172 ( .INP(n147), .ZN(n166) );
  NBUFFX2 U173 ( .INP(n238), .Z(n149) );
  INVX0 U174 ( .INP(n149), .ZN(n167) );
  NBUFFX2 U175 ( .INP(n242), .Z(n155) );
  INVX0 U176 ( .INP(n155), .ZN(n169) );
  NBUFFX2 U177 ( .INP(n243), .Z(n157) );
  INVX0 U178 ( .INP(n157), .ZN(n170) );
  INVX0 U179 ( .INP(n164), .ZN(n163) );
  INVX0 U180 ( .INP(waddr[0]), .ZN(n164) );
  INVX0 U181 ( .INP(n5), .ZN(n165) );
endmodule


module payload_ram_bank8x8_1 ( clk, we, waddr, wdata, raddr, rdata );
  input [2:0] waddr;
  input [7:0] wdata;
  input [2:0] raddr;
  output [7:0] rdata;
  input clk, we;
  wire   n1, n2, n5, n6, n7, n8, n9, n10, n11, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203,
         n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260;
  wire   [63:0] mem;

  DFFX1 mem_reg_0__7_ ( .D(n187), .CLK(clk), .Q(mem[63]) );
  DFFX1 mem_reg_0__6_ ( .D(n188), .CLK(clk), .Q(mem[62]) );
  DFFX1 mem_reg_0__5_ ( .D(n189), .CLK(clk), .Q(mem[61]) );
  DFFX1 mem_reg_0__4_ ( .D(n190), .CLK(clk), .Q(mem[60]) );
  DFFX1 mem_reg_0__3_ ( .D(n191), .CLK(clk), .Q(mem[59]) );
  DFFX1 mem_reg_0__2_ ( .D(n192), .CLK(clk), .Q(mem[58]) );
  DFFX1 mem_reg_0__1_ ( .D(n193), .CLK(clk), .Q(mem[57]) );
  DFFX1 mem_reg_0__0_ ( .D(n194), .CLK(clk), .Q(mem[56]) );
  DFFX1 mem_reg_1__7_ ( .D(n195), .CLK(clk), .Q(mem[55]) );
  DFFX1 mem_reg_1__6_ ( .D(n196), .CLK(clk), .Q(mem[54]) );
  DFFX1 mem_reg_1__5_ ( .D(n197), .CLK(clk), .Q(mem[53]) );
  DFFX1 mem_reg_1__4_ ( .D(n198), .CLK(clk), .Q(mem[52]) );
  DFFX1 mem_reg_1__3_ ( .D(n199), .CLK(clk), .Q(mem[51]) );
  DFFX1 mem_reg_1__2_ ( .D(n200), .CLK(clk), .Q(mem[50]) );
  DFFX1 mem_reg_1__1_ ( .D(n201), .CLK(clk), .Q(mem[49]) );
  DFFX1 mem_reg_1__0_ ( .D(n202), .CLK(clk), .Q(mem[48]) );
  DFFX1 mem_reg_2__7_ ( .D(n203), .CLK(clk), .Q(mem[47]) );
  DFFX1 mem_reg_2__6_ ( .D(n204), .CLK(clk), .Q(mem[46]) );
  DFFX1 mem_reg_2__5_ ( .D(n205), .CLK(clk), .Q(mem[45]) );
  DFFX1 mem_reg_2__4_ ( .D(n206), .CLK(clk), .Q(mem[44]) );
  DFFX1 mem_reg_2__3_ ( .D(n207), .CLK(clk), .Q(mem[43]) );
  DFFX1 mem_reg_2__2_ ( .D(n208), .CLK(clk), .Q(mem[42]) );
  DFFX1 mem_reg_2__1_ ( .D(n209), .CLK(clk), .Q(mem[41]) );
  DFFX1 mem_reg_2__0_ ( .D(n210), .CLK(clk), .Q(mem[40]) );
  DFFX1 mem_reg_3__7_ ( .D(n211), .CLK(clk), .Q(mem[39]) );
  DFFX1 mem_reg_3__6_ ( .D(n212), .CLK(clk), .Q(mem[38]) );
  DFFX1 mem_reg_3__5_ ( .D(n213), .CLK(clk), .Q(mem[37]) );
  DFFX1 mem_reg_3__4_ ( .D(n214), .CLK(clk), .Q(mem[36]) );
  DFFX1 mem_reg_3__3_ ( .D(n215), .CLK(clk), .Q(mem[35]) );
  DFFX1 mem_reg_3__2_ ( .D(n216), .CLK(clk), .Q(mem[34]) );
  DFFX1 mem_reg_3__1_ ( .D(n217), .CLK(clk), .Q(mem[33]) );
  DFFX1 mem_reg_3__0_ ( .D(n218), .CLK(clk), .Q(mem[32]) );
  DFFX1 mem_reg_4__7_ ( .D(n219), .CLK(clk), .Q(mem[31]) );
  DFFX1 mem_reg_4__6_ ( .D(n220), .CLK(clk), .Q(mem[30]) );
  DFFX1 mem_reg_4__5_ ( .D(n221), .CLK(clk), .Q(mem[29]) );
  DFFX1 mem_reg_4__4_ ( .D(n222), .CLK(clk), .Q(mem[28]) );
  DFFX1 mem_reg_4__3_ ( .D(n223), .CLK(clk), .Q(mem[27]) );
  DFFX1 mem_reg_4__2_ ( .D(n224), .CLK(clk), .Q(mem[26]) );
  DFFX1 mem_reg_4__1_ ( .D(n225), .CLK(clk), .Q(mem[25]) );
  DFFX1 mem_reg_4__0_ ( .D(n226), .CLK(clk), .Q(mem[24]) );
  DFFX1 mem_reg_5__7_ ( .D(n227), .CLK(clk), .Q(mem[23]) );
  DFFX1 mem_reg_5__6_ ( .D(n228), .CLK(clk), .Q(mem[22]) );
  DFFX1 mem_reg_5__5_ ( .D(n229), .CLK(clk), .Q(mem[21]) );
  DFFX1 mem_reg_5__4_ ( .D(n230), .CLK(clk), .Q(mem[20]) );
  DFFX1 mem_reg_5__3_ ( .D(n231), .CLK(clk), .Q(mem[19]) );
  DFFX1 mem_reg_5__2_ ( .D(n232), .CLK(clk), .Q(mem[18]) );
  DFFX1 mem_reg_5__1_ ( .D(n233), .CLK(clk), .Q(mem[17]) );
  DFFX1 mem_reg_5__0_ ( .D(n234), .CLK(clk), .Q(mem[16]) );
  DFFX1 mem_reg_6__7_ ( .D(n235), .CLK(clk), .Q(mem[15]) );
  DFFX1 mem_reg_6__6_ ( .D(n236), .CLK(clk), .Q(mem[14]) );
  DFFX1 mem_reg_6__5_ ( .D(n237), .CLK(clk), .Q(mem[13]) );
  DFFX1 mem_reg_6__4_ ( .D(n238), .CLK(clk), .Q(mem[12]) );
  DFFX1 mem_reg_6__3_ ( .D(n239), .CLK(clk), .Q(mem[11]) );
  DFFX1 mem_reg_6__2_ ( .D(n240), .CLK(clk), .Q(mem[10]) );
  DFFX1 mem_reg_6__1_ ( .D(n241), .CLK(clk), .Q(mem[9]) );
  DFFX1 mem_reg_6__0_ ( .D(n242), .CLK(clk), .Q(mem[8]) );
  DFFX1 mem_reg_7__7_ ( .D(n243), .CLK(clk), .Q(mem[7]) );
  DFFX1 mem_reg_7__6_ ( .D(n244), .CLK(clk), .Q(mem[6]) );
  DFFX1 mem_reg_7__5_ ( .D(n245), .CLK(clk), .Q(mem[5]) );
  DFFX1 mem_reg_7__4_ ( .D(n246), .CLK(clk), .Q(mem[4]) );
  DFFX1 mem_reg_7__3_ ( .D(n247), .CLK(clk), .Q(mem[3]) );
  DFFX1 mem_reg_7__2_ ( .D(n248), .CLK(clk), .Q(mem[2]) );
  DFFX1 mem_reg_7__1_ ( .D(n249), .CLK(clk), .Q(mem[1]) );
  DFFX1 mem_reg_7__0_ ( .D(n250), .CLK(clk), .Q(mem[0]) );
  AO22X1 U14 ( .IN1(n97), .IN2(n166), .IN3(mem[0]), .IN4(n181), .Q(n250) );
  AO22X1 U15 ( .IN1(n95), .IN2(n166), .IN3(mem[1]), .IN4(n181), .Q(n249) );
  AO22X1 U16 ( .IN1(n93), .IN2(n166), .IN3(mem[2]), .IN4(n181), .Q(n248) );
  AO22X1 U17 ( .IN1(n91), .IN2(n166), .IN3(mem[3]), .IN4(n181), .Q(n247) );
  AO22X1 U18 ( .IN1(n89), .IN2(n167), .IN3(mem[4]), .IN4(n181), .Q(n246) );
  AO22X1 U19 ( .IN1(wdata[5]), .IN2(n167), .IN3(mem[5]), .IN4(n180), .Q(n245)
         );
  AO22X1 U20 ( .IN1(wdata[6]), .IN2(n167), .IN3(mem[6]), .IN4(n180), .Q(n244)
         );
  AO22X1 U21 ( .IN1(wdata[7]), .IN2(n167), .IN3(mem[7]), .IN4(n180), .Q(n243)
         );
  AO22X1 U23 ( .IN1(n160), .IN2(n97), .IN3(mem[8]), .IN4(n179), .Q(n242) );
  AO22X1 U24 ( .IN1(n160), .IN2(n95), .IN3(mem[9]), .IN4(n179), .Q(n241) );
  AO22X1 U25 ( .IN1(n160), .IN2(n93), .IN3(mem[10]), .IN4(n179), .Q(n240) );
  AO22X1 U26 ( .IN1(n160), .IN2(n91), .IN3(mem[11]), .IN4(n179), .Q(n239) );
  AO22X1 U27 ( .IN1(n161), .IN2(n89), .IN3(mem[12]), .IN4(n179), .Q(n238) );
  AO22X1 U28 ( .IN1(n161), .IN2(n87), .IN3(mem[13]), .IN4(n178), .Q(n237) );
  AO22X1 U29 ( .IN1(n161), .IN2(n86), .IN3(mem[14]), .IN4(n178), .Q(n236) );
  AO22X1 U30 ( .IN1(n161), .IN2(n11), .IN3(mem[15]), .IN4(n178), .Q(n235) );
  AO22X1 U32 ( .IN1(n186), .IN2(n97), .IN3(mem[16]), .IN4(n103), .Q(n234) );
  AO22X1 U33 ( .IN1(n186), .IN2(n95), .IN3(mem[17]), .IN4(n103), .Q(n233) );
  AO22X1 U34 ( .IN1(n186), .IN2(n93), .IN3(mem[18]), .IN4(n103), .Q(n232) );
  AO22X1 U35 ( .IN1(n186), .IN2(n91), .IN3(mem[19]), .IN4(n103), .Q(n231) );
  AO22X1 U36 ( .IN1(n186), .IN2(n89), .IN3(mem[20]), .IN4(n257), .Q(n230) );
  AO22X1 U37 ( .IN1(n186), .IN2(wdata[5]), .IN3(mem[21]), .IN4(n103), .Q(n229)
         );
  AO22X1 U38 ( .IN1(n186), .IN2(wdata[6]), .IN3(mem[22]), .IN4(n103), .Q(n228)
         );
  AO22X1 U39 ( .IN1(n186), .IN2(wdata[7]), .IN3(mem[23]), .IN4(n103), .Q(n227)
         );
  AO22X1 U41 ( .IN1(n185), .IN2(n97), .IN3(mem[24]), .IN4(n177), .Q(n226) );
  AO22X1 U42 ( .IN1(n185), .IN2(n95), .IN3(mem[25]), .IN4(n177), .Q(n225) );
  AO22X1 U43 ( .IN1(n185), .IN2(n93), .IN3(mem[26]), .IN4(n177), .Q(n224) );
  AO22X1 U44 ( .IN1(n185), .IN2(n91), .IN3(mem[27]), .IN4(n177), .Q(n223) );
  AO22X1 U45 ( .IN1(n104), .IN2(n89), .IN3(mem[28]), .IN4(n177), .Q(n222) );
  AO22X1 U46 ( .IN1(n104), .IN2(n87), .IN3(mem[29]), .IN4(n176), .Q(n221) );
  AO22X1 U47 ( .IN1(n104), .IN2(n86), .IN3(mem[30]), .IN4(n176), .Q(n220) );
  AO22X1 U48 ( .IN1(n104), .IN2(n11), .IN3(mem[31]), .IN4(n176), .Q(n219) );
  AND2X1 U50 ( .IN1(we), .IN2(waddr[2]), .Q(n259) );
  AO22X1 U51 ( .IN1(n164), .IN2(n97), .IN3(mem[32]), .IN4(n175), .Q(n218) );
  AO22X1 U52 ( .IN1(n164), .IN2(n95), .IN3(mem[33]), .IN4(n175), .Q(n217) );
  AO22X1 U53 ( .IN1(n164), .IN2(n93), .IN3(mem[34]), .IN4(n175), .Q(n216) );
  AO22X1 U54 ( .IN1(n164), .IN2(n91), .IN3(mem[35]), .IN4(n175), .Q(n215) );
  AO22X1 U55 ( .IN1(n165), .IN2(n89), .IN3(mem[36]), .IN4(n175), .Q(n214) );
  AO22X1 U56 ( .IN1(n165), .IN2(n87), .IN3(mem[37]), .IN4(n174), .Q(n213) );
  AO22X1 U57 ( .IN1(n165), .IN2(n86), .IN3(mem[38]), .IN4(n174), .Q(n212) );
  AO22X1 U58 ( .IN1(n165), .IN2(n11), .IN3(mem[39]), .IN4(n174), .Q(n211) );
  AO22X1 U60 ( .IN1(n162), .IN2(n97), .IN3(mem[40]), .IN4(n173), .Q(n210) );
  AO22X1 U61 ( .IN1(n162), .IN2(n95), .IN3(mem[41]), .IN4(n173), .Q(n209) );
  AO22X1 U62 ( .IN1(n162), .IN2(n93), .IN3(mem[42]), .IN4(n173), .Q(n208) );
  AO22X1 U63 ( .IN1(n162), .IN2(n91), .IN3(mem[43]), .IN4(n173), .Q(n207) );
  AO22X1 U64 ( .IN1(n163), .IN2(n89), .IN3(mem[44]), .IN4(n173), .Q(n206) );
  AO22X1 U65 ( .IN1(n163), .IN2(n87), .IN3(mem[45]), .IN4(n172), .Q(n205) );
  AO22X1 U66 ( .IN1(n163), .IN2(n86), .IN3(mem[46]), .IN4(n172), .Q(n204) );
  AO22X1 U67 ( .IN1(n163), .IN2(n11), .IN3(mem[47]), .IN4(n172), .Q(n203) );
  AO22X1 U69 ( .IN1(n108), .IN2(n97), .IN3(mem[48]), .IN4(n171), .Q(n202) );
  AO22X1 U70 ( .IN1(n108), .IN2(n95), .IN3(mem[49]), .IN4(n171), .Q(n201) );
  AO22X1 U71 ( .IN1(n108), .IN2(n93), .IN3(mem[50]), .IN4(n171), .Q(n200) );
  AO22X1 U72 ( .IN1(n109), .IN2(n91), .IN3(mem[51]), .IN4(n171), .Q(n199) );
  AO22X1 U73 ( .IN1(n109), .IN2(n89), .IN3(mem[52]), .IN4(n171), .Q(n198) );
  AO22X1 U74 ( .IN1(n109), .IN2(n87), .IN3(mem[53]), .IN4(n170), .Q(n197) );
  AO22X1 U75 ( .IN1(n108), .IN2(n86), .IN3(mem[54]), .IN4(n170), .Q(n196) );
  AO22X1 U76 ( .IN1(n109), .IN2(n11), .IN3(mem[55]), .IN4(n170), .Q(n195) );
  AO22X1 U78 ( .IN1(n105), .IN2(n97), .IN3(mem[56]), .IN4(n169), .Q(n194) );
  AO22X1 U79 ( .IN1(n105), .IN2(n95), .IN3(mem[57]), .IN4(n169), .Q(n193) );
  AO22X1 U80 ( .IN1(n105), .IN2(n93), .IN3(mem[58]), .IN4(n169), .Q(n192) );
  AO22X1 U81 ( .IN1(n106), .IN2(n91), .IN3(mem[59]), .IN4(n169), .Q(n191) );
  AO22X1 U82 ( .IN1(n106), .IN2(n89), .IN3(mem[60]), .IN4(n169), .Q(n190) );
  AO22X1 U83 ( .IN1(n106), .IN2(n87), .IN3(mem[61]), .IN4(n168), .Q(n189) );
  AO22X1 U84 ( .IN1(n105), .IN2(n86), .IN3(mem[62]), .IN4(n168), .Q(n188) );
  AO22X1 U85 ( .IN1(n106), .IN2(n11), .IN3(mem[63]), .IN4(n168), .Q(n187) );
  DELLN1X2 U2 ( .INP(n257), .Z(n103) );
  NAND2X1 U3 ( .IN1(n182), .IN2(n259), .QN(n1) );
  NAND2X0 U4 ( .IN1(n2), .IN2(n107), .QN(n257) );
  INVX2 U5 ( .INP(n1), .ZN(n2) );
  NBUFFX2 U6 ( .INP(n136), .Z(n150) );
  NBUFFX2 U7 ( .INP(n136), .Z(n157) );
  NBUFFX2 U8 ( .INP(n136), .Z(n151) );
  NBUFFX2 U9 ( .INP(n138), .Z(n148) );
  NBUFFX2 U10 ( .INP(n135), .Z(n152) );
  NBUFFX2 U11 ( .INP(n139), .Z(n110) );
  NBUFFX2 U12 ( .INP(n136), .Z(n156) );
  NBUFFX2 U13 ( .INP(n139), .Z(n145) );
  NBUFFX2 U22 ( .INP(n138), .Z(n149) );
  NBUFFX2 U31 ( .INP(n138), .Z(n147) );
  NBUFFX2 U40 ( .INP(n139), .Z(n146) );
  NBUFFX2 U49 ( .INP(n158), .Z(n107) );
  NBUFFX2 U59 ( .INP(n135), .Z(n155) );
  NBUFFX2 U68 ( .INP(n139), .Z(n111) );
  NBUFFX2 U77 ( .INP(n135), .Z(n153) );
  NBUFFX2 U86 ( .INP(n138), .Z(n10) );
  NAND3X0 U87 ( .IN1(n182), .IN2(n259), .IN3(n159), .QN(n260) );
  NAND3X0 U88 ( .IN1(n259), .IN2(n183), .IN3(n159), .QN(n258) );
  NAND3X0 U89 ( .IN1(n183), .IN2(n107), .IN3(n259), .QN(n256) );
  NAND3X0 U90 ( .IN1(n159), .IN2(n182), .IN3(n254), .QN(n255) );
  NAND3X0 U91 ( .IN1(n159), .IN2(n183), .IN3(n254), .QN(n253) );
  OAI22X1 U92 ( .IN1(n5), .IN2(n9), .IN3(n6), .IN4(n100), .QN(rdata[1]) );
  NBUFFX2 U93 ( .INP(n260), .Z(n181) );
  NBUFFX2 U94 ( .INP(n258), .Z(n179) );
  NBUFFX2 U95 ( .INP(n256), .Z(n177) );
  NBUFFX2 U96 ( .INP(n256), .Z(n176) );
  NBUFFX2 U97 ( .INP(n255), .Z(n175) );
  NBUFFX2 U98 ( .INP(n253), .Z(n173) );
  NBUFFX2 U99 ( .INP(n252), .Z(n171) );
  NBUFFX2 U100 ( .INP(n251), .Z(n169) );
  NBUFFX2 U101 ( .INP(n251), .Z(n168) );
  NBUFFX2 U102 ( .INP(n252), .Z(n170) );
  NBUFFX2 U103 ( .INP(n135), .Z(n154) );
  NBUFFX2 U104 ( .INP(n144), .Z(n9) );
  OAI22X1 U105 ( .IN1(n98), .IN2(n144), .IN3(n99), .IN4(n100), .QN(rdata[0])
         );
  OAI22X1 U106 ( .IN1(n7), .IN2(n9), .IN3(n8), .IN4(n100), .QN(rdata[4]) );
  AOI221X1 U107 ( .IN1(mem[17]), .IN2(n145), .IN3(mem[1]), .IN4(n148), .IN5(
        n114), .QN(n5) );
  AOI221X1 U108 ( .IN1(mem[25]), .IN2(n110), .IN3(mem[9]), .IN4(n147), .IN5(
        n115), .QN(n6) );
  AOI221X1 U109 ( .IN1(mem[28]), .IN2(n110), .IN3(mem[12]), .IN4(n10), .IN5(
        n125), .QN(n8) );
  NOR2X0 U110 ( .IN1(n142), .IN2(n101), .QN(n138) );
  AOI221X1 U111 ( .IN1(mem[20]), .IN2(n111), .IN3(mem[4]), .IN4(n10), .IN5(
        n124), .QN(n7) );
  AOI221X1 U112 ( .IN1(mem[16]), .IN2(n146), .IN3(mem[0]), .IN4(n149), .IN5(
        n112), .QN(n98) );
  NBUFFX2 U113 ( .INP(wdata[7]), .Z(n11) );
  NBUFFX2 U114 ( .INP(wdata[6]), .Z(n86) );
  NBUFFX2 U115 ( .INP(wdata[5]), .Z(n87) );
  INVX0 U116 ( .INP(wdata[4]), .ZN(n88) );
  INVX0 U117 ( .INP(n88), .ZN(n89) );
  INVX0 U118 ( .INP(wdata[3]), .ZN(n90) );
  INVX0 U119 ( .INP(n90), .ZN(n91) );
  INVX0 U120 ( .INP(wdata[2]), .ZN(n92) );
  INVX0 U121 ( .INP(n92), .ZN(n93) );
  INVX0 U122 ( .INP(wdata[1]), .ZN(n94) );
  INVX0 U123 ( .INP(n94), .ZN(n95) );
  INVX0 U124 ( .INP(wdata[0]), .ZN(n96) );
  INVX0 U125 ( .INP(n96), .ZN(n97) );
  AOI221X1 U126 ( .IN1(mem[24]), .IN2(n146), .IN3(mem[8]), .IN4(n147), .IN5(
        n113), .QN(n99) );
  INVX0 U127 ( .INP(n144), .ZN(n100) );
  INVX0 U128 ( .INP(raddr[1]), .ZN(n101) );
  INVX0 U129 ( .INP(n101), .ZN(n102) );
  INVX0 U130 ( .INP(n256), .ZN(n104) );
  INVX0 U131 ( .INP(n168), .ZN(n105) );
  INVX0 U132 ( .INP(n168), .ZN(n106) );
  INVX0 U133 ( .INP(n170), .ZN(n108) );
  INVX0 U134 ( .INP(n170), .ZN(n109) );
  INVX0 U135 ( .INP(n176), .ZN(n185) );
  INVX0 U136 ( .INP(n257), .ZN(n186) );
  NBUFFX2 U137 ( .INP(n260), .Z(n180) );
  NBUFFX2 U138 ( .INP(n258), .Z(n178) );
  NBUFFX2 U139 ( .INP(n255), .Z(n174) );
  NBUFFX2 U140 ( .INP(n253), .Z(n172) );
  NAND3X0 U141 ( .IN1(n182), .IN2(n107), .IN3(n254), .QN(n252) );
  NAND3X0 U142 ( .IN1(n183), .IN2(n107), .IN3(n254), .QN(n251) );
  NOR2X0 U143 ( .IN1(n184), .IN2(waddr[2]), .QN(n254) );
  INVX0 U144 ( .INP(we), .ZN(n184) );
  NOR2X0 U145 ( .IN1(n142), .IN2(n102), .QN(n139) );
  NOR2X0 U146 ( .IN1(n102), .IN2(n143), .QN(n135) );
  AO22X1 U147 ( .IN1(mem[32]), .IN2(n151), .IN3(mem[48]), .IN4(n154), .Q(n112)
         );
  AO22X1 U148 ( .IN1(mem[40]), .IN2(n150), .IN3(mem[56]), .IN4(n154), .Q(n113)
         );
  AO22X1 U149 ( .IN1(mem[33]), .IN2(n157), .IN3(mem[49]), .IN4(n154), .Q(n114)
         );
  AO22X1 U150 ( .IN1(mem[41]), .IN2(n156), .IN3(mem[57]), .IN4(n152), .Q(n115)
         );
  AO22X1 U151 ( .IN1(mem[34]), .IN2(n150), .IN3(mem[50]), .IN4(n154), .Q(n116)
         );
  AO221X1 U152 ( .IN1(mem[18]), .IN2(n146), .IN3(mem[2]), .IN4(n149), .IN5(
        n116), .Q(n119) );
  AO22X1 U153 ( .IN1(mem[42]), .IN2(n157), .IN3(mem[58]), .IN4(n153), .Q(n117)
         );
  AO221X1 U154 ( .IN1(mem[26]), .IN2(n110), .IN3(mem[10]), .IN4(n148), .IN5(
        n117), .Q(n118) );
  AO22X1 U155 ( .IN1(n119), .IN2(raddr[0]), .IN3(n118), .IN4(n144), .Q(
        rdata[2]) );
  AO221X1 U156 ( .IN1(mem[19]), .IN2(n146), .IN3(mem[3]), .IN4(n149), .IN5(
        n120), .Q(n123) );
  AO22X1 U157 ( .IN1(mem[43]), .IN2(n150), .IN3(mem[59]), .IN4(n155), .Q(n121)
         );
  AO221X1 U158 ( .IN1(mem[27]), .IN2(n111), .IN3(mem[11]), .IN4(n148), .IN5(
        n121), .Q(n122) );
  AO22X1 U159 ( .IN1(n123), .IN2(raddr[0]), .IN3(n122), .IN4(n144), .Q(
        rdata[3]) );
  AO22X1 U160 ( .IN1(mem[36]), .IN2(n151), .IN3(mem[52]), .IN4(n153), .Q(n124)
         );
  AO22X1 U161 ( .IN1(mem[44]), .IN2(n157), .IN3(mem[60]), .IN4(n155), .Q(n125)
         );
  AO22X1 U162 ( .IN1(mem[37]), .IN2(n156), .IN3(mem[53]), .IN4(n152), .Q(n126)
         );
  AO221X1 U163 ( .IN1(mem[21]), .IN2(n111), .IN3(mem[5]), .IN4(n148), .IN5(
        n126), .Q(n129) );
  AO22X1 U164 ( .IN1(mem[45]), .IN2(n151), .IN3(mem[61]), .IN4(n152), .Q(n127)
         );
  AO221X1 U165 ( .IN1(mem[29]), .IN2(n145), .IN3(mem[13]), .IN4(n147), .IN5(
        n127), .Q(n128) );
  AO22X1 U166 ( .IN1(n129), .IN2(raddr[0]), .IN3(n128), .IN4(n9), .Q(rdata[5])
         );
  AO22X1 U167 ( .IN1(mem[38]), .IN2(n157), .IN3(mem[54]), .IN4(n155), .Q(n130)
         );
  AO221X1 U168 ( .IN1(mem[22]), .IN2(n110), .IN3(mem[6]), .IN4(n10), .IN5(n130), .Q(n133) );
  AO22X1 U169 ( .IN1(mem[46]), .IN2(n156), .IN3(mem[62]), .IN4(n152), .Q(n131)
         );
  AO221X1 U170 ( .IN1(mem[30]), .IN2(n111), .IN3(mem[14]), .IN4(n147), .IN5(
        n131), .Q(n132) );
  AO22X1 U171 ( .IN1(n133), .IN2(raddr[0]), .IN3(n132), .IN4(n9), .Q(rdata[6])
         );
  AO22X1 U172 ( .IN1(mem[39]), .IN2(n150), .IN3(mem[55]), .IN4(n155), .Q(n134)
         );
  AO221X1 U173 ( .IN1(mem[23]), .IN2(n145), .IN3(mem[7]), .IN4(n10), .IN5(n134), .Q(n141) );
  AO22X1 U174 ( .IN1(mem[47]), .IN2(n156), .IN3(mem[63]), .IN4(n153), .Q(n137)
         );
  AO221X1 U175 ( .IN1(mem[31]), .IN2(n145), .IN3(mem[15]), .IN4(n149), .IN5(
        n137), .Q(n140) );
  AO22X1 U176 ( .IN1(raddr[0]), .IN2(n141), .IN3(n140), .IN4(n9), .Q(rdata[7])
         );
  INVX0 U177 ( .INP(raddr[2]), .ZN(n142) );
  INVX0 U178 ( .INP(n142), .ZN(n143) );
  INVX0 U179 ( .INP(raddr[0]), .ZN(n144) );
  NOR2X0 U180 ( .IN1(n101), .IN2(n143), .QN(n136) );
  AO22X1 U181 ( .IN1(mem[35]), .IN2(n151), .IN3(mem[51]), .IN4(n153), .Q(n120)
         );
  INVX0 U182 ( .INP(waddr[1]), .ZN(n158) );
  INVX0 U183 ( .INP(n158), .ZN(n159) );
  INVX0 U184 ( .INP(n178), .ZN(n160) );
  INVX0 U185 ( .INP(n178), .ZN(n161) );
  INVX0 U186 ( .INP(n172), .ZN(n162) );
  INVX0 U187 ( .INP(n172), .ZN(n163) );
  INVX0 U188 ( .INP(n174), .ZN(n164) );
  INVX0 U189 ( .INP(n174), .ZN(n165) );
  INVX0 U190 ( .INP(n180), .ZN(n166) );
  INVX0 U191 ( .INP(n180), .ZN(n167) );
  INVX0 U192 ( .INP(n183), .ZN(n182) );
  INVX0 U193 ( .INP(waddr[0]), .ZN(n183) );
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
         n247, n248, n249, n250;
  wire   [63:0] mem;

  DFFX1 mem_reg_0__7_ ( .D(n177), .CLK(clk), .Q(mem[63]) );
  DFFX1 mem_reg_0__6_ ( .D(n178), .CLK(clk), .Q(mem[62]) );
  DFFX1 mem_reg_0__5_ ( .D(n179), .CLK(clk), .Q(mem[61]) );
  DFFX1 mem_reg_0__4_ ( .D(n180), .CLK(clk), .Q(mem[60]) );
  DFFX1 mem_reg_0__3_ ( .D(n181), .CLK(clk), .Q(mem[59]) );
  DFFX1 mem_reg_0__2_ ( .D(n182), .CLK(clk), .Q(mem[58]) );
  DFFX1 mem_reg_0__1_ ( .D(n183), .CLK(clk), .Q(mem[57]) );
  DFFX1 mem_reg_0__0_ ( .D(n184), .CLK(clk), .Q(mem[56]) );
  DFFX1 mem_reg_1__7_ ( .D(n185), .CLK(clk), .Q(mem[55]) );
  DFFX1 mem_reg_1__6_ ( .D(n186), .CLK(clk), .Q(mem[54]) );
  DFFX1 mem_reg_1__5_ ( .D(n187), .CLK(clk), .Q(mem[53]) );
  DFFX1 mem_reg_1__4_ ( .D(n188), .CLK(clk), .Q(mem[52]) );
  DFFX1 mem_reg_1__3_ ( .D(n189), .CLK(clk), .Q(mem[51]) );
  DFFX1 mem_reg_1__2_ ( .D(n190), .CLK(clk), .Q(mem[50]) );
  DFFX1 mem_reg_1__1_ ( .D(n191), .CLK(clk), .Q(mem[49]) );
  DFFX1 mem_reg_1__0_ ( .D(n192), .CLK(clk), .Q(mem[48]) );
  DFFX1 mem_reg_2__7_ ( .D(n193), .CLK(clk), .Q(mem[47]) );
  DFFX1 mem_reg_2__6_ ( .D(n194), .CLK(clk), .Q(mem[46]) );
  DFFX1 mem_reg_2__5_ ( .D(n195), .CLK(clk), .Q(mem[45]) );
  DFFX1 mem_reg_2__4_ ( .D(n196), .CLK(clk), .Q(mem[44]) );
  DFFX1 mem_reg_2__3_ ( .D(n197), .CLK(clk), .Q(mem[43]) );
  DFFX1 mem_reg_2__2_ ( .D(n198), .CLK(clk), .Q(mem[42]) );
  DFFX1 mem_reg_2__1_ ( .D(n199), .CLK(clk), .Q(mem[41]) );
  DFFX1 mem_reg_2__0_ ( .D(n200), .CLK(clk), .Q(mem[40]) );
  DFFX1 mem_reg_3__7_ ( .D(n201), .CLK(clk), .Q(mem[39]) );
  DFFX1 mem_reg_3__6_ ( .D(n202), .CLK(clk), .Q(mem[38]) );
  DFFX1 mem_reg_3__5_ ( .D(n203), .CLK(clk), .Q(mem[37]) );
  DFFX1 mem_reg_3__4_ ( .D(n204), .CLK(clk), .Q(mem[36]) );
  DFFX1 mem_reg_3__3_ ( .D(n205), .CLK(clk), .Q(mem[35]) );
  DFFX1 mem_reg_3__2_ ( .D(n206), .CLK(clk), .Q(mem[34]) );
  DFFX1 mem_reg_3__1_ ( .D(n207), .CLK(clk), .Q(mem[33]) );
  DFFX1 mem_reg_3__0_ ( .D(n208), .CLK(clk), .Q(mem[32]) );
  DFFX1 mem_reg_4__7_ ( .D(n209), .CLK(clk), .Q(mem[31]) );
  DFFX1 mem_reg_4__6_ ( .D(n210), .CLK(clk), .Q(mem[30]) );
  DFFX1 mem_reg_4__5_ ( .D(n211), .CLK(clk), .Q(mem[29]) );
  DFFX1 mem_reg_4__4_ ( .D(n212), .CLK(clk), .Q(mem[28]) );
  DFFX1 mem_reg_4__3_ ( .D(n213), .CLK(clk), .Q(mem[27]) );
  DFFX1 mem_reg_4__2_ ( .D(n214), .CLK(clk), .Q(mem[26]) );
  DFFX1 mem_reg_4__1_ ( .D(n215), .CLK(clk), .Q(mem[25]) );
  DFFX1 mem_reg_4__0_ ( .D(n216), .CLK(clk), .Q(mem[24]) );
  DFFX1 mem_reg_5__7_ ( .D(n217), .CLK(clk), .Q(mem[23]) );
  DFFX1 mem_reg_5__6_ ( .D(n218), .CLK(clk), .Q(mem[22]) );
  DFFX1 mem_reg_5__5_ ( .D(n219), .CLK(clk), .Q(mem[21]) );
  DFFX1 mem_reg_5__4_ ( .D(n220), .CLK(clk), .Q(mem[20]) );
  DFFX1 mem_reg_5__3_ ( .D(n221), .CLK(clk), .Q(mem[19]) );
  DFFX1 mem_reg_5__2_ ( .D(n222), .CLK(clk), .Q(mem[18]) );
  DFFX1 mem_reg_5__1_ ( .D(n223), .CLK(clk), .Q(mem[17]) );
  DFFX1 mem_reg_5__0_ ( .D(n224), .CLK(clk), .Q(mem[16]) );
  DFFX1 mem_reg_6__7_ ( .D(n225), .CLK(clk), .Q(mem[15]) );
  DFFX1 mem_reg_6__6_ ( .D(n226), .CLK(clk), .Q(mem[14]) );
  DFFX1 mem_reg_6__5_ ( .D(n227), .CLK(clk), .Q(mem[13]) );
  DFFX1 mem_reg_6__4_ ( .D(n228), .CLK(clk), .Q(mem[12]) );
  DFFX1 mem_reg_6__3_ ( .D(n229), .CLK(clk), .Q(mem[11]) );
  DFFX1 mem_reg_6__2_ ( .D(n230), .CLK(clk), .Q(mem[10]) );
  DFFX1 mem_reg_6__1_ ( .D(n231), .CLK(clk), .Q(mem[9]) );
  DFFX1 mem_reg_6__0_ ( .D(n232), .CLK(clk), .Q(mem[8]) );
  DFFX1 mem_reg_7__7_ ( .D(n233), .CLK(clk), .Q(mem[7]) );
  DFFX1 mem_reg_7__6_ ( .D(n234), .CLK(clk), .Q(mem[6]) );
  DFFX1 mem_reg_7__5_ ( .D(n235), .CLK(clk), .Q(mem[5]) );
  DFFX1 mem_reg_7__4_ ( .D(n236), .CLK(clk), .Q(mem[4]) );
  DFFX1 mem_reg_7__3_ ( .D(n237), .CLK(clk), .Q(mem[3]) );
  DFFX1 mem_reg_7__2_ ( .D(n238), .CLK(clk), .Q(mem[2]) );
  DFFX1 mem_reg_7__1_ ( .D(n239), .CLK(clk), .Q(mem[1]) );
  DFFX1 mem_reg_7__0_ ( .D(n240), .CLK(clk), .Q(mem[0]) );
  AO22X1 U14 ( .IN1(wdata[0]), .IN2(n152), .IN3(mem[0]), .IN4(n169), .Q(n240)
         );
  AO22X1 U15 ( .IN1(wdata[1]), .IN2(n152), .IN3(mem[1]), .IN4(n169), .Q(n239)
         );
  AO22X1 U16 ( .IN1(wdata[2]), .IN2(n152), .IN3(mem[2]), .IN4(n169), .Q(n238)
         );
  AO22X1 U17 ( .IN1(wdata[3]), .IN2(n152), .IN3(mem[3]), .IN4(n169), .Q(n237)
         );
  AO22X1 U18 ( .IN1(wdata[4]), .IN2(n153), .IN3(mem[4]), .IN4(n169), .Q(n236)
         );
  AO22X1 U19 ( .IN1(wdata[5]), .IN2(n153), .IN3(mem[5]), .IN4(n168), .Q(n235)
         );
  AO22X1 U20 ( .IN1(wdata[6]), .IN2(n153), .IN3(mem[6]), .IN4(n168), .Q(n234)
         );
  AO22X1 U21 ( .IN1(wdata[7]), .IN2(n153), .IN3(mem[7]), .IN4(n168), .Q(n233)
         );
  AO22X1 U23 ( .IN1(n146), .IN2(wdata[0]), .IN3(mem[8]), .IN4(n167), .Q(n232)
         );
  AO22X1 U24 ( .IN1(n146), .IN2(wdata[1]), .IN3(mem[9]), .IN4(n167), .Q(n231)
         );
  AO22X1 U25 ( .IN1(n146), .IN2(wdata[2]), .IN3(mem[10]), .IN4(n167), .Q(n230)
         );
  AO22X1 U26 ( .IN1(n146), .IN2(wdata[3]), .IN3(mem[11]), .IN4(n167), .Q(n229)
         );
  AO22X1 U27 ( .IN1(n147), .IN2(wdata[4]), .IN3(mem[12]), .IN4(n167), .Q(n228)
         );
  AO22X1 U28 ( .IN1(n147), .IN2(wdata[5]), .IN3(mem[13]), .IN4(n166), .Q(n227)
         );
  AO22X1 U29 ( .IN1(n147), .IN2(wdata[6]), .IN3(mem[14]), .IN4(n166), .Q(n226)
         );
  AO22X1 U30 ( .IN1(n147), .IN2(wdata[7]), .IN3(mem[15]), .IN4(n166), .Q(n225)
         );
  AO22X1 U32 ( .IN1(n176), .IN2(n10), .IN3(mem[16]), .IN4(n165), .Q(n224) );
  AO22X1 U33 ( .IN1(n176), .IN2(n9), .IN3(mem[17]), .IN4(n165), .Q(n223) );
  AO22X1 U34 ( .IN1(n176), .IN2(n8), .IN3(mem[18]), .IN4(n165), .Q(n222) );
  AO22X1 U35 ( .IN1(n176), .IN2(n7), .IN3(mem[19]), .IN4(n165), .Q(n221) );
  AO22X1 U36 ( .IN1(n87), .IN2(n6), .IN3(mem[20]), .IN4(n165), .Q(n220) );
  AO22X1 U37 ( .IN1(n87), .IN2(n5), .IN3(mem[21]), .IN4(n164), .Q(n219) );
  AO22X1 U38 ( .IN1(n87), .IN2(n4), .IN3(mem[22]), .IN4(n164), .Q(n218) );
  AO22X1 U39 ( .IN1(n87), .IN2(n3), .IN3(mem[23]), .IN4(n164), .Q(n217) );
  AO22X1 U41 ( .IN1(n175), .IN2(n10), .IN3(mem[24]), .IN4(n163), .Q(n216) );
  AO22X1 U42 ( .IN1(n175), .IN2(n9), .IN3(mem[25]), .IN4(n163), .Q(n215) );
  AO22X1 U43 ( .IN1(n175), .IN2(n8), .IN3(mem[26]), .IN4(n163), .Q(n214) );
  AO22X1 U44 ( .IN1(n175), .IN2(n7), .IN3(mem[27]), .IN4(n163), .Q(n213) );
  AO22X1 U45 ( .IN1(n175), .IN2(n6), .IN3(mem[28]), .IN4(n163), .Q(n212) );
  AO22X1 U46 ( .IN1(n86), .IN2(n5), .IN3(mem[29]), .IN4(n162), .Q(n211) );
  AO22X1 U47 ( .IN1(n86), .IN2(n4), .IN3(mem[30]), .IN4(n162), .Q(n210) );
  AO22X1 U48 ( .IN1(n86), .IN2(n3), .IN3(mem[31]), .IN4(n162), .Q(n209) );
  AND2X1 U50 ( .IN1(we), .IN2(waddr[2]), .Q(n249) );
  AO22X1 U51 ( .IN1(n150), .IN2(n10), .IN3(mem[32]), .IN4(n161), .Q(n208) );
  AO22X1 U52 ( .IN1(n150), .IN2(n9), .IN3(mem[33]), .IN4(n161), .Q(n207) );
  AO22X1 U53 ( .IN1(n150), .IN2(n8), .IN3(mem[34]), .IN4(n161), .Q(n206) );
  AO22X1 U54 ( .IN1(n150), .IN2(n7), .IN3(mem[35]), .IN4(n161), .Q(n205) );
  AO22X1 U55 ( .IN1(n151), .IN2(n6), .IN3(mem[36]), .IN4(n161), .Q(n204) );
  AO22X1 U56 ( .IN1(n151), .IN2(n5), .IN3(mem[37]), .IN4(n160), .Q(n203) );
  AO22X1 U57 ( .IN1(n151), .IN2(n4), .IN3(mem[38]), .IN4(n160), .Q(n202) );
  AO22X1 U58 ( .IN1(n151), .IN2(n3), .IN3(mem[39]), .IN4(n160), .Q(n201) );
  AO22X1 U60 ( .IN1(n148), .IN2(n10), .IN3(mem[40]), .IN4(n159), .Q(n200) );
  AO22X1 U61 ( .IN1(n148), .IN2(n9), .IN3(mem[41]), .IN4(n159), .Q(n199) );
  AO22X1 U62 ( .IN1(n148), .IN2(n8), .IN3(mem[42]), .IN4(n159), .Q(n198) );
  AO22X1 U63 ( .IN1(n148), .IN2(n7), .IN3(mem[43]), .IN4(n159), .Q(n197) );
  AO22X1 U64 ( .IN1(n149), .IN2(n6), .IN3(mem[44]), .IN4(n159), .Q(n196) );
  AO22X1 U65 ( .IN1(n149), .IN2(n5), .IN3(mem[45]), .IN4(n158), .Q(n195) );
  AO22X1 U66 ( .IN1(n149), .IN2(n4), .IN3(mem[46]), .IN4(n158), .Q(n194) );
  AO22X1 U67 ( .IN1(n149), .IN2(n3), .IN3(mem[47]), .IN4(n158), .Q(n193) );
  AO22X1 U69 ( .IN1(n173), .IN2(n10), .IN3(mem[48]), .IN4(n157), .Q(n192) );
  AO22X1 U70 ( .IN1(n173), .IN2(n9), .IN3(mem[49]), .IN4(n157), .Q(n191) );
  AO22X1 U71 ( .IN1(n173), .IN2(n8), .IN3(mem[50]), .IN4(n157), .Q(n190) );
  AO22X1 U72 ( .IN1(n173), .IN2(n7), .IN3(mem[51]), .IN4(n157), .Q(n189) );
  AO22X1 U73 ( .IN1(n89), .IN2(n6), .IN3(mem[52]), .IN4(n157), .Q(n188) );
  AO22X1 U74 ( .IN1(n89), .IN2(n5), .IN3(mem[53]), .IN4(n156), .Q(n187) );
  AO22X1 U75 ( .IN1(n89), .IN2(n4), .IN3(mem[54]), .IN4(n156), .Q(n186) );
  AO22X1 U76 ( .IN1(n89), .IN2(n3), .IN3(mem[55]), .IN4(n156), .Q(n185) );
  AO22X1 U78 ( .IN1(n172), .IN2(n10), .IN3(mem[56]), .IN4(n155), .Q(n184) );
  AO22X1 U79 ( .IN1(n172), .IN2(n9), .IN3(mem[57]), .IN4(n155), .Q(n183) );
  AO22X1 U80 ( .IN1(n172), .IN2(n8), .IN3(mem[58]), .IN4(n155), .Q(n182) );
  AO22X1 U81 ( .IN1(n172), .IN2(n7), .IN3(mem[59]), .IN4(n155), .Q(n181) );
  AO22X1 U82 ( .IN1(n88), .IN2(n6), .IN3(mem[60]), .IN4(n155), .Q(n180) );
  AO22X1 U83 ( .IN1(n88), .IN2(n5), .IN3(mem[61]), .IN4(n154), .Q(n179) );
  AO22X1 U84 ( .IN1(n88), .IN2(n4), .IN3(mem[62]), .IN4(n154), .Q(n178) );
  AO22X1 U85 ( .IN1(n88), .IN2(n3), .IN3(mem[63]), .IN4(n154), .Q(n177) );
  NBUFFX2 U2 ( .INP(n120), .Z(n133) );
  NBUFFX2 U3 ( .INP(n119), .Z(n135) );
  AO22X1 U4 ( .IN1(mem[33]), .IN2(n133), .IN3(mem[49]), .IN4(n135), .Q(n94) );
  NBUFFX2 U5 ( .INP(n122), .Z(n132) );
  NBUFFX2 U6 ( .INP(n119), .Z(n140) );
  NBUFFX2 U7 ( .INP(n123), .Z(n144) );
  NBUFFX2 U8 ( .INP(n120), .Z(n143) );
  NBUFFX2 U9 ( .INP(n119), .Z(n141) );
  NBUFFX2 U10 ( .INP(n123), .Z(n130) );
  NBUFFX2 U11 ( .INP(n119), .Z(n136) );
  NBUFFX2 U12 ( .INP(n123), .Z(n145) );
  NBUFFX2 U13 ( .INP(n123), .Z(n129) );
  NBUFFX2 U22 ( .INP(n122), .Z(n131) );
  NAND3X0 U31 ( .IN1(n249), .IN2(n170), .IN3(waddr[1]), .QN(n248) );
  NAND3X1 U40 ( .IN1(n249), .IN2(n171), .IN3(waddr[0]), .QN(n247) );
  NAND3X0 U49 ( .IN1(n170), .IN2(n171), .IN3(n244), .QN(n241) );
  NBUFFX2 U59 ( .INP(n250), .Z(n169) );
  NBUFFX2 U68 ( .INP(n248), .Z(n167) );
  NBUFFX2 U77 ( .INP(n247), .Z(n165) );
  NBUFFX2 U86 ( .INP(n247), .Z(n164) );
  NBUFFX2 U87 ( .INP(n246), .Z(n163) );
  NBUFFX2 U88 ( .INP(n246), .Z(n162) );
  NBUFFX2 U89 ( .INP(n242), .Z(n157) );
  NBUFFX2 U90 ( .INP(n242), .Z(n156) );
  NBUFFX2 U91 ( .INP(n241), .Z(n155) );
  NBUFFX2 U92 ( .INP(n241), .Z(n154) );
  NBUFFX2 U93 ( .INP(n120), .Z(n134) );
  NAND3X0 U94 ( .IN1(waddr[1]), .IN2(n170), .IN3(n244), .QN(n243) );
  NBUFFX2 U95 ( .INP(n120), .Z(n142) );
  NAND3X0 U96 ( .IN1(waddr[1]), .IN2(waddr[0]), .IN3(n244), .QN(n245) );
  NAND3X1 U97 ( .IN1(waddr[0]), .IN2(n171), .IN3(n244), .QN(n242) );
  INVX0 U98 ( .INP(raddr[1]), .ZN(n1) );
  INVX0 U99 ( .INP(n1), .ZN(n2) );
  NBUFFX2 U100 ( .INP(wdata[7]), .Z(n3) );
  NBUFFX2 U101 ( .INP(wdata[6]), .Z(n4) );
  NBUFFX2 U102 ( .INP(wdata[5]), .Z(n5) );
  NBUFFX2 U103 ( .INP(wdata[4]), .Z(n6) );
  NBUFFX2 U104 ( .INP(wdata[3]), .Z(n7) );
  NBUFFX2 U105 ( .INP(wdata[2]), .Z(n8) );
  NBUFFX2 U106 ( .INP(wdata[1]), .Z(n9) );
  NBUFFX2 U107 ( .INP(wdata[0]), .Z(n10) );
  NBUFFX2 U108 ( .INP(raddr[0]), .Z(n11) );
  INVX0 U109 ( .INP(n163), .ZN(n86) );
  INVX0 U110 ( .INP(n247), .ZN(n87) );
  INVX0 U111 ( .INP(n241), .ZN(n88) );
  INVX0 U112 ( .INP(n242), .ZN(n89) );
  NAND3X1 U113 ( .IN1(waddr[0]), .IN2(n249), .IN3(waddr[1]), .QN(n250) );
  INVX0 U114 ( .INP(n162), .ZN(n175) );
  INVX0 U115 ( .INP(n164), .ZN(n176) );
  INVX0 U116 ( .INP(n156), .ZN(n173) );
  INVX0 U117 ( .INP(n154), .ZN(n172) );
  NBUFFX2 U118 ( .INP(n250), .Z(n168) );
  NBUFFX2 U119 ( .INP(n248), .Z(n166) );
  NBUFFX2 U120 ( .INP(n245), .Z(n161) );
  NBUFFX2 U121 ( .INP(n243), .Z(n159) );
  NBUFFX2 U122 ( .INP(n245), .Z(n160) );
  NBUFFX2 U123 ( .INP(n243), .Z(n158) );
  NAND3X0 U124 ( .IN1(n170), .IN2(n171), .IN3(n249), .QN(n246) );
  NOR2X0 U125 ( .IN1(n174), .IN2(waddr[2]), .QN(n244) );
  INVX0 U126 ( .INP(we), .ZN(n174) );
  NOR2X0 U127 ( .IN1(n126), .IN2(n2), .QN(n123) );
  NOR2X0 U128 ( .IN1(n2), .IN2(n127), .QN(n119) );
  AO22X1 U129 ( .IN1(mem[32]), .IN2(n143), .IN3(mem[48]), .IN4(n141), .Q(n90)
         );
  AO221X1 U130 ( .IN1(mem[16]), .IN2(n129), .IN3(mem[0]), .IN4(n132), .IN5(n90), .Q(n93) );
  AO22X1 U131 ( .IN1(mem[40]), .IN2(n134), .IN3(mem[56]), .IN4(n140), .Q(n91)
         );
  AO221X1 U132 ( .IN1(mem[24]), .IN2(n144), .IN3(mem[8]), .IN4(n132), .IN5(n91), .Q(n92) );
  AO22X1 U133 ( .IN1(n93), .IN2(raddr[0]), .IN3(n92), .IN4(n137), .Q(rdata[0])
         );
  AO221X1 U134 ( .IN1(mem[17]), .IN2(n145), .IN3(mem[1]), .IN4(n132), .IN5(n94), .Q(n97) );
  AO22X1 U135 ( .IN1(mem[41]), .IN2(n142), .IN3(mem[57]), .IN4(n140), .Q(n95)
         );
  AO221X1 U136 ( .IN1(mem[25]), .IN2(n145), .IN3(mem[9]), .IN4(n132), .IN5(n95), .Q(n96) );
  AO22X1 U137 ( .IN1(n97), .IN2(n11), .IN3(n96), .IN4(n128), .Q(rdata[1]) );
  AO22X1 U138 ( .IN1(mem[34]), .IN2(n134), .IN3(mem[50]), .IN4(n136), .Q(n98)
         );
  AO221X1 U139 ( .IN1(mem[18]), .IN2(n144), .IN3(mem[2]), .IN4(n132), .IN5(n98), .Q(n101) );
  AO22X1 U140 ( .IN1(mem[42]), .IN2(n143), .IN3(mem[58]), .IN4(n141), .Q(n99)
         );
  AO221X1 U141 ( .IN1(mem[26]), .IN2(n144), .IN3(mem[10]), .IN4(n132), .IN5(
        n99), .Q(n100) );
  AO22X1 U142 ( .IN1(n101), .IN2(raddr[0]), .IN3(n100), .IN4(n128), .Q(
        rdata[2]) );
  AO22X1 U143 ( .IN1(mem[35]), .IN2(n142), .IN3(mem[51]), .IN4(n140), .Q(n102)
         );
  AO221X1 U144 ( .IN1(mem[19]), .IN2(n130), .IN3(mem[3]), .IN4(n139), .IN5(
        n102), .Q(n105) );
  AO22X1 U145 ( .IN1(mem[43]), .IN2(n133), .IN3(mem[59]), .IN4(n135), .Q(n103)
         );
  AO221X1 U146 ( .IN1(mem[27]), .IN2(n129), .IN3(mem[11]), .IN4(n131), .IN5(
        n103), .Q(n104) );
  AO22X1 U147 ( .IN1(n105), .IN2(n11), .IN3(n104), .IN4(n137), .Q(rdata[3]) );
  AO22X1 U148 ( .IN1(mem[36]), .IN2(n143), .IN3(mem[52]), .IN4(n141), .Q(n106)
         );
  AO221X1 U149 ( .IN1(mem[20]), .IN2(n130), .IN3(mem[4]), .IN4(n139), .IN5(
        n106), .Q(n109) );
  AO22X1 U150 ( .IN1(mem[44]), .IN2(n142), .IN3(mem[60]), .IN4(n136), .Q(n107)
         );
  AO221X1 U151 ( .IN1(mem[28]), .IN2(n145), .IN3(mem[12]), .IN4(n131), .IN5(
        n107), .Q(n108) );
  AO22X1 U152 ( .IN1(n109), .IN2(n11), .IN3(n108), .IN4(n128), .Q(rdata[4]) );
  AO22X1 U153 ( .IN1(mem[37]), .IN2(n133), .IN3(mem[53]), .IN4(n135), .Q(n110)
         );
  AO221X1 U154 ( .IN1(mem[21]), .IN2(n130), .IN3(mem[5]), .IN4(n139), .IN5(
        n110), .Q(n113) );
  AO22X1 U155 ( .IN1(mem[45]), .IN2(n134), .IN3(mem[61]), .IN4(n140), .Q(n111)
         );
  AO221X1 U156 ( .IN1(mem[29]), .IN2(n144), .IN3(mem[13]), .IN4(n131), .IN5(
        n111), .Q(n112) );
  AO22X1 U157 ( .IN1(n113), .IN2(n11), .IN3(n112), .IN4(n137), .Q(rdata[5]) );
  AO22X1 U158 ( .IN1(mem[38]), .IN2(n134), .IN3(mem[54]), .IN4(n136), .Q(n114)
         );
  AO221X1 U159 ( .IN1(mem[22]), .IN2(n130), .IN3(mem[6]), .IN4(n139), .IN5(
        n114), .Q(n117) );
  AO22X1 U160 ( .IN1(mem[46]), .IN2(n143), .IN3(mem[62]), .IN4(n141), .Q(n115)
         );
  AO221X1 U161 ( .IN1(mem[30]), .IN2(n129), .IN3(mem[14]), .IN4(n131), .IN5(
        n115), .Q(n116) );
  AO22X1 U162 ( .IN1(n117), .IN2(n11), .IN3(n116), .IN4(n137), .Q(rdata[6]) );
  AO22X1 U163 ( .IN1(mem[39]), .IN2(n142), .IN3(mem[55]), .IN4(n136), .Q(n118)
         );
  AO221X1 U164 ( .IN1(mem[23]), .IN2(n145), .IN3(mem[7]), .IN4(n139), .IN5(
        n118), .Q(n125) );
  AO22X1 U165 ( .IN1(mem[47]), .IN2(n133), .IN3(mem[63]), .IN4(n135), .Q(n121)
         );
  AO221X1 U166 ( .IN1(mem[31]), .IN2(n129), .IN3(mem[15]), .IN4(n131), .IN5(
        n121), .Q(n124) );
  AO22X1 U167 ( .IN1(n125), .IN2(n11), .IN3(n124), .IN4(n128), .Q(rdata[7]) );
  INVX0 U168 ( .INP(raddr[2]), .ZN(n126) );
  INVX0 U169 ( .INP(n126), .ZN(n127) );
  INVX0 U170 ( .INP(raddr[0]), .ZN(n128) );
  NOR2X0 U171 ( .IN1(n126), .IN2(n1), .QN(n122) );
  INVX0 U172 ( .INP(n138), .ZN(n137) );
  INVX0 U173 ( .INP(n128), .ZN(n138) );
  NOR2X0 U174 ( .IN1(n1), .IN2(n127), .QN(n120) );
  NOR2X0 U175 ( .IN1(n126), .IN2(n1), .QN(n139) );
  INVX0 U176 ( .INP(n166), .ZN(n146) );
  INVX0 U177 ( .INP(n166), .ZN(n147) );
  INVX0 U178 ( .INP(n158), .ZN(n148) );
  INVX0 U179 ( .INP(n243), .ZN(n149) );
  INVX0 U180 ( .INP(n160), .ZN(n150) );
  INVX0 U181 ( .INP(n245), .ZN(n151) );
  INVX0 U182 ( .INP(n168), .ZN(n152) );
  INVX0 U183 ( .INP(n168), .ZN(n153) );
  INVX0 U184 ( .INP(waddr[0]), .ZN(n170) );
  INVX0 U185 ( .INP(waddr[1]), .ZN(n171) );
endmodule


module payload_ram ( clk, reset, we, waddr, wdata, raddr, rdata );
  input [6:0] waddr;
  input [7:0] wdata;
  input [6:0] raddr;
  output [7:0] rdata;
  input clk, reset, we;
  wire   N73, N90, N91, N92, N93, N94, N95, N96, N97, n1, n2, n3, n4, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n28, n29, n30, n32, n33, n34,
         n36, n39, n40, n43, n44, n46, n52, n53, n54, n55, n61, n62, n63, n64,
         n70, n71, n72, n73, n79, n80, n81, n82, n88, n89, n90, n91, n97, n98,
         n99, n100, n108, n109, n110, n112, n113, n115, n116, n118, n119, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, net28306, net34081, net34079, net34239, net34238, net34245,
         net34244, net40463, net40478, net40525, net41596, net41595, net41847,
         net41883, net41958, net41962, net41961, net41980, net41979, net42006,
         net42094, net42093, net42097, net42556, net43310, net43939, net43432,
         n5, n6, n7, n8, n9, n11, n22, n23, n24, n25, n26, n27, n31, n35, n37,
         n38, n41, n42, n45, n47, n48, n49, n50, n51, n56, n57, n58, n59, n60,
         n65, n66, n67, n68, n69, n74, n75, n76, n77, n78, n83, n84, n85, n86,
         n87, n92, n93, n94, n95, n96, n101, n102, n103, n104, n105, n106,
         n107, n111, n114, n117, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n234, n235, n236, n237, n238,
         n239, n240, n241, n242, n243, n244, n245, n246, n247, n248, n249,
         n250, n251, n252, n253, n254, n255, n256, n257, n258, n259, n260,
         n261, n262, n263, n264, n265, n266, n267, n268, n269, n270, n271,
         n272, n273, n274, n275, n276, n277, n278, n279, n280, n281, n282,
         n283, n284, n285, n286, n287, n288, n289, n290, n291, n292, n293,
         n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, n304,
         n305, n306, n307, n308, n309, n310, n311, n312, n313, n314, n315,
         n316, n317, n318, n319, n320, n321, n322, n323, n324, n325, n326,
         n327, n328, n329, n330, n331, n332, n333, n334, n335, n336, n337,
         n338, n339, n340, n341, n342, n343, n344, n345, n346, n347, n348,
         n349, n350, n351, n352, n353, n354, n355, n356, n357, n358, n359,
         n360, n361, n362, n363, n364, n365, n366, n367, n368, n369, n370,
         n371, n372, n373, n374, n375, n376, n377, n378, n379, n380, n381,
         n382, n383, n384, n385, n386, n387, n388, n389, n390, n391, n392,
         n393, n394, n395, n396, n397, n398;
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
  DFFX1 waddr_q_reg_6_ ( .D(n124), .CLK(clk), .Q(waddr_q[6]), .QN(n271) );
  DFFX1 waddr_q_reg_5_ ( .D(n123), .CLK(clk), .Q(waddr_q[5]), .QN(n2) );
  DFFX1 waddr_q_reg_4_ ( .D(n122), .CLK(clk), .Q(waddr_q[4]), .QN(n3) );
  DFFX1 waddr_q_reg_3_ ( .D(n121), .CLK(clk), .Q(waddr_q[3]), .QN(n4) );
  DFFX1 waddr_q_reg_0_ ( .D(n118), .CLK(clk), .Q(waddr_q[0]), .QN(net43310) );
  DFFX1 rdata_reg_7_ ( .D(N97), .CLK(clk), .Q(rdata[7]) );
  DFFX1 rdata_reg_6_ ( .D(N96), .CLK(clk), .Q(rdata[6]) );
  DFFX1 rdata_reg_5_ ( .D(N95), .CLK(clk), .Q(rdata[5]) );
  DFFX1 rdata_reg_4_ ( .D(N94), .CLK(clk), .Q(rdata[4]) );
  DFFX1 rdata_reg_3_ ( .D(N93), .CLK(clk), .Q(rdata[3]) );
  DFFX1 rdata_reg_2_ ( .D(N92), .CLK(clk), .Q(rdata[2]) );
  DFFX1 rdata_reg_1_ ( .D(N91), .CLK(clk), .Q(rdata[1]) );
  DFFX1 rdata_reg_0_ ( .D(N90), .CLK(clk), .Q(rdata[0]) );
  AO22X1 U63 ( .IN1(waddr_q[3]), .IN2(net34244), .IN3(waddr[3]), .IN4(n395),
        .Q(n121) );
  AO22X1 U64 ( .IN1(waddr_q[4]), .IN2(net34244), .IN3(waddr[4]), .IN4(n395),
        .Q(n122) );
  AO22X1 U65 ( .IN1(waddr_q[5]), .IN2(net42556), .IN3(waddr[5]), .IN4(n397),
        .Q(n123) );
  AO22X1 U66 ( .IN1(waddr_q[6]), .IN2(net42556), .IN3(waddr[6]), .IN4(n397),
        .Q(n124) );
  AO22X1 U67 ( .IN1(n294), .IN2(net34245), .IN3(wdata[0]), .IN4(net41958), .Q(
        n125) );
  AO22X1 U68 ( .IN1(n293), .IN2(n396), .IN3(wdata[1]), .IN4(net34238), .Q(n126) );
  AO22X1 U69 ( .IN1(n292), .IN2(net42556), .IN3(wdata[2]), .IN4(net34239), .Q(
        n127) );
  AO22X1 U70 ( .IN1(n291), .IN2(net42556), .IN3(wdata[3]), .IN4(n398), .Q(n128) );
  AO22X1 U71 ( .IN1(wdata_q[4]), .IN2(net34244), .IN3(wdata[4]), .IN4(n395),
        .Q(n129) );
  AO22X1 U72 ( .IN1(n290), .IN2(net34244), .IN3(wdata[5]), .IN4(n398), .Q(n130) );
  AO22X1 U73 ( .IN1(wdata_q[6]), .IN2(net42556), .IN3(wdata[6]), .IN4(n397),
        .Q(n131) );
  AO22X1 U74 ( .IN1(n289), .IN2(n396), .IN3(wdata[7]), .IN4(n398), .Q(n132) );
  AO22X1 U85 ( .IN1(bank_rdata2[6]), .IN2(n60), .IN3(bank_rdata3[6]), .IN4(
        n114), .Q(n52) );
  AO22X1 U91 ( .IN1(bank_rdata14[6]), .IN2(n161), .IN3(bank_rdata15[6]), .IN4(
        n46), .Q(n55) );
  AO22X1 U101 ( .IN1(bank_rdata2[4]), .IN2(n30), .IN3(bank_rdata3[4]), .IN4(
        n114), .Q(n70) );
  AO22X1 U107 ( .IN1(bank_rdata14[4]), .IN2(n161), .IN3(bank_rdata15[4]),
        .IN4(n58), .Q(n73) );
  AO22X1 U125 ( .IN1(bank_rdata2[1]), .IN2(n60), .IN3(bank_rdata3[1]), .IN4(
        n111), .Q(n97) );
  AO22X1 U131 ( .IN1(bank_rdata14[1]), .IN2(n161), .IN3(bank_rdata15[1]),
        .IN4(n58), .Q(n100) );
  DFFX1 waddr_q_reg_1_ ( .D(n119), .CLK(clk), .Q(waddr_q[1]), .QN(n295) );
  DFFX1 waddr_q_reg_2_ ( .D(n120), .CLK(clk), .Q(waddr_q[2]), .QN(n186) );
  DFFX1 wdata_q_reg_0_ ( .D(n125), .CLK(clk), .Q(wdata_q[0]), .QN(n372) );
  DFFX1 wdata_q_reg_1_ ( .D(n126), .CLK(clk), .Q(wdata_q[1]), .QN(n371) );
  DFFX1 wdata_q_reg_2_ ( .D(n127), .CLK(clk), .Q(wdata_q[2]), .QN(n370) );
  DFFX1 wdata_q_reg_3_ ( .D(n128), .CLK(clk), .Q(wdata_q[3]), .QN(n369) );
  DFFX1 wdata_q_reg_5_ ( .D(n130), .CLK(clk), .Q(wdata_q[5]), .QN(n367) );
  DFFX1 wdata_q_reg_7_ ( .D(n132), .CLK(clk), .Q(wdata_q[7]), .QN(n365) );
  DFFX1 wdata_q_reg_4_ ( .D(n129), .CLK(clk), .Q(wdata_q[4]), .QN(n368) );
  DFFX1 wdata_q_reg_6_ ( .D(n131), .CLK(clk), .Q(wdata_q[6]), .QN(n366) );
  DELLN1X2 U3 ( .INP(net43432), .Z(net34245) );
  NBUFFX2 U6 ( .INP(n394), .Z(net34244) );
  NBUFFX2 U7 ( .INP(net43432), .Z(net42556) );
  NAND2X0 U9 ( .IN1(n5), .IN2(n6), .QN(n118) );
  NAND2X0 U10 ( .IN1(net34079), .IN2(net34245), .QN(n5) );
  NBUFFX2 U11 ( .INP(waddr_q[0]), .Z(net34079) );
  NAND2X1 U12 ( .IN1(waddr[0]), .IN2(net34238), .QN(n6) );
  INVX0 U13 ( .INP(net43939), .ZN(net34238) );
  NBUFFX2 U14 ( .INP(n314), .Z(n7) );
  INVX0 U15 ( .INP(n228), .ZN(n8) );
  DELLN1X2 U16 ( .INP(n295), .Z(n228) );
  AND2X1 U17 ( .IN1(n109), .IN2(n113), .Q(n9) );
  AND3X1 U18 ( .IN1(n144), .IN2(n143), .IN3(n142), .Q(n11) );
  AND2X1 U19 ( .IN1(n141), .IN2(n11), .Q(n152) );
  DELLN1X2 U20 ( .INP(raddr[0]), .Z(n209) );
  DELLN2X2 U21 ( .INP(raddr[0]), .Z(n383) );
  NBUFFX4 U22 ( .INP(raddr[3]), .Z(n178) );
  AND2X4 U23 ( .IN1(n150), .IN2(n153), .Q(n22) );
  AND2X1 U24 ( .IN1(n152), .IN2(n22), .Q(n147) );
  DELLN3X2 U26 ( .INP(n374), .Z(n296) );
  NBUFFX4 U27 ( .INP(n49), .Z(n297) );
  NAND2X0 U28 ( .IN1(net42006), .IN2(n108), .QN(n42) );
  NBUFFX2 U29 ( .INP(n108), .Z(n175) );
  AND2X1 U30 ( .IN1(n101), .IN2(n104), .Q(n23) );
  AND2X1 U31 ( .IN1(n103), .IN2(n23), .Q(n93) );
  DELLN2X2 U32 ( .INP(raddr[1]), .Z(n373) );
  DELLN2X2 U33 ( .INP(raddr[1]), .Z(n180) );
  AND2X2 U34 ( .IN1(n151), .IN2(n149), .Q(n24) );
  AND3X1 U35 ( .IN1(n147), .IN2(n24), .IN3(n148), .Q(n77) );
  AND2X1 U36 ( .IN1(n109), .IN2(n113), .Q(n33) );
  AND2X1 U37 ( .IN1(n47), .IN2(n179), .Q(n28) );
  AND2X1 U38 ( .IN1(n117), .IN2(bank_rdata13[0]), .Q(n158) );
  AND2X1 U39 ( .IN1(bank_rdata12[0]), .IN2(n43), .Q(n156) );
  NBUFFX4 U40 ( .INP(n203), .Z(n384) );
  AND2X1 U41 ( .IN1(n176), .IN2(n108), .Q(n40) );
  AOI221X1 U42 ( .IN1(n76), .IN2(bank_rdata5[1]), .IN3(bank_rdata4[1]), .IN4(
        n33), .IN5(n98), .QN(n267) );
  AO22X1 U43 ( .IN1(bank_rdata6[1]), .IN2(n95), .IN3(bank_rdata7[1]), .IN4(n36), .Q(n98) );
  AO22X1 U44 ( .IN1(bank_rdata6[3]), .IN2(n96), .IN3(bank_rdata7[3]), .IN4(n65), .Q(n80) );
  AOI221X1 U45 ( .IN1(n133), .IN2(bank_rdata13[6]), .IN3(bank_rdata12[6]),
        .IN4(n43), .IN5(n55), .QN(n275) );
  AOI221X1 U46 ( .IN1(bank_rdata5[6]), .IN2(n59), .IN3(bank_rdata4[6]), .IN4(
        n33), .IN5(n53), .QN(n277) );
  AO22X1 U47 ( .IN1(bank_rdata6[6]), .IN2(n95), .IN3(bank_rdata7[6]), .IN4(n36), .Q(n53) );
  AOI221X1 U48 ( .IN1(bank_rdata5[7]), .IN2(n59), .IN3(bank_rdata4[7]), .IN4(
        n9), .IN5(n34), .QN(n287) );
  AO22X1 U49 ( .IN1(bank_rdata6[7]), .IN2(n95), .IN3(bank_rdata7[7]), .IN4(
        n168), .Q(n34) );
  DELLN1X2 U50 ( .INP(n49), .Z(n388) );
  NBUFFX4 U51 ( .INP(n295), .Z(n67) );
  DELLN1X2 U52 ( .INP(n374), .Z(n172) );
  NBUFFX2 U53 ( .INP(n210), .Z(n375) );
  DELLN1X2 U54 ( .INP(n49), .Z(n387) );
  DELLN1X2 U55 ( .INP(n255), .Z(n205) );
  DELLN1X2 U56 ( .INP(n203), .Z(n386) );
  NAND2X1 U57 ( .IN1(n166), .IN2(bank_rdata9[0]), .QN(n143) );
  NAND2X1 U58 ( .IN1(bank_rdata0[0]), .IN2(n28), .QN(n142) );
  DELLN1X2 U59 ( .INP(n209), .Z(n385) );
  AND2X1 U60 ( .IN1(net41883), .IN2(n112), .Q(n36) );
  NBUFFX2 U61 ( .INP(n364), .Z(n304) );
  NBUFFX2 U62 ( .INP(n363), .Z(n302) );
  NBUFFX2 U75 ( .INP(n66), .Z(n232) );
  OR3X1 U76 ( .IN1(n158), .IN2(n157), .IN3(n156), .Q(n83) );
  NAND2X1 U77 ( .IN1(bank_rdata14[0]), .IN2(n160), .QN(n151) );
  AOI221X1 U78 ( .IN1(bank_rdata1[2]), .IN2(n169), .IN3(bank_rdata0[2]), .IN4(
        net41980), .IN5(n88), .QN(n265) );
  AO221X1 U79 ( .IN1(n133), .IN2(bank_rdata13[4]), .IN3(bank_rdata12[4]),
        .IN4(n43), .IN5(n73), .Q(n85) );
  AO22X1 U80 ( .IN1(bank_rdata6[5]), .IN2(n96), .IN3(bank_rdata7[5]), .IN4(n65), .Q(n62) );
  AO22X1 U81 ( .IN1(n232), .IN2(n396), .IN3(waddr[2]), .IN4(net34239), .Q(n120) );
  AO22X1 U82 ( .IN1(n273), .IN2(net34244), .IN3(waddr[1]), .IN4(net41958), .Q(
        n119) );
  AOI221X1 U83 ( .IN1(bank_rdata9[1]), .IN2(n167), .IN3(bank_rdata8[1]), .IN4(
        n164), .IN5(n99), .QN(n191) );
  AOI221X1 U84 ( .IN1(n166), .IN2(bank_rdata9[3]), .IN3(bank_rdata8[3]), .IN4(
        n164), .IN5(n81), .QN(n261) );
  AOI221X1 U86 ( .IN1(n167), .IN2(bank_rdata9[6]), .IN3(bank_rdata8[6]), .IN4(
        n165), .IN5(n54), .QN(n276) );
  AOI221X1 U87 ( .IN1(bank_rdata1[7]), .IN2(n169), .IN3(bank_rdata0[7]), .IN4(
        net41980), .IN5(n29), .QN(n288) );
  DELLN2X2 U88 ( .INP(waddr_q[1]), .Z(n273) );
  DELLN1X2 U89 ( .INP(raddr[1]), .Z(n374) );
  AO22X2 U90 ( .IN1(bank_rdata14[2]), .IN2(n161), .IN3(bank_rdata15[2]), .IN4(
        net42094), .Q(n91) );
  NBUFFX2 U92 ( .INP(wdata_q[3]), .Z(n291) );
  NBUFFX2 U93 ( .INP(wdata_q[2]), .Z(n292) );
  NBUFFX2 U94 ( .INP(wdata_q[1]), .Z(n293) );
  NBUFFX2 U95 ( .INP(wdata_q[0]), .Z(n294) );
  NBUFFX2 U96 ( .INP(n218), .Z(n303) );
  NBUFFX2 U97 ( .INP(n213), .Z(n305) );
  NBUFFX4 U98 ( .INP(n214), .Z(n306) );
  NBUFFX4 U99 ( .INP(n215), .Z(n307) );
  NBUFFX4 U100 ( .INP(n216), .Z(n308) );
  NBUFFX4 U102 ( .INP(n217), .Z(n309) );
  NBUFFX2 U103 ( .INP(wdata_q[7]), .Z(n289) );
  NBUFFX2 U104 ( .INP(wdata_q[5]), .Z(n290) );
  DELLN1X2 U105 ( .INP(n256), .Z(n382) );
  NAND2X1 U106 ( .IN1(n176), .IN2(n174), .QN(n25) );
  NBUFFX4 U108 ( .INP(n184), .Z(n171) );
  NAND2X1 U109 ( .IN1(n116), .IN2(n110), .QN(n26) );
  AND2X1 U110 ( .IN1(n116), .IN2(net42097), .Q(n27) );
  NAND2X1 U111 ( .IN1(n175), .IN2(n159), .QN(n31) );
  NAND2X0 U112 ( .IN1(n110), .IN2(n115), .QN(n35) );
  AO221X1 U113 ( .IN1(n117), .IN2(bank_rdata13[2]), .IN3(bank_rdata12[2]),
        .IN4(n43), .IN5(n91), .Q(n37) );
  OR2X1 U114 ( .IN1(n177), .IN2(n173), .Q(n38) );
  NAND2X1 U115 ( .IN1(net41883), .IN2(n179), .QN(n41) );
  DELLN1X2 U116 ( .INP(waddr_q[0]), .Z(net41596) );
  DELLN1X2 U117 ( .INP(waddr_q[0]), .Z(net41595) );
  INVX0 U118 ( .INP(net40463), .ZN(net40478) );
  INVX0 U119 ( .INP(reset), .ZN(net40463) );
  DELLN1X2 U120 ( .INP(n187), .Z(n381) );
  NBUFFX4 U121 ( .INP(n187), .Z(n233) );
  NBUFFX2 U122 ( .INP(n66), .Z(n379) );
  OR2X1 U123 ( .IN1(n391), .IN2(raddr[6]), .Q(n84) );
  NBUFFX4 U124 ( .INP(raddr[6]), .Z(n107) );
  DELLN1X2 U126 ( .INP(waddr_q[2]), .Z(n380) );
  DELLN1X2 U127 ( .INP(waddr_q[2]), .Z(n378) );
  DELLN1X2 U128 ( .INP(raddr[4]), .Z(n69) );
  INVX0 U129 ( .INP(n178), .ZN(n45) );
  DELLN2X2 U130 ( .INP(waddr_q[1]), .Z(n230) );
  DELLN2X2 U132 ( .INP(n109), .Z(n47) );
  INVX0 U133 ( .INP(n374), .ZN(n48) );
  INVX0 U134 ( .INP(n48), .ZN(n49) );
  AOI221X2 U135 ( .IN1(bank_rdata5[4]), .IN2(n59), .IN3(bank_rdata4[4]), .IN4(
        n33), .IN5(n71), .QN(n283) );
  AOI221X2 U136 ( .IN1(n76), .IN2(bank_rdata5[2]), .IN3(bank_rdata4[2]), .IN4(
        n9), .IN5(n89), .QN(n264) );
  AO22X2 U137 ( .IN1(bank_rdata10[6]), .IN2(n56), .IN3(bank_rdata11[6]), .IN4(
        n163), .Q(n54) );
  NAND2X1 U138 ( .IN1(bank_rdata11[0]), .IN2(n163), .QN(n144) );
  AO22X2 U139 ( .IN1(bank_rdata6[2]), .IN2(n95), .IN3(bank_rdata7[2]), .IN4(
        n36), .Q(n89) );
  AO22X2 U140 ( .IN1(bank_rdata6[4]), .IN2(n96), .IN3(bank_rdata7[4]), .IN4(
        n36), .Q(n71) );
  NAND2X0 U141 ( .IN1(n50), .IN2(n51), .QN(n239) );
  AND2X1 U142 ( .IN1(n264), .IN2(n265), .Q(n50) );
  NOR2X0 U143 ( .IN1(n57), .IN2(n37), .QN(n51) );
  INVX0 U144 ( .INP(net41961), .ZN(n56) );
  AO221X1 U145 ( .IN1(n167), .IN2(bank_rdata9[2]), .IN3(bank_rdata8[2]), .IN4(
        n165), .IN5(n90), .Q(n57) );
  NBUFFX2 U146 ( .INP(waddr_q[0]), .Z(net34081) );
  INVX0 U147 ( .INP(net42093), .ZN(n58) );
  AND2X4 U148 ( .IN1(n174), .IN2(n115), .Q(n46) );
  NBUFFX2 U149 ( .INP(n32), .Z(n59) );
  INVX0 U150 ( .INP(n155), .ZN(n60) );
  AND2X1 U151 ( .IN1(n47), .IN2(n175), .Q(n30) );
  AOI221X1 U152 ( .IN1(bank_rdata1[5]), .IN2(n169), .IN3(bank_rdata0[5]),
        .IN4(net41980), .IN5(n61), .QN(n282) );
  AOI221X1 U153 ( .IN1(bank_rdata1[3]), .IN2(n169), .IN3(bank_rdata0[3]),
        .IN4(net41980), .IN5(n79), .QN(n263) );
  AND2X1 U154 ( .IN1(n116), .IN2(net42097), .Q(n43) );
  DELLN1X2 U155 ( .INP(n168), .Z(n65) );
  NBUFFX2 U156 ( .INP(n210), .Z(n226) );
  DELLN1X2 U157 ( .INP(n115), .Z(n159) );
  AO22X2 U158 ( .IN1(bank_rdata14[7]), .IN2(n160), .IN3(bank_rdata15[7]),
        .IN4(net42094), .Q(n44) );
  INVX0 U159 ( .INP(n186), .ZN(n66) );
  AO22X1 U160 ( .IN1(bank_rdata10[7]), .IN2(n40), .IN3(bank_rdata11[7]), .IN4(
        n162), .Q(n39) );
  AO22X1 U161 ( .IN1(bank_rdata10[3]), .IN2(n40), .IN3(bank_rdata11[3]), .IN4(
        n162), .Q(n81) );
  AO22X1 U162 ( .IN1(bank_rdata10[5]), .IN2(n56), .IN3(bank_rdata11[5]), .IN4(
        n162), .Q(n63) );
  NAND2X0 U163 ( .IN1(bank_rdata10[0]), .IN2(n40), .QN(n146) );
  INVX0 U164 ( .INP(net41979), .ZN(n68) );
  DELLN1X2 U165 ( .INP(raddr[5]), .Z(n185) );
  INVX0 U166 ( .INP(n391), .ZN(n74) );
  INVX0 U167 ( .INP(n228), .ZN(n75) );
  AO22X1 U168 ( .IN1(bank_rdata10[2]), .IN2(net41962), .IN3(bank_rdata11[2]),
        .IN4(n163), .Q(n90) );
  AO22X1 U169 ( .IN1(bank_rdata10[1]), .IN2(n56), .IN3(bank_rdata11[1]), .IN4(
        n162), .Q(n99) );
  AO22X1 U170 ( .IN1(bank_rdata10[4]), .IN2(net41962), .IN3(bank_rdata11[4]),
        .IN4(n163), .Q(n72) );
  NAND2X0 U171 ( .IN1(n170), .IN2(bank_rdata1[0]), .QN(n145) );
  NAND2X0 U172 ( .IN1(bank_rdata8[0]), .IN2(n165), .QN(n141) );
  NBUFFX2 U173 ( .INP(n32), .Z(n76) );
  AND2X4 U174 ( .IN1(net42006), .IN2(n113), .Q(n32) );
  NOR2X0 U175 ( .IN1(n77), .IN2(net40478), .QN(N90) );
  NOR2X0 U176 ( .IN1(n78), .IN2(n83), .QN(n148) );
  NAND2X0 U177 ( .IN1(n102), .IN2(n93), .QN(n78) );
  NOR2X0 U178 ( .IN1(n86), .IN2(n85), .QN(n87) );
  AO221X1 U179 ( .IN1(n167), .IN2(bank_rdata9[4]), .IN3(n165), .IN4(
        bank_rdata8[4]), .IN5(n72), .Q(n86) );
  NAND2X0 U180 ( .IN1(n92), .IN2(n87), .QN(n189) );
  AND2X1 U181 ( .IN1(n284), .IN2(n283), .Q(n92) );
  NAND2X0 U182 ( .IN1(bank_rdata2[7]), .IN2(n154), .QN(n136) );
  NAND2X0 U183 ( .IN1(bank_rdata2[5]), .IN2(n154), .QN(n134) );
  NAND2X0 U184 ( .IN1(n154), .IN2(bank_rdata2[3]), .QN(n138) );
  AOI221X1 U185 ( .IN1(bank_rdata1[4]), .IN2(n170), .IN3(bank_rdata0[4]),
        .IN4(n68), .IN5(n70), .QN(n284) );
  INVX0 U186 ( .INP(n390), .ZN(n94) );
  INVX0 U187 ( .INP(n38), .ZN(n95) );
  INVX0 U188 ( .INP(n38), .ZN(n96) );
  NAND2X0 U189 ( .IN1(bank_rdata6[0]), .IN2(n96), .QN(n101) );
  NAND2X0 U190 ( .IN1(n32), .IN2(bank_rdata5[0]), .QN(n102) );
  NAND2X0 U191 ( .IN1(bank_rdata7[0]), .IN2(n168), .QN(n103) );
  NAND2X0 U192 ( .IN1(bank_rdata4[0]), .IN2(n33), .QN(n104) );
  AOI221X1 U193 ( .IN1(bank_rdata13[1]), .IN2(n117), .IN3(bank_rdata12[1]),
        .IN4(n27), .IN5(n100), .QN(n266) );
  INVX0 U194 ( .INP(n67), .ZN(n105) );
  AND3X1 U195 ( .IN1(n287), .IN2(n285), .IN3(n286), .Q(n106) );
  AO22X1 U196 ( .IN1(bank_rdata2[2]), .IN2(n30), .IN3(bank_rdata3[2]), .IN4(
        n111), .Q(n88) );
  INVX0 U197 ( .INP(n42), .ZN(n111) );
  INVX0 U198 ( .INP(n42), .ZN(n114) );
  AOI221X1 U199 ( .IN1(n76), .IN2(bank_rdata5[3]), .IN3(bank_rdata4[3]), .IN4(
        n9), .IN5(n80), .QN(n262) );
  NAND2X0 U200 ( .IN1(n136), .IN2(n137), .QN(n29) );
  INVX0 U201 ( .INP(n140), .ZN(n117) );
  INVX0 U202 ( .INP(n140), .ZN(n133) );
  NAND2X0 U203 ( .IN1(n138), .IN2(n139), .QN(n79) );
  NAND2X0 U204 ( .IN1(n134), .IN2(n135), .QN(n61) );
  NAND2X0 U205 ( .IN1(n288), .IN2(n106), .QN(n259) );
  AOI221X1 U206 ( .IN1(n166), .IN2(bank_rdata9[7]), .IN3(bank_rdata8[7]),
        .IN4(n164), .IN5(n39), .QN(n286) );
  NAND2X0 U207 ( .IN1(bank_rdata3[7]), .IN2(n114), .QN(n137) );
  NAND2X0 U208 ( .IN1(bank_rdata3[5]), .IN2(n111), .QN(n135) );
  NAND2X0 U209 ( .IN1(n111), .IN2(bank_rdata3[3]), .QN(n139) );
  NAND2X0 U210 ( .IN1(bank_rdata3[0]), .IN2(n114), .QN(n149) );
  NAND2X0 U211 ( .IN1(bank_rdata2[0]), .IN2(n154), .QN(n150) );
  AND2X1 U212 ( .IN1(n145), .IN2(n146), .Q(n153) );
  INVX0 U213 ( .INP(n155), .ZN(n154) );
  INVX0 U214 ( .INP(n30), .ZN(n155) );
  AND2X1 U215 ( .IN1(bank_rdata15[0]), .IN2(n46), .Q(n157) );
  INVX0 U216 ( .INP(n26), .ZN(n165) );
  INVX0 U217 ( .INP(n26), .ZN(n164) );
  INVX0 U218 ( .INP(n35), .ZN(n167) );
  INVX0 U219 ( .INP(n35), .ZN(n166) );
  INVX0 U220 ( .INP(n31), .ZN(n163) );
  INVX0 U221 ( .INP(n31), .ZN(n162) );
  INVX0 U222 ( .INP(n25), .ZN(n160) );
  INVX0 U223 ( .INP(n25), .ZN(n161) );
  INVX0 U224 ( .INP(n41), .ZN(n169) );
  INVX0 U225 ( .INP(n41), .ZN(n170) );
  NAND2X0 U226 ( .IN1(n159), .IN2(net42097), .QN(n140) );
  DELLN1X2 U227 ( .INP(n36), .Z(n168) );
  INVX0 U228 ( .INP(net41847), .ZN(net42097) );
  INVX0 U229 ( .INP(n46), .ZN(net42093) );
  INVX0 U230 ( .INP(net42093), .ZN(net42094) );
  INVX0 U231 ( .INP(n112), .ZN(n173) );
  INVX0 U232 ( .INP(n173), .ZN(n174) );
  AO22X2 U233 ( .IN1(bank_rdata14[5]), .IN2(n160), .IN3(bank_rdata15[5]),
        .IN4(net42094), .Q(n64) );
  AO22X2 U234 ( .IN1(bank_rdata14[3]), .IN2(n160), .IN3(bank_rdata15[3]),
        .IN4(net42094), .Q(n82) );
  INVX0 U235 ( .INP(n84), .ZN(net42006) );
  NOR2X0 U236 ( .IN1(n184), .IN2(n178), .QN(n176) );
  INVX0 U237 ( .INP(n47), .ZN(n177) );
  INVX0 U238 ( .INP(n28), .ZN(net41979) );
  INVX0 U239 ( .INP(net41979), .ZN(net41980) );
  AOI221X2 U240 ( .IN1(bank_rdata5[5]), .IN2(n76), .IN3(bank_rdata4[5]), .IN4(
        n9), .IN5(n62), .QN(n281) );
  INVX0 U241 ( .INP(n40), .ZN(net41961) );
  INVX0 U242 ( .INP(net41961), .ZN(net41962) );
  INVX0 U243 ( .INP(net43939), .ZN(net41958) );
  NOR2X0 U244 ( .IN1(n182), .IN2(n94), .QN(n179) );
  AOI221X1 U245 ( .IN1(n166), .IN2(bank_rdata9[5]), .IN3(bank_rdata8[5]),
        .IN4(n164), .IN5(n63), .QN(n280) );
  INVX0 U246 ( .INP(n185), .ZN(n181) );
  INVX0 U247 ( .INP(n389), .ZN(n182) );
  DELLN2X2 U248 ( .INP(waddr_q[1]), .Z(n183) );
  INVX0 U249 ( .INP(n107), .ZN(n184) );
  INVX0 U250 ( .INP(n84), .ZN(net41883) );
  INVX0 U251 ( .INP(n113), .ZN(net41847) );
  INVX0 U252 ( .INP(n186), .ZN(n187) );
  INVX0 U253 ( .INP(n211), .ZN(n188) );
  AOI221X1 U254 ( .IN1(bank_rdata1[6]), .IN2(n170), .IN3(bank_rdata0[6]),
        .IN4(n68), .IN5(n52), .QN(n278) );
  AND2X1 U255 ( .IN1(n189), .IN2(net40463), .Q(N94) );
  NAND2X0 U256 ( .IN1(n191), .IN2(n190), .QN(n229) );
  AND3X1 U257 ( .IN1(n267), .IN2(n266), .IN3(n268), .Q(n190) );
  AOI221X1 U258 ( .IN1(bank_rdata1[1]), .IN2(n170), .IN3(bank_rdata0[1]),
        .IN4(n68), .IN5(n97), .QN(n268) );
  INVX0 U259 ( .INP(n202), .ZN(n192) );
  INVX0 U260 ( .INP(n202), .ZN(n193) );
  INVX0 U261 ( .INP(n346), .ZN(n194) );
  INVX0 U262 ( .INP(n342), .ZN(n195) );
  INVX0 U263 ( .INP(n350), .ZN(n196) );
  INVX0 U264 ( .INP(n339), .ZN(n197) );
  INVX0 U265 ( .INP(n334), .ZN(n198) );
  INVX0 U266 ( .INP(n344), .ZN(n199) );
  INVX0 U267 ( .INP(n352), .ZN(n200) );
  INVX0 U268 ( .INP(n348), .ZN(n201) );
  INVX0 U269 ( .INP(n256), .ZN(n202) );
  INVX0 U270 ( .INP(n205), .ZN(n203) );
  AND3X1 U271 ( .IN1(n277), .IN2(n278), .IN3(n275), .Q(n204) );
  INVX0 U272 ( .INP(n334), .ZN(n206) );
  INVX0 U273 ( .INP(n327), .ZN(n207) );
  DELLN1X2 U274 ( .INP(n354), .Z(n269) );
  INVX0 U275 ( .INP(n228), .ZN(n208) );
  INVX0 U276 ( .INP(n205), .ZN(n210) );
  DELLN2X2 U277 ( .INP(n209), .Z(n354) );
  NAND2X0 U278 ( .IN1(n276), .IN2(n204), .QN(n257) );
  INVX0 U279 ( .INP(n375), .ZN(n211) );
  INVX0 U280 ( .INP(n211), .ZN(n212) );
  INVX0 U281 ( .INP(n313), .ZN(n213) );
  INVX0 U282 ( .INP(n315), .ZN(n214) );
  INVX0 U283 ( .INP(n317), .ZN(n215) );
  INVX0 U284 ( .INP(n319), .ZN(n216) );
  INVX0 U285 ( .INP(n321), .ZN(n217) );
  INVX0 U286 ( .INP(n311), .ZN(n218) );
  INVX0 U287 ( .INP(n324), .ZN(n219) );
  INVX0 U288 ( .INP(n327), .ZN(n220) );
  INVX0 U289 ( .INP(n315), .ZN(n221) );
  INVX0 U290 ( .INP(n317), .ZN(n222) );
  INVX0 U291 ( .INP(n319), .ZN(n223) );
  INVX0 U292 ( .INP(n321), .ZN(n224) );
  DELLN1X2 U293 ( .INP(n230), .Z(n225) );
  INVX0 U294 ( .INP(n228), .ZN(n227) );
  AND2X1 U295 ( .IN1(n229), .IN2(net40463), .Q(N91) );
  DELLN2X2 U296 ( .INP(waddr_q[1]), .Z(n272) );
  DELLN2X2 U297 ( .INP(waddr_q[1]), .Z(n376) );
  DELLN1X2 U298 ( .INP(n230), .Z(n231) );
  DELLN2X2 U299 ( .INP(waddr_q[1]), .Z(n377) );
  INVX0 U300 ( .INP(net43310), .ZN(net40525) );
  INVX0 U301 ( .INP(raddr[2]), .ZN(n234) );
  INVX0 U302 ( .INP(n234), .ZN(n235) );
  INVX0 U303 ( .INP(n234), .ZN(n236) );
  INVX0 U304 ( .INP(n234), .ZN(n237) );
  AND2X1 U305 ( .IN1(n238), .IN2(net40463), .Q(N93) );
  NAND4X0 U306 ( .IN1(n261), .IN2(n262), .IN3(n260), .IN4(n263), .QN(n238) );
  AND2X1 U307 ( .IN1(n239), .IN2(net40463), .Q(N92) );
  INVX0 U308 ( .INP(n367), .ZN(n240) );
  INVX0 U309 ( .INP(n369), .ZN(n241) );
  INVX0 U310 ( .INP(n370), .ZN(n242) );
  INVX0 U311 ( .INP(n371), .ZN(n243) );
  INVX0 U312 ( .INP(n372), .ZN(n244) );
  INVX0 U313 ( .INP(n365), .ZN(n245) );
  INVX0 U314 ( .INP(n366), .ZN(n246) );
  INVX0 U315 ( .INP(n332), .ZN(n247) );
  INVX0 U316 ( .INP(n334), .ZN(n248) );
  INVX0 U317 ( .INP(n336), .ZN(n249) );
  INVX0 U318 ( .INP(n344), .ZN(n250) );
  INVX0 U319 ( .INP(n346), .ZN(n251) );
  INVX0 U320 ( .INP(n348), .ZN(n252) );
  INVX0 U321 ( .INP(n350), .ZN(n253) );
  INVX0 U322 ( .INP(n352), .ZN(n254) );
  INVX0 U323 ( .INP(n209), .ZN(n255) );
  INVX0 U324 ( .INP(n255), .ZN(n256) );
  AND2X1 U325 ( .IN1(n257), .IN2(net40463), .Q(N96) );
  AND2X1 U326 ( .IN1(n258), .IN2(net40463), .Q(N95) );
  NAND4X0 U327 ( .IN1(n280), .IN2(n282), .IN3(n281), .IN4(n279), .QN(n258) );
  AND2X1 U328 ( .IN1(n259), .IN2(net40463), .Q(N97) );
  AOI221X1 U329 ( .IN1(n133), .IN2(bank_rdata13[3]), .IN3(bank_rdata12[3]),
        .IN4(n27), .IN5(n82), .QN(n260) );
  INVX0 U330 ( .INP(n67), .ZN(n270) );
  NOR2X0 U331 ( .IN1(n171), .IN2(n45), .QN(n115) );
  NOR2X0 U332 ( .IN1(n390), .IN2(n181), .QN(n112) );
  INVX0 U333 ( .INP(net43939), .ZN(net34239) );
  INVX0 U334 ( .INP(raddr[4]), .ZN(n390) );
  INVX0 U335 ( .INP(raddr[3]), .ZN(n391) );
  INVX0 U336 ( .INP(raddr[5]), .ZN(n389) );
  NOR2X0 U337 ( .IN1(n185), .IN2(n390), .QN(n108) );
  NOR2X0 U338 ( .IN1(n171), .IN2(n178), .QN(n116) );
  NOR2X0 U339 ( .IN1(n389), .IN2(n69), .QN(n113) );
  NOR2X0 U340 ( .IN1(n107), .IN2(n74), .QN(n109) );
  NOR2X0 U341 ( .IN1(n182), .IN2(n94), .QN(n110) );
  NOR2X0 U342 ( .IN1(n16), .IN2(n17), .QN(bank_we[6]) );
  NOR2X0 U343 ( .IN1(n13), .IN2(n17), .QN(bank_we[0]) );
  NOR2X0 U344 ( .IN1(n13), .IN2(n14), .QN(bank_we[8]) );
  NOR2X0 U345 ( .IN1(n17), .IN2(n18), .QN(bank_we[4]) );
  NOR2X0 U346 ( .IN1(n14), .IN2(n18), .QN(bank_we[12]) );
  NOR2X0 U347 ( .IN1(n14), .IN2(n19), .QN(bank_we[10]) );
  NOR2X0 U348 ( .IN1(n12), .IN2(n19), .QN(bank_we[11]) );
  NOR2X0 U349 ( .IN1(n12), .IN2(n13), .QN(bank_we[9]) );
  NOR2X0 U350 ( .IN1(n15), .IN2(n18), .QN(bank_we[5]) );
  NOR2X0 U351 ( .IN1(n15), .IN2(n16), .QN(bank_we[7]) );
  NOR2X0 U352 ( .IN1(n14), .IN2(n16), .QN(bank_we[14]) );
  NOR2X0 U353 ( .IN1(n12), .IN2(n16), .QN(bank_we[15]) );
  NOR2X0 U354 ( .IN1(n12), .IN2(n18), .QN(bank_we[13]) );
  NOR2X0 U355 ( .IN1(n13), .IN2(n15), .QN(bank_we[1]) );
  NOR2X0 U356 ( .IN1(n17), .IN2(n19), .QN(bank_we[2]) );
  NOR2X0 U357 ( .IN1(n15), .IN2(n19), .QN(bank_we[3]) );
  NAND2X0 U358 ( .IN1(n20), .IN2(n4), .QN(n17) );
  NAND2X0 U359 ( .IN1(n21), .IN2(n4), .QN(n14) );
  NAND2X0 U360 ( .IN1(n21), .IN2(waddr_q[3]), .QN(n12) );
  NOR2X0 U361 ( .IN1(n1), .IN2(waddr_q[6]), .QN(n20) );
  NOR2X0 U362 ( .IN1(n1), .IN2(n271), .QN(n21) );
  NAND2X0 U363 ( .IN1(n20), .IN2(waddr_q[3]), .QN(n15) );
  NAND2X0 U364 ( .IN1(waddr_q[5]), .IN2(n3), .QN(n18) );
  NAND2X0 U365 ( .IN1(waddr_q[4]), .IN2(n2), .QN(n19) );
  NAND2X0 U366 ( .IN1(waddr_q[5]), .IN2(waddr_q[4]), .QN(n16) );
  NAND2X0 U367 ( .IN1(n3), .IN2(n2), .QN(n13) );
  INVX0 U369 ( .INP(we), .ZN(net28306) );
  INVX0 U370 ( .INP(n67), .ZN(n274) );
  AOI221X1 U371 ( .IN1(n133), .IN2(bank_rdata13[5]), .IN3(bank_rdata12[5]),
        .IN4(n27), .IN5(n64), .QN(n279) );
  AOI221X1 U372 ( .IN1(n117), .IN2(bank_rdata13[7]), .IN3(bank_rdata12[7]),
        .IN4(n27), .IN5(n44), .QN(n285) );
  INVX0 U373 ( .INP(n365), .ZN(n298) );
  INVX0 U374 ( .INP(n365), .ZN(n299) );
  INVX0 U375 ( .INP(n367), .ZN(n300) );
  INVX0 U376 ( .INP(n367), .ZN(n301) );
  INVX0 U377 ( .INP(n339), .ZN(n310) );
  INVX0 U378 ( .INP(n356), .ZN(n311) );
  INVX0 U379 ( .INP(n342), .ZN(n312) );
  INVX0 U380 ( .INP(n358), .ZN(n313) );
  INVX0 U381 ( .INP(n313), .ZN(n314) );
  INVX0 U382 ( .INP(n359), .ZN(n315) );
  INVX0 U383 ( .INP(n315), .ZN(n316) );
  INVX0 U384 ( .INP(n360), .ZN(n317) );
  INVX0 U385 ( .INP(n317), .ZN(n318) );
  INVX0 U386 ( .INP(n361), .ZN(n319) );
  INVX0 U387 ( .INP(n319), .ZN(n320) );
  INVX0 U388 ( .INP(n362), .ZN(n321) );
  INVX0 U389 ( .INP(n321), .ZN(n322) );
  INVX0 U390 ( .INP(n339), .ZN(n323) );
  INVX0 U391 ( .INP(n218), .ZN(n324) );
  INVX0 U392 ( .INP(n324), .ZN(n325) );
  INVX0 U393 ( .INP(n342), .ZN(n326) );
  INVX0 U394 ( .INP(n213), .ZN(n327) );
  INVX0 U395 ( .INP(n346), .ZN(n328) );
  INVX0 U396 ( .INP(n348), .ZN(n329) );
  INVX0 U397 ( .INP(n350), .ZN(n330) );
  INVX0 U398 ( .INP(n352), .ZN(n331) );
  INVX0 U399 ( .INP(n355), .ZN(n332) );
  INVX0 U400 ( .INP(n332), .ZN(n333) );
  INVX0 U401 ( .INP(n356), .ZN(n334) );
  INVX0 U402 ( .INP(n334), .ZN(n335) );
  INVX0 U403 ( .INP(n357), .ZN(n336) );
  INVX0 U404 ( .INP(n336), .ZN(n337) );
  INVX0 U405 ( .INP(n344), .ZN(n338) );
  INVX0 U406 ( .INP(n355), .ZN(n339) );
  INVX0 U407 ( .INP(n339), .ZN(n340) );
  INVX0 U408 ( .INP(n334), .ZN(n341) );
  INVX0 U409 ( .INP(n357), .ZN(n342) );
  INVX0 U410 ( .INP(n342), .ZN(n343) );
  INVX0 U411 ( .INP(n213), .ZN(n344) );
  INVX0 U412 ( .INP(n344), .ZN(n345) );
  INVX0 U413 ( .INP(n214), .ZN(n346) );
  INVX0 U414 ( .INP(n346), .ZN(n347) );
  INVX0 U415 ( .INP(n215), .ZN(n348) );
  INVX0 U416 ( .INP(n348), .ZN(n349) );
  INVX0 U417 ( .INP(n216), .ZN(n350) );
  INVX0 U418 ( .INP(n350), .ZN(n351) );
  INVX0 U419 ( .INP(n217), .ZN(n352) );
  INVX0 U420 ( .INP(n352), .ZN(n353) );
  INVX0 U421 ( .INP(n365), .ZN(n355) );
  INVX0 U422 ( .INP(n366), .ZN(n356) );
  INVX0 U423 ( .INP(n367), .ZN(n357) );
  INVX0 U424 ( .INP(n368), .ZN(n358) );
  INVX0 U425 ( .INP(n369), .ZN(n359) );
  INVX0 U426 ( .INP(n370), .ZN(n360) );
  INVX0 U427 ( .INP(n371), .ZN(n361) );
  INVX0 U428 ( .INP(n372), .ZN(n362) );
  INVX0 U429 ( .INP(n365), .ZN(n363) );
  INVX0 U430 ( .INP(n367), .ZN(n364) );
  payload_ram_bank8x8_15 b00 ( .clk(clk), .we(bank_we[0]), .waddr({n378, n227,
        net41595}), .wdata({n289, n325, n290, n207, n291, n292, n293, n294}),
        .raddr({n237, n387, n385}), .rdata(bank_rdata0) );
  payload_ram_bank8x8_14 b01 ( .clk(clk), .we(bank_we[1]), .waddr({n233, n8,
        net41596}), .wdata({n245, wdata_q[6], n240, wdata_q[4], n291, n292,
        n293, n294}), .raddr({n237, n296, n269}), .rdata(bank_rdata1) );
  payload_ram_bank8x8_13 b02 ( .clk(clk), .we(bank_we[2]), .waddr({n379, n270,
        net40525}), .wdata({n245, n246, n240, n305, n241, n242, n243, n244}),
        .raddr({n235, n180, n354}), .rdata(bank_rdata2) );
  payload_ram_bank8x8_12 b03 ( .clk(clk), .we(bank_we[3]), .waddr({n378, n225,
        net34079}), .wdata({wdata_q[7], n206, wdata_q[5], n207, wdata_q[3:0]}),
        .raddr({raddr[2], n373, n188}), .rdata(bank_rdata3) );
  payload_ram_bank8x8_11 b04 ( .clk(clk), .we(bank_we[4]), .waddr({n380, n75,
        net40525}), .wdata({n299, n246, n301, n220, n241, n242, n243, n244}),
        .raddr({n235, n373, n212}), .rdata(bank_rdata4) );
  payload_ram_bank8x8_10 b05 ( .clk(clk), .we(bank_we[5]), .waddr({n378, n377,
        net34079}), .wdata({n298, n219, n300, wdata_q[4], n221, n222, n223,
        n224}), .raddr({n237, n388, n193}), .rdata(bank_rdata5) );
  payload_ram_bank8x8_9 b06 ( .clk(clk), .we(bank_we[6]), .waddr({n379, n376,
        net41596}), .wdata({n197, n198, n195, n199, n194, n201, n196, n200}),
        .raddr({n237, n172, n354}), .rdata(bank_rdata6) );
  payload_ram_bank8x8_8 b07 ( .clk(clk), .we(bank_we[7]), .waddr({n233, n183,
        net41596}), .wdata({n247, n248, n249, n250, n251, n252, n253, n254}),
        .raddr({n236, n387, n354}), .rdata(bank_rdata7) );
  payload_ram_bank8x8_7 b08 ( .clk(clk), .we(bank_we[8]), .waddr({n380, n274,
        net41595}), .wdata({n363, n248, n364, n250, n251, n252, n253, n254}),
        .raddr({n235, n172, n384}), .rdata(bank_rdata8) );
  payload_ram_bank8x8_6 b09 ( .clk(clk), .we(bank_we[9]), .waddr({n232, n105,
        net41595}), .wdata({n247, wdata_q[6], n249, n345, n347, n349, n351,
        n353}), .raddr({n236, n296, n192}), .rdata(bank_rdata9) );
  payload_ram_bank8x8_5 b10 ( .clk(clk), .we(bank_we[10]), .waddr({n381, n231,
        net40525}), .wdata({n323, n325, n326, n314, n328, n329, n330, n331}),
        .raddr({n237, n388, n375}), .rdata(bank_rdata10) );
  payload_ram_bank8x8_4 b11 ( .clk(clk), .we(bank_we[11]), .waddr({n381, n273,
        net40525}), .wdata({n289, n219, n290, n220, n221, n222, n223, n224}),
        .raddr({n235, n373, n269}), .rdata(bank_rdata11) );
  payload_ram_bank8x8_3 b12 ( .clk(clk), .we(bank_we[12]), .waddr({n379, n272,
        net40525}), .wdata({n310, n303, n312, n7, n316, n318, n320, n322}),
        .raddr({n235, n180, n382}), .rdata(bank_rdata12) );
  payload_ram_bank8x8_2 b13 ( .clk(clk), .we(bank_we[13]), .waddr({n232, n183,
        net34079}), .wdata({n302, n303, n304, n305, n306, n307, n308, n309}),
        .raddr({n236, n297, n226}), .rdata(bank_rdata13) );
  payload_ram_bank8x8_1 b14 ( .clk(clk), .we(bank_we[14]), .waddr({n380, n274,
        net41596}), .wdata({n340, n341, n343, n345, n347, n349, n351, n353}),
        .raddr({n236, n180, n383}), .rdata(bank_rdata14) );
  payload_ram_bank8x8_0 b15 ( .clk(clk), .we(bank_we[15]), .waddr({n233, n208,
        net34081}), .wdata({n333, n335, n337, n338, n306, n307, n308, n309}),
        .raddr({n236, n297, n386}), .rdata(bank_rdata15) );
  NOR2X2 U4 ( .IN1(reset), .IN2(net28306), .QN(N73) );
  NAND2X2 U5 ( .IN1(n392), .IN2(we), .QN(net43939) );
  INVX1 U8 ( .INP(we), .ZN(n393) );
  INVX1 U25 ( .INP(reset), .ZN(n392) );
  DELLN1X2 U368 ( .INP(net34245), .Z(n396) );
  AND2X1 U431 ( .IN1(n393), .IN2(n392), .Q(net43432) );
  AND2X4 U432 ( .IN1(n393), .IN2(n392), .Q(n394) );
  NBUFFX2 U433 ( .INP(net34238), .Z(n398) );
  NBUFFX2 U434 ( .INP(net41958), .Z(n395) );
  NBUFFX2 U435 ( .INP(net34239), .Z(n397) );
endmodule


module bit_accumulator ( clk, reset, clear, preload, load, byte_vld, consume,
        rate, phr_len, byte_in, window );
  input [6:0] phr_len;
  input [7:0] byte_in;
  output [11:0] window;
  input clk, reset, clear, preload, load, byte_vld, consume, rate;
  wire   n7, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n1, n2,
         n3, n4, n5, n6, n8, n9, n10, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81;
  wire   [23:12] acc;

  DFFX1 acc_reg_11_ ( .D(n44), .CLK(clk), .Q(window[11]) );
  DFFX1 acc_reg_10_ ( .D(n45), .CLK(clk), .Q(window[10]), .QN(n6) );
  DFFX1 acc_reg_9_ ( .D(n46), .CLK(clk), .Q(window[9]) );
  DFFX1 acc_reg_8_ ( .D(n47), .CLK(clk), .Q(window[8]) );
  DFFX1 acc_reg_7_ ( .D(n48), .CLK(clk), .Q(window[7]), .QN(n54) );
  AO221X1 U16 ( .IN1(n75), .IN2(window[8]), .IN3(window[2]), .IN4(n61), .IN5(
        n11), .Q(n28) );
  AO221X1 U18 ( .IN1(window[9]), .IN2(n53), .IN3(window[3]), .IN4(n68), .IN5(
        n12), .Q(n29) );
  AO222X1 U19 ( .IN1(acc[15]), .IN2(n8), .IN3(phr_len[3]), .IN4(n80), .IN5(
        window[11]), .IN6(n71), .Q(n12) );
  AO221X1 U22 ( .IN1(window[11]), .IN2(n73), .IN3(window[5]), .IN4(n68), .IN5(
        n14), .Q(n31) );
  AO222X1 U23 ( .IN1(acc[17]), .IN2(n8), .IN3(phr_len[5]), .IN4(n80), .IN5(
        acc[13]), .IN6(n72), .Q(n14) );
  AO222X1 U30 ( .IN1(acc[23]), .IN2(n73), .IN3(byte_in[1]), .IN4(n15), .IN5(
        acc[17]), .IN6(n7), .Q(n38) );
  AO222X1 U31 ( .IN1(acc[22]), .IN2(n75), .IN3(byte_in[0]), .IN4(n15), .IN5(
        acc[16]), .IN6(n7), .Q(n39) );
  AND2X1 U32 ( .IN1(byte_vld), .IN2(n72), .Q(n15) );
  AO222X1 U33 ( .IN1(acc[21]), .IN2(n73), .IN3(acc[23]), .IN4(n70), .IN5(
        acc[15]), .IN6(n66), .Q(n40) );
  AO222X1 U35 ( .IN1(acc[19]), .IN2(n63), .IN3(acc[21]), .IN4(n70), .IN5(
        acc[13]), .IN6(n60), .Q(n42) );
  AO221X1 U37 ( .IN1(acc[17]), .IN2(n73), .IN3(window[11]), .IN4(n66), .IN5(
        n16), .Q(n44) );
  AO22X1 U38 ( .IN1(acc[19]), .IN2(n71), .IN3(acc[23]), .IN4(n51), .Q(n16) );
  AO221X1 U39 ( .IN1(acc[16]), .IN2(n74), .IN3(window[10]), .IN4(n66), .IN5(
        n17), .Q(n45) );
  AO22X1 U40 ( .IN1(acc[18]), .IN2(n72), .IN3(acc[22]), .IN4(n51), .Q(n17) );
  AO221X1 U41 ( .IN1(acc[15]), .IN2(n74), .IN3(window[9]), .IN4(n66), .IN5(n18), .Q(n46) );
  AO22X1 U42 ( .IN1(acc[17]), .IN2(n71), .IN3(acc[21]), .IN4(n8), .Q(n18) );
  AO221X1 U43 ( .IN1(acc[14]), .IN2(n53), .IN3(n60), .IN4(window[8]), .IN5(n19), .Q(n47) );
  AO22X1 U44 ( .IN1(acc[16]), .IN2(n72), .IN3(acc[20]), .IN4(n51), .Q(n19) );
  AO221X1 U45 ( .IN1(acc[13]), .IN2(n75), .IN3(window[7]), .IN4(n68), .IN5(n20), .Q(n48) );
  AO22X1 U46 ( .IN1(acc[15]), .IN2(n71), .IN3(acc[19]), .IN4(n51), .Q(n20) );
  AO221X1 U47 ( .IN1(n53), .IN2(acc[12]), .IN3(n68), .IN4(window[6]), .IN5(n21), .Q(n49) );
  AO222X1 U48 ( .IN1(acc[18]), .IN2(n8), .IN3(phr_len[6]), .IN4(n80), .IN5(
        acc[14]), .IN6(n71), .Q(n21) );
  AND4X1 U49 ( .IN1(n25), .IN2(n24), .IN3(n22), .IN4(n23), .Q(n7) );
  DFFX1 acc_reg_20_ ( .D(n35), .CLK(clk), .Q(acc[20]), .QN(n58) );
  DFFX1 acc_reg_23_ ( .D(n32), .CLK(clk), .Q(acc[23]) );
  DFFX1 acc_reg_22_ ( .D(n33), .CLK(clk), .Q(acc[22]) );
  DFFX1 acc_reg_19_ ( .D(n36), .CLK(clk), .Q(acc[19]) );
  DFFX1 acc_reg_18_ ( .D(n37), .CLK(clk), .Q(acc[18]), .QN(n57) );
  DFFX1 acc_reg_21_ ( .D(n34), .CLK(clk), .Q(acc[21]) );
  DFFX1 acc_reg_0_ ( .D(n26), .CLK(clk), .Q(window[0]), .QN(n10) );
  DFFX1 acc_reg_17_ ( .D(n38), .CLK(clk), .Q(acc[17]) );
  DFFX1 acc_reg_14_ ( .D(n41), .CLK(clk), .Q(acc[14]), .QN(n52) );
  DFFX1 acc_reg_6_ ( .D(n49), .CLK(clk), .Q(window[6]), .QN(n9) );
  DFFX1 acc_reg_2_ ( .D(n28), .CLK(clk), .Q(window[2]) );
  DFFX1 acc_reg_3_ ( .D(n29), .CLK(clk), .Q(window[3]) );
  DFFX1 acc_reg_5_ ( .D(n31), .CLK(clk), .Q(window[5]) );
  DFFX1 acc_reg_1_ ( .D(n27), .CLK(clk), .Q(window[1]), .QN(n55) );
  DFFX1 acc_reg_16_ ( .D(n39), .CLK(clk), .Q(acc[16]) );
  DFFX1 acc_reg_15_ ( .D(n40), .CLK(clk), .Q(acc[15]) );
  DFFX1 acc_reg_13_ ( .D(n42), .CLK(clk), .Q(acc[13]) );
  DFFX1 acc_reg_12_ ( .D(n43), .CLK(clk), .Q(acc[12]), .QN(n59) );
  DFFX1 acc_reg_4_ ( .D(n30), .CLK(clk), .Q(window[4]) );
  NBUFFX2 U3 ( .INP(n79), .Z(n70) );
  NBUFFX2 U4 ( .INP(n63), .Z(n53) );
  NBUFFX2 U5 ( .INP(n63), .Z(n74) );
  AO22X1 U6 ( .IN1(acc[21]), .IN2(n60), .IN3(byte_in[5]), .IN4(n15), .Q(n34)
         );
  AO22X1 U7 ( .IN1(acc[18]), .IN2(n61), .IN3(byte_in[2]), .IN4(n15), .Q(n37)
         );
  AO22X1 U8 ( .IN1(acc[19]), .IN2(n68), .IN3(byte_in[3]), .IN4(n15), .Q(n36)
         );
  AO22X1 U9 ( .IN1(acc[22]), .IN2(n61), .IN3(byte_in[6]), .IN4(n15), .Q(n33)
         );
  AO22X1 U10 ( .IN1(acc[23]), .IN2(n64), .IN3(byte_in[7]), .IN4(n15), .Q(n32)
         );
  AO22X1 U11 ( .IN1(acc[20]), .IN2(n61), .IN3(byte_in[4]), .IN4(n15), .Q(n35)
         );
  NBUFFX2 U12 ( .INP(n64), .Z(n60) );
  NBUFFX2 U13 ( .INP(n65), .Z(n66) );
  NBUFFX2 U14 ( .INP(n63), .Z(n73) );
  NBUFFX2 U15 ( .INP(n63), .Z(n75) );
  OR2X1 U17 ( .IN1(n24), .IN2(n76), .Q(n62) );
  NBUFFX2 U20 ( .INP(n79), .Z(n72) );
  NAND3X0 U21 ( .IN1(n25), .IN2(n81), .IN3(load), .QN(n22) );
  AND3X1 U24 ( .IN1(n25), .IN2(n78), .IN3(n81), .Q(n1) );
  AO221X1 U25 ( .IN1(window[10]), .IN2(n75), .IN3(window[4]), .IN4(n61), .IN5(
        n13), .Q(n30) );
  AOI222X1 U26 ( .IN1(acc[12]), .IN2(n8), .IN3(phr_len[0]), .IN4(n80), .IN5(
        window[8]), .IN6(n72), .QN(n50) );
  INVX0 U27 ( .INP(phr_len[2]), .ZN(n5) );
  NAND2X0 U28 ( .IN1(acc[16]), .IN2(n8), .QN(n2) );
  NAND2X0 U29 ( .IN1(phr_len[4]), .IN2(n80), .QN(n3) );
  NAND2X0 U34 ( .IN1(n70), .IN2(acc[12]), .QN(n4) );
  NAND3X0 U36 ( .IN1(n2), .IN2(n3), .IN3(n4), .QN(n13) );
  NAND2X0 U50 ( .IN1(n1), .IN2(consume), .QN(n24) );
  AO222X1 U51 ( .IN1(acc[20]), .IN2(n74), .IN3(acc[22]), .IN4(n70), .IN5(
        acc[14]), .IN6(n64), .Q(n41) );
  OAI222X1 U52 ( .IN1(n52), .IN2(n69), .IN3(n5), .IN4(n23), .IN5(n6), .IN6(n22), .QN(n11) );
  INVX0 U53 ( .INP(n69), .ZN(n8) );
  OAI221X1 U54 ( .IN1(n9), .IN2(n62), .IN3(n10), .IN4(n67), .IN5(n50), .QN(n26) );
  INVX0 U55 ( .INP(n69), .ZN(n51) );
  OAI221X1 U56 ( .IN1(n54), .IN2(n62), .IN3(n55), .IN4(n67), .IN5(n56), .QN(
        n27) );
  AOI222X1 U57 ( .IN1(acc[13]), .IN2(n51), .IN3(phr_len[1]), .IN4(n80), .IN5(
        window[9]), .IN6(n71), .QN(n56) );
  OAI222X1 U58 ( .IN1(n57), .IN2(n62), .IN3(n58), .IN4(n22), .IN5(n67), .IN6(
        n59), .QN(n43) );
  INVX0 U59 ( .INP(n67), .ZN(n61) );
  INVX0 U60 ( .INP(n62), .ZN(n63) );
  NBUFFX2 U61 ( .INP(n65), .Z(n64) );
  INVX0 U62 ( .INP(n67), .ZN(n65) );
  INVX0 U63 ( .INP(n7), .ZN(n67) );
  INVX0 U64 ( .INP(n67), .ZN(n68) );
  INVX0 U65 ( .INP(rate), .ZN(n77) );
  NBUFFX2 U66 ( .INP(n79), .Z(n71) );
  OR2X1 U67 ( .IN1(n77), .IN2(n24), .Q(n69) );
  INVX0 U68 ( .INP(n22), .ZN(n79) );
  INVX0 U69 ( .INP(n23), .ZN(n80) );
  INVX0 U70 ( .INP(load), .ZN(n78) );
  NOR2X0 U71 ( .IN1(reset), .IN2(clear), .QN(n25) );
  NAND2X0 U72 ( .IN1(preload), .IN2(n25), .QN(n23) );
  INVX0 U73 ( .INP(preload), .ZN(n81) );
  INVX0 U74 ( .INP(n77), .ZN(n76) );
endmodule


module iq_demux ( bits_in, i_bits, q_bits );
  input [11:0] bits_in;
  output [5:0] i_bits;
  output [5:0] q_bits;


  NBUFFX2 U1 ( .INP(bits_in[4]), .Z(i_bits[2]) );
  NBUFFX2 U2 ( .INP(bits_in[11]), .Z(q_bits[5]) );
  NBUFFX2 U3 ( .INP(bits_in[5]), .Z(q_bits[2]) );
  NBUFFX2 U4 ( .INP(bits_in[1]), .Z(q_bits[0]) );
  NBUFFX2 U5 ( .INP(bits_in[0]), .Z(i_bits[0]) );
  NBUFFX2 U6 ( .INP(bits_in[7]), .Z(q_bits[3]) );
  NBUFFX2 U7 ( .INP(bits_in[6]), .Z(i_bits[3]) );
  NBUFFX2 U8 ( .INP(bits_in[10]), .Z(i_bits[5]) );
  NBUFFX2 U9 ( .INP(bits_in[9]), .Z(q_bits[4]) );
  NBUFFX2 U10 ( .INP(bits_in[8]), .Z(i_bits[4]) );
  NBUFFX2 U11 ( .INP(bits_in[3]), .Z(q_bits[1]) );
  NBUFFX2 U12 ( .INP(bits_in[2]), .Z(i_bits[1]) );
endmodule


module symbol_mapper_1 ( rate, bits_in, codeword );
  input [5:0] bits_in;
  output [31:0] codeword;
  input rate;
  wire   n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n21, n22,
         n23, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n1, n2, n3, n4, n5, n6, n7, n20, n24, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50;

  OAI22X1 U41 ( .IN1(n17), .IN2(n2), .IN3(n12), .IN4(n45), .QN(codeword[3]) );
  XOR2X1 U43 ( .IN1(n22), .IN2(n3), .Q(n21) );
  XOR2X1 U46 ( .IN1(n49), .IN2(n3), .Q(n26) );
  XOR2X1 U59 ( .IN1(bits_in[4]), .IN2(n49), .Q(n22) );
  XOR2X1 U60 ( .IN1(bits_in[5]), .IN2(n49), .Q(n25) );
  XOR2X1 U61 ( .IN1(n50), .IN2(bits_in[1]), .Q(n23) );
  XOR2X1 U62 ( .IN1(n12), .IN2(n3), .Q(n34) );
  XOR2X1 U63 ( .IN1(n14), .IN2(n3), .Q(n35) );
  XOR2X1 U64 ( .IN1(n9), .IN2(n3), .Q(n36) );
  XOR2X1 U65 ( .IN1(bits_in[5]), .IN2(n6), .Q(n9) );
  XOR2X1 U69 ( .IN1(bits_in[5]), .IN2(n14), .Q(n12) );
  XOR2X1 U71 ( .IN1(bits_in[4]), .IN2(n6), .Q(n14) );
  XOR2X1 U2 ( .IN1(n5), .IN2(n25), .Q(n29) );
  XNOR2X1 U3 ( .IN1(n19), .IN2(n3), .Q(n18) );
  OAI22X1 U4 ( .IN1(n44), .IN2(n9), .IN3(n2), .IN4(n10), .QN(codeword[1]) );
  NBUFFX2 U5 ( .INP(n45), .Z(n43) );
  XNOR2X1 U6 ( .IN1(n22), .IN2(bits_in[5]), .Q(n19) );
  AO22X1 U7 ( .IN1(n23), .IN2(n42), .IN3(n46), .IN4(n2), .Q(codeword[2]) );
  XOR2X1 U8 ( .IN1(n20), .IN2(n9), .Q(n15) );
  XOR2X1 U9 ( .IN1(n20), .IN2(n14), .Q(n13) );
  XOR2X1 U10 ( .IN1(n20), .IN2(n12), .Q(n11) );
  XOR2X1 U11 ( .IN1(bits_in[2]), .IN2(n9), .Q(n8) );
  XOR2X1 U12 ( .IN1(n5), .IN2(n14), .Q(n39) );
  XOR2X1 U13 ( .IN1(n5), .IN2(n12), .Q(n38) );
  NOR2X0 U14 ( .IN1(n42), .IN2(n35), .QN(codeword[14]) );
  AND2X1 U15 ( .IN1(n2), .IN2(n19), .Q(codeword[19]) );
  XOR2X1 U16 ( .IN1(n20), .IN2(n25), .Q(n32) );
  XOR2X1 U17 ( .IN1(n5), .IN2(n22), .Q(n28) );
  INVX0 U18 ( .INP(rate), .ZN(n1) );
  INVX0 U19 ( .INP(n1), .ZN(n2) );
  XOR2X1 U20 ( .IN1(n48), .IN2(n47), .Q(n3) );
  NBUFFX2 U21 ( .INP(n45), .Z(n40) );
  NBUFFX2 U22 ( .INP(n45), .Z(n24) );
  XOR2X1 U23 ( .IN1(n7), .IN2(n23), .Q(n17) );
  NBUFFX2 U24 ( .INP(n45), .Z(n42) );
  NBUFFX2 U25 ( .INP(n45), .Z(n44) );
  NBUFFX2 U26 ( .INP(n45), .Z(n41) );
  NOR2X0 U27 ( .IN1(n4), .IN2(n24), .QN(codeword[29]) );
  XOR2X1 U28 ( .IN1(n3), .IN2(n25), .Q(n4) );
  INVX0 U29 ( .INP(n7), .ZN(n5) );
  NBUFFX2 U30 ( .INP(n48), .Z(n7) );
  XOR2X1 U31 ( .IN1(n6), .IN2(n3), .Q(n37) );
  NOR2X0 U32 ( .IN1(n40), .IN2(n36), .QN(codeword[13]) );
  XOR2X1 U33 ( .IN1(n50), .IN2(n7), .Q(n10) );
  NBUFFX2 U34 ( .INP(bits_in[0]), .Z(n6) );
  XOR2X1 U35 ( .IN1(n20), .IN2(n6), .Q(n16) );
  NOR2X0 U36 ( .IN1(n30), .IN2(n44), .QN(codeword[23]) );
  XOR2X1 U37 ( .IN1(n7), .IN2(n19), .Q(n27) );
  XOR2X1 U38 ( .IN1(n47), .IN2(n19), .Q(n30) );
  XOR2X1 U39 ( .IN1(bits_in[3]), .IN2(n22), .Q(n31) );
  XOR2X1 U40 ( .IN1(n20), .IN2(n49), .Q(n33) );
  NBUFFX2 U42 ( .INP(bits_in[3]), .Z(n20) );
  NOR2X0 U44 ( .IN1(n44), .IN2(n21), .QN(codeword[30]) );
  NOR2X0 U45 ( .IN1(n40), .IN2(n10), .QN(codeword[8]) );
  NOR2X0 U47 ( .IN1(n44), .IN2(n49), .QN(codeword[16]) );
  NOR2X0 U48 ( .IN1(n24), .IN2(n25), .QN(codeword[17]) );
  NOR2X0 U49 ( .IN1(n43), .IN2(n22), .QN(codeword[18]) );
  NOR2X0 U50 ( .IN1(n42), .IN2(n17), .QN(codeword[24]) );
  NOR2X0 U51 ( .IN1(n43), .IN2(n34), .QN(codeword[15]) );
  NOR2X0 U52 ( .IN1(n41), .IN2(n27), .QN(codeword[27]) );
  NOR2X0 U53 ( .IN1(n24), .IN2(n26), .QN(codeword[28]) );
  NOR2X0 U54 ( .IN1(n40), .IN2(n18), .QN(codeword[31]) );
  INVX0 U55 ( .INP(n14), .ZN(n46) );
  NOR2X0 U56 ( .IN1(n24), .IN2(n16), .QN(codeword[4]) );
  NOR2X0 U57 ( .IN1(n41), .IN2(n15), .QN(codeword[5]) );
  NOR2X0 U58 ( .IN1(n43), .IN2(n13), .QN(codeword[6]) );
  NOR2X0 U66 ( .IN1(n41), .IN2(n11), .QN(codeword[7]) );
  NOR2X0 U67 ( .IN1(n41), .IN2(n33), .QN(codeword[20]) );
  NOR2X0 U68 ( .IN1(n42), .IN2(n32), .QN(codeword[21]) );
  NOR2X0 U70 ( .IN1(n43), .IN2(n31), .QN(codeword[22]) );
  NOR2X0 U72 ( .IN1(n42), .IN2(n37), .QN(codeword[12]) );
  NOR2X0 U73 ( .IN1(n24), .IN2(n29), .QN(codeword[25]) );
  NOR2X0 U74 ( .IN1(n40), .IN2(n28), .QN(codeword[26]) );
  NOR2X0 U75 ( .IN1(n41), .IN2(n8), .QN(codeword[9]) );
  NOR2X0 U76 ( .IN1(n40), .IN2(n39), .QN(codeword[10]) );
  NOR2X0 U77 ( .IN1(n43), .IN2(n38), .QN(codeword[11]) );
  INVX0 U78 ( .INP(bits_in[3]), .ZN(n47) );
  INVX0 U79 ( .INP(bits_in[2]), .ZN(n48) );
  INVX0 U80 ( .INP(n23), .ZN(n49) );
  INVX0 U81 ( .INP(bits_in[0]), .ZN(n50) );
  INVX0 U82 ( .INP(n6), .ZN(codeword[0]) );
  INVX0 U83 ( .INP(n2), .ZN(n45) );
endmodule


module symbol_mapper_0 ( rate, bits_in, codeword );
  input [5:0] bits_in;
  output [31:0] codeword;
  input rate;
  wire   n1, n2, n3, n4, n5, n6, n7, n20, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80;

  XOR2X1 U47 ( .IN1(n47), .IN2(n69), .Q(n62) );
  XOR2X1 U56 ( .IN1(n49), .IN2(n47), .Q(n78) );
  XOR2X1 U59 ( .IN1(bits_in[4]), .IN2(n48), .Q(n67) );
  XOR2X1 U61 ( .IN1(n49), .IN2(bits_in[1]), .Q(n66) );
  XOR2X1 U62 ( .IN1(n76), .IN2(n1), .Q(n55) );
  XOR2X1 U63 ( .IN1(n74), .IN2(n1), .Q(n54) );
  XOR2X1 U71 ( .IN1(bits_in[4]), .IN2(n4), .Q(n74) );
  NBUFFX2 U2 ( .INP(n43), .Z(n20) );
  XOR2X1 U3 ( .IN1(n2), .IN2(n74), .Q(n76) );
  NBUFFX2 U4 ( .INP(n41), .Z(n7) );
  XOR2X1 U5 ( .IN1(n2), .IN2(n4), .Q(n79) );
  XOR2X1 U6 ( .IN1(n47), .IN2(n66), .Q(n71) );
  XOR2X1 U7 ( .IN1(bits_in[5]), .IN2(n48), .Q(n64) );
  OAI22X1 U8 ( .IN1(n71), .IN2(n5), .IN3(n76), .IN4(n44), .QN(codeword[3]) );
  XOR2X1 U9 ( .IN1(n6), .IN2(n79), .Q(n73) );
  XOR2X1 U10 ( .IN1(n6), .IN2(n74), .Q(n75) );
  XOR2X1 U11 ( .IN1(n6), .IN2(n76), .Q(n77) );
  XOR2X1 U12 ( .IN1(n3), .IN2(n79), .Q(n80) );
  XOR2X1 U13 ( .IN1(n3), .IN2(n74), .Q(n50) );
  XOR2X1 U14 ( .IN1(n3), .IN2(n76), .Q(n51) );
  XOR2X1 U15 ( .IN1(n79), .IN2(n1), .Q(n53) );
  AND2X1 U16 ( .IN1(n5), .IN2(n69), .Q(codeword[19]) );
  XOR2X1 U17 ( .IN1(n3), .IN2(n64), .Q(n60) );
  XOR2X1 U18 ( .IN1(n3), .IN2(n67), .Q(n61) );
  XOR2X1 U19 ( .IN1(n1), .IN2(n64), .Q(n65) );
  XOR2X1 U20 ( .IN1(n47), .IN2(n46), .Q(n1) );
  NBUFFX2 U21 ( .INP(n44), .Z(n40) );
  NBUFFX2 U22 ( .INP(n44), .Z(n42) );
  NBUFFX2 U23 ( .INP(n44), .Z(n43) );
  NBUFFX2 U24 ( .INP(n44), .Z(n41) );
  OAI22X2 U25 ( .IN1(n44), .IN2(n79), .IN3(n78), .IN4(n5), .QN(codeword[1]) );
  NBUFFX2 U26 ( .INP(bits_in[5]), .Z(n2) );
  NOR2X0 U27 ( .IN1(n40), .IN2(n70), .QN(codeword[31]) );
  XOR2X1 U28 ( .IN1(n6), .IN2(n64), .Q(n57) );
  NOR2X0 U29 ( .IN1(n42), .IN2(n54), .QN(codeword[14]) );
  XOR2X1 U30 ( .IN1(n46), .IN2(n69), .Q(n59) );
  XNOR2X1 U31 ( .IN1(n1), .IN2(n69), .Q(n70) );
  XNOR2X1 U32 ( .IN1(n67), .IN2(n2), .Q(n69) );
  NBUFFX2 U33 ( .INP(bits_in[2]), .Z(n3) );
  XOR2X1 U34 ( .IN1(n4), .IN2(n1), .Q(n52) );
  NOR2X0 U35 ( .IN1(n40), .IN2(n53), .QN(codeword[13]) );
  XOR2X1 U36 ( .IN1(n48), .IN2(n1), .Q(n63) );
  XOR2X1 U37 ( .IN1(n67), .IN2(n1), .Q(n68) );
  NBUFFX2 U38 ( .INP(bits_in[0]), .Z(n4) );
  XOR2X1 U39 ( .IN1(bits_in[3]), .IN2(n4), .Q(n72) );
  AO22X1 U40 ( .IN1(n66), .IN2(n44), .IN3(n45), .IN4(n5), .Q(codeword[2]) );
  XOR2X1 U41 ( .IN1(n6), .IN2(n48), .Q(n56) );
  XOR2X1 U42 ( .IN1(n6), .IN2(n67), .Q(n58) );
  NBUFFX2 U43 ( .INP(rate), .Z(n5) );
  NBUFFX2 U44 ( .INP(bits_in[3]), .Z(n6) );
  NOR2X0 U45 ( .IN1(n7), .IN2(n78), .QN(codeword[8]) );
  NOR2X0 U46 ( .IN1(n42), .IN2(n55), .QN(codeword[15]) );
  NOR2X0 U48 ( .IN1(n40), .IN2(n63), .QN(codeword[28]) );
  NOR2X0 U49 ( .IN1(n68), .IN2(n20), .QN(codeword[30]) );
  NOR2X0 U50 ( .IN1(n7), .IN2(n65), .QN(codeword[29]) );
  NOR2X0 U51 ( .IN1(n43), .IN2(n48), .QN(codeword[16]) );
  NOR2X0 U52 ( .IN1(n41), .IN2(n64), .QN(codeword[17]) );
  NOR2X0 U53 ( .IN1(n42), .IN2(n67), .QN(codeword[18]) );
  NOR2X0 U54 ( .IN1(n43), .IN2(n59), .QN(codeword[23]) );
  NOR2X0 U55 ( .IN1(n41), .IN2(n71), .QN(codeword[24]) );
  NOR2X0 U57 ( .IN1(n20), .IN2(n62), .QN(codeword[27]) );
  INVX0 U58 ( .INP(bits_in[3]), .ZN(n46) );
  NOR2X0 U60 ( .IN1(n41), .IN2(n52), .QN(codeword[12]) );
  INVX0 U64 ( .INP(n74), .ZN(n45) );
  NOR2X0 U65 ( .IN1(n7), .IN2(n72), .QN(codeword[4]) );
  NOR2X0 U66 ( .IN1(n20), .IN2(n73), .QN(codeword[5]) );
  NOR2X0 U67 ( .IN1(n42), .IN2(n75), .QN(codeword[6]) );
  NOR2X0 U68 ( .IN1(n40), .IN2(n77), .QN(codeword[7]) );
  NOR2X0 U69 ( .IN1(n43), .IN2(n56), .QN(codeword[20]) );
  NOR2X0 U70 ( .IN1(n41), .IN2(n57), .QN(codeword[21]) );
  NOR2X0 U72 ( .IN1(n42), .IN2(n58), .QN(codeword[22]) );
  NOR2X0 U73 ( .IN1(n43), .IN2(n60), .QN(codeword[25]) );
  NOR2X0 U74 ( .IN1(n7), .IN2(n61), .QN(codeword[26]) );
  NOR2X0 U75 ( .IN1(n20), .IN2(n80), .QN(codeword[9]) );
  NOR2X0 U76 ( .IN1(n40), .IN2(n50), .QN(codeword[10]) );
  NOR2X0 U77 ( .IN1(n40), .IN2(n51), .QN(codeword[11]) );
  INVX0 U78 ( .INP(bits_in[2]), .ZN(n47) );
  INVX0 U79 ( .INP(n66), .ZN(n48) );
  INVX0 U80 ( .INP(bits_in[0]), .ZN(n49) );
  INVX0 U81 ( .INP(n4), .ZN(codeword[0]) );
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
  wire   n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, srl_49_net27690,
         srl_48_net27893, srl_48_net27894, srl_48_net27895, srl_48_net27896,
         srl_48_net27901, srl_48_net27902, srl_48_net27903, srl_48_net27904,
         net28322, net33761, net34197, net34195, net34189, net34185, net34183,
         net34201, net34287, net34305, net38415, net39275, net39695, n1, n2,
         n3, n4, n5, n6, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, n133, n134, n135, n136, n137, n138, n139, n140, n141, n142,
         n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153,
         n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175,
         n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, n186,
         n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197,
         n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208,
         n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219,
         n220, n221, n222, n223, n224, n225, n226, n227, n228, n229, n230,
         n231, n232, n233, n234, n235, n236, n237, n238, n239, n240, n241,
         n242, n243, n244, n245, n246, n247, n248, n249, n250, n251, n252,
         n253, n254, n255, n256, n257, n258, n259, n260, n261, n262, n263,
         n264, n265, n266, n267, n268, n269, n270, n271, n272, n273, n274,
         n275;
  wire   [31:0] hold_i;
  wire   [31:0] hold_q;
  wire   [3:0] sel_i;
  wire   [3:1] sel_q;

  DFFX1 hold_q_reg_31_ ( .D(n72), .CLK(clk), .Q(hold_q[31]) );
  DFFX1 hold_q_reg_30_ ( .D(n71), .CLK(clk), .Q(hold_q[30]) );
  DFFX1 hold_q_reg_29_ ( .D(n70), .CLK(clk), .Q(hold_q[29]) );
  DFFX1 hold_q_reg_28_ ( .D(n69), .CLK(clk), .Q(hold_q[28]) );
  DFFX1 hold_q_reg_27_ ( .D(n68), .CLK(clk), .Q(hold_q[27]) );
  DFFX1 hold_q_reg_26_ ( .D(n67), .CLK(clk), .Q(hold_q[26]) );
  DFFX1 hold_q_reg_25_ ( .D(n66), .CLK(clk), .Q(hold_q[25]), .QN(n164) );
  DFFX1 hold_q_reg_24_ ( .D(n65), .CLK(clk), .Q(hold_q[24]) );
  DFFX1 hold_q_reg_23_ ( .D(n64), .CLK(clk), .Q(hold_q[23]) );
  DFFX1 hold_q_reg_22_ ( .D(n63), .CLK(clk), .Q(hold_q[22]) );
  DFFX1 hold_q_reg_21_ ( .D(n62), .CLK(clk), .Q(hold_q[21]) );
  DFFX1 hold_q_reg_20_ ( .D(n61), .CLK(clk), .Q(hold_q[20]) );
  DFFX1 hold_q_reg_19_ ( .D(n60), .CLK(clk), .Q(hold_q[19]) );
  DFFX1 hold_q_reg_18_ ( .D(n59), .CLK(clk), .Q(hold_q[18]) );
  DFFX1 hold_q_reg_17_ ( .D(n58), .CLK(clk), .Q(hold_q[17]), .QN(n163) );
  DFFX1 hold_q_reg_16_ ( .D(n57), .CLK(clk), .Q(hold_q[16]), .QN(n95) );
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
  DFFX1 hold_q_reg_4_ ( .D(n45), .CLK(clk), .Q(hold_q[4]), .QN(n96) );
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
  AO22X1 U5 ( .IN1(sel_q[3]), .IN2(rate), .IN3(cw_q[3]), .IN4(net33761), .Q(
        nib_q[3]) );
  AO22X1 U8 ( .IN1(sel_q[2]), .IN2(net39695), .IN3(cw_q[2]), .IN4(net33761),
        .Q(nib_q[2]) );
  AO22X1 U12 ( .IN1(sel_i[2]), .IN2(net39695), .IN3(cw_i[2]), .IN4(net33761),
        .Q(nib_i[2]) );
  AO22X1 U14 ( .IN1(sel_i[0]), .IN2(net39695), .IN3(cw_i[0]), .IN4(net33761),
        .Q(nib_i[0]) );
  AO22X1 U15 ( .IN1(hold_i[0]), .IN2(n124), .IN3(n6), .IN4(cw_i[0]), .Q(n9) );
  AO22X1 U20 ( .IN1(hold_i[5]), .IN2(n120), .IN3(cw_i[5]), .IN4(n80), .Q(n14)
         );
  AO22X1 U24 ( .IN1(hold_i[9]), .IN2(n118), .IN3(cw_i[9]), .IN4(n73), .Q(n18)
         );
  AO22X1 U26 ( .IN1(hold_i[11]), .IN2(n117), .IN3(cw_i[11]), .IN4(n80), .Q(n20) );
  AO22X1 U28 ( .IN1(hold_i[13]), .IN2(n150), .IN3(cw_i[13]), .IN4(n83), .Q(n22) );
  AO22X1 U30 ( .IN1(hold_i[15]), .IN2(n135), .IN3(cw_i[15]), .IN4(n5), .Q(n24)
         );
  AO22X1 U31 ( .IN1(hold_i[16]), .IN2(n151), .IN3(cw_i[16]), .IN4(n82), .Q(n25) );
  AO22X1 U33 ( .IN1(hold_i[18]), .IN2(n152), .IN3(cw_i[18]), .IN4(n85), .Q(n27) );
  AO22X1 U36 ( .IN1(hold_i[21]), .IN2(n123), .IN3(cw_i[21]), .IN4(n78), .Q(n30) );
  AO22X1 U37 ( .IN1(hold_i[22]), .IN2(n162), .IN3(cw_i[22]), .IN4(n6), .Q(n31)
         );
  AO22X1 U41 ( .IN1(hold_i[26]), .IN2(n161), .IN3(cw_i[26]), .IN4(n77), .Q(n35) );
  AO22X1 U42 ( .IN1(hold_i[27]), .IN2(n162), .IN3(cw_i[27]), .IN4(n85), .Q(n36) );
  AO22X1 U43 ( .IN1(hold_i[28]), .IN2(n146), .IN3(cw_i[28]), .IN4(n3), .Q(n37)
         );
  AO22X1 U47 ( .IN1(hold_q[0]), .IN2(n154), .IN3(n3), .IN4(cw_q[0]), .Q(n41)
         );
  AO22X1 U49 ( .IN1(hold_q[2]), .IN2(n154), .IN3(n4), .IN4(cw_q[2]), .Q(n43)
         );
  AO22X1 U52 ( .IN1(hold_q[5]), .IN2(n154), .IN3(cw_q[5]), .IN4(n84), .Q(n46)
         );
  AO22X1 U53 ( .IN1(hold_q[6]), .IN2(n134), .IN3(cw_q[6]), .IN4(n84), .Q(n47)
         );
  AO22X1 U54 ( .IN1(hold_q[7]), .IN2(n156), .IN3(cw_q[7]), .IN4(n83), .Q(n48)
         );
  AO22X1 U55 ( .IN1(hold_q[8]), .IN2(n127), .IN3(cw_q[8]), .IN4(n77), .Q(n49)
         );
  AO22X1 U56 ( .IN1(hold_q[9]), .IN2(n128), .IN3(cw_q[9]), .IN4(n83), .Q(n50)
         );
  AO22X1 U57 ( .IN1(hold_q[10]), .IN2(n128), .IN3(cw_q[10]), .IN4(n3), .Q(n51)
         );
  AO22X1 U58 ( .IN1(hold_q[11]), .IN2(net34189), .IN3(cw_q[11]), .IN4(n82),
        .Q(n52) );
  AO22X1 U62 ( .IN1(hold_q[15]), .IN2(n129), .IN3(cw_q[15]), .IN4(n73), .Q(n56) );
  AO22X1 U63 ( .IN1(hold_q[16]), .IN2(n140), .IN3(cw_q[16]), .IN4(n73), .Q(n57) );
  AO22X1 U64 ( .IN1(hold_q[17]), .IN2(n130), .IN3(cw_q[17]), .IN4(n84), .Q(n58) );
  AO22X1 U65 ( .IN1(hold_q[18]), .IN2(n139), .IN3(cw_q[18]), .IN4(n6), .Q(n59)
         );
  AO22X1 U66 ( .IN1(hold_q[19]), .IN2(n138), .IN3(cw_q[19]), .IN4(n79), .Q(n60) );
  AO22X1 U68 ( .IN1(hold_q[21]), .IN2(n129), .IN3(cw_q[21]), .IN4(n77), .Q(n62) );
  AO22X1 U69 ( .IN1(hold_q[22]), .IN2(n148), .IN3(cw_q[22]), .IN4(n81), .Q(n63) );
  AO22X1 U70 ( .IN1(hold_q[23]), .IN2(n130), .IN3(cw_q[23]), .IN4(n5), .Q(n64)
         );
  AO22X1 U73 ( .IN1(hold_q[26]), .IN2(n151), .IN3(cw_q[26]), .IN4(n74), .Q(n67) );
  AO22X1 U74 ( .IN1(hold_q[27]), .IN2(n133), .IN3(cw_q[27]), .IN4(n83), .Q(n68) );
  AO22X1 U76 ( .IN1(hold_q[29]), .IN2(n135), .IN3(cw_q[29]), .IN4(n74), .Q(n70) );
  NOR3X0 U80 ( .IN1(clear), .IN2(reset), .IN3(n229), .QN(n8) );
  INVX0 U3 ( .INP(n97), .ZN(n1) );
  INVX0 U4 ( .INP(n97), .ZN(n2) );
  NBUFFX2 U6 ( .INP(n1), .Z(n3) );
  NBUFFX2 U7 ( .INP(n1), .Z(n4) );
  NBUFFX2 U9 ( .INP(n1), .Z(n5) );
  NBUFFX2 U10 ( .INP(n2), .Z(n6) );
  NBUFFX2 U11 ( .INP(n2), .Z(n73) );
  NBUFFX2 U13 ( .INP(n2), .Z(n74) );
  INVX0 U16 ( .INP(n8), .ZN(n75) );
  INVX0 U17 ( .INP(n8), .ZN(n76) );
  INVX0 U18 ( .INP(n75), .ZN(n77) );
  INVX0 U19 ( .INP(n75), .ZN(n78) );
  INVX0 U21 ( .INP(n75), .ZN(n79) );
  INVX0 U22 ( .INP(n75), .ZN(n80) );
  INVX0 U23 ( .INP(n75), .ZN(n81) );
  INVX0 U25 ( .INP(n76), .ZN(n82) );
  INVX0 U27 ( .INP(n76), .ZN(n83) );
  INVX0 U29 ( .INP(n76), .ZN(n84) );
  INVX0 U32 ( .INP(n76), .ZN(n85) );
  INVX0 U34 ( .INP(n76), .ZN(n86) );
  NBUFFX4 U35 ( .INP(n8), .Z(net34201) );
  AND2X1 U38 ( .IN1(cw_i[9]), .IN2(n170), .Q(n114) );
  AO22X1 U39 ( .IN1(cw_i[31]), .IN2(n224), .IN3(cw_i[23]), .IN4(n228), .Q(n245) );
  INVX0 U40 ( .INP(cw_q[16]), .ZN(n196) );
  AO22X1 U44 ( .IN1(cw_q[9]), .IN2(n225), .IN3(cw_q[1]), .IN4(net34287), .Q(
        n253) );
  NAND2X1 U45 ( .IN1(cw_q[22]), .IN2(net34287), .QN(n113) );
  AO22X1 U46 ( .IN1(cw_i[10]), .IN2(n225), .IN3(cw_i[2]), .IN4(n226), .Q(n237)
         );
  AO22X1 U48 ( .IN1(cw_i[11]), .IN2(n224), .IN3(n104), .IN4(n227), .Q(n244) );
  OR2X1 U50 ( .IN1(net28322), .IN2(n167), .Q(n218) );
  OR2X1 U51 ( .IN1(n183), .IN2(nib_idx[1]), .Q(n217) );
  OR2X2 U59 ( .IN1(clear), .IN2(reset), .Q(n100) );
  NAND2X1 U60 ( .IN1(hold_q[12]), .IN2(srl_49_net27690), .QN(n203) );
  NAND2X1 U61 ( .IN1(hold_q[20]), .IN2(n216), .QN(n205) );
  NAND2X1 U67 ( .IN1(hold_q[24]), .IN2(n222), .QN(n200) );
  NAND2X1 U71 ( .IN1(hold_q[0]), .IN2(n216), .QN(n201) );
  NAND2X1 U72 ( .IN1(cw_q[0]), .IN2(n216), .QN(n207) );
  AND2X1 U75 ( .IN1(net28322), .IN2(n183), .Q(n216) );
  INVX0 U77 ( .INP(n218), .ZN(n225) );
  NBUFFX2 U78 ( .INP(n246), .Z(n228) );
  NBUFFX2 U79 ( .INP(n246), .Z(n226) );
  NBUFFX2 U81 ( .INP(n120), .Z(n119) );
  NBUFFX2 U82 ( .INP(n117), .Z(n118) );
  NBUFFX2 U83 ( .INP(net34185), .Z(n121) );
  NBUFFX2 U84 ( .INP(n120), .Z(n123) );
  NBUFFX2 U85 ( .INP(cw_i[29]), .Z(n179) );
  NBUFFX2 U86 ( .INP(n122), .Z(n125) );
  NAND2X1 U87 ( .IN1(net33761), .IN2(cw_q[0]), .QN(n193) );
  AO22X1 U88 ( .IN1(hold_i[1]), .IN2(n121), .IN3(n5), .IN4(n108), .Q(n10) );
  AO22X1 U89 ( .IN1(hold_i[2]), .IN2(n133), .IN3(n5), .IN4(cw_i[2]), .Q(n11)
         );
  AO22X1 U90 ( .IN1(hold_i[3]), .IN2(n118), .IN3(n81), .IN4(n104), .Q(n12) );
  AO22X1 U91 ( .IN1(hold_i[4]), .IN2(n119), .IN3(cw_i[4]), .IN4(n73), .Q(n13)
         );
  AO22X1 U92 ( .IN1(hold_i[6]), .IN2(n124), .IN3(cw_i[6]), .IN4(n3), .Q(n15)
         );
  AO22X1 U93 ( .IN1(hold_i[8]), .IN2(n120), .IN3(cw_i[8]), .IN4(n86), .Q(n17)
         );
  AO22X1 U94 ( .IN1(hold_i[10]), .IN2(n123), .IN3(cw_i[10]), .IN4(n78), .Q(n19) );
  AO22X1 U95 ( .IN1(hold_i[12]), .IN2(n121), .IN3(cw_i[12]), .IN4(n79), .Q(n21) );
  AO22X1 U96 ( .IN1(hold_i[14]), .IN2(n122), .IN3(cw_i[14]), .IN4(n4), .Q(n23)
         );
  AO22X1 U97 ( .IN1(hold_i[17]), .IN2(n157), .IN3(cw_i[17]), .IN4(n85), .Q(n26) );
  AO22X1 U98 ( .IN1(hold_i[20]), .IN2(n152), .IN3(cw_i[20]), .IN4(n82), .Q(n29) );
  AO22X1 U99 ( .IN1(hold_i[23]), .IN2(n122), .IN3(cw_i[23]), .IN4(n86), .Q(n32) );
  AO22X1 U100 ( .IN1(hold_i[24]), .IN2(n160), .IN3(cw_i[24]), .IN4(n74), .Q(
        n33) );
  AO22X1 U101 ( .IN1(hold_i[25]), .IN2(n137), .IN3(cw_i[25]), .IN4(n84), .Q(
        n34) );
  AO22X1 U102 ( .IN1(hold_i[29]), .IN2(n117), .IN3(n179), .IN4(n80), .Q(n38)
         );
  AO22X1 U103 ( .IN1(hold_i[30]), .IN2(n142), .IN3(cw_i[30]), .IN4(n4), .Q(n39) );
  AO22X1 U104 ( .IN1(hold_i[31]), .IN2(n143), .IN3(cw_i[31]), .IN4(n6), .Q(n40) );
  AO22X1 U105 ( .IN1(hold_q[1]), .IN2(n159), .IN3(n86), .IN4(cw_q[1]), .Q(n42)
         );
  NAND2X1 U106 ( .IN1(n188), .IN2(n189), .QN(n53) );
  AO22X1 U107 ( .IN1(hold_q[13]), .IN2(n125), .IN3(cw_q[13]), .IN4(n74), .Q(
        n54) );
  AO22X1 U108 ( .IN1(hold_q[14]), .IN2(n124), .IN3(cw_q[14]), .IN4(n79), .Q(
        n55) );
  NAND2X1 U109 ( .IN1(n184), .IN2(n185), .QN(n61) );
  AO22X1 U110 ( .IN1(hold_q[25]), .IN2(n132), .IN3(cw_q[25]), .IN4(n81), .Q(
        n66) );
  AO22X1 U111 ( .IN1(hold_q[31]), .IN2(n134), .IN3(cw_q[31]), .IN4(n86), .Q(
        n72) );
  AO22X1 U112 ( .IN1(hold_i[7]), .IN2(n119), .IN3(cw_i[7]), .IN4(n77), .Q(n16)
         );
  AO22X1 U113 ( .IN1(hold_i[19]), .IN2(n158), .IN3(cw_i[19]), .IN4(n78), .Q(
        n28) );
  NAND2X1 U114 ( .IN1(n78), .IN2(cw_q[12]), .QN(n189) );
  NAND2X1 U115 ( .IN1(n190), .IN2(n191), .QN(n45) );
  NAND2X1 U116 ( .IN1(n186), .IN2(n187), .QN(n69) );
  NBUFFX2 U117 ( .INP(n7), .Z(net34197) );
  NBUFFX2 U118 ( .INP(net34197), .Z(net34183) );
  NBUFFX2 U119 ( .INP(net34189), .Z(n124) );
  NBUFFX2 U120 ( .INP(n7), .Z(net34195) );
  INVX0 U121 ( .INP(net34195), .ZN(n155) );
  AOI22X1 U122 ( .IN1(cw_i[28]), .IN2(n224), .IN3(cw_i[20]), .IN4(n228), .QN(
        n87) );
  NBUFFX2 U123 ( .INP(net34197), .Z(net34185) );
  NBUFFX2 U124 ( .INP(net34195), .Z(net34189) );
  NBUFFX2 U125 ( .INP(n248), .Z(n221) );
  OR2X1 U126 ( .IN1(net39275), .IN2(n95), .Q(n88) );
  OR2X1 U127 ( .IN1(net39275), .IN2(n96), .Q(n89) );
  AND2X1 U128 ( .IN1(n178), .IN2(n172), .Q(n90) );
  AND2X1 U129 ( .IN1(n179), .IN2(n170), .Q(n91) );
  AND2X1 U130 ( .IN1(n174), .IN2(n87), .Q(n92) );
  OR2X1 U131 ( .IN1(net39275), .IN2(n196), .Q(n93) );
  OR2X1 U132 ( .IN1(n77), .IN2(n100), .Q(net38415) );
  NBUFFX2 U133 ( .INP(n116), .Z(n120) );
  NBUFFX2 U134 ( .INP(n116), .Z(n117) );
  AND2X1 U135 ( .IN1(cw_q[12]), .IN2(srl_49_net27690), .Q(n94) );
  NBUFFX2 U136 ( .INP(n248), .Z(n222) );
  NBUFFX2 U137 ( .INP(n248), .Z(n223) );
  AO22X1 U138 ( .IN1(cw_q[11]), .IN2(n224), .IN3(cw_q[3]), .IN4(net34287), .Q(
        n269) );
  INVX0 U139 ( .INP(net34201), .ZN(n97) );
  INVX0 U140 ( .INP(n166), .ZN(n167) );
  NAND2X0 U141 ( .IN1(n98), .IN2(n99), .QN(srl_48_net27895) );
  NAND2X0 U142 ( .IN1(n221), .IN2(cw_i[13]), .QN(n98) );
  NOR2X0 U143 ( .IN1(n101), .IN2(n91), .QN(n99) );
  NAND2X0 U144 ( .IN1(n171), .IN2(n175), .QN(n101) );
  NOR2X0 U145 ( .IN1(net28322), .IN2(n167), .QN(n170) );
  OR2X2 U146 ( .IN1(n166), .IN2(nib_idx[1]), .Q(net39275) );
  INVX0 U147 ( .INP(rate), .ZN(net33761) );
  NAND2X0 U148 ( .IN1(n90), .IN2(n177), .QN(n240) );
  AO22X1 U149 ( .IN1(hold_q[3]), .IN2(n141), .IN3(n85), .IN4(cw_q[3]), .Q(n44)
         );
  NAND2X0 U150 ( .IN1(hold_q[24]), .IN2(n147), .QN(n102) );
  NAND2X0 U151 ( .IN1(cw_q[24]), .IN2(n82), .QN(n103) );
  NAND2X0 U152 ( .IN1(n102), .IN2(n103), .QN(n65) );
  NAND2X1 U153 ( .IN1(n145), .IN2(hold_q[28]), .QN(n186) );
  NAND2X0 U154 ( .IN1(n132), .IN2(hold_q[12]), .QN(n188) );
  NAND2X0 U155 ( .IN1(n173), .IN2(n92), .QN(srl_48_net27903) );
  INVX0 U156 ( .INP(n109), .ZN(n104) );
  AO221X1 U157 ( .IN1(cw_i[18]), .IN2(n220), .IN3(cw_i[26]), .IN4(n221), .IN5(
        n237), .Q(n241) );
  NAND2X0 U158 ( .IN1(cw_i[8]), .IN2(n170), .QN(n105) );
  NAND2X1 U159 ( .IN1(cw_i[0]), .IN2(n227), .QN(n106) );
  NAND2X1 U160 ( .IN1(n105), .IN2(n106), .QN(n231) );
  NBUFFX2 U161 ( .INP(n246), .Z(n227) );
  INVX0 U162 ( .INP(cw_i[1]), .ZN(n107) );
  INVX0 U163 ( .INP(n107), .ZN(n108) );
  AND2X1 U164 ( .IN1(cw_i[1]), .IN2(n228), .Q(n115) );
  INVX0 U165 ( .INP(cw_i[3]), .ZN(n109) );
  NAND2X1 U166 ( .IN1(sel_i[1]), .IN2(net39695), .QN(n110) );
  NAND2X0 U167 ( .IN1(n108), .IN2(net33761), .QN(n111) );
  NAND2X1 U168 ( .IN1(n110), .IN2(n111), .QN(nib_i[1]) );
  NAND2X1 U169 ( .IN1(n112), .IN2(n113), .QN(n262) );
  NAND2X0 U170 ( .IN1(cw_q[30]), .IN2(n225), .QN(n112) );
  AND2X1 U171 ( .IN1(net28322), .IN2(n183), .Q(net34287) );
  NAND2X0 U172 ( .IN1(n81), .IN2(cw_q[28]), .QN(n187) );
  NAND2X0 U173 ( .IN1(cw_q[24]), .IN2(srl_49_net27690), .QN(n206) );
  INVX0 U174 ( .INP(n218), .ZN(n224) );
  OR2X1 U175 ( .IN1(n115), .IN2(n114), .Q(n234) );
  MUX41X1 U176 ( .IN1(srl_48_net27893), .IN3(srl_48_net27894), .IN2(
        srl_48_net27895), .IN4(srl_48_net27896), .S0(n182), .S1(n215), .Q(
        sel_i[1]) );
  AO22X1 U177 ( .IN1(sel_i[3]), .IN2(net39695), .IN3(n104), .IN4(net33761),
        .Q(nib_i[3]) );
  INVX0 U178 ( .INP(net38415), .ZN(n116) );
  NBUFFX4 U179 ( .INP(n116), .Z(n122) );
  INVX0 U180 ( .INP(n116), .ZN(n126) );
  INVX0 U181 ( .INP(n126), .ZN(n127) );
  INVX0 U182 ( .INP(n126), .ZN(n128) );
  INVX0 U183 ( .INP(n126), .ZN(n129) );
  INVX0 U184 ( .INP(n126), .ZN(n130) );
  INVX0 U185 ( .INP(net34197), .ZN(n131) );
  INVX0 U186 ( .INP(n131), .ZN(n132) );
  INVX0 U187 ( .INP(n131), .ZN(n133) );
  INVX0 U188 ( .INP(n131), .ZN(n134) );
  INVX0 U189 ( .INP(n131), .ZN(n135) );
  INVX0 U190 ( .INP(net34183), .ZN(n136) );
  INVX0 U191 ( .INP(n136), .ZN(n137) );
  INVX0 U192 ( .INP(n136), .ZN(n138) );
  INVX0 U193 ( .INP(n136), .ZN(n139) );
  INVX0 U194 ( .INP(n136), .ZN(n140) );
  INVX0 U195 ( .INP(n131), .ZN(n141) );
  INVX0 U196 ( .INP(n153), .ZN(n142) );
  INVX0 U197 ( .INP(n153), .ZN(n143) );
  INVX0 U198 ( .INP(net34185), .ZN(n144) );
  INVX0 U199 ( .INP(n144), .ZN(n145) );
  INVX0 U200 ( .INP(n144), .ZN(n146) );
  INVX0 U201 ( .INP(n144), .ZN(n147) );
  INVX0 U202 ( .INP(n144), .ZN(n148) );
  INVX0 U203 ( .INP(net34195), .ZN(n149) );
  INVX0 U204 ( .INP(n149), .ZN(n150) );
  INVX0 U205 ( .INP(n149), .ZN(n151) );
  INVX0 U206 ( .INP(n149), .ZN(n152) );
  INVX0 U207 ( .INP(net34189), .ZN(n153) );
  INVX0 U208 ( .INP(n153), .ZN(n154) );
  INVX0 U209 ( .INP(n155), .ZN(n156) );
  INVX0 U210 ( .INP(n155), .ZN(n157) );
  INVX0 U211 ( .INP(n155), .ZN(n158) );
  INVX0 U212 ( .INP(n155), .ZN(n159) );
  INVX0 U213 ( .INP(n149), .ZN(n160) );
  INVX0 U214 ( .INP(n155), .ZN(n161) );
  INVX0 U215 ( .INP(n149), .ZN(n162) );
  INVX0 U216 ( .INP(net38415), .ZN(n7) );
  MUX41X1 U217 ( .IN1(n259), .IN3(n258), .IN2(n257), .IN4(n256), .S0(n182),
        .S1(n215), .Q(sel_q[1]) );
  NAND2X0 U218 ( .IN1(n125), .IN2(hold_q[4]), .QN(n190) );
  NOR2X0 U219 ( .IN1(net39275), .IN2(n194), .QN(n195) );
  INVX0 U220 ( .INP(net39275), .ZN(net34305) );
  OAI221X1 U221 ( .IN1(n163), .IN2(net39275), .IN3(n164), .IN4(n214), .IN5(
        n165), .QN(n259) );
  AOI22X1 U222 ( .IN1(hold_q[9]), .IN2(n170), .IN3(hold_q[1]), .IN4(net34287),
        .QN(n165) );
  AO22X1 U223 ( .IN1(sel_q[1]), .IN2(net39695), .IN3(cw_q[1]), .IN4(net33761),
        .Q(nib_q[1]) );
  INVX0 U224 ( .INP(nib_idx[2]), .ZN(n166) );
  NAND2X0 U225 ( .IN1(n127), .IN2(hold_q[20]), .QN(n184) );
  AO22X1 U226 ( .IN1(hold_q[30]), .IN2(n150), .IN3(cw_q[30]), .IN4(n4), .Q(n71) );
  NAND2X0 U227 ( .IN1(hold_q[11]), .IN2(n170), .QN(n168) );
  NAND2X1 U228 ( .IN1(hold_q[3]), .IN2(net34287), .QN(n169) );
  NAND2X1 U229 ( .IN1(n168), .IN2(n169), .QN(n268) );
  INVX0 U230 ( .INP(nib_idx[1]), .ZN(net28322) );
  NAND2X0 U231 ( .IN1(cw_i[21]), .IN2(n226), .QN(n171) );
  AND2X1 U232 ( .IN1(n180), .IN2(n181), .Q(n172) );
  NAND2X0 U233 ( .IN1(cw_i[4]), .IN2(n219), .QN(n173) );
  NAND2X0 U234 ( .IN1(cw_i[12]), .IN2(n223), .QN(n174) );
  NAND2X0 U235 ( .IN1(cw_i[5]), .IN2(n219), .QN(n175) );
  MUX41X1 U236 ( .IN1(n266), .IN3(n264), .IN2(n267), .IN4(n265), .S0(
        nib_idx[0]), .S1(n176), .Q(sel_q[2]) );
  INVX0 U237 ( .INP(n182), .ZN(n176) );
  NAND2X1 U238 ( .IN1(n192), .IN2(n193), .QN(nib_q[0]) );
  NAND2X0 U239 ( .IN1(n80), .IN2(cw_q[4]), .QN(n191) );
  INVX0 U240 ( .INP(cw_q[4]), .ZN(n194) );
  NAND2X0 U241 ( .IN1(n79), .IN2(cw_q[20]), .QN(n185) );
  NAND2X0 U242 ( .IN1(n216), .IN2(cw_q[20]), .QN(n199) );
  NOR2X0 U243 ( .IN1(n94), .IN2(n195), .QN(n197) );
  NAND2X1 U244 ( .IN1(n209), .IN2(rate), .QN(n192) );
  MUX41X1 U245 ( .IN1(n210), .IN3(n212), .IN2(n211), .IN4(n213), .S0(
        nib_idx[3]), .S1(n215), .Q(n209) );
  NAND2X0 U246 ( .IN1(cw_i[6]), .IN2(n219), .QN(n177) );
  NAND2X0 U247 ( .IN1(n222), .IN2(cw_i[14]), .QN(n178) );
  MUX41X1 U248 ( .IN1(srl_48_net27902), .IN3(srl_48_net27901), .IN2(
        srl_48_net27904), .IN4(srl_48_net27903), .S0(n176), .S1(n215), .Q(
        sel_i[0]) );
  MUX41X1 U249 ( .IN1(n242), .IN3(n240), .IN2(n241), .IN4(n239), .S0(n215),
        .S1(nib_idx[3]), .Q(sel_i[2]) );
  NAND2X0 U250 ( .IN1(cw_i[30]), .IN2(n170), .QN(n180) );
  NAND2X1 U251 ( .IN1(cw_i[22]), .IN2(n227), .QN(n181) );
  NAND2X0 U252 ( .IN1(cw_q[8]), .IN2(n225), .QN(n208) );
  NAND2X0 U253 ( .IN1(hold_q[28]), .IN2(n170), .QN(n204) );
  NAND2X0 U254 ( .IN1(cw_q[28]), .IN2(n225), .QN(n198) );
  NAND2X0 U255 ( .IN1(hold_q[8]), .IN2(n224), .QN(n202) );
  NBUFFX2 U256 ( .INP(nib_idx[3]), .Z(n182) );
  MUX41X1 U257 ( .IN1(n275), .IN3(n274), .IN2(n273), .IN4(n272), .S0(n182),
        .S1(nib_idx[0]), .Q(sel_q[3]) );
  MUX41X1 U258 ( .IN1(n252), .IN3(n251), .IN2(n250), .IN4(n249), .S0(n182),
        .S1(n215), .Q(sel_i[3]) );
  NAND4X0 U259 ( .IN1(n202), .IN2(n201), .IN3(n88), .IN4(n200), .QN(n210) );
  NAND3X0 U260 ( .IN1(n199), .IN2(n198), .IN3(n197), .QN(n211) );
  NAND4X0 U261 ( .IN1(n208), .IN2(n207), .IN3(n93), .IN4(n206), .QN(n212) );
  NAND4X0 U262 ( .IN1(n205), .IN2(n204), .IN3(n89), .IN4(n203), .QN(n213) );
  NBUFFX2 U263 ( .INP(nib_idx[0]), .Z(n215) );
  INVX0 U264 ( .INP(srl_49_net27690), .ZN(n214) );
  INVX0 U265 ( .INP(n167), .ZN(n183) );
  INVX0 U266 ( .INP(net33761), .ZN(net39695) );
  INVX0 U267 ( .INP(n217), .ZN(n219) );
  INVX0 U268 ( .INP(n217), .ZN(n220) );
  NOR2X0 U269 ( .IN1(n183), .IN2(net28322), .QN(srl_49_net27690) );
  NOR2X0 U270 ( .IN1(n183), .IN2(net28322), .QN(n248) );
  NOR2X0 U271 ( .IN1(nib_idx[1]), .IN2(n167), .QN(n246) );
  INVX0 U272 ( .INP(hold_en), .ZN(n229) );
  AO22X1 U273 ( .IN1(hold_i[8]), .IN2(n225), .IN3(hold_i[0]), .IN4(n226), .Q(
        n230) );
  AO221X1 U274 ( .IN1(hold_i[16]), .IN2(n219), .IN3(hold_i[24]), .IN4(n221),
        .IN5(n230), .Q(srl_48_net27901) );
  AO221X1 U275 ( .IN1(cw_i[16]), .IN2(n220), .IN3(cw_i[24]), .IN4(n222), .IN5(
        n231), .Q(srl_48_net27902) );
  AO22X1 U276 ( .IN1(hold_i[28]), .IN2(n224), .IN3(hold_i[20]), .IN4(n226),
        .Q(n232) );
  AO221X1 U277 ( .IN1(hold_i[4]), .IN2(n220), .IN3(hold_i[12]), .IN4(n221),
        .IN5(n232), .Q(srl_48_net27904) );
  AO22X1 U278 ( .IN1(hold_i[9]), .IN2(n170), .IN3(hold_i[1]), .IN4(n227), .Q(
        n233) );
  AO221X1 U279 ( .IN1(hold_i[17]), .IN2(n219), .IN3(hold_i[25]), .IN4(n222),
        .IN5(n233), .Q(srl_48_net27893) );
  AO221X1 U280 ( .IN1(cw_i[17]), .IN2(n220), .IN3(cw_i[25]), .IN4(n223), .IN5(
        n234), .Q(srl_48_net27894) );
  AO22X1 U281 ( .IN1(hold_i[29]), .IN2(n225), .IN3(hold_i[21]), .IN4(n227),
        .Q(n235) );
  AO221X1 U282 ( .IN1(hold_i[5]), .IN2(n220), .IN3(hold_i[13]), .IN4(n222),
        .IN5(n235), .Q(srl_48_net27896) );
  AO22X1 U283 ( .IN1(hold_i[10]), .IN2(n225), .IN3(hold_i[2]), .IN4(n228), .Q(
        n236) );
  AO221X1 U284 ( .IN1(hold_i[18]), .IN2(n219), .IN3(hold_i[26]), .IN4(n223),
        .IN5(n236), .Q(n242) );
  AO22X1 U285 ( .IN1(hold_i[30]), .IN2(n170), .IN3(hold_i[22]), .IN4(n228),
        .Q(n238) );
  AO221X1 U286 ( .IN1(hold_i[6]), .IN2(n220), .IN3(hold_i[14]), .IN4(n223),
        .IN5(n238), .Q(n239) );
  AO22X1 U287 ( .IN1(hold_i[11]), .IN2(n224), .IN3(hold_i[3]), .IN4(n226), .Q(
        n243) );
  AO221X1 U288 ( .IN1(hold_i[19]), .IN2(n219), .IN3(hold_i[27]), .IN4(n221),
        .IN5(n243), .Q(n252) );
  AO221X1 U289 ( .IN1(cw_i[19]), .IN2(n220), .IN3(cw_i[27]), .IN4(n222), .IN5(
        n244), .Q(n251) );
  AO221X1 U290 ( .IN1(cw_i[7]), .IN2(n219), .IN3(cw_i[15]), .IN4(n223), .IN5(
        n245), .Q(n250) );
  AO22X1 U291 ( .IN1(hold_i[31]), .IN2(n225), .IN3(hold_i[23]), .IN4(n226),
        .Q(n247) );
  AO221X1 U292 ( .IN1(hold_i[7]), .IN2(n220), .IN3(hold_i[15]), .IN4(n221),
        .IN5(n247), .Q(n249) );
  AO221X1 U293 ( .IN1(cw_q[17]), .IN2(net34305), .IN3(cw_q[25]), .IN4(
        srl_49_net27690), .IN5(n253), .Q(n258) );
  AO22X1 U294 ( .IN1(cw_q[29]), .IN2(n224), .IN3(cw_q[21]), .IN4(net34287),
        .Q(n254) );
  AO221X1 U295 ( .IN1(cw_q[5]), .IN2(net34305), .IN3(cw_q[13]), .IN4(
        srl_49_net27690), .IN5(n254), .Q(n257) );
  AO22X1 U296 ( .IN1(hold_q[29]), .IN2(n170), .IN3(hold_q[21]), .IN4(n216),
        .Q(n255) );
  AO221X1 U297 ( .IN1(hold_q[5]), .IN2(net34305), .IN3(hold_q[13]), .IN4(n221),
        .IN5(n255), .Q(n256) );
  AO22X1 U298 ( .IN1(hold_q[10]), .IN2(n225), .IN3(hold_q[2]), .IN4(net34287),
        .Q(n260) );
  AO221X1 U299 ( .IN1(hold_q[18]), .IN2(net34305), .IN3(hold_q[26]), .IN4(
        srl_49_net27690), .IN5(n260), .Q(n267) );
  AO22X1 U300 ( .IN1(cw_q[10]), .IN2(n170), .IN3(cw_q[2]), .IN4(net34287), .Q(
        n261) );
  AO221X1 U301 ( .IN1(cw_q[18]), .IN2(net34305), .IN3(cw_q[26]), .IN4(
        srl_49_net27690), .IN5(n261), .Q(n266) );
  AO221X1 U302 ( .IN1(cw_q[6]), .IN2(net34305), .IN3(cw_q[14]), .IN4(n248),
        .IN5(n262), .Q(n265) );
  AO22X1 U303 ( .IN1(hold_q[30]), .IN2(n225), .IN3(hold_q[22]), .IN4(n216),
        .Q(n263) );
  AO221X1 U304 ( .IN1(hold_q[6]), .IN2(net34305), .IN3(hold_q[14]), .IN4(
        srl_49_net27690), .IN5(n263), .Q(n264) );
  AO221X1 U305 ( .IN1(hold_q[19]), .IN2(net34305), .IN3(hold_q[27]), .IN4(n223), .IN5(n268), .Q(n275) );
  AO221X1 U306 ( .IN1(cw_q[19]), .IN2(net34305), .IN3(cw_q[27]), .IN4(n248),
        .IN5(n269), .Q(n274) );
  AO22X1 U307 ( .IN1(cw_q[31]), .IN2(n224), .IN3(cw_q[23]), .IN4(net34287),
        .Q(n270) );
  AO221X1 U308 ( .IN1(cw_q[7]), .IN2(net34305), .IN3(cw_q[15]), .IN4(n222),
        .IN5(n270), .Q(n273) );
  AO22X1 U309 ( .IN1(hold_q[31]), .IN2(n224), .IN3(hold_q[23]), .IN4(n216),
        .Q(n271) );
  AO221X1 U310 ( .IN1(hold_q[7]), .IN2(net34305), .IN3(hold_q[15]), .IN4(n223),
        .IN5(n271), .Q(n272) );
endmodule


module shr_rom ( rate, idx, nib, last_idx );
  input [4:0] idx;
  output [3:0] nib;
  output [4:0] last_idx;
  input rate;
  wire   N33, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n6, n8, n10, n11, n25, n26, n27;

  AO221X1 U22 ( .IN1(n12), .IN2(n25), .IN3(n11), .IN4(n13), .IN5(n14), .Q(
        nib[3]) );
  NAND4X0 U23 ( .IN1(n15), .IN2(n16), .IN3(n17), .IN4(n18), .QN(nib[2]) );
  NAND4X0 U24 ( .IN1(n13), .IN2(n19), .IN3(n25), .IN4(n26), .QN(n15) );
  AO221X1 U25 ( .IN1(n21), .IN2(n11), .IN3(n20), .IN4(n12), .IN5(n14), .Q(
        nib[1]) );
  AO221X1 U26 ( .IN1(n22), .IN2(n11), .IN3(n8), .IN4(n12), .IN5(n14), .Q(
        nib[0]) );
  AO22X1 U27 ( .IN1(n23), .IN2(N33), .IN3(n19), .IN4(n27), .Q(n14) );
  NOR3X0 U28 ( .IN1(n6), .IN2(last_idx[4]), .IN3(idx[2]), .QN(n12) );
  AND3X1 U29 ( .IN1(idx[2]), .IN2(n27), .IN3(idx[4]), .Q(n24) );
  NBUFFX2 U7 ( .INP(idx[1]), .Z(n8) );
  INVX0 U8 ( .INP(last_idx[3]), .ZN(last_idx[2]) );
  NBUFFX2 U9 ( .INP(n10), .Z(last_idx[3]) );
  NBUFFX2 U10 ( .INP(idx[4]), .Z(n6) );
  INVX0 U11 ( .INP(n18), .ZN(n11) );
  NAND2X0 U12 ( .IN1(N33), .IN2(last_idx[4]), .QN(n16) );
  NAND2X0 U13 ( .IN1(n19), .IN2(n27), .QN(n17) );
  NAND2X0 U14 ( .IN1(n24), .IN2(last_idx[4]), .QN(n18) );
  NOR2X0 U15 ( .IN1(n6), .IN2(rate), .QN(n19) );
  NOR2X0 U16 ( .IN1(n8), .IN2(n25), .QN(n22) );
  NOR2X0 U17 ( .IN1(n8), .IN2(idx[0]), .QN(n21) );
  NAND2X0 U18 ( .IN1(idx[1]), .IN2(n25), .QN(n20) );
  OA21X1 U19 ( .IN1(n25), .IN2(n8), .IN3(n20), .Q(n13) );
  INVX0 U20 ( .INP(idx[2]), .ZN(n26) );
  INVX0 U21 ( .INP(idx[0]), .ZN(n25) );
  INVX0 U30 ( .INP(idx[3]), .ZN(n27) );
  NOR2X0 U31 ( .IN1(last_idx[3]), .IN2(n24), .QN(n23) );
  INVX0 U32 ( .INP(rate), .ZN(n10) );
  INVX0 U33 ( .INP(n10), .ZN(last_idx[4]) );
  OAI21X1 U34 ( .IN1(idx[3]), .IN2(idx[2]), .IN3(n6), .QN(N33) );
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
         n10, n11, SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2;
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

  NBUFFX2 U1 ( .INP(rate_q), .Z(n2) );
  DELLN1X2 U2 ( .INP(n7), .Z(n10) );
  NBUFFX4 U3 ( .INP(n2), .Z(n7) );
  INVX0 U4 ( .INP(nib_idx[2]), .ZN(n1) );
  INVX0 U5 ( .INP(rate_q), .ZN(n3) );
  INVX0 U6 ( .INP(n3), .ZN(n4) );
  INVX0 U7 ( .INP(il_clear), .ZN(n5) );
  INVX0 U8 ( .INP(n5), .ZN(n6) );
  DELLN1X2 U9 ( .INP(nib_idx[1]), .Z(n8) );
  INVX0 U10 ( .INP(n1), .ZN(n9) );
  DELLN2X2 U11 ( .INP(n7), .Z(n11) );
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
        .consume(acc_consume), .rate(n7), .phr_len(len_q), .byte_in(ram_rdata),
        .window(acc_window) );
  iq_demux u_demux ( .bits_in(acc_window), .i_bits(i_bits), .q_bits(q_bits) );
  symbol_mapper_1 u_map_i ( .rate(n4), .bits_in(i_bits), .codeword(cw_i) );
  symbol_mapper_0 u_map_q ( .rate(n10), .bits_in(q_bits), .codeword(cw_q) );
  bit_interleaver u_il ( .clk(clk), .reset(reset), .clear(n6), .hold_en(
        il_hold_en), .rate(n11), .cw_i(cw_i), .cw_q(cw_q), .nib_idx({
        nib_idx[3], n9, n8, nib_idx[0]}), .nib_i(nib_i), .nib_q(nib_q) );
  shr_rom u_shr ( .rate(n2), .idx(shr_idx), .nib(shr_nib), .last_idx({
        shr_last[4:2], SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2}) );
  ppdu_mux u_mux ( .shr_nib(shr_nib), .data_nib_i(nib_i), .data_nib_q(nib_q),
        .sel_shr(buf_sel_shr), .out_i(mod_nib_i), .out_q(mod_nib_q) );
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
  wire   n13, n1, n2, n4, n5, n6, n9, n10, n11, n7, n8, n12;

  DFFARX1 address_reg_0_ ( .D(n11), .CLK(clk), .RSTB(rstn), .Q(n13), .QN(n2)
         );
  DFFARX1 address_reg_1_ ( .D(n10), .CLK(clk), .RSTB(rstn), .Q(address[1]),
        .QN(n1) );
  DFFARX1 address_reg_2_ ( .D(n9), .CLK(clk), .RSTB(rstn), .Q(address[2]) );
  AO22X1 U5 ( .IN1(address[2]), .IN2(n4), .IN3(n5), .IN4(address[1]), .Q(n9)
         );
  AND2X1 U6 ( .IN1(n6), .IN2(n13), .Q(n5) );
  AO22X1 U10 ( .IN1(n4), .IN2(n13), .IN3(n6), .IN4(n2), .Q(n11) );
  NOR3X0 U11 ( .IN1(address[2]), .IN2(clear), .IN3(n12), .QN(n6) );
  INVX0 U3 ( .INP(n2), .ZN(address[0]) );
  INVX0 U4 ( .INP(enable), .ZN(n12) );
  NOR2X0 U7 ( .IN1(enable), .IN2(clear), .QN(n4) );
  AO21X1 U8 ( .IN1(n7), .IN2(address[1]), .IN3(n8), .Q(n10) );
  AO21X1 U9 ( .IN1(n2), .IN2(n6), .IN3(n4), .Q(n7) );
  AND3X1 U12 ( .IN1(n6), .IN2(n1), .IN3(n13), .Q(n8) );
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
  INVX0 U7 ( .INP(r_address[1]), .ZN(n7) );
  INVX0 U8 ( .INP(r_address[0]), .ZN(n8) );
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
  wire   n1, n6, n7, n8, n9, n10, n11, n12, n13;
  wire   [3:0] mem;

  AO22X1 U2 ( .IN1(mem[0]), .IN2(n9), .IN3(data_in[0]), .IN4(we), .Q(n13) );
  AO22X1 U3 ( .IN1(mem[1]), .IN2(n9), .IN3(data_in[1]), .IN4(we), .Q(n12) );
  AO22X1 U4 ( .IN1(mem[2]), .IN2(n9), .IN3(data_in[2]), .IN4(we), .Q(n11) );
  AO22X1 U5 ( .IN1(mem[3]), .IN2(n9), .IN3(data_in[3]), .IN4(we), .Q(n10) );
  DFFARX1 mem_reg_3_ ( .D(n10), .CLK(clk), .RSTB(rstn), .Q(mem[3]) );
  DFFARX1 mem_reg_2_ ( .D(n11), .CLK(clk), .RSTB(rstn), .Q(mem[2]) );
  DFFARX1 mem_reg_1_ ( .D(n12), .CLK(clk), .RSTB(rstn), .Q(mem[1]) );
  DFFARX1 mem_reg_0_ ( .D(n13), .CLK(clk), .RSTB(rstn), .Q(mem[0]) );
  INVX0 U6 ( .INP(we), .ZN(n9) );
  INVX0 U7 ( .INP(r_address[0]), .ZN(n8) );
  INVX0 U8 ( .INP(r_address[1]), .ZN(n7) );
  AO22X1 U9 ( .IN1(mem[3]), .IN2(r_address[0]), .IN3(mem[2]), .IN4(n8), .Q(n6)
         );
  AO22X1 U10 ( .IN1(mem[1]), .IN2(r_address[0]), .IN3(mem[0]), .IN4(n8), .Q(n1) );
  AO22X1 U11 ( .IN1(r_address[1]), .IN2(n6), .IN3(n1), .IN4(n7), .Q(data_out)
         );
endmodule


module dqpsk_mapper_polar_N12 ( I, Q, PHI );
  output [11:0] PHI;
  input I, Q;


  XOR2X1 U3 ( .IN1(Q), .IN2(I), .Q(PHI[10]) );
  NBUFFX2 U24 ( .INP(I), .Z(PHI[11]) );
  INVX0 U4 ( .INP(1'b1), .ZN(PHI[9]) );
  INVX0 U6 ( .INP(1'b1), .ZN(PHI[8]) );
  INVX0 U8 ( .INP(1'b1), .ZN(PHI[7]) );
  INVX0 U10 ( .INP(1'b1), .ZN(PHI[6]) );
  INVX0 U12 ( .INP(1'b1), .ZN(PHI[5]) );
  INVX0 U14 ( .INP(1'b1), .ZN(PHI[4]) );
  INVX0 U16 ( .INP(1'b1), .ZN(PHI[3]) );
  INVX0 U18 ( .INP(1'b1), .ZN(PHI[2]) );
  INVX0 U20 ( .INP(1'b1), .ZN(PHI[1]) );
  INVX0 U22 ( .INP(1'b1), .ZN(PHI[0]) );
endmodule


module feedback_memory_polar_N12 ( clk, rstn, clear, we, datain, address,
        dataout );
  input [11:0] datain;
  input [1:0] address;
  output [11:0] dataout;
  input clk, rstn, clear, we;
  wire   n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n1, n2, n3, n4, n5, n6, n7, n21, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95;
  wire   [47:0] mem;

  DFFARX1 mem_reg_0__11_ ( .D(n69), .CLK(clk), .RSTB(rstn), .Q(mem[47]) );
  DFFARX1 mem_reg_0__10_ ( .D(n68), .CLK(clk), .RSTB(rstn), .Q(mem[46]) );
  DFFASX1 mem_reg_0__9_ ( .D(n67), .CLK(clk), .SETB(rstn), .Q(mem[45]) );
  DFFARX1 mem_reg_0__8_ ( .D(n66), .CLK(clk), .RSTB(rstn), .Q(mem[44]) );
  DFFARX1 mem_reg_0__7_ ( .D(n65), .CLK(clk), .RSTB(rstn), .Q(mem[43]) );
  DFFARX1 mem_reg_0__6_ ( .D(n64), .CLK(clk), .RSTB(rstn), .Q(mem[42]) );
  DFFARX1 mem_reg_0__5_ ( .D(n63), .CLK(clk), .RSTB(rstn), .Q(mem[41]) );
  DFFARX1 mem_reg_0__4_ ( .D(n62), .CLK(clk), .RSTB(rstn), .Q(mem[40]) );
  DFFARX1 mem_reg_0__3_ ( .D(n61), .CLK(clk), .RSTB(rstn), .Q(mem[39]) );
  DFFARX1 mem_reg_0__2_ ( .D(n60), .CLK(clk), .RSTB(rstn), .Q(mem[38]) );
  DFFARX1 mem_reg_0__1_ ( .D(n59), .CLK(clk), .RSTB(rstn), .Q(mem[37]) );
  DFFARX1 mem_reg_0__0_ ( .D(n58), .CLK(clk), .RSTB(rstn), .Q(mem[36]) );
  DFFARX1 mem_reg_1__11_ ( .D(n57), .CLK(clk), .RSTB(rstn), .Q(mem[35]) );
  DFFARX1 mem_reg_1__10_ ( .D(n56), .CLK(clk), .RSTB(rstn), .Q(mem[34]) );
  DFFASX1 mem_reg_1__9_ ( .D(n55), .CLK(clk), .SETB(rstn), .Q(mem[33]) );
  DFFARX1 mem_reg_1__8_ ( .D(n54), .CLK(clk), .RSTB(rstn), .Q(mem[32]) );
  DFFARX1 mem_reg_1__7_ ( .D(n53), .CLK(clk), .RSTB(rstn), .Q(mem[31]) );
  DFFARX1 mem_reg_1__6_ ( .D(n52), .CLK(clk), .RSTB(rstn), .Q(mem[30]) );
  DFFARX1 mem_reg_1__5_ ( .D(n51), .CLK(clk), .RSTB(rstn), .Q(mem[29]) );
  DFFARX1 mem_reg_1__4_ ( .D(n50), .CLK(clk), .RSTB(rstn), .Q(mem[28]) );
  DFFARX1 mem_reg_1__3_ ( .D(n49), .CLK(clk), .RSTB(rstn), .Q(mem[27]) );
  DFFARX1 mem_reg_1__2_ ( .D(n48), .CLK(clk), .RSTB(rstn), .Q(mem[26]) );
  DFFARX1 mem_reg_1__1_ ( .D(n47), .CLK(clk), .RSTB(rstn), .Q(mem[25]) );
  DFFARX1 mem_reg_1__0_ ( .D(n46), .CLK(clk), .RSTB(rstn), .Q(mem[24]) );
  DFFARX1 mem_reg_2__11_ ( .D(n45), .CLK(clk), .RSTB(rstn), .Q(mem[23]) );
  DFFARX1 mem_reg_2__10_ ( .D(n44), .CLK(clk), .RSTB(rstn), .Q(mem[22]) );
  DFFASX1 mem_reg_2__9_ ( .D(n43), .CLK(clk), .SETB(rstn), .Q(mem[21]) );
  DFFARX1 mem_reg_2__8_ ( .D(n42), .CLK(clk), .RSTB(rstn), .Q(mem[20]) );
  DFFARX1 mem_reg_2__7_ ( .D(n41), .CLK(clk), .RSTB(rstn), .Q(mem[19]) );
  DFFARX1 mem_reg_2__6_ ( .D(n40), .CLK(clk), .RSTB(rstn), .Q(mem[18]) );
  DFFARX1 mem_reg_2__5_ ( .D(n39), .CLK(clk), .RSTB(rstn), .Q(mem[17]) );
  DFFARX1 mem_reg_2__4_ ( .D(n38), .CLK(clk), .RSTB(rstn), .Q(mem[16]) );
  DFFARX1 mem_reg_2__3_ ( .D(n37), .CLK(clk), .RSTB(rstn), .Q(mem[15]) );
  DFFARX1 mem_reg_2__2_ ( .D(n36), .CLK(clk), .RSTB(rstn), .Q(mem[14]) );
  DFFARX1 mem_reg_2__1_ ( .D(n35), .CLK(clk), .RSTB(rstn), .Q(mem[13]) );
  DFFARX1 mem_reg_2__0_ ( .D(n34), .CLK(clk), .RSTB(rstn), .Q(mem[12]) );
  DFFARX1 mem_reg_3__11_ ( .D(n33), .CLK(clk), .RSTB(rstn), .Q(mem[11]) );
  DFFARX1 mem_reg_3__10_ ( .D(n32), .CLK(clk), .RSTB(rstn), .Q(mem[10]) );
  DFFASX1 mem_reg_3__9_ ( .D(n31), .CLK(clk), .SETB(rstn), .Q(mem[9]) );
  DFFARX1 mem_reg_3__8_ ( .D(n30), .CLK(clk), .RSTB(rstn), .Q(mem[8]) );
  DFFARX1 mem_reg_3__7_ ( .D(n29), .CLK(clk), .RSTB(rstn), .Q(mem[7]) );
  DFFARX1 mem_reg_3__6_ ( .D(n28), .CLK(clk), .RSTB(rstn), .Q(mem[6]) );
  DFFARX1 mem_reg_3__5_ ( .D(n27), .CLK(clk), .RSTB(rstn), .Q(mem[5]) );
  DFFARX1 mem_reg_3__4_ ( .D(n26), .CLK(clk), .RSTB(rstn), .Q(mem[4]) );
  DFFARX1 mem_reg_3__3_ ( .D(n25), .CLK(clk), .RSTB(rstn), .Q(mem[3]) );
  DFFARX1 mem_reg_3__2_ ( .D(n24), .CLK(clk), .RSTB(rstn), .Q(mem[2]) );
  DFFARX1 mem_reg_3__1_ ( .D(n23), .CLK(clk), .RSTB(rstn), .Q(mem[1]) );
  DFFARX1 mem_reg_3__0_ ( .D(n22), .CLK(clk), .RSTB(rstn), .Q(mem[0]) );
  AO22X1 U14 ( .IN1(mem[0]), .IN2(n93), .IN3(datain[0]), .IN4(n8), .Q(n22) );
  AO22X1 U15 ( .IN1(mem[1]), .IN2(n93), .IN3(datain[1]), .IN4(n8), .Q(n23) );
  AO22X1 U16 ( .IN1(mem[2]), .IN2(n93), .IN3(datain[2]), .IN4(n8), .Q(n24) );
  AO22X1 U17 ( .IN1(mem[3]), .IN2(n93), .IN3(datain[3]), .IN4(n8), .Q(n25) );
  AO22X1 U18 ( .IN1(mem[4]), .IN2(n93), .IN3(datain[4]), .IN4(n8), .Q(n26) );
  AO22X1 U19 ( .IN1(mem[5]), .IN2(n93), .IN3(datain[5]), .IN4(n8), .Q(n27) );
  AO22X1 U20 ( .IN1(mem[6]), .IN2(n93), .IN3(datain[6]), .IN4(n8), .Q(n28) );
  AO22X1 U21 ( .IN1(mem[7]), .IN2(n93), .IN3(datain[7]), .IN4(n8), .Q(n29) );
  AO22X1 U22 ( .IN1(mem[8]), .IN2(n93), .IN3(datain[8]), .IN4(n8), .Q(n30) );
  AO22X1 U24 ( .IN1(mem[10]), .IN2(n93), .IN3(datain[10]), .IN4(n8), .Q(n32)
         );
  AO22X1 U25 ( .IN1(mem[11]), .IN2(n93), .IN3(datain[11]), .IN4(n8), .Q(n33)
         );
  AO22X1 U28 ( .IN1(mem[12]), .IN2(n1), .IN3(n13), .IN4(datain[0]), .Q(n34) );
  AO22X1 U29 ( .IN1(mem[13]), .IN2(n1), .IN3(n13), .IN4(datain[1]), .Q(n35) );
  AO22X1 U30 ( .IN1(mem[14]), .IN2(n2), .IN3(n13), .IN4(datain[2]), .Q(n36) );
  AO22X1 U31 ( .IN1(mem[15]), .IN2(n1), .IN3(n13), .IN4(datain[3]), .Q(n37) );
  AO22X1 U32 ( .IN1(mem[16]), .IN2(n1), .IN3(n13), .IN4(datain[4]), .Q(n38) );
  AO22X1 U33 ( .IN1(mem[17]), .IN2(n2), .IN3(n13), .IN4(datain[5]), .Q(n39) );
  AO22X1 U34 ( .IN1(mem[18]), .IN2(n92), .IN3(n13), .IN4(datain[6]), .Q(n40)
         );
  AO22X1 U35 ( .IN1(mem[19]), .IN2(n1), .IN3(n13), .IN4(datain[7]), .Q(n41) );
  AO22X1 U36 ( .IN1(mem[20]), .IN2(n2), .IN3(n13), .IN4(datain[8]), .Q(n42) );
  AO22X1 U37 ( .IN1(n14), .IN2(n9), .IN3(mem[21]), .IN4(n2), .Q(n43) );
  AO22X1 U38 ( .IN1(mem[22]), .IN2(n2), .IN3(n13), .IN4(datain[10]), .Q(n44)
         );
  AO22X1 U39 ( .IN1(mem[23]), .IN2(n1), .IN3(n13), .IN4(datain[11]), .Q(n45)
         );
  AO22X1 U42 ( .IN1(mem[24]), .IN2(n91), .IN3(n16), .IN4(datain[0]), .Q(n46)
         );
  AO22X1 U43 ( .IN1(mem[25]), .IN2(n91), .IN3(n16), .IN4(datain[1]), .Q(n47)
         );
  AO22X1 U44 ( .IN1(mem[26]), .IN2(n91), .IN3(n16), .IN4(datain[2]), .Q(n48)
         );
  AO22X1 U45 ( .IN1(mem[27]), .IN2(n91), .IN3(n16), .IN4(datain[3]), .Q(n49)
         );
  AO22X1 U46 ( .IN1(mem[28]), .IN2(n91), .IN3(n16), .IN4(datain[4]), .Q(n50)
         );
  AO22X1 U47 ( .IN1(mem[29]), .IN2(n91), .IN3(n16), .IN4(datain[5]), .Q(n51)
         );
  AO22X1 U48 ( .IN1(mem[30]), .IN2(n91), .IN3(n16), .IN4(datain[6]), .Q(n52)
         );
  AO22X1 U49 ( .IN1(mem[31]), .IN2(n91), .IN3(n16), .IN4(datain[7]), .Q(n53)
         );
  AO22X1 U50 ( .IN1(mem[32]), .IN2(n91), .IN3(n16), .IN4(datain[8]), .Q(n54)
         );
  AO22X1 U52 ( .IN1(mem[34]), .IN2(n91), .IN3(n16), .IN4(datain[10]), .Q(n56)
         );
  AO22X1 U53 ( .IN1(mem[35]), .IN2(n91), .IN3(n16), .IN4(datain[11]), .Q(n57)
         );
  AO22X1 U56 ( .IN1(mem[36]), .IN2(n90), .IN3(n19), .IN4(datain[0]), .Q(n58)
         );
  AO22X1 U57 ( .IN1(mem[37]), .IN2(n90), .IN3(n19), .IN4(datain[1]), .Q(n59)
         );
  AO22X1 U58 ( .IN1(mem[38]), .IN2(n90), .IN3(n19), .IN4(datain[2]), .Q(n60)
         );
  AO22X1 U59 ( .IN1(mem[39]), .IN2(n90), .IN3(n19), .IN4(datain[3]), .Q(n61)
         );
  AO22X1 U60 ( .IN1(mem[40]), .IN2(n90), .IN3(n19), .IN4(datain[4]), .Q(n62)
         );
  AO22X1 U61 ( .IN1(mem[41]), .IN2(n90), .IN3(n19), .IN4(datain[5]), .Q(n63)
         );
  AO22X1 U62 ( .IN1(mem[42]), .IN2(n90), .IN3(n19), .IN4(datain[6]), .Q(n64)
         );
  AO22X1 U63 ( .IN1(mem[43]), .IN2(n90), .IN3(n19), .IN4(datain[7]), .Q(n65)
         );
  AO22X1 U64 ( .IN1(mem[44]), .IN2(n90), .IN3(n19), .IN4(datain[8]), .Q(n66)
         );
  AO22X1 U67 ( .IN1(mem[46]), .IN2(n90), .IN3(n19), .IN4(datain[10]), .Q(n68)
         );
  AO22X1 U68 ( .IN1(mem[47]), .IN2(n90), .IN3(n19), .IN4(datain[11]), .Q(n69)
         );
  AND2X1 U3 ( .IN1(we), .IN2(n94), .Q(n11) );
  NAND3X0 U4 ( .IN1(address[0]), .IN2(n11), .IN3(address[1]), .QN(n12) );
  AND2X1 U5 ( .IN1(n11), .IN2(n10), .Q(n8) );
  NAND3X0 U6 ( .IN1(n11), .IN2(n81), .IN3(address[1]), .QN(n15) );
  AND2X1 U7 ( .IN1(n11), .IN2(n14), .Q(n13) );
  NAND3X0 U8 ( .IN1(n11), .IN2(n95), .IN3(address[0]), .QN(n18) );
  AND2X1 U9 ( .IN1(n11), .IN2(n17), .Q(n16) );
  OR2X1 U10 ( .IN1(clear), .IN2(n3), .Q(n20) );
  OR2X1 U11 ( .IN1(datain[9]), .IN2(clear), .Q(n9) );
  AND2X1 U12 ( .IN1(n11), .IN2(n20), .Q(n19) );
  AO22X1 U13 ( .IN1(n9), .IN2(n10), .IN3(mem[9]), .IN4(n93), .Q(n31) );
  AO22X1 U23 ( .IN1(n20), .IN2(n9), .IN3(mem[45]), .IN4(n90), .Q(n67) );
  NBUFFX2 U26 ( .INP(n92), .Z(n1) );
  NBUFFX2 U27 ( .INP(n92), .Z(n2) );
  AND3X1 U40 ( .IN1(n81), .IN2(n95), .IN3(n11), .Q(n3) );
  NAND2X0 U41 ( .IN1(n94), .IN2(n12), .QN(n10) );
  AO22X1 U51 ( .IN1(n17), .IN2(n9), .IN3(mem[33]), .IN4(n91), .Q(n55) );
  NAND2X0 U54 ( .IN1(n94), .IN2(n18), .QN(n17) );
  NAND2X0 U55 ( .IN1(n94), .IN2(n15), .QN(n14) );
  INVX0 U65 ( .INP(clear), .ZN(n94) );
  INVX0 U66 ( .INP(n20), .ZN(n90) );
  NBUFFX2 U69 ( .INP(n79), .Z(n84) );
  NBUFFX2 U70 ( .INP(n79), .Z(n85) );
  INVX0 U71 ( .INP(n17), .ZN(n91) );
  INVX0 U72 ( .INP(n14), .ZN(n92) );
  INVX0 U73 ( .INP(n10), .ZN(n93) );
  NOR2X0 U74 ( .IN1(n95), .IN2(n81), .QN(n79) );
  NBUFFX2 U75 ( .INP(n76), .Z(n89) );
  NBUFFX2 U76 ( .INP(n80), .Z(n83) );
  NBUFFX2 U77 ( .INP(n77), .Z(n87) );
  NBUFFX2 U78 ( .INP(n77), .Z(n86) );
  NBUFFX2 U79 ( .INP(n76), .Z(n88) );
  NBUFFX2 U80 ( .INP(n80), .Z(n82) );
  INVX0 U81 ( .INP(address[0]), .ZN(n81) );
  INVX0 U82 ( .INP(address[1]), .ZN(n95) );
  NOR2X0 U83 ( .IN1(n95), .IN2(address[0]), .QN(n80) );
  NOR2X0 U84 ( .IN1(n81), .IN2(address[1]), .QN(n77) );
  NOR2X0 U85 ( .IN1(address[0]), .IN2(address[1]), .QN(n76) );
  AO22X1 U86 ( .IN1(mem[24]), .IN2(n87), .IN3(mem[36]), .IN4(n89), .Q(n4) );
  AO221X1 U87 ( .IN1(mem[12]), .IN2(n83), .IN3(mem[0]), .IN4(n85), .IN5(n4),
        .Q(dataout[0]) );
  AO22X1 U88 ( .IN1(mem[25]), .IN2(n86), .IN3(mem[37]), .IN4(n88), .Q(n5) );
  AO221X1 U89 ( .IN1(mem[13]), .IN2(n82), .IN3(mem[1]), .IN4(n85), .IN5(n5),
        .Q(dataout[1]) );
  AO22X1 U90 ( .IN1(mem[26]), .IN2(n87), .IN3(mem[38]), .IN4(n89), .Q(n6) );
  AO221X1 U91 ( .IN1(mem[14]), .IN2(n83), .IN3(mem[2]), .IN4(n85), .IN5(n6),
        .Q(dataout[2]) );
  AO22X1 U92 ( .IN1(mem[27]), .IN2(n86), .IN3(mem[39]), .IN4(n88), .Q(n7) );
  AO221X1 U93 ( .IN1(mem[15]), .IN2(n82), .IN3(mem[3]), .IN4(n85), .IN5(n7),
        .Q(dataout[3]) );
  AO22X1 U94 ( .IN1(mem[28]), .IN2(n87), .IN3(mem[40]), .IN4(n89), .Q(n21) );
  AO221X1 U95 ( .IN1(mem[16]), .IN2(n83), .IN3(mem[4]), .IN4(n85), .IN5(n21),
        .Q(dataout[4]) );
  AO22X1 U96 ( .IN1(mem[29]), .IN2(n86), .IN3(mem[41]), .IN4(n88), .Q(n70) );
  AO221X1 U97 ( .IN1(mem[17]), .IN2(n82), .IN3(mem[5]), .IN4(n85), .IN5(n70),
        .Q(dataout[5]) );
  AO22X1 U98 ( .IN1(mem[30]), .IN2(n87), .IN3(mem[42]), .IN4(n89), .Q(n71) );
  AO221X1 U99 ( .IN1(mem[18]), .IN2(n83), .IN3(mem[6]), .IN4(n84), .IN5(n71),
        .Q(dataout[6]) );
  AO22X1 U100 ( .IN1(mem[31]), .IN2(n86), .IN3(mem[43]), .IN4(n88), .Q(n72) );
  AO221X1 U101 ( .IN1(mem[19]), .IN2(n82), .IN3(mem[7]), .IN4(n84), .IN5(n72),
        .Q(dataout[7]) );
  AO22X1 U102 ( .IN1(mem[32]), .IN2(n87), .IN3(mem[44]), .IN4(n89), .Q(n73) );
  AO221X1 U103 ( .IN1(mem[20]), .IN2(n83), .IN3(mem[8]), .IN4(n84), .IN5(n73),
        .Q(dataout[8]) );
  AO22X1 U104 ( .IN1(mem[33]), .IN2(n86), .IN3(mem[45]), .IN4(n88), .Q(n74) );
  AO221X1 U105 ( .IN1(mem[21]), .IN2(n82), .IN3(mem[9]), .IN4(n84), .IN5(n74),
        .Q(dataout[9]) );
  AO22X1 U106 ( .IN1(mem[34]), .IN2(n87), .IN3(mem[46]), .IN4(n89), .Q(n75) );
  AO221X1 U107 ( .IN1(mem[22]), .IN2(n83), .IN3(mem[10]), .IN4(n84), .IN5(n75),
        .Q(dataout[10]) );
  AO22X1 U108 ( .IN1(mem[35]), .IN2(n86), .IN3(mem[47]), .IN4(n88), .Q(n78) );
  AO221X1 U109 ( .IN1(mem[23]), .IN2(n82), .IN3(mem[11]), .IN4(n84), .IN5(n78),
        .Q(dataout[11]) );
endmodule


module integrator_N12_1_DW01_add_0 ( A, B, CI, SUM, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [11:2] carry;

  FADDX1 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  FADDX1 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  FADDX1 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  FADDX1 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  FADDX1 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  FADDX1 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  FADDX1 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  FADDX1 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  FADDX1 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  FADDX1 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  XOR3X1 U1_11 ( .IN1(A[11]), .IN2(B[11]), .IN3(carry[11]), .Q(SUM[11]) );
  AND2X1 U1 ( .IN1(A[0]), .IN2(B[0]), .Q(n1) );
  XOR2X1 U2 ( .IN1(A[0]), .IN2(B[0]), .Q(SUM[0]) );
endmodule


module integrator_N12_1 ( clk, rstn, we, X0, dxdt, OUT );
  input [11:0] X0;
  input [11:0] dxdt;
  output [11:0] OUT;
  input clk, rstn, we;
  wire   N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19,
         N20, N21, N22, N23, N24, N25, N26, N27, N28, n2, n3, n4, n5;

  DFFARX1 OUT_reg_0_ ( .D(N17), .CLK(clk), .RSTB(rstn), .Q(OUT[0]) );
  DFFARX1 OUT_reg_1_ ( .D(N18), .CLK(clk), .RSTB(rstn), .Q(OUT[1]) );
  DFFARX1 OUT_reg_2_ ( .D(N19), .CLK(clk), .RSTB(rstn), .Q(OUT[2]) );
  DFFARX1 OUT_reg_3_ ( .D(N20), .CLK(clk), .RSTB(rstn), .Q(OUT[3]) );
  DFFARX1 OUT_reg_4_ ( .D(N21), .CLK(clk), .RSTB(rstn), .Q(OUT[4]) );
  DFFARX1 OUT_reg_5_ ( .D(N22), .CLK(clk), .RSTB(rstn), .Q(OUT[5]) );
  DFFARX1 OUT_reg_6_ ( .D(N23), .CLK(clk), .RSTB(rstn), .Q(OUT[6]) );
  DFFARX1 OUT_reg_7_ ( .D(N24), .CLK(clk), .RSTB(rstn), .Q(OUT[7]) );
  DFFARX1 OUT_reg_8_ ( .D(N25), .CLK(clk), .RSTB(rstn), .Q(OUT[8]) );
  DFFARX1 OUT_reg_9_ ( .D(N26), .CLK(clk), .RSTB(rstn), .Q(OUT[9]) );
  DFFARX1 OUT_reg_10_ ( .D(N27), .CLK(clk), .RSTB(rstn), .Q(OUT[10]) );
  DFFARX1 OUT_reg_11_ ( .D(N28), .CLK(clk), .RSTB(rstn), .Q(OUT[11]) );
  AO22X1 U4 ( .IN1(n4), .IN2(X0[11]), .IN3(N16), .IN4(n3), .Q(N28) );
  AO22X1 U6 ( .IN1(X0[10]), .IN2(n4), .IN3(N15), .IN4(n2), .Q(N27) );
  AO22X1 U7 ( .IN1(X0[9]), .IN2(n4), .IN3(N14), .IN4(n3), .Q(N26) );
  AO22X1 U8 ( .IN1(X0[8]), .IN2(n4), .IN3(N13), .IN4(n2), .Q(N25) );
  AO22X1 U9 ( .IN1(X0[7]), .IN2(n4), .IN3(N12), .IN4(n3), .Q(N24) );
  AO22X1 U10 ( .IN1(X0[6]), .IN2(n4), .IN3(N11), .IN4(n2), .Q(N23) );
  AO22X1 U11 ( .IN1(X0[5]), .IN2(n4), .IN3(N10), .IN4(n3), .Q(N22) );
  AO22X1 U12 ( .IN1(X0[4]), .IN2(n4), .IN3(N9), .IN4(n2), .Q(N21) );
  AO22X1 U13 ( .IN1(X0[3]), .IN2(n4), .IN3(N8), .IN4(n3), .Q(N20) );
  AO22X1 U14 ( .IN1(X0[2]), .IN2(n4), .IN3(N7), .IN4(n2), .Q(N19) );
  AO22X1 U15 ( .IN1(X0[1]), .IN2(n4), .IN3(N6), .IN4(n3), .Q(N18) );
  AO22X1 U16 ( .IN1(X0[0]), .IN2(n4), .IN3(N5), .IN4(n2), .Q(N17) );
  NBUFFX2 U3 ( .INP(n5), .Z(n3) );
  NBUFFX2 U17 ( .INP(we), .Z(n4) );
  NBUFFX2 U18 ( .INP(n5), .Z(n2) );
  INVX0 U19 ( .INP(n4), .ZN(n5) );
  integrator_N12_1_DW01_add_0 add_11 ( .A(OUT), .B(dxdt), .CI(1'b0), .SUM({N16,
        N15, N14, N13, N12, N11, N10, N9, N8, N7, N6, N5}) );
endmodule


module twos_comp_gen_N6_1 ( X, sign, OUT );
  input [5:0] X;
  output [5:0] OUT;
  input sign;
  wire   N4, N5, N6, N7, N8, n1, n2, n3, n4, n5, n6;
  wire   [5:2] sub_9_carry;

  AO22X1 U6 ( .IN1(X[5]), .IN2(n6), .IN3(sign), .IN4(N8), .Q(OUT[5]) );
  AO22X1 U7 ( .IN1(X[4]), .IN2(n6), .IN3(N7), .IN4(sign), .Q(OUT[4]) );
  AO22X1 U8 ( .IN1(X[3]), .IN2(n6), .IN3(N6), .IN4(sign), .Q(OUT[3]) );
  AO22X1 U9 ( .IN1(X[2]), .IN2(n6), .IN3(N5), .IN4(sign), .Q(OUT[2]) );
  AO22X1 U10 ( .IN1(X[1]), .IN2(n6), .IN3(N4), .IN4(sign), .Q(OUT[1]) );
  AO22X1 U11 ( .IN1(X[0]), .IN2(n6), .IN3(X[0]), .IN4(sign), .Q(OUT[0]) );
  INVX0 U2 ( .INP(X[3]), .ZN(n3) );
  INVX0 U3 ( .INP(X[1]), .ZN(n1) );
  INVX0 U4 ( .INP(X[0]), .ZN(n2) );
  INVX0 U5 ( .INP(X[2]), .ZN(n4) );
  INVX0 U12 ( .INP(X[4]), .ZN(n5) );
  XNOR2X1 U13 ( .IN1(X[5]), .IN2(sub_9_carry[5]), .Q(N8) );
  INVX0 U14 ( .INP(sign), .ZN(n6) );
  AND2X1 U15 ( .IN1(sub_9_carry[4]), .IN2(n5), .Q(sub_9_carry[5]) );
  XOR2X1 U16 ( .IN1(n5), .IN2(sub_9_carry[4]), .Q(N7) );
  AND2X1 U17 ( .IN1(sub_9_carry[3]), .IN2(n3), .Q(sub_9_carry[4]) );
  XOR2X1 U18 ( .IN1(n3), .IN2(sub_9_carry[3]), .Q(N6) );
  AND2X1 U19 ( .IN1(sub_9_carry[2]), .IN2(n4), .Q(sub_9_carry[3]) );
  XOR2X1 U20 ( .IN1(n4), .IN2(sub_9_carry[2]), .Q(N5) );
  AND2X1 U21 ( .IN1(n2), .IN2(n1), .Q(sub_9_carry[2]) );
  XOR2X1 U22 ( .IN1(n1), .IN2(n2), .Q(N4) );
endmodule


module twos_comp_gen_N6_0 ( X, sign, OUT );
  input [5:0] X;
  output [5:0] OUT;
  input sign;
  wire   N4, N5, N6, N7, N8, n1, n2, n3, n4, n5, n6;
  wire   [5:2] sub_9_carry;

  AO22X1 U6 ( .IN1(X[5]), .IN2(n6), .IN3(sign), .IN4(N8), .Q(OUT[5]) );
  AO22X1 U7 ( .IN1(X[4]), .IN2(n6), .IN3(N7), .IN4(sign), .Q(OUT[4]) );
  AO22X1 U8 ( .IN1(X[3]), .IN2(n6), .IN3(N6), .IN4(sign), .Q(OUT[3]) );
  AO22X1 U9 ( .IN1(X[2]), .IN2(n6), .IN3(N5), .IN4(sign), .Q(OUT[2]) );
  AO22X1 U10 ( .IN1(X[1]), .IN2(n6), .IN3(N4), .IN4(sign), .Q(OUT[1]) );
  AO22X1 U11 ( .IN1(X[0]), .IN2(n6), .IN3(X[0]), .IN4(sign), .Q(OUT[0]) );
  INVX0 U2 ( .INP(X[4]), .ZN(n1) );
  INVX0 U3 ( .INP(X[0]), .ZN(n3) );
  INVX0 U4 ( .INP(X[3]), .ZN(n2) );
  INVX0 U5 ( .INP(X[1]), .ZN(n5) );
  INVX0 U12 ( .INP(X[2]), .ZN(n4) );
  INVX0 U13 ( .INP(sign), .ZN(n6) );
  XNOR2X1 U14 ( .IN1(X[5]), .IN2(sub_9_carry[5]), .Q(N8) );
  AND2X1 U15 ( .IN1(sub_9_carry[4]), .IN2(n1), .Q(sub_9_carry[5]) );
  XOR2X1 U16 ( .IN1(n1), .IN2(sub_9_carry[4]), .Q(N7) );
  AND2X1 U17 ( .IN1(sub_9_carry[3]), .IN2(n2), .Q(sub_9_carry[4]) );
  XOR2X1 U18 ( .IN1(n2), .IN2(sub_9_carry[3]), .Q(N6) );
  AND2X1 U19 ( .IN1(sub_9_carry[2]), .IN2(n4), .Q(sub_9_carry[3]) );
  XOR2X1 U20 ( .IN1(n4), .IN2(sub_9_carry[2]), .Q(N5) );
  AND2X1 U21 ( .IN1(n3), .IN2(n5), .Q(sub_9_carry[2]) );
  XOR2X1 U22 ( .IN1(n5), .IN2(n3), .Q(N4) );
endmodule


module complex_exp_LUT_N12_M6 ( clk, rstn, pause, theta, sin, cos );
  input [11:0] theta;
  output [5:0] sin;
  output [5:0] cos;
  input clk, rstn, pause;
  wire   lut_word_4, lut_word_3, lut_word_2, lut_word_1, lut_word_0, scos,
         N11288, N11289, N11290, N11291, N11292, N11293, N11294, N11295,
         N11296, N11297, N11298, N11299, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198,
         n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n209,
         n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n220,
         n221, n222, n223, n224, n225, n226, n227, n228, n229, n230, n231,
         n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n242,
         n243, n244, n245, n246, n247, n248, n249, n250, n251, n252, n253,
         n254, n255, n256, n257, n258, n259, n260, n261, n262, n263, n264,
         n265, n266, n267, n268, n269, n270, n271, n272, n273, n274, n275,
         n276, n277, n278, n279, n280, n281, n282, n283, n284, n285, n286,
         n287, n288, n289, n290, n291, n292, n293, n294, n295, n296, n297,
         n298, n299, n300, n301, n302, n303, n304, n305, n306, n307, n308,
         n309, n310, n311, n312, n313, n314, n315, n316, n317, n318, n319,
         n320, n321, n322, n323, n324, n325, n326, n327, n328, n329, n330,
         n331, n332, n333, n334, n335, n336, n337, n338, n339, n340, n341,
         n342, n343, n344, n345, n346, n347, n348, n349, n350, n351, n352,
         n353, n354, n355, n356, n357, n358, n359, n360, n361, n362, n363,
         n364, n365, n366, n367, n368, n371, n372, n373, n374, n375, n376,
         n377, n378, n379, n380, n381, n382, n383, n384, n385, n386, n387,
         n388, n389, n390, n391, n392, n393, n394, n395, n396, n397, n398,
         n399, n400, n401, n402, n403, n404, n405, n406, n407, n408, n409,
         n410, n411, n412, n413, n414, n415, n416, n417, n418, n419, n420,
         n421, n422, n423, n424, n425, n426, n427, n428, n429, n430, n431,
         n432, n433, n434, n435, n436, n437, n438, n439, n440, n441, n442,
         n443, n444, n445, n446, n447, n448, n449, n450, n451, n452, n453,
         n454, n455, n456, n457, n458, n459, n460, n461, n462, n463, n464,
         n465, n466, n467, n468, n469, n470, n471, n472, n473, n474, n475,
         n476, n477, n478, n479, n480, n481, n482, n483, n484, n485, n486,
         n487, n488, n489, n490, n491, n492, n493, n494, n495, n496, n497, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n369, n370, n498, n499, n500, n501, n502,
         n503, n504, n505, n506, n507;
  wire   [10:6] lut_word;
  wire   [5:0] sinq;
  wire   [5:0] cosq;

  DFFARX1 cos_reg_5_ ( .D(N11299), .CLK(clk), .RSTB(rstn), .Q(cos[5]) );
  DFFARX1 cos_reg_4_ ( .D(N11298), .CLK(clk), .RSTB(rstn), .Q(cos[4]) );
  DFFARX1 cos_reg_3_ ( .D(N11297), .CLK(clk), .RSTB(rstn), .Q(cos[3]) );
  DFFARX1 cos_reg_2_ ( .D(N11296), .CLK(clk), .RSTB(rstn), .Q(cos[2]) );
  DFFARX1 cos_reg_1_ ( .D(N11295), .CLK(clk), .RSTB(rstn), .Q(cos[1]) );
  DFFARX1 cos_reg_0_ ( .D(N11294), .CLK(clk), .RSTB(rstn), .Q(cos[0]) );
  DFFARX1 sin_reg_5_ ( .D(N11293), .CLK(clk), .RSTB(rstn), .Q(sin[5]) );
  DFFARX1 sin_reg_4_ ( .D(N11292), .CLK(clk), .RSTB(rstn), .Q(sin[4]) );
  DFFARX1 sin_reg_3_ ( .D(N11291), .CLK(clk), .RSTB(rstn), .Q(sin[3]) );
  DFFARX1 sin_reg_2_ ( .D(N11290), .CLK(clk), .RSTB(rstn), .Q(sin[2]) );
  DFFARX1 sin_reg_1_ ( .D(N11289), .CLK(clk), .RSTB(rstn), .Q(sin[1]) );
  DFFARX1 sin_reg_0_ ( .D(N11288), .CLK(clk), .RSTB(rstn), .Q(sin[0]) );
  XOR2X1 U248 ( .IN1(theta[11]), .IN2(n3), .Q(scos) );
  NAND4X0 U249 ( .IN1(n92), .IN2(n93), .IN3(n94), .IN4(n95), .QN(lut_word_4)
         );
  NAND4X0 U250 ( .IN1(n96), .IN2(n97), .IN3(n98), .IN4(n92), .QN(lut_word_3)
         );
  NAND4X0 U251 ( .IN1(n104), .IN2(n94), .IN3(n105), .IN4(n106), .QN(lut_word_2) );
  NAND4X0 U252 ( .IN1(n111), .IN2(n96), .IN3(n25), .IN4(n112), .QN(n107) );
  AND2X1 U253 ( .IN1(n117), .IN2(n118), .Q(n104) );
  OR4X1 U254 ( .IN1(n119), .IN2(n120), .IN3(n121), .IN4(n122), .Q(lut_word_1)
         );
  NAND4X0 U255 ( .IN1(n123), .IN2(n124), .IN3(n125), .IN4(n126), .QN(n122) );
  OR4X1 U256 ( .IN1(n127), .IN2(n128), .IN3(n129), .IN4(n49), .Q(n121) );
  NAND4X0 U257 ( .IN1(n23), .IN2(n131), .IN3(n52), .IN4(n18), .QN(n120) );
  NAND4X0 U258 ( .IN1(n96), .IN2(n133), .IN3(n118), .IN4(n39), .QN(n119) );
  NAND4X0 U259 ( .IN1(n19), .IN2(n52), .IN3(n135), .IN4(n136), .QN(lut_word_0)
         );
  OR3X1 U260 ( .IN1(n140), .IN2(n141), .IN3(n142), .Q(n137) );
  NOR3X0 U261 ( .IN1(n143), .IN2(n144), .IN3(n145), .QN(n135) );
  NAND4X0 U262 ( .IN1(n102), .IN2(n67), .IN3(n146), .IN4(n147), .QN(n108) );
  AND3X1 U263 ( .IN1(n148), .IN2(n149), .IN3(n150), .Q(n147) );
  AND4X1 U264 ( .IN1(n152), .IN2(n65), .IN3(n153), .IN4(n154), .Q(n102) );
  OAI22X1 U265 ( .IN1(n85), .IN2(n502), .IN3(n155), .IN4(n69), .QN(n154) );
  NAND3X0 U266 ( .IN1(n156), .IN2(n157), .IN3(n158), .QN(n155) );
  NAND4X0 U267 ( .IN1(n161), .IN2(n162), .IN3(n163), .IN4(n47), .QN(
        lut_word[9]) );
  NAND3X0 U268 ( .IN1(n55), .IN2(n164), .IN3(n126), .QN(n100) );
  AOI221X1 U269 ( .IN1(n165), .IN2(n166), .IN3(n370), .IN4(n167), .IN5(n168),
        .QN(n126) );
  AO21X1 U270 ( .IN1(n89), .IN2(n62), .IN3(n169), .Q(n168) );
  NAND3X0 U271 ( .IN1(n171), .IN2(n172), .IN3(n170), .QN(n167) );
  NOR3X0 U272 ( .IN1(n74), .IN2(n63), .IN3(n166), .QN(n170) );
  NAND4X0 U273 ( .IN1(n45), .IN2(n161), .IN3(n176), .IN4(n177), .QN(
        lut_word[8]) );
  AOI221X1 U274 ( .IN1(n501), .IN2(n180), .IN3(n84), .IN4(n181), .IN5(n138),
        .QN(n164) );
  AO22X1 U275 ( .IN1(n182), .IN2(n183), .IN3(n184), .IN4(n185), .Q(n138) );
  AND3X1 U276 ( .IN1(n187), .IN2(n103), .IN3(n94), .Q(n176) );
  AO222X1 U277 ( .IN1(n499), .IN2(n189), .IN3(n190), .IN4(n191), .IN5(n83),
        .IN6(n192), .Q(n151) );
  NAND4X0 U278 ( .IN1(n193), .IN2(n156), .IN3(n158), .IN4(n194), .QN(n192) );
  AND4X1 U279 ( .IN1(n195), .IN2(n196), .IN3(n197), .IN4(n157), .Q(n194) );
  OR3X1 U280 ( .IN1(n69), .IN2(n76), .IN3(n191), .Q(n189) );
  NAND4X0 U281 ( .IN1(n201), .IN2(n94), .IN3(n202), .IN4(n203), .QN(
        lut_word[7]) );
  NOR3X0 U282 ( .IN1(n206), .IN2(n99), .IN3(n207), .QN(n202) );
  NAND4X0 U283 ( .IN1(n50), .IN2(n208), .IN3(n175), .IN4(n209), .QN(n99) );
  AND3X1 U284 ( .IN1(n116), .IN2(n130), .IN3(n148), .Q(n209) );
  AOI221X1 U285 ( .IN1(n502), .IN2(n210), .IN3(n74), .IN4(n85), .IN5(n211),
        .QN(n148) );
  AO21X1 U286 ( .IN1(n212), .IN2(n166), .IN3(n179), .Q(n211) );
  AO221X1 U287 ( .IN1(n501), .IN2(n214), .IN3(n85), .IN4(n215), .IN5(n216),
        .Q(n174) );
  AO22X1 U288 ( .IN1(n84), .IN2(n217), .IN3(n502), .IN4(n218), .Q(n216) );
  NAND3X0 U289 ( .IN1(n219), .IN2(n220), .IN3(n323), .QN(n215) );
  NAND3X0 U290 ( .IN1(n222), .IN2(n223), .IN3(n224), .QN(n127) );
  AOI222X1 U291 ( .IN1(n498), .IN2(n225), .IN3(n226), .IN4(n227), .IN5(n228),
        .IN6(n185), .QN(n224) );
  AO21X1 U292 ( .IN1(n172), .IN2(n171), .IN3(n199), .Q(n223) );
  NOR3X0 U293 ( .IN1(n115), .IN2(n129), .IN3(n128), .QN(n175) );
  AO22X1 U294 ( .IN1(n501), .IN2(n229), .IN3(n84), .IN4(n230), .Q(n129) );
  NAND3X0 U295 ( .IN1(n232), .IN2(n233), .IN3(n231), .QN(n229) );
  AO221X1 U296 ( .IN1(n234), .IN2(n191), .IN3(n369), .IN4(n235), .IN5(n236),
        .Q(n115) );
  AO21X1 U297 ( .IN1(n88), .IN2(n237), .IN3(n238), .Q(n236) );
  NAND3X0 U298 ( .IN1(n239), .IN2(n240), .IN3(n68), .QN(n235) );
  NAND4X0 U299 ( .IN1(n243), .IN2(n17), .IN3(n244), .IN4(n245), .QN(
        lut_word[6]) );
  AO222X1 U300 ( .IN1(n89), .IN2(n248), .IN3(n165), .IN4(n185), .IN5(n249),
        .IN6(n227), .Q(n169) );
  NAND4X0 U301 ( .IN1(n250), .IN2(n171), .IN3(n172), .IN4(n213), .QN(n185) );
  AO222X1 U302 ( .IN1(n84), .IN2(n237), .IN3(n251), .IN4(n191), .IN5(n69),
        .IN6(n501), .Q(n159) );
  NAND4X0 U303 ( .IN1(n68), .IN2(n158), .IN3(n252), .IN4(n193), .QN(n237) );
  NAND4X0 U304 ( .IN1(n208), .IN2(n222), .IN3(n253), .IN4(n61), .QN(n246) );
  AO222X1 U305 ( .IN1(n87), .IN2(n254), .IN3(n184), .IN4(n166), .IN5(n369),
        .IN6(n255), .Q(n238) );
  NAND3X0 U306 ( .IN1(n239), .IN2(n240), .IN3(n64), .QN(n254) );
  NAND4X0 U307 ( .IN1(n171), .IN2(n256), .IN3(n250), .IN4(n257), .QN(n255) );
  AND3X1 U308 ( .IN1(n172), .IN2(n213), .IN3(n258), .Q(n257) );
  AOI222X1 U309 ( .IN1(n86), .IN2(n259), .IN3(n226), .IN4(n191), .IN5(n498),
        .IN6(n189), .QN(n222) );
  NAND3X0 U310 ( .IN1(n158), .IN2(n157), .IN3(n260), .QN(n259) );
  NOR3X0 U311 ( .IN1(n69), .IN2(n76), .IN3(n191), .QN(n260) );
  NAND4X0 U312 ( .IN1(n197), .IN2(n261), .IN3(n196), .IN4(n195), .QN(n191) );
  AND2X1 U313 ( .IN1(n150), .IN2(n266), .Q(n208) );
  NAND4X0 U314 ( .IN1(n158), .IN2(n193), .IN3(n156), .IN4(n157), .QN(n227) );
  OA22X1 U315 ( .IN1(n74), .IN2(n273), .IN3(n84), .IN4(n501), .Q(n269) );
  AND2X1 U316 ( .IN1(n273), .IN2(n85), .Q(n268) );
  NAND3X0 U317 ( .IN1(n172), .IN2(n213), .IN3(n171), .QN(n273) );
  AOI21X1 U318 ( .IN1(n158), .IN2(n157), .IN3(n274), .QN(n267) );
  NOR3X0 U319 ( .IN1(n132), .IN2(n275), .IN3(n276), .QN(n244) );
  NAND4X0 U320 ( .IN1(n277), .IN2(n278), .IN3(n279), .IN4(n280), .QN(n132) );
  NAND4X0 U321 ( .IN1(n283), .IN2(n21), .IN3(n284), .IN4(n38), .QN(n205) );
  NAND4X0 U322 ( .IN1(n146), .IN2(n118), .IN3(n286), .IN4(n152), .QN(n200) );
  AOI221X1 U323 ( .IN1(n287), .IN2(n166), .IN3(n500), .IN4(n210), .IN5(n288),
        .QN(n152) );
  OAI22X1 U324 ( .IN1(n261), .IN2(n289), .IN3(n250), .IN4(n199), .QN(n288) );
  NAND4X0 U325 ( .IN1(n60), .IN2(n250), .IN3(n290), .IN4(n171), .QN(n210) );
  NAND4X0 U326 ( .IN1(n239), .IN2(n240), .IN3(n256), .IN4(n258), .QN(n166) );
  AND2X1 U327 ( .IN1(n293), .IN2(n294), .Q(n264) );
  AND2X1 U328 ( .IN1(n293), .IN2(n295), .Q(n272) );
  AND2X1 U329 ( .IN1(n296), .IN2(n295), .Q(n262) );
  AND2X1 U330 ( .IN1(n296), .IN2(n294), .Q(n265) );
  AO221X1 U331 ( .IN1(n84), .IN2(n297), .IN3(n502), .IN4(n298), .IN5(n299),
        .Q(n173) );
  AO22X1 U332 ( .IN1(n501), .IN2(n300), .IN3(n85), .IN4(n301), .Q(n299) );
  NAND3X0 U333 ( .IN1(n219), .IN2(n220), .IN3(n56), .QN(n298) );
  NAND3X0 U334 ( .IN1(n302), .IN2(n303), .IN3(n57), .QN(n301) );
  AO221X1 U335 ( .IN1(n500), .IN2(n304), .IN3(n82), .IN4(n46), .IN5(n305), .Q(
        n128) );
  AO22X1 U336 ( .IN1(n84), .IN2(n306), .IN3(n228), .IN4(n183), .Q(n305) );
  NAND3X0 U337 ( .IN1(n308), .IN2(n309), .IN3(n307), .QN(n304) );
  NOR3X0 U338 ( .IN1(n54), .IN2(n71), .IN3(n183), .QN(n307) );
  NAND3X0 U339 ( .IN1(n310), .IN2(n311), .IN3(n20), .QN(n160) );
  OR4X1 U340 ( .IN1(n188), .IN2(n44), .IN3(n313), .IN4(n314), .Q(lut_word[10])
         );
  NAND4X0 U341 ( .IN1(n161), .IN2(n162), .IN3(n94), .IN4(n95), .QN(n314) );
  AND3X1 U342 ( .IN1(n118), .IN2(n149), .IN3(n146), .Q(n95) );
  AOI222X1 U343 ( .IN1(n91), .IN2(n315), .IN3(n316), .IN4(n217), .IN5(n88),
        .IN6(n317), .QN(n146) );
  NAND4X0 U344 ( .IN1(n302), .IN2(n303), .IN3(n220), .IN4(n319), .QN(n317) );
  AO21X1 U345 ( .IN1(n318), .IN2(n241), .IN3(n319), .Q(n149) );
  OA22X1 U346 ( .IN1(n219), .IN2(n322), .IN3(n318), .IN4(n323), .Q(n118) );
  AND4X1 U347 ( .IN1(n221), .IN2(n231), .IN3(n232), .IN4(n233), .Q(n323) );
  NOR3X0 U348 ( .IN1(n275), .IN2(n144), .IN3(n134), .QN(n94) );
  AO222X1 U349 ( .IN1(n251), .IN2(n324), .IN3(n325), .IN4(n218), .IN5(n40),
        .IN6(n84), .Q(n134) );
  NAND3X0 U350 ( .IN1(n241), .IN2(n322), .IN3(n242), .QN(n325) );
  NAND3X0 U351 ( .IN1(n326), .IN2(n327), .IN3(n328), .QN(n251) );
  AO22X1 U352 ( .IN1(n84), .IN2(n329), .IN3(n502), .IN4(n330), .Q(n144) );
  AO221X1 U353 ( .IN1(n84), .IN2(n333), .IN3(n501), .IN4(n334), .IN5(n335),
        .Q(n275) );
  AO21X1 U354 ( .IN1(n33), .IN2(n502), .IN3(n142), .Q(n335) );
  AO221X1 U355 ( .IN1(n212), .IN2(n336), .IN3(n502), .IN4(n337), .IN5(n338),
        .Q(n142) );
  AO22X1 U356 ( .IN1(n36), .IN2(n501), .IN3(n85), .IN4(n339), .Q(n338) );
  NAND3X0 U357 ( .IN1(n340), .IN2(n341), .IN3(n37), .QN(n337) );
  OR2X1 U358 ( .IN1(n334), .IN2(n36), .Q(n333) );
  NAND3X0 U359 ( .IN1(n343), .IN2(n344), .IN3(n345), .QN(n334) );
  AND3X1 U360 ( .IN1(n96), .IN2(n93), .IN3(n187), .Q(n162) );
  AND4X1 U361 ( .IN1(n21), .IN2(n98), .IN3(n18), .IN4(n346), .Q(n187) );
  AOI221X1 U362 ( .IN1(n347), .IN2(n348), .IN3(n83), .IN4(n349), .IN5(n350),
        .QN(n97) );
  AO22X1 U363 ( .IN1(n78), .IN2(n499), .IN3(n29), .IN4(n500), .Q(n350) );
  NAND3X0 U364 ( .IN1(n199), .IN2(n198), .IN3(n274), .QN(n347) );
  AO221X1 U365 ( .IN1(n88), .IN2(n349), .IN3(n29), .IN4(n369), .IN5(n351), .Q(
        n282) );
  AO21X1 U366 ( .IN1(n249), .IN2(n348), .IN3(n114), .Q(n351) );
  NAND4X0 U367 ( .IN1(n131), .IN2(n111), .IN3(n355), .IN4(n356), .QN(n312) );
  AO21X1 U368 ( .IN1(n357), .IN2(n354), .IN3(n241), .Q(n356) );
  AO21X1 U369 ( .IN1(n357), .IN2(n358), .IN3(n318), .Q(n355) );
  AND2X1 U370 ( .IN1(n359), .IN2(n360), .Q(n357) );
  AOI222X1 U371 ( .IN1(n370), .IN2(n361), .IN3(n362), .IN4(n348), .IN5(n86),
        .IN6(n349), .QN(n111) );
  NAND4X0 U372 ( .IN1(n28), .IN2(n363), .IN3(n364), .IN4(n365), .QN(n349) );
  NAND3X0 U373 ( .IN1(n359), .IN2(n354), .IN3(n28), .QN(n361) );
  AOI222X1 U374 ( .IN1(n249), .IN2(n366), .IN3(n165), .IN4(n367), .IN5(n77),
        .IN6(n89), .QN(n131) );
  NAND3X0 U375 ( .IN1(n241), .IN2(n318), .IN3(n242), .QN(n249) );
  OA22X1 U378 ( .IN1(n78), .IN2(n371), .IN3(n89), .IN4(n370), .Q(n372) );
  NAND3X0 U379 ( .IN1(n365), .IN2(n373), .IN3(n363), .QN(n371) );
  AO222X1 U380 ( .IN1(n82), .IN2(n375), .IN3(n228), .IN4(n376), .IN5(n500),
        .IN6(n377), .Q(n143) );
  AND4X1 U381 ( .IN1(n379), .IN2(n380), .IN3(n381), .IN4(n382), .Q(n378) );
  AND3X1 U382 ( .IN1(n358), .IN2(n359), .IN3(n360), .Q(n382) );
  NOR3X0 U383 ( .IN1(n281), .IN2(n113), .IN3(n145), .QN(n98) );
  NAND3X0 U384 ( .IN1(n201), .IN2(n279), .IN3(n112), .QN(n145) );
  AOI221X1 U385 ( .IN1(n91), .IN2(n383), .IN3(n369), .IN4(n384), .IN5(n385),
        .QN(n112) );
  AO22X1 U386 ( .IN1(n87), .IN2(n339), .IN3(n88), .IN4(n386), .Q(n385) );
  NAND4X0 U387 ( .IN1(n37), .IN2(n340), .IN3(n387), .IN4(n341), .QN(n386) );
  AND2X1 U388 ( .IN1(n331), .IN2(n332), .Q(n387) );
  AOI222X1 U389 ( .IN1(n84), .IN2(n388), .IN3(n182), .IN4(n348), .IN5(n501),
        .IN6(n389), .QN(n279) );
  NAND4X0 U390 ( .IN1(n391), .IN2(n392), .IN3(n393), .IN4(n394), .QN(n348) );
  AND4X1 U391 ( .IN1(n365), .IN2(n392), .IN3(n363), .IN4(n395), .Q(n390) );
  AND3X1 U392 ( .IN1(n394), .IN2(n352), .IN3(n393), .Q(n395) );
  AND3X1 U393 ( .IN1(n400), .IN2(n401), .IN3(n402), .Q(n201) );
  OA22X1 U394 ( .IN1(n403), .IN2(n274), .IN3(n404), .IN4(n326), .Q(n402) );
  AO22X1 U395 ( .IN1(n198), .IN2(n199), .IN3(n403), .IN4(n352), .Q(n401) );
  AND3X1 U396 ( .IN1(n365), .IN2(n373), .IN3(n363), .Q(n403) );
  AO22X1 U397 ( .IN1(n327), .IN2(n399), .IN3(n404), .IN4(n381), .Q(n400) );
  AND3X1 U398 ( .IN1(n379), .IN2(n380), .IN3(n374), .Q(n404) );
  NAND3X0 U399 ( .IN1(n133), .IN2(n26), .IN3(n405), .QN(n113) );
  AOI222X1 U400 ( .IN1(n91), .IN2(n33), .IN3(n87), .IN4(n406), .IN5(n369),
        .IN6(n407), .QN(n405) );
  NAND3X0 U401 ( .IN1(n408), .IN2(n409), .IN3(n41), .QN(n406) );
  AO221X1 U402 ( .IN1(n182), .IN2(n366), .IN3(n88), .IN4(n410), .IN5(n411),
        .Q(n276) );
  AO22X1 U403 ( .IN1(n30), .IN2(n501), .IN3(n91), .IN4(n412), .Q(n411) );
  NAND4X0 U404 ( .IN1(n363), .IN2(n365), .IN3(n373), .IN4(n352), .QN(n366) );
  AOI221X1 U405 ( .IN1(n91), .IN2(n414), .IN3(n88), .IN4(n324), .IN5(n415),
        .QN(n133) );
  OA22X1 U406 ( .IN1(n80), .IN2(n416), .IN3(n87), .IN4(n369), .Q(n415) );
  OR2X1 U407 ( .IN1(n324), .IN2(n416), .Q(n414) );
  AO221X1 U408 ( .IN1(n212), .IN2(n376), .IN3(n502), .IN4(n417), .IN5(n418),
        .Q(n281) );
  OAI22X1 U409 ( .IN1(n391), .IN2(n399), .IN3(n381), .IN4(n326), .QN(n418) );
  NAND4X0 U410 ( .IN1(n24), .IN2(n381), .IN3(n419), .IN4(n374), .QN(n417) );
  AND2X1 U411 ( .IN1(n380), .IN2(n379), .Q(n419) );
  AO222X1 U412 ( .IN1(n370), .IN2(n420), .IN3(n421), .IN4(n376), .IN5(n89),
        .IN6(n422), .Q(n109) );
  NAND4X0 U413 ( .IN1(n22), .IN2(n358), .IN3(n360), .IN4(n374), .QN(n420) );
  NAND3X0 U414 ( .IN1(n379), .IN2(n380), .IN3(n381), .QN(n422) );
  AND4X1 U415 ( .IN1(n31), .IN2(n277), .IN3(n423), .IN4(n117), .Q(n93) );
  AOI221X1 U416 ( .IN1(n212), .IN2(n424), .IN3(n502), .IN4(n412), .IN5(n425),
        .QN(n117) );
  AO22X1 U417 ( .IN1(n40), .IN2(n82), .IN3(n500), .IN4(n324), .Q(n425) );
  NAND3X0 U418 ( .IN1(n327), .IN2(n399), .IN3(n326), .QN(n212) );
  AO221X1 U419 ( .IN1(n86), .IN2(n430), .IN3(n498), .IN4(n431), .IN5(n432),
        .Q(n285) );
  OA22X1 U420 ( .IN1(n79), .IN2(n431), .IN3(n89), .IN4(n370), .Q(n432) );
  NAND3X0 U421 ( .IN1(n344), .IN2(n342), .IN3(n343), .QN(n431) );
  NAND3X0 U422 ( .IN1(n341), .IN2(n332), .IN3(n340), .QN(n430) );
  AO221X1 U423 ( .IN1(n362), .IN2(n336), .IN3(n80), .IN4(n370), .IN5(n433),
        .Q(n206) );
  OAI21X1 U424 ( .IN1(n331), .IN2(n368), .IN3(n123), .QN(n433) );
  AOI22X1 U425 ( .IN1(n33), .IN2(n499), .IN3(n82), .IN4(n407), .QN(n123) );
  AOI222X1 U426 ( .IN1(n500), .IN2(n437), .IN3(n228), .IN4(n339), .IN5(n82),
        .IN6(n384), .QN(n277) );
  NAND3X0 U427 ( .IN1(n435), .IN2(n434), .IN3(n35), .QN(n437) );
  NAND3X0 U428 ( .IN1(n408), .IN2(n409), .IN3(n37), .QN(n384) );
  NAND4X0 U429 ( .IN1(n345), .IN2(n343), .IN3(n344), .IN4(n342), .QN(n339) );
  NAND3X0 U430 ( .IN1(n124), .IN2(n278), .IN3(n32), .QN(n140) );
  AO221X1 U431 ( .IN1(n370), .IN2(n438), .IN3(n499), .IN4(n412), .IN5(n439),
        .Q(n207) );
  AO22X1 U432 ( .IN1(n421), .IN2(n324), .IN3(n83), .IN4(n410), .Q(n439) );
  OR2X1 U433 ( .IN1(n412), .IN2(n33), .Q(n410) );
  NAND3X0 U434 ( .IN1(n368), .IN2(n353), .IN3(n436), .QN(n421) );
  NAND3X0 U435 ( .IN1(n434), .IN2(n409), .IN3(n435), .QN(n412) );
  NAND4X0 U436 ( .IN1(n449), .IN2(n341), .IN3(n332), .IN4(n331), .QN(n438) );
  NAND4X0 U437 ( .IN1(n440), .IN2(n441), .IN3(n442), .IN4(n443), .QN(n324) );
  AOI22X1 U438 ( .IN1(n80), .IN2(n500), .IN3(n287), .IN4(n336), .QN(n278) );
  NAND4X0 U439 ( .IN1(n340), .IN2(n341), .IN3(n332), .IN4(n331), .QN(n336) );
  NAND3X0 U440 ( .IN1(n274), .IN2(n199), .IN3(n289), .QN(n287) );
  AOI221X1 U441 ( .IN1(n500), .IN2(n416), .IN3(n82), .IN4(n329), .IN5(n445),
        .QN(n124) );
  OA22X1 U442 ( .IN1(n40), .IN2(n329), .IN3(n83), .IN4(n499), .Q(n445) );
  NAND3X0 U443 ( .IN1(n441), .IN2(n442), .IN3(n440), .QN(n329) );
  NAND3X0 U444 ( .IN1(n332), .IN2(n331), .IN3(n341), .QN(n416) );
  AND2X1 U445 ( .IN1(n311), .IN2(n284), .Q(n96) );
  OA22X1 U446 ( .IN1(n440), .IN2(n318), .IN3(n241), .IN4(n449), .Q(n284) );
  AND4X1 U447 ( .IN1(n440), .IN2(n441), .IN3(n442), .IN4(n443), .Q(n449) );
  AOI221X1 U448 ( .IN1(n86), .IN2(n450), .IN3(n79), .IN4(n498), .IN5(n451),
        .QN(n311) );
  AO22X1 U449 ( .IN1(n369), .IN2(n452), .IN3(n453), .IN4(n424), .Q(n451) );
  NAND3X0 U450 ( .IN1(n442), .IN2(n443), .IN3(n441), .QN(n452) );
  NAND4X0 U451 ( .IN1(n34), .IN2(n345), .IN3(n454), .IN4(n343), .QN(n450) );
  AND2X1 U452 ( .IN1(n342), .IN2(n344), .Q(n454) );
  NAND4X0 U453 ( .IN1(n408), .IN2(n435), .IN3(n434), .IN4(n409), .QN(n424) );
  AND2X1 U454 ( .IN1(n455), .IN2(n296), .Q(n448) );
  AND2X1 U455 ( .IN1(n456), .IN2(n293), .Q(n446) );
  AND2X1 U456 ( .IN1(n455), .IN2(n293), .Q(n444) );
  AND2X1 U457 ( .IN1(n456), .IN2(n296), .Q(n447) );
  AND2X1 U458 ( .IN1(n283), .IN2(n310), .Q(n161) );
  AOI222X1 U459 ( .IN1(n87), .IN2(n459), .IN3(n184), .IN4(n376), .IN5(n369),
        .IN6(n460), .QN(n310) );
  NAND3X0 U460 ( .IN1(n374), .IN2(n379), .IN3(n461), .QN(n460) );
  NAND4X0 U461 ( .IN1(n358), .IN2(n360), .IN3(n359), .IN4(n354), .QN(n376) );
  AND2X1 U462 ( .IN1(n381), .IN2(n380), .Q(n461) );
  AOI22X1 U463 ( .IN1(n87), .IN2(n462), .IN3(n184), .IN4(n367), .QN(n283) );
  NAND4X0 U464 ( .IN1(n381), .IN2(n374), .IN3(n379), .IN4(n380), .QN(n367) );
  AND2X1 U465 ( .IN1(n455), .IN2(n463), .Q(n396) );
  AND2X1 U466 ( .IN1(n456), .IN2(n463), .Q(n397) );
  AND2X1 U467 ( .IN1(n455), .IN2(n464), .Q(n413) );
  AND2X1 U468 ( .IN1(n465), .IN2(n466), .Q(n455) );
  AND2X1 U469 ( .IN1(n456), .IN2(n464), .Q(n398) );
  AND2X1 U470 ( .IN1(n70), .IN2(n465), .Q(n456) );
  NAND3X0 U471 ( .IN1(n266), .IN2(n130), .IN3(n50), .QN(n313) );
  NAND3X0 U472 ( .IN1(n253), .IN2(n467), .IN3(n468), .QN(n139) );
  AOI222X1 U473 ( .IN1(n72), .IN2(n370), .IN3(n453), .IN4(n300), .IN5(n86),
        .IN6(n469), .QN(n468) );
  NAND4X0 U474 ( .IN1(n57), .IN2(n186), .IN3(n470), .IN4(n471), .QN(n469) );
  AND2X1 U475 ( .IN1(n472), .IN2(n473), .Q(n470) );
  OR2X1 U476 ( .IN1(n186), .IN2(n353), .Q(n467) );
  AOI221X1 U477 ( .IN1(n86), .IN2(n474), .IN3(n370), .IN4(n475), .IN5(n476),
        .QN(n253) );
  OA22X1 U478 ( .IN1(n72), .IN2(n475), .IN3(n498), .IN4(n89), .Q(n476) );
  NAND3X0 U479 ( .IN1(n220), .IN2(n302), .IN3(n219), .QN(n475) );
  NAND3X0 U480 ( .IN1(n473), .IN2(n472), .IN3(n471), .QN(n181) );
  AOI22X1 U481 ( .IN1(n453), .IN2(n218), .IN3(n86), .IN4(n478), .QN(n266) );
  NAND3X0 U482 ( .IN1(n353), .IN2(n477), .IN3(n436), .QN(n453) );
  AOI21X1 U483 ( .IN1(n302), .IN2(n303), .IN3(n289), .QN(n481) );
  AO222X1 U484 ( .IN1(n83), .IN2(n478), .IN3(n226), .IN4(n183), .IN5(n482),
        .IN6(n218), .Q(n247) );
  NAND4X0 U485 ( .IN1(n289), .IN2(n274), .IN3(n199), .IN4(n198), .QN(n482) );
  AO222X1 U486 ( .IN1(n82), .IN2(n486), .IN3(n228), .IN4(n300), .IN5(n500),
        .IN6(n217), .Q(n141) );
  NAND4X0 U487 ( .IN1(n219), .IN2(n220), .IN3(n302), .IN4(n303), .QN(n217) );
  NAND4X0 U488 ( .IN1(n308), .IN2(n309), .IN3(n320), .IN4(n321), .QN(n300) );
  AO22X1 U490 ( .IN1(n86), .IN2(n218), .IN3(n497), .IN4(n183), .Q(n188) );
  NAND4X0 U491 ( .IN1(n186), .IN2(n471), .IN3(n473), .IN4(n472), .QN(n183) );
  NAND4X0 U492 ( .IN1(n242), .IN2(n241), .IN3(n322), .IN4(n318), .QN(n497) );
  AND2X1 U493 ( .IN1(n503), .IN2(n485), .Q(n492) );
  AND2X1 U494 ( .IN1(n485), .IN2(n484), .Q(n493) );
  NAND4X0 U495 ( .IN1(n221), .IN2(n231), .IN3(n232), .IN4(n233), .QN(n218) );
  AND2X1 U496 ( .IN1(n464), .IN2(n294), .Q(n489) );
  AND2X1 U497 ( .IN1(n464), .IN2(n295), .Q(n490) );
  AND2X1 U498 ( .IN1(n295), .IN2(n463), .Q(n488) );
  AND2X1 U499 ( .IN1(n463), .IN2(n294), .Q(n487) );
  XOR2X1 U500 ( .IN1(n3), .IN2(theta[9]), .Q(n465) );
  XOR2X1 U501 ( .IN1(n4), .IN2(theta[0]), .Q(n466) );
  XOR2X1 U502 ( .IN1(n3), .IN2(theta[8]), .Q(n457) );
  XOR2X1 U503 ( .IN1(n4), .IN2(theta[1]), .Q(n458) );
  XOR2X1 U505 ( .IN1(n3), .IN2(theta[4]), .Q(n491) );
  XOR2X1 U506 ( .IN1(n4), .IN2(theta[5]), .Q(n496) );
  XOR2X1 U507 ( .IN1(n3), .IN2(theta[3]), .Q(n484) );
  XOR2X1 U508 ( .IN1(n4), .IN2(theta[6]), .Q(n485) );
  XOR2X1 U509 ( .IN1(n3), .IN2(theta[2]), .Q(n495) );
  XOR2X1 U510 ( .IN1(n4), .IN2(theta[7]), .Q(n494) );
  AND2X1 U511 ( .IN1(cosq[5]), .IN2(n507), .Q(N11299) );
  AND2X1 U512 ( .IN1(cosq[4]), .IN2(n507), .Q(N11298) );
  AND2X1 U513 ( .IN1(cosq[3]), .IN2(n507), .Q(N11297) );
  AND2X1 U514 ( .IN1(cosq[2]), .IN2(n507), .Q(N11296) );
  AND2X1 U515 ( .IN1(cosq[1]), .IN2(n507), .Q(N11295) );
  AND2X1 U516 ( .IN1(cosq[0]), .IN2(n507), .Q(N11294) );
  AND2X1 U517 ( .IN1(sinq[5]), .IN2(n507), .Q(N11293) );
  AND2X1 U518 ( .IN1(sinq[4]), .IN2(n507), .Q(N11292) );
  AND2X1 U519 ( .IN1(sinq[3]), .IN2(n507), .Q(N11291) );
  AND2X1 U520 ( .IN1(sinq[2]), .IN2(n507), .Q(N11290) );
  AND2X1 U521 ( .IN1(sinq[1]), .IN2(n507), .Q(N11289) );
  AND2X1 U522 ( .IN1(sinq[0]), .IN2(n507), .Q(N11288) );
  INVX0 U3 ( .INP(n175), .ZN(n42) );
  INVX0 U4 ( .INP(n100), .ZN(n47) );
  NOR2X0 U5 ( .IN1(n174), .IN2(n42), .QN(n163) );
  INVX0 U6 ( .INP(n207), .ZN(n32) );
  INVX0 U7 ( .INP(n132), .ZN(n23) );
  INVX0 U8 ( .INP(n238), .ZN(n61) );
  NOR2X0 U9 ( .IN1(n160), .IN2(n200), .QN(n243) );
  INVX0 U10 ( .INP(n108), .ZN(n52) );
  INVX0 U11 ( .INP(n110), .ZN(n18) );
  NOR4X0 U12 ( .IN1(n99), .IN2(n100), .IN3(n101), .IN4(n44), .QN(n92) );
  NAND2X0 U13 ( .IN1(n102), .IN2(n103), .QN(n101) );
  INVX0 U14 ( .INP(n109), .ZN(n21) );
  INVX0 U15 ( .INP(n217), .ZN(n58) );
  INVX0 U16 ( .INP(n173), .ZN(n55) );
  INVX0 U17 ( .INP(n339), .ZN(n37) );
  INVX0 U18 ( .INP(n191), .ZN(n68) );
  NAND2X0 U19 ( .IN1(n164), .IN2(n116), .QN(n178) );
  INVX0 U20 ( .INP(n116), .ZN(n43) );
  INVX0 U21 ( .INP(n113), .ZN(n25) );
  INVX0 U22 ( .INP(n348), .ZN(n28) );
  INVX0 U23 ( .INP(n376), .ZN(n24) );
  INVX0 U24 ( .INP(n300), .ZN(n57) );
  INVX0 U25 ( .INP(n424), .ZN(n34) );
  INVX0 U26 ( .INP(n301), .ZN(n56) );
  INVX0 U27 ( .INP(n407), .ZN(n41) );
  INVX0 U28 ( .INP(n130), .ZN(n49) );
  INVX0 U29 ( .INP(n160), .ZN(n19) );
  NOR4X0 U30 ( .IN1(n137), .IN2(n138), .IN3(n139), .IN4(n42), .QN(n136) );
  INVX0 U31 ( .INP(n307), .ZN(n46) );
  NOR2X0 U32 ( .IN1(n128), .IN2(n173), .QN(n286) );
  INVX0 U33 ( .INP(n205), .ZN(n17) );
  NOR4X0 U34 ( .IN1(n246), .IN2(n159), .IN3(n169), .IN4(n247), .QN(n245) );
  NOR4X0 U35 ( .IN1(n110), .IN2(n160), .IN3(n204), .IN4(n205), .QN(n203) );
  INVX0 U36 ( .INP(n151), .ZN(n67) );
  NAND2X1 U37 ( .IN1(n378), .IN2(n354), .QN(n375) );
  NAND2X1 U38 ( .IN1(n378), .IN2(n374), .QN(n377) );
  INVX0 U39 ( .INP(n140), .ZN(n31) );
  NOR2X0 U40 ( .IN1(n206), .IN2(n285), .QN(n423) );
  NOR2X0 U41 ( .IN1(n312), .IN2(n204), .QN(n346) );
  NOR4X0 U42 ( .IN1(n178), .IN2(n129), .IN3(n51), .IN4(n179), .QN(n177) );
  INVX0 U43 ( .INP(n200), .ZN(n45) );
  OA21X1 U44 ( .IN1(n82), .IN2(n500), .IN3(n227), .Q(n270) );
  OR3X1 U45 ( .IN1(n143), .IN2(n1), .IN3(n2), .Q(n110) );
  AND2X1 U46 ( .IN1(n77), .IN2(n82), .Q(n1) );
  AO221X1 U47 ( .IN1(n498), .IN2(n371), .IN3(n228), .IN4(n367), .IN5(n372),
        .Q(n2) );
  NOR2X0 U48 ( .IN1(n281), .IN2(n282), .QN(n280) );
  NOR4X0 U49 ( .IN1(n114), .IN2(n115), .IN3(n43), .IN4(n100), .QN(n105) );
  NOR4X0 U50 ( .IN1(n107), .IN2(n108), .IN3(n109), .IN4(n110), .QN(n106) );
  NAND2X1 U51 ( .IN1(n309), .IN2(n308), .QN(n486) );
  INVX0 U52 ( .INP(n384), .ZN(n35) );
  INVX0 U53 ( .INP(n125), .ZN(n44) );
  INVX0 U54 ( .INP(n374), .ZN(n77) );
  INVX0 U55 ( .INP(n312), .ZN(n20) );
  INVX0 U56 ( .INP(n285), .ZN(n38) );
  INVX0 U57 ( .INP(n422), .ZN(n22) );
  NAND2X1 U58 ( .IN1(n461), .IN2(n358), .QN(n459) );
  NAND2X1 U59 ( .IN1(n379), .IN2(n374), .QN(n462) );
  NAND2X1 U60 ( .IN1(n58), .IN2(n221), .QN(n214) );
  NOR2X0 U61 ( .IN1(n127), .IN2(n174), .QN(n116) );
  INVX0 U62 ( .INP(n255), .ZN(n64) );
  NOR2X0 U63 ( .IN1(n63), .IN2(n75), .QN(n290) );
  INVX0 U64 ( .INP(n166), .ZN(n60) );
  INVX0 U65 ( .INP(n172), .ZN(n75) );
  NOR2X0 U66 ( .IN1(n66), .IN2(n76), .QN(n252) );
  INVX0 U67 ( .INP(n157), .ZN(n66) );
  NAND2X0 U68 ( .IN1(n501), .IN2(n155), .QN(n153) );
  INVX0 U69 ( .INP(n159), .ZN(n65) );
  NAND2X1 U70 ( .IN1(n172), .IN2(n171), .QN(n248) );
  NAND2X1 U71 ( .IN1(n48), .IN2(n186), .QN(n180) );
  INVX0 U72 ( .INP(n181), .ZN(n48) );
  INVX0 U73 ( .INP(n170), .ZN(n62) );
  NOR2X0 U74 ( .IN1(n78), .IN2(n30), .QN(n364) );
  INVX0 U75 ( .INP(n276), .ZN(n26) );
  NOR2X0 U76 ( .IN1(n151), .IN2(n188), .QN(n103) );
  NAND2X1 U77 ( .IN1(n221), .IN2(n231), .QN(n230) );
  INVX0 U78 ( .INP(n156), .ZN(n76) );
  NAND2X1 U79 ( .IN1(n331), .IN2(n332), .QN(n330) );
  INVX0 U80 ( .INP(n352), .ZN(n78) );
  INVX0 U81 ( .INP(n213), .ZN(n63) );
  NAND2X1 U82 ( .IN1(n57), .IN2(n186), .QN(n297) );
  INVX0 U83 ( .INP(n340), .ZN(n80) );
  NAND2X1 U84 ( .IN1(n27), .IN2(n97), .QN(n204) );
  INVX0 U85 ( .INP(n282), .ZN(n27) );
  INVX0 U86 ( .INP(n139), .ZN(n50) );
  NAND2X1 U87 ( .IN1(n390), .IN2(n391), .QN(n389) );
  NAND2X1 U88 ( .IN1(n390), .IN2(n373), .QN(n388) );
  NAND2X1 U89 ( .IN1(n220), .IN2(n219), .QN(n478) );
  NAND2X0 U90 ( .IN1(n37), .IN2(n340), .QN(n383) );
  NAND2X1 U91 ( .IN1(n303), .IN2(n302), .QN(n474) );
  INVX0 U92 ( .INP(n134), .ZN(n39) );
  INVX0 U93 ( .INP(n373), .ZN(n30) );
  NAND2X1 U94 ( .IN1(n434), .IN2(n435), .QN(n407) );
  NAND2X1 U95 ( .IN1(n498), .IN2(n181), .QN(n130) );
  INVX0 U96 ( .INP(n193), .ZN(n69) );
  INVX0 U97 ( .INP(n443), .ZN(n40) );
  INVX0 U98 ( .INP(n303), .ZN(n72) );
  INVX0 U99 ( .INP(n345), .ZN(n79) );
  INVX0 U100 ( .INP(n408), .ZN(n33) );
  INVX0 U101 ( .INP(n250), .ZN(n74) );
  NOR4X0 U102 ( .IN1(n71), .IN2(n54), .IN3(n73), .IN4(n59), .QN(n319) );
  INVX0 U103 ( .INP(n308), .ZN(n59) );
  INVX0 U104 ( .INP(n309), .ZN(n73) );
  INVX0 U105 ( .INP(n354), .ZN(n29) );
  INVX0 U106 ( .INP(n342), .ZN(n36) );
  INVX0 U107 ( .INP(n320), .ZN(n54) );
  INVX0 U108 ( .INP(n321), .ZN(n71) );
  NAND2X1 U109 ( .IN1(n233), .IN2(n232), .QN(n306) );
  INVX0 U110 ( .INP(n149), .ZN(n51) );
  INVX0 U111 ( .INP(n199), .ZN(n82) );
  NOR4X0 U112 ( .IN1(n267), .IN2(n268), .IN3(n269), .IN4(n270), .QN(n150) );
  NOR4X0 U113 ( .IN1(n141), .IN2(n247), .IN3(n480), .IN4(n481), .QN(n125) );
  OA21X1 U114 ( .IN1(n82), .IN2(n499), .IN3(n217), .Q(n480) );
  NAND2X1 U115 ( .IN1(n413), .IN2(n6), .QN(n374) );
  NAND2X1 U116 ( .IN1(n157), .IN2(n158), .QN(n225) );
  NAND2X1 U117 ( .IN1(n14), .IN2(n490), .QN(n219) );
  NAND2X1 U118 ( .IN1(n262), .IN2(n12), .QN(n157) );
  NAND2X1 U119 ( .IN1(n272), .IN2(n6), .QN(n171) );
  NAND2X1 U120 ( .IN1(n241), .IN2(n242), .QN(n234) );
  NAND2X1 U121 ( .IN1(n262), .IN2(n9), .QN(n195) );
  NAND2X1 U122 ( .IN1(n265), .IN2(n9), .QN(n197) );
  INVX0 U123 ( .INP(n327), .ZN(n501) );
  NAND2X1 U124 ( .IN1(n444), .IN2(n9), .QN(n340) );
  NAND2X1 U125 ( .IN1(n444), .IN2(n15), .QN(n345) );
  NAND2X1 U126 ( .IN1(n448), .IN2(n15), .QN(n344) );
  NAND2X1 U127 ( .IN1(n198), .IN2(n199), .QN(n190) );
  INVX0 U128 ( .INP(n399), .ZN(n84) );
  NAND2X1 U129 ( .IN1(n14), .IN2(n487), .QN(n303) );
  NAND2X1 U130 ( .IN1(n14), .IN2(n489), .QN(n220) );
  NAND2X1 U131 ( .IN1(n264), .IN2(n7), .QN(n172) );
  NAND2X1 U132 ( .IN1(n265), .IN2(n13), .QN(n158) );
  NAND2X1 U133 ( .IN1(n14), .IN2(n488), .QN(n302) );
  NAND2X1 U134 ( .IN1(n490), .IN2(n11), .QN(n186) );
  NAND2X1 U135 ( .IN1(n398), .IN2(n5), .QN(n379) );
  NAND2X1 U136 ( .IN1(n5), .IN2(n487), .QN(n221) );
  NAND2X1 U137 ( .IN1(n447), .IN2(n9), .QN(n331) );
  NAND2X1 U138 ( .IN1(n262), .IN2(n6), .QN(n213) );
  INVX0 U139 ( .INP(n241), .ZN(n87) );
  NAND2X1 U140 ( .IN1(n413), .IN2(n12), .QN(n352) );
  NAND2X1 U141 ( .IN1(n413), .IN2(n15), .QN(n358) );
  NAND2X1 U142 ( .IN1(n444), .IN2(n6), .QN(n435) );
  NAND2X1 U143 ( .IN1(n396), .IN2(n6), .QN(n380) );
  NAND2X1 U144 ( .IN1(n264), .IN2(n12), .QN(n156) );
  NAND2X1 U145 ( .IN1(n447), .IN2(n16), .QN(n342) );
  NAND2X1 U146 ( .IN1(n448), .IN2(n6), .QN(n409) );
  NAND2X1 U147 ( .IN1(n447), .IN2(n12), .QN(n443) );
  NAND2X1 U148 ( .IN1(n444), .IN2(n12), .QN(n440) );
  NAND2X1 U149 ( .IN1(n396), .IN2(n15), .QN(n359) );
  NAND2X1 U150 ( .IN1(n265), .IN2(n15), .QN(n239) );
  NAND2X1 U151 ( .IN1(n318), .IN2(n241), .QN(n316) );
  NAND2X0 U152 ( .IN1(n53), .IN2(n219), .QN(n315) );
  INVX0 U153 ( .INP(n317), .ZN(n53) );
  NAND2X1 U154 ( .IN1(n272), .IN2(n15), .QN(n256) );
  NAND2X1 U155 ( .IN1(n272), .IN2(n10), .QN(n261) );
  NAND2X1 U156 ( .IN1(n396), .IN2(n9), .QN(n393) );
  NAND2X1 U157 ( .IN1(n398), .IN2(n9), .QN(n392) );
  NAND2X1 U158 ( .IN1(n264), .IN2(n10), .QN(n196) );
  INVX0 U159 ( .INP(n353), .ZN(n498) );
  INVX0 U160 ( .INP(n198), .ZN(n500) );
  INVX0 U161 ( .INP(n318), .ZN(n369) );
  NAND2X1 U162 ( .IN1(n448), .IN2(n8), .QN(n332) );
  NAND2X1 U163 ( .IN1(n397), .IN2(n16), .QN(n354) );
  NAND2X1 U164 ( .IN1(n8), .IN2(n489), .QN(n309) );
  NAND2X1 U165 ( .IN1(n397), .IN2(n13), .QN(n373) );
  NAND2X1 U166 ( .IN1(n8), .IN2(n490), .QN(n308) );
  NAND2X1 U167 ( .IN1(n446), .IN2(n10), .QN(n341) );
  NAND2X1 U168 ( .IN1(n397), .IN2(n7), .QN(n381) );
  NAND2X1 U169 ( .IN1(n5), .IN2(n490), .QN(n232) );
  NAND2X1 U170 ( .IN1(n5), .IN2(n488), .QN(n231) );
  NAND2X1 U171 ( .IN1(n5), .IN2(n489), .QN(n233) );
  NOR2X0 U172 ( .IN1(n213), .IN2(n199), .QN(n179) );
  NAND2X1 U173 ( .IN1(n396), .IN2(n12), .QN(n365) );
  NAND2X1 U174 ( .IN1(n446), .IN2(n16), .QN(n343) );
  NAND2X1 U175 ( .IN1(n413), .IN2(n10), .QN(n391) );
  NOR2X0 U176 ( .IN1(n352), .IN2(n353), .QN(n114) );
  NAND2X1 U177 ( .IN1(n448), .IN2(n11), .QN(n442) );
  NAND2X1 U178 ( .IN1(n446), .IN2(n13), .QN(n441) );
  NAND2X1 U179 ( .IN1(n262), .IN2(n16), .QN(n240) );
  NAND2X1 U180 ( .IN1(n446), .IN2(n7), .QN(n434) );
  NAND2X1 U181 ( .IN1(n265), .IN2(n7), .QN(n250) );
  NAND2X1 U182 ( .IN1(n272), .IN2(n13), .QN(n193) );
  NAND2X1 U183 ( .IN1(n11), .IN2(n487), .QN(n472) );
  NAND2X1 U184 ( .IN1(n8), .IN2(n488), .QN(n320) );
  NAND2X1 U185 ( .IN1(n8), .IN2(n487), .QN(n321) );
  NAND2X1 U186 ( .IN1(n489), .IN2(n11), .QN(n471) );
  NAND2X1 U187 ( .IN1(n488), .IN2(n11), .QN(n473) );
  NAND2X1 U188 ( .IN1(n14), .IN2(n264), .QN(n258) );
  NAND2X1 U189 ( .IN1(n397), .IN2(n10), .QN(n394) );
  NAND2X1 U190 ( .IN1(n447), .IN2(n7), .QN(n408) );
  NAND2X1 U191 ( .IN1(n398), .IN2(n13), .QN(n363) );
  NAND2X1 U192 ( .IN1(n398), .IN2(n16), .QN(n360) );
  NAND2X1 U193 ( .IN1(n274), .IN2(n289), .QN(n228) );
  NAND2X1 U194 ( .IN1(n436), .IN2(n353), .QN(n362) );
  NAND2X1 U195 ( .IN1(n353), .IN2(n368), .QN(n165) );
  INVX0 U196 ( .INP(n477), .ZN(n370) );
  INVX0 U197 ( .INP(n328), .ZN(n502) );
  INVX0 U198 ( .INP(n436), .ZN(n89) );
  INVX0 U199 ( .INP(n368), .ZN(n86) );
  INVX0 U200 ( .INP(n274), .ZN(n499) );
  INVX0 U201 ( .INP(n326), .ZN(n85) );
  INVX0 U202 ( .INP(n289), .ZN(n83) );
  NAND2X1 U203 ( .IN1(n242), .IN2(n322), .QN(n184) );
  INVX0 U204 ( .INP(n322), .ZN(n88) );
  INVX0 U205 ( .INP(n242), .ZN(n91) );
  NAND2X1 U206 ( .IN1(n477), .IN2(n436), .QN(n226) );
  NAND2X1 U207 ( .IN1(n326), .IN2(n328), .QN(n182) );
  NAND2X1 U208 ( .IN1(n492), .IN2(n428), .QN(n199) );
  NBUFFX2 U209 ( .INP(n291), .Z(n6) );
  NBUFFX2 U210 ( .INP(n271), .Z(n12) );
  NBUFFX2 U211 ( .INP(n292), .Z(n14) );
  NBUFFX2 U212 ( .INP(n263), .Z(n9) );
  NBUFFX2 U213 ( .INP(n292), .Z(n15) );
  NAND2X1 U214 ( .IN1(n427), .IN2(n429), .QN(n327) );
  NOR2X0 U215 ( .IN1(n505), .IN2(n90), .QN(n483) );
  NAND2X0 U216 ( .IN1(n483), .IN2(n492), .QN(n241) );
  NBUFFX2 U217 ( .INP(n271), .Z(n13) );
  NBUFFX2 U218 ( .INP(n292), .Z(n16) );
  NBUFFX2 U219 ( .INP(n271), .Z(n11) );
  NBUFFX2 U220 ( .INP(n291), .Z(n7) );
  NBUFFX2 U221 ( .INP(n263), .Z(n10) );
  NBUFFX2 U222 ( .INP(n291), .Z(n5) );
  NAND2X1 U223 ( .IN1(n428), .IN2(n429), .QN(n399) );
  NAND2X1 U224 ( .IN1(n429), .IN2(n479), .QN(n353) );
  NAND2X0 U225 ( .IN1(n492), .IN2(n479), .QN(n318) );
  NAND2X0 U226 ( .IN1(n492), .IN2(n427), .QN(n198) );
  NBUFFX2 U227 ( .INP(n263), .Z(n8) );
  NOR2X0 U228 ( .IN1(n506), .IN2(n81), .QN(n464) );
  NAND2X1 U229 ( .IN1(n427), .IN2(n493), .QN(n274) );
  NAND2X0 U230 ( .IN1(n426), .IN2(n483), .QN(n436) );
  NAND2X1 U231 ( .IN1(n428), .IN2(n493), .QN(n289) );
  NAND2X1 U232 ( .IN1(n426), .IN2(n428), .QN(n326) );
  NAND2X0 U233 ( .IN1(n483), .IN2(n429), .QN(n368) );
  NAND2X1 U234 ( .IN1(n426), .IN2(n427), .QN(n328) );
  NAND2X1 U235 ( .IN1(n426), .IN2(n479), .QN(n477) );
  NAND2X1 U236 ( .IN1(n493), .IN2(n479), .QN(n242) );
  NAND2X0 U237 ( .IN1(n483), .IN2(n493), .QN(n322) );
  NOR2X0 U238 ( .IN1(n494), .IN2(n90), .QN(n428) );
  INVX0 U239 ( .INP(n495), .ZN(n90) );
  INVX0 U240 ( .INP(n484), .ZN(n503) );
  AND2X1 U241 ( .IN1(n496), .IN2(n491), .Q(n291) );
  NOR2X0 U242 ( .IN1(n491), .IN2(n504), .QN(n292) );
  NOR2X0 U243 ( .IN1(n491), .IN2(n496), .QN(n271) );
  AND2X1 U244 ( .IN1(n504), .IN2(n491), .Q(n263) );
  NOR2X0 U245 ( .IN1(n485), .IN2(n503), .QN(n429) );
  NOR2X0 U246 ( .IN1(n494), .IN2(n495), .QN(n427) );
  INVX0 U247 ( .INP(n496), .ZN(n504) );
  NOR2X0 U376 ( .IN1(n495), .IN2(n505), .QN(n479) );
  INVX0 U377 ( .INP(n494), .ZN(n505) );
  NOR2X0 U489 ( .IN1(n465), .IN2(n70), .QN(n295) );
  INVX0 U504 ( .INP(n457), .ZN(n506) );
  INVX0 U523 ( .INP(n458), .ZN(n81) );
  NOR2X0 U524 ( .IN1(n458), .IN2(n506), .QN(n463) );
  NOR2X0 U525 ( .IN1(n457), .IN2(n81), .QN(n293) );
  NOR2X0 U526 ( .IN1(n466), .IN2(n465), .QN(n294) );
  INVX0 U527 ( .INP(n466), .ZN(n70) );
  NOR2X0 U528 ( .IN1(n484), .IN2(n485), .QN(n426) );
  NOR2X0 U529 ( .IN1(n457), .IN2(n458), .QN(n296) );
  INVX0 U530 ( .INP(pause), .ZN(n507) );
  NBUFFX2 U531 ( .INP(theta[10]), .Z(n3) );
  NBUFFX2 U532 ( .INP(theta[10]), .Z(n4) );
  twos_comp_gen_N6_1 sign_gen1 ( .X({1'b0, lut_word}), .sign(theta[11]), .OUT(
        sinq) );
  twos_comp_gen_N6_0 sign_gen2 ( .X({1'b0, lut_word_4, lut_word_3, lut_word_2,
        lut_word_1, lut_word_0}), .sign(scos), .OUT(cosq) );
endmodule


module integrator_N12_0_DW01_add_0 ( A, B, CI, SUM, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [11:2] carry;

  FADDX1 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  FADDX1 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  FADDX1 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  FADDX1 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  FADDX1 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  FADDX1 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  FADDX1 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  FADDX1 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  FADDX1 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  FADDX1 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  XOR3X1 U1_11 ( .IN1(A[11]), .IN2(B[11]), .IN3(carry[11]), .Q(SUM[11]) );
  AND2X1 U1 ( .IN1(A[0]), .IN2(B[0]), .Q(n1) );
  XOR2X1 U2 ( .IN1(A[0]), .IN2(B[0]), .Q(SUM[0]) );
endmodule


module integrator_N12_0 ( clk, rstn, we, X0, dxdt, OUT );
  input [11:0] X0;
  input [11:0] dxdt;
  output [11:0] OUT;
  input clk, rstn, we;
  wire   N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19,
         N20, N21, N22, N23, N24, N25, N26, N27, N28, n2, n3, n4, n5, n6;

  DFFARX1 OUT_reg_0_ ( .D(N17), .CLK(clk), .RSTB(rstn), .Q(OUT[0]) );
  DFFARX1 OUT_reg_1_ ( .D(N18), .CLK(clk), .RSTB(rstn), .Q(OUT[1]) );
  DFFARX1 OUT_reg_2_ ( .D(N19), .CLK(clk), .RSTB(rstn), .Q(OUT[2]) );
  DFFARX1 OUT_reg_3_ ( .D(N20), .CLK(clk), .RSTB(rstn), .Q(OUT[3]) );
  DFFARX1 OUT_reg_4_ ( .D(N21), .CLK(clk), .RSTB(rstn), .Q(OUT[4]) );
  DFFARX1 OUT_reg_5_ ( .D(N22), .CLK(clk), .RSTB(rstn), .Q(OUT[5]) );
  DFFARX1 OUT_reg_6_ ( .D(N23), .CLK(clk), .RSTB(rstn), .Q(OUT[6]) );
  DFFARX1 OUT_reg_7_ ( .D(N24), .CLK(clk), .RSTB(rstn), .Q(OUT[7]) );
  DFFARX1 OUT_reg_8_ ( .D(N25), .CLK(clk), .RSTB(rstn), .Q(OUT[8]) );
  DFFARX1 OUT_reg_9_ ( .D(N26), .CLK(clk), .RSTB(rstn), .Q(OUT[9]) );
  DFFARX1 OUT_reg_10_ ( .D(N27), .CLK(clk), .RSTB(rstn), .Q(OUT[10]) );
  DFFARX1 OUT_reg_11_ ( .D(N28), .CLK(clk), .RSTB(rstn), .Q(OUT[11]) );
  AO22X1 U4 ( .IN1(X0[11]), .IN2(n5), .IN3(N16), .IN4(n3), .Q(N28) );
  AO22X1 U6 ( .IN1(X0[10]), .IN2(n4), .IN3(N15), .IN4(n2), .Q(N27) );
  AO22X1 U7 ( .IN1(X0[9]), .IN2(n4), .IN3(N14), .IN4(n3), .Q(N26) );
  AO22X1 U8 ( .IN1(X0[8]), .IN2(n4), .IN3(N13), .IN4(n2), .Q(N25) );
  AO22X1 U9 ( .IN1(X0[7]), .IN2(n4), .IN3(N12), .IN4(n3), .Q(N24) );
  AO22X1 U10 ( .IN1(X0[6]), .IN2(n4), .IN3(N11), .IN4(n2), .Q(N23) );
  AO22X1 U11 ( .IN1(X0[5]), .IN2(n5), .IN3(N10), .IN4(n3), .Q(N22) );
  AO22X1 U12 ( .IN1(X0[4]), .IN2(n5), .IN3(N9), .IN4(n2), .Q(N21) );
  AO22X1 U13 ( .IN1(X0[3]), .IN2(n5), .IN3(N8), .IN4(n3), .Q(N20) );
  AO22X1 U14 ( .IN1(X0[2]), .IN2(n5), .IN3(N7), .IN4(n2), .Q(N19) );
  AO22X1 U15 ( .IN1(X0[1]), .IN2(n5), .IN3(N6), .IN4(n3), .Q(N18) );
  AO22X1 U16 ( .IN1(X0[0]), .IN2(n5), .IN3(N5), .IN4(n2), .Q(N17) );
  NBUFFX2 U3 ( .INP(we), .Z(n4) );
  NBUFFX2 U17 ( .INP(we), .Z(n5) );
  NBUFFX2 U18 ( .INP(n6), .Z(n3) );
  NBUFFX2 U19 ( .INP(n6), .Z(n2) );
  INVX0 U20 ( .INP(n4), .ZN(n6) );
  integrator_N12_0_DW01_add_0 add_11 ( .A(OUT), .B(dxdt), .CI(1'b0), .SUM({N16,
        N15, N14, N13, N12, N11, N10, N9, N8, N7, N6, N5}) );
endmodule


module Freq_LUT ( lut_addr, fc_sign, dfdt_sign );
  input [4:0] lut_addr;
  output fc_sign, dfdt_sign;
  wire   n2, n1;

  XNOR3X1 U4 ( .IN1(lut_addr[3]), .IN2(lut_addr[1]), .IN3(lut_addr[0]), .Q(
        fc_sign) );
  XOR2X1 U5 ( .IN1(lut_addr[4]), .IN2(n2), .Q(dfdt_sign) );
  OA22X1 U6 ( .IN1(lut_addr[0]), .IN2(n1), .IN3(lut_addr[3]), .IN4(lut_addr[1]), .Q(n2) );
  INVX0 U3 ( .INP(lut_addr[3]), .ZN(n1) );
endmodule


module twos_comp_gen_N12_2 ( X, sign, OUT );
  input [11:0] X;
  output [11:0] OUT;
  input sign;
  wire   N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;
  wire   [11:2] sub_9_carry;

  AO22X1 U6 ( .IN1(X[9]), .IN2(n15), .IN3(n2), .IN4(N12), .Q(OUT[9]) );
  AO22X1 U7 ( .IN1(X[8]), .IN2(n15), .IN3(N11), .IN4(n1), .Q(OUT[8]) );
  AO22X1 U8 ( .IN1(X[7]), .IN2(n15), .IN3(N10), .IN4(n1), .Q(OUT[7]) );
  AO22X1 U9 ( .IN1(X[6]), .IN2(n15), .IN3(N9), .IN4(n1), .Q(OUT[6]) );
  AO22X1 U10 ( .IN1(X[5]), .IN2(n15), .IN3(N8), .IN4(n1), .Q(OUT[5]) );
  AO22X1 U11 ( .IN1(X[4]), .IN2(n15), .IN3(N7), .IN4(n1), .Q(OUT[4]) );
  AO22X1 U12 ( .IN1(X[3]), .IN2(n15), .IN3(N6), .IN4(n2), .Q(OUT[3]) );
  AO22X1 U13 ( .IN1(X[2]), .IN2(n15), .IN3(N5), .IN4(n2), .Q(OUT[2]) );
  AO22X1 U14 ( .IN1(X[1]), .IN2(n15), .IN3(N4), .IN4(n2), .Q(OUT[1]) );
  AO22X1 U15 ( .IN1(X[11]), .IN2(n15), .IN3(N14), .IN4(n2), .Q(OUT[11]) );
  AO22X1 U16 ( .IN1(X[10]), .IN2(n15), .IN3(N13), .IN4(n2), .Q(OUT[10]) );
  AO22X1 U17 ( .IN1(X[0]), .IN2(n15), .IN3(X[0]), .IN4(n2), .Q(OUT[0]) );
  INVX0 U2 ( .INP(n1), .ZN(n15) );
  NBUFFX2 U3 ( .INP(sign), .Z(n1) );
  NBUFFX2 U4 ( .INP(sign), .Z(n2) );
  INVX0 U5 ( .INP(X[11]), .ZN(n3) );
  INVX0 U18 ( .INP(X[1]), .ZN(n9) );
  INVX0 U19 ( .INP(X[2]), .ZN(n14) );
  INVX0 U20 ( .INP(X[3]), .ZN(n8) );
  INVX0 U21 ( .INP(X[4]), .ZN(n13) );
  INVX0 U22 ( .INP(X[5]), .ZN(n7) );
  INVX0 U23 ( .INP(X[6]), .ZN(n6) );
  INVX0 U24 ( .INP(X[7]), .ZN(n12) );
  INVX0 U25 ( .INP(X[8]), .ZN(n11) );
  INVX0 U26 ( .INP(X[9]), .ZN(n5) );
  INVX0 U27 ( .INP(X[10]), .ZN(n4) );
  INVX0 U28 ( .INP(X[0]), .ZN(n10) );
  XOR2X1 U29 ( .IN1(n3), .IN2(sub_9_carry[11]), .Q(N14) );
  AND2X1 U30 ( .IN1(sub_9_carry[10]), .IN2(n4), .Q(sub_9_carry[11]) );
  XOR2X1 U31 ( .IN1(n4), .IN2(sub_9_carry[10]), .Q(N13) );
  AND2X1 U32 ( .IN1(sub_9_carry[9]), .IN2(n5), .Q(sub_9_carry[10]) );
  XOR2X1 U33 ( .IN1(n5), .IN2(sub_9_carry[9]), .Q(N12) );
  AND2X1 U34 ( .IN1(sub_9_carry[8]), .IN2(n11), .Q(sub_9_carry[9]) );
  XOR2X1 U35 ( .IN1(n11), .IN2(sub_9_carry[8]), .Q(N11) );
  AND2X1 U36 ( .IN1(sub_9_carry[7]), .IN2(n12), .Q(sub_9_carry[8]) );
  XOR2X1 U37 ( .IN1(n12), .IN2(sub_9_carry[7]), .Q(N10) );
  AND2X1 U38 ( .IN1(sub_9_carry[6]), .IN2(n6), .Q(sub_9_carry[7]) );
  XOR2X1 U39 ( .IN1(n6), .IN2(sub_9_carry[6]), .Q(N9) );
  AND2X1 U40 ( .IN1(sub_9_carry[5]), .IN2(n7), .Q(sub_9_carry[6]) );
  XOR2X1 U41 ( .IN1(n7), .IN2(sub_9_carry[5]), .Q(N8) );
  AND2X1 U42 ( .IN1(sub_9_carry[4]), .IN2(n13), .Q(sub_9_carry[5]) );
  XOR2X1 U43 ( .IN1(n13), .IN2(sub_9_carry[4]), .Q(N7) );
  AND2X1 U44 ( .IN1(sub_9_carry[3]), .IN2(n8), .Q(sub_9_carry[4]) );
  XOR2X1 U45 ( .IN1(n8), .IN2(sub_9_carry[3]), .Q(N6) );
  AND2X1 U46 ( .IN1(sub_9_carry[2]), .IN2(n14), .Q(sub_9_carry[3]) );
  XOR2X1 U47 ( .IN1(n14), .IN2(sub_9_carry[2]), .Q(N5) );
  AND2X1 U48 ( .IN1(n10), .IN2(n9), .Q(sub_9_carry[2]) );
  XOR2X1 U49 ( .IN1(n9), .IN2(n10), .Q(N4) );
endmodule


module twos_comp_gen_N12_1 ( X, sign, OUT );
  input [11:0] X;
  output [11:0] OUT;
  input sign;
  wire   N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14;
  wire   [11:2] sub_9_carry;

  AO22X1 U2 ( .IN1(X[11]), .IN2(n14), .IN3(N14), .IN4(n1), .Q(OUT[11]) );
  AO22X1 U3 ( .IN1(X[10]), .IN2(n14), .IN3(N13), .IN4(n1), .Q(OUT[10]) );
  AO22X1 U4 ( .IN1(X[9]), .IN2(n14), .IN3(n1), .IN4(N12), .Q(OUT[9]) );
  AO22X1 U5 ( .IN1(X[8]), .IN2(n14), .IN3(N11), .IN4(n1), .Q(OUT[8]) );
  AO22X1 U6 ( .IN1(X[7]), .IN2(n14), .IN3(N10), .IN4(sign), .Q(OUT[7]) );
  AO22X1 U7 ( .IN1(X[6]), .IN2(n14), .IN3(N9), .IN4(sign), .Q(OUT[6]) );
  AO22X1 U8 ( .IN1(X[5]), .IN2(n14), .IN3(N8), .IN4(n1), .Q(OUT[5]) );
  AO22X1 U9 ( .IN1(X[4]), .IN2(n14), .IN3(N7), .IN4(sign), .Q(OUT[4]) );
  AO22X1 U10 ( .IN1(X[3]), .IN2(n14), .IN3(N6), .IN4(sign), .Q(OUT[3]) );
  AO22X1 U11 ( .IN1(X[2]), .IN2(n14), .IN3(N5), .IN4(sign), .Q(OUT[2]) );
  AO22X1 U12 ( .IN1(X[1]), .IN2(n14), .IN3(N4), .IN4(n1), .Q(OUT[1]) );
  NBUFFX2 U13 ( .INP(sign), .Z(n1) );
  AO22X2 U14 ( .IN1(X[0]), .IN2(n14), .IN3(X[0]), .IN4(n1), .Q(OUT[0]) );
  INVX0 U15 ( .INP(sign), .ZN(n14) );
  INVX0 U16 ( .INP(X[11]), .ZN(n2) );
  INVX0 U17 ( .INP(X[1]), .ZN(n8) );
  INVX0 U18 ( .INP(X[2]), .ZN(n7) );
  INVX0 U19 ( .INP(X[3]), .ZN(n13) );
  INVX0 U20 ( .INP(X[4]), .ZN(n12) );
  INVX0 U21 ( .INP(X[5]), .ZN(n6) );
  INVX0 U22 ( .INP(X[6]), .ZN(n11) );
  INVX0 U23 ( .INP(X[7]), .ZN(n5) );
  INVX0 U24 ( .INP(X[8]), .ZN(n4) );
  INVX0 U25 ( .INP(X[9]), .ZN(n3) );
  INVX0 U26 ( .INP(X[10]), .ZN(n10) );
  INVX0 U27 ( .INP(X[0]), .ZN(n9) );
  XOR2X1 U28 ( .IN1(n2), .IN2(sub_9_carry[11]), .Q(N14) );
  AND2X1 U29 ( .IN1(sub_9_carry[10]), .IN2(n10), .Q(sub_9_carry[11]) );
  XOR2X1 U30 ( .IN1(n10), .IN2(sub_9_carry[10]), .Q(N13) );
  AND2X1 U31 ( .IN1(sub_9_carry[9]), .IN2(n3), .Q(sub_9_carry[10]) );
  XOR2X1 U32 ( .IN1(n3), .IN2(sub_9_carry[9]), .Q(N12) );
  AND2X1 U33 ( .IN1(sub_9_carry[8]), .IN2(n4), .Q(sub_9_carry[9]) );
  XOR2X1 U34 ( .IN1(n4), .IN2(sub_9_carry[8]), .Q(N11) );
  AND2X1 U35 ( .IN1(sub_9_carry[7]), .IN2(n5), .Q(sub_9_carry[8]) );
  XOR2X1 U36 ( .IN1(n5), .IN2(sub_9_carry[7]), .Q(N10) );
  AND2X1 U37 ( .IN1(sub_9_carry[6]), .IN2(n11), .Q(sub_9_carry[7]) );
  XOR2X1 U38 ( .IN1(n11), .IN2(sub_9_carry[6]), .Q(N9) );
  AND2X1 U39 ( .IN1(sub_9_carry[5]), .IN2(n6), .Q(sub_9_carry[6]) );
  XOR2X1 U40 ( .IN1(n6), .IN2(sub_9_carry[5]), .Q(N8) );
  AND2X1 U41 ( .IN1(sub_9_carry[4]), .IN2(n12), .Q(sub_9_carry[5]) );
  XOR2X1 U42 ( .IN1(n12), .IN2(sub_9_carry[4]), .Q(N7) );
  AND2X1 U43 ( .IN1(sub_9_carry[3]), .IN2(n13), .Q(sub_9_carry[4]) );
  XOR2X1 U44 ( .IN1(n13), .IN2(sub_9_carry[3]), .Q(N6) );
  AND2X1 U45 ( .IN1(sub_9_carry[2]), .IN2(n7), .Q(sub_9_carry[3]) );
  XOR2X1 U46 ( .IN1(n7), .IN2(sub_9_carry[2]), .Q(N5) );
  AND2X1 U47 ( .IN1(n9), .IN2(n8), .Q(sub_9_carry[2]) );
  XOR2X1 U48 ( .IN1(n8), .IN2(n9), .Q(N4) );
endmodule


module twos_comp_gen_N12_0 ( X, sign, OUT );
  input [11:0] X;
  output [11:0] OUT;
  input sign;
  wire   N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;
  wire   [11:2] sub_9_carry;

  AO22X1 U6 ( .IN1(X[9]), .IN2(n15), .IN3(n2), .IN4(N12), .Q(OUT[9]) );
  AO22X1 U7 ( .IN1(X[8]), .IN2(n15), .IN3(N11), .IN4(n1), .Q(OUT[8]) );
  AO22X1 U8 ( .IN1(X[7]), .IN2(n15), .IN3(N10), .IN4(n1), .Q(OUT[7]) );
  AO22X1 U9 ( .IN1(X[6]), .IN2(n15), .IN3(N9), .IN4(n1), .Q(OUT[6]) );
  AO22X1 U10 ( .IN1(X[5]), .IN2(n15), .IN3(N8), .IN4(n1), .Q(OUT[5]) );
  AO22X1 U11 ( .IN1(X[4]), .IN2(n15), .IN3(N7), .IN4(n1), .Q(OUT[4]) );
  AO22X1 U12 ( .IN1(X[3]), .IN2(n15), .IN3(N6), .IN4(n2), .Q(OUT[3]) );
  AO22X1 U13 ( .IN1(X[2]), .IN2(n15), .IN3(N5), .IN4(n2), .Q(OUT[2]) );
  AO22X1 U14 ( .IN1(X[1]), .IN2(n15), .IN3(N4), .IN4(n2), .Q(OUT[1]) );
  AO22X1 U15 ( .IN1(X[11]), .IN2(n15), .IN3(N14), .IN4(n2), .Q(OUT[11]) );
  AO22X1 U16 ( .IN1(X[10]), .IN2(n15), .IN3(N13), .IN4(n2), .Q(OUT[10]) );
  AO22X1 U17 ( .IN1(X[0]), .IN2(n15), .IN3(X[0]), .IN4(n2), .Q(OUT[0]) );
  INVX0 U2 ( .INP(n1), .ZN(n15) );
  NBUFFX2 U3 ( .INP(sign), .Z(n1) );
  NBUFFX2 U4 ( .INP(sign), .Z(n2) );
  INVX0 U5 ( .INP(X[11]), .ZN(n3) );
  INVX0 U18 ( .INP(X[1]), .ZN(n10) );
  INVX0 U19 ( .INP(X[2]), .ZN(n14) );
  INVX0 U20 ( .INP(X[3]), .ZN(n13) );
  INVX0 U21 ( .INP(X[4]), .ZN(n12) );
  INVX0 U22 ( .INP(X[5]), .ZN(n9) );
  INVX0 U23 ( .INP(X[6]), .ZN(n8) );
  INVX0 U24 ( .INP(X[7]), .ZN(n7) );
  INVX0 U25 ( .INP(X[8]), .ZN(n6) );
  INVX0 U26 ( .INP(X[9]), .ZN(n5) );
  INVX0 U27 ( .INP(X[10]), .ZN(n4) );
  INVX0 U28 ( .INP(X[0]), .ZN(n11) );
  XOR2X1 U29 ( .IN1(n3), .IN2(sub_9_carry[11]), .Q(N14) );
  AND2X1 U30 ( .IN1(sub_9_carry[10]), .IN2(n4), .Q(sub_9_carry[11]) );
  XOR2X1 U31 ( .IN1(n4), .IN2(sub_9_carry[10]), .Q(N13) );
  AND2X1 U32 ( .IN1(sub_9_carry[9]), .IN2(n5), .Q(sub_9_carry[10]) );
  XOR2X1 U33 ( .IN1(n5), .IN2(sub_9_carry[9]), .Q(N12) );
  AND2X1 U34 ( .IN1(sub_9_carry[8]), .IN2(n6), .Q(sub_9_carry[9]) );
  XOR2X1 U35 ( .IN1(n6), .IN2(sub_9_carry[8]), .Q(N11) );
  AND2X1 U36 ( .IN1(sub_9_carry[7]), .IN2(n7), .Q(sub_9_carry[8]) );
  XOR2X1 U37 ( .IN1(n7), .IN2(sub_9_carry[7]), .Q(N10) );
  AND2X1 U38 ( .IN1(sub_9_carry[6]), .IN2(n8), .Q(sub_9_carry[7]) );
  XOR2X1 U39 ( .IN1(n8), .IN2(sub_9_carry[6]), .Q(N9) );
  AND2X1 U40 ( .IN1(sub_9_carry[5]), .IN2(n9), .Q(sub_9_carry[6]) );
  XOR2X1 U41 ( .IN1(n9), .IN2(sub_9_carry[5]), .Q(N8) );
  AND2X1 U42 ( .IN1(sub_9_carry[4]), .IN2(n12), .Q(sub_9_carry[5]) );
  XOR2X1 U43 ( .IN1(n12), .IN2(sub_9_carry[4]), .Q(N7) );
  AND2X1 U44 ( .IN1(sub_9_carry[3]), .IN2(n13), .Q(sub_9_carry[4]) );
  XOR2X1 U45 ( .IN1(n13), .IN2(sub_9_carry[3]), .Q(N6) );
  AND2X1 U46 ( .IN1(sub_9_carry[2]), .IN2(n14), .Q(sub_9_carry[3]) );
  XOR2X1 U47 ( .IN1(n14), .IN2(sub_9_carry[2]), .Q(N5) );
  AND2X1 U48 ( .IN1(n11), .IN2(n10), .Q(sub_9_carry[2]) );
  XOR2X1 U49 ( .IN1(n10), .IN2(n11), .Q(N4) );
endmodule


module CSK_GEN_N12_M6_DW01_add_0 ( A, B, CI, SUM, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [11:2] carry;

  FADDX1 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  FADDX1 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  FADDX1 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  FADDX1 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  FADDX1 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  FADDX1 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  FADDX1 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  FADDX1 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  FADDX1 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  FADDX1 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  XOR3X1 U1_11 ( .IN1(A[11]), .IN2(B[11]), .IN3(carry[11]), .Q(SUM[11]) );
  AND2X1 U1 ( .IN1(A[0]), .IN2(B[0]), .Q(n1) );
  XOR2X1 U2 ( .IN1(A[0]), .IN2(B[0]), .Q(SUM[0]) );
endmodule


module CSK_GEN_N12_M6 ( clk, rstn, latch, pause, DQPSK, chirps_address, DAC_RE,
        DAC_IM );
  input [11:0] DQPSK;
  input [4:0] chirps_address;
  output [5:0] DAC_RE;
  output [5:0] DAC_IM;
  input clk, rstn, latch, pause;
  wire   dfdt_sign, fc_sign, n2;
  wire   [11:0] sfc;
  wire   [11:0] sbw;
  wire   [11:0] initFreq;
  wire   [11:0] Freq;
  wire   [11:0] theta;
  wire   [11:0] sdfdt;

  INVX0 U4 ( .INP(dfdt_sign), .ZN(n2) );
  integrator_N12_1 Phase_integrator ( .clk(clk), .rstn(rstn), .we(latch), .X0(
        DQPSK), .dxdt(Freq), .OUT(theta) );
  complex_exp_LUT_N12_M6 complex_exp_LUT ( .clk(clk), .rstn(rstn), .pause(
        pause), .theta(theta), .sin(DAC_IM), .cos(DAC_RE) );
  integrator_N12_0 Frequency_integrator ( .clk(clk), .rstn(rstn), .we(latch),
        .X0(initFreq), .dxdt(sdfdt), .OUT(Freq) );
  Freq_LUT Freq_LUT ( .lut_addr(chirps_address), .fc_sign(fc_sign),
        .dfdt_sign(dfdt_sign) );
  twos_comp_gen_N12_2 s_fc ( .X({1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 1'b0,
        1'b1, 1'b0, 1'b1, 1'b0, 1'b0}), .sign(fc_sign), .OUT(sfc) );
  twos_comp_gen_N12_1 s_hBW ( .X({1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0,
        1'b1, 1'b1, 1'b0, 1'b0, 1'b0}), .sign(n2), .OUT(sbw) );
  twos_comp_gen_N12_0 s_dfdt ( .X({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
        1'b1, 1'b1, 1'b1, 1'b0, 1'b0}), .sign(dfdt_sign), .OUT(sdfdt) );
  CSK_GEN_N12_M6_DW01_add_0 add_16 ( .A(sfc), .B(sbw), .CI(1'b0), .SUM(
        initFreq) );
endmodule


module address_counter_N5_MAX31 ( clk, rstn, clear, enable, address );
  output [4:0] address;
  input clk, rstn, clear, enable;
  wire   N7, N10, N11, N12, N13, n6, n7, n8, n9, n10, n11, n12, n13, n1, n2,
         n3;
  wire   [4:2] add_23_carry;

  DFFARX1 address_reg_0_ ( .D(n13), .CLK(clk), .RSTB(rstn), .Q(address[0]),
        .QN(n1) );
  DFFARX1 address_reg_4_ ( .D(n9), .CLK(clk), .RSTB(rstn), .Q(address[4]) );
  DFFARX1 address_reg_3_ ( .D(n10), .CLK(clk), .RSTB(rstn), .Q(address[3]) );
  DFFARX1 address_reg_2_ ( .D(n11), .CLK(clk), .RSTB(rstn), .Q(address[2]) );
  DFFARX1 address_reg_1_ ( .D(n12), .CLK(clk), .RSTB(rstn), .Q(address[1]) );
  AO22X1 U8 ( .IN1(address[4]), .IN2(n6), .IN3(N13), .IN4(n7), .Q(n9) );
  AO22X1 U9 ( .IN1(address[3]), .IN2(n6), .IN3(N12), .IN4(n7), .Q(n10) );
  AO22X1 U10 ( .IN1(address[2]), .IN2(n6), .IN3(N11), .IN4(n7), .Q(n11) );
  AO22X1 U11 ( .IN1(address[1]), .IN2(n6), .IN3(N10), .IN4(n7), .Q(n12) );
  AO22X1 U12 ( .IN1(address[0]), .IN2(n6), .IN3(n1), .IN4(n7), .Q(n13) );
  AND2X1 U13 ( .IN1(n3), .IN2(n8), .Q(n6) );
  HADDX1 add_23_U1_1_1 ( .A0(address[1]), .B0(address[0]), .C1(add_23_carry[2]), .SO(N10) );
  HADDX1 add_23_U1_1_2 ( .A0(address[2]), .B0(add_23_carry[2]), .C1(
        add_23_carry[3]), .SO(N11) );
  HADDX1 add_23_U1_1_3 ( .A0(address[3]), .B0(add_23_carry[3]), .C1(
        add_23_carry[4]), .SO(N12) );
  NAND2X0 U3 ( .IN1(enable), .IN2(n3), .QN(n8) );
  INVX0 U4 ( .INP(clear), .ZN(n3) );
  NOR2X0 U5 ( .IN1(N7), .IN2(n8), .QN(n7) );
  XOR2X1 U6 ( .IN1(add_23_carry[4]), .IN2(address[4]), .Q(N13) );
  AND3X1 U7 ( .IN1(address[4]), .IN2(address[3]), .IN3(address[0]), .Q(n2) );
  AND3X1 U14 ( .IN1(address[2]), .IN2(address[1]), .IN3(n2), .Q(N7) );
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
  INVX0 U7 ( .INP(n10), .ZN(n16) );
  NAND2X1 U8 ( .IN1(n8), .IN2(n6), .QN(delay[4]) );
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
  NAND2X1 U7 ( .IN1(n8), .IN2(n9), .QN(n19) );
  NOR2X0 U8 ( .IN1(address[1]), .IN2(n6), .QN(n16) );
  NOR2X0 U9 ( .IN1(address[2]), .IN2(n13), .QN(n12) );
  NAND2X1 U10 ( .IN1(address[1]), .IN2(address[0]), .QN(n13) );
endmodule


module Modulation_FSM ( clk, rstn, Ttick, frame_ready, mem_adderss_ovf,
        Ram_inc, Periodreg_inc, latch, pause, Timer_en, busy, clear );
  input clk, rstn, Ttick, frame_ready, mem_adderss_ovf;
  output Ram_inc, Periodreg_inc, latch, pause, Timer_en, busy, clear;
  wire   n5, n6, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n1, n2,
         n3, n4, n7;
  wire   [1:0] state_reg;

  DFFARX1 state_reg_reg_0_ ( .D(n19), .CLK(clk), .RSTB(rstn), .Q(state_reg[0]),
        .QN(n6) );
  DFFARX1 state_reg_reg_1_ ( .D(n18), .CLK(clk), .RSTB(rstn), .Q(state_reg[1]),
        .QN(n5) );
  AO22X1 U19 ( .IN1(state_reg[1]), .IN2(n4), .IN3(mem_adderss_ovf), .IN4(n10),
        .Q(n9) );
  AO22X1 U20 ( .IN1(state_reg[0]), .IN2(n2), .IN3(n11), .IN4(n12), .Q(n19) );
  AO21X1 U21 ( .IN1(frame_ready), .IN2(n3), .IN3(n1), .Q(n12) );
  AOI22X1 U22 ( .IN1(pause), .IN2(n14), .IN3(Ttick), .IN4(n15), .QN(n13) );
  AO22X1 U23 ( .IN1(frame_ready), .IN2(n16), .IN3(n10), .IN4(n7), .Q(latch) );
  AO21X1 U24 ( .IN1(frame_ready), .IN2(n16), .IN3(n10), .Q(Ram_inc) );
  AO21X1 U25 ( .IN1(n3), .IN2(Ttick), .IN3(n1), .Q(n16) );
  AO22X1 U3 ( .IN1(mem_adderss_ovf), .IN2(n10), .IN3(n17), .IN4(frame_ready),
        .Q(Periodreg_inc) );
  NOR2X0 U4 ( .IN1(Timer_en), .IN2(frame_ready), .QN(clear) );
  INVX0 U5 ( .INP(pause), .ZN(busy) );
  NOR2X0 U6 ( .IN1(n4), .IN2(pause), .QN(n10) );
  INVX0 U7 ( .INP(Timer_en), .ZN(n1) );
  INVX0 U8 ( .INP(n14), .ZN(n3) );
  NOR2X0 U9 ( .IN1(n4), .IN2(n14), .QN(n17) );
  INVX0 U10 ( .INP(n11), .ZN(n2) );
  NOR2X0 U11 ( .IN1(n13), .IN2(clear), .QN(n11) );
  NAND2X1 U12 ( .IN1(state_reg[0]), .IN2(n5), .QN(pause) );
  NAND2X0 U13 ( .IN1(n5), .IN2(n6), .QN(Timer_en) );
  INVX0 U14 ( .INP(Ttick), .ZN(n4) );
  NAND2X1 U15 ( .IN1(state_reg[1]), .IN2(n6), .QN(n14) );
  INVX0 U16 ( .INP(mem_adderss_ovf), .ZN(n7) );
  NAND2X1 U17 ( .IN1(busy), .IN2(n7), .QN(n15) );
  OA21X1 U18 ( .IN1(Ttick), .IN2(n6), .IN3(n9), .Q(n18) );
endmodule


module Modulation_system_N12 ( clk, rstn, frame_ready, I_data_in, Q_data_in,
        DAC_RE, DAC_IM, busy );
  input [3:0] I_data_in;
  input [3:0] Q_data_in;
  output [5:0] DAC_RE;
  output [5:0] DAC_IM;
  input clk, rstn, frame_ready;
  output busy;
  wire   mem_Address_2_, Ram_inc, D_Ram_inc, clear, I, Q, latch, pause,
         Timer_en, Ttick, Periodreg_inc, n2, add_51_carry_11_, n1, n3, n4, n5,
         n6, n7, SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2,
         SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4,
         SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6,
         SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8,
         SYNOPSYS_UNCONNECTED_9, SYNOPSYS_UNCONNECTED_10,
         SYNOPSYS_UNCONNECTED_11;
  wire   [1:0] Ram_Address;
  wire   [11:10] feedback_data;
  wire   [11:10] PHI;
  wire   [11:0] DQPSK;
  wire   [4:0] chirps_address;
  wire   [3:0] Period_address;
  wire   [6:0] Period;

  INVX0 U1 ( .INP(frame_ready), .ZN(n1) );
  INVX0 U2 ( .INP(n1), .ZN(n3) );
  INVX0 U3 ( .INP(latch), .ZN(n4) );
  INVX0 U4 ( .INP(n4), .ZN(n5) );
  INVX0 U5 ( .INP(n7), .ZN(n6) );
  INVX0 U6 ( .INP(clear), .ZN(n7) );
  INVX0 U7 ( .INP(busy), .ZN(n2) );
  XOR3X1 U8 ( .IN1(feedback_data[11]), .IN2(PHI[11]), .IN3(add_51_carry_11_),
        .Q(DQPSK[11]) );
  AND2X1 U9 ( .IN1(PHI[10]), .IN2(feedback_data[10]), .Q(add_51_carry_11_) );
  XOR2X1 U10 ( .IN1(feedback_data[10]), .IN2(PHI[10]), .Q(DQPSK[10]) );
  dreg_N1 DeLAY_REG ( .clk(clk), .rstn(rstn), .data_in(Ram_inc), .dataout(
        D_Ram_inc) );
  address_counter_N3_MAX4 Address_A ( .clk(clk), .rstn(rstn), .clear(n6),
        .enable(D_Ram_inc), .address({mem_Address_2_, Ram_Address}) );
  bit_RAM_Depth4_1 I_bit_RAM ( .clk(clk), .rstn(rstn), .we(n2), .r_address(
        Ram_Address), .data_in(I_data_in), .data_out(I) );
  bit_RAM_Depth4_0 Q_bit_RAM ( .clk(clk), .rstn(rstn), .we(n2), .r_address(
        Ram_Address), .data_in(Q_data_in), .data_out(Q) );
  dqpsk_mapper_polar_N12 dqpsk_mapper ( .I(I), .Q(Q), .PHI({PHI,
        SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3,
        SYNOPSYS_UNCONNECTED_4, SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6,
        SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8, SYNOPSYS_UNCONNECTED_9,
        SYNOPSYS_UNCONNECTED_10}) );
  feedback_memory_polar_N12 feedback_memory ( .clk(clk), .rstn(rstn), .clear(
        n6), .we(n5), .datain(DQPSK), .address(Ram_Address), .dataout({
        feedback_data, DQPSK[9:0]}) );
  CSK_GEN_N12_M6 CSK_GEN ( .clk(clk), .rstn(rstn), .latch(latch), .pause(pause), .DQPSK(DQPSK), .chirps_address(chirps_address), .DAC_RE(DAC_RE), .DAC_IM(
        DAC_IM) );
  address_counter_N5_MAX31 Address_C ( .clk(clk), .rstn(rstn), .clear(clear),
        .enable(n5), .address(chirps_address) );
  delay_LUT delay_LUT ( .lut_addr(Period_address), .delay({Period[6:1],
        SYNOPSYS_UNCONNECTED_11}) );
  timer_N7 delay_timer ( .clk(clk), .rstn(rstn), .enable(Timer_en),
        .time_limit({Period[6:1], 1'b0}), .trig(Ttick) );
  address_counter_N4_MAX15 Address_D ( .clk(clk), .rstn(rstn), .clear(clear),
        .enable(Periodreg_inc), .address(Period_address) );
  Modulation_FSM control_unit ( .clk(clk), .rstn(rstn), .Ttick(Ttick),
        .frame_ready(n3), .mem_adderss_ovf(mem_Address_2_), .Ram_inc(Ram_inc),
        .Periodreg_inc(Periodreg_inc), .latch(latch), .pause(pause),
        .Timer_en(Timer_en), .busy(busy), .clear(clear) );
endmodule


module CSS_Transmitter_Top ( clk, rstn, start_Tx, rate, payloadLength,
        payload_we, payload_addr, payload_din, DAC_RE_polar, DAC_IM_polar,
        system_busy, len_err, final_ppdu_nibbles );
  input [7:0] payloadLength;
  input [6:0] payload_addr;
  input [7:0] payload_din;
  output [5:0] DAC_RE_polar;
  output [5:0] DAC_IM_polar;
  output [9:0] final_ppdu_nibbles;
  input clk, rstn, start_Tx, rate, payload_we;
  output system_busy, len_err;
  wire   framer_busy, mod_busy, n_0_net_, frame_ready;
  wire   [3:0] stream_i;
  wire   [3:0] stream_q;

  INVX1 U1 ( .INP(rstn), .ZN(n_0_net_) );
  OR2X2 U3 ( .IN1(framer_busy), .IN2(mod_busy), .Q(system_busy) );
  css_tx_framer u_framer ( .clk(clk), .reset(n_0_net_), .start_Tx(start_Tx),
        .rate(rate), .payloadLength(payloadLength), .payload_we(payload_we),
        .payload_addr(payload_addr), .payload_din(payload_din), .mod_busy(
        mod_busy), .frame_ready(frame_ready), .mod_nib_i(stream_i),
        .mod_nib_q(stream_q), .ppdu_nibbles(final_ppdu_nibbles), .len_err(
        len_err), .busy(framer_busy) );
  Modulation_system_N12 u_modulator ( .clk(clk), .rstn(rstn), .frame_ready(
        frame_ready), .I_data_in(stream_i), .Q_data_in(stream_q), .DAC_RE(
        DAC_RE_polar), .DAC_IM(DAC_IM_polar), .busy(mod_busy) );
endmodule

