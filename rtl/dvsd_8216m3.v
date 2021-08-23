// =================================================================
// 
// 8-BIT DADDA MULTIPLIER
// 
// 
// DESCRIPTION:
// 
// "dvsd_8216m3" is a 8 bit multiplier which uses Dadda-tree 
// algorithm to multiply two 8-bit numbers to produce 16-bit number.
// 
// -----------------------------------------------------------------
// input  A :                               a[7] a[6] a[5] a[4] a[3] a[2] a[1] a[0]
// input  B :                               b[7] b[6] b[5] b[4] b[3] b[2] b[1] b[0]
// ----------------------------------------------------------------- 
// output M : m[15] m[14] m[13] m[12] m[11] m[10] m[9] m[8] m[7] m[6] m[5] m[4] m[3] m[2] m[1] m[0]
// ----------------------------------------------------------------- 
//            ^MSB                                             LSB^
// 
// MODULES:
// 
// 1. dvsd_8216m3
// 2. Half Adder
// 3. 3:2 Compressor
// 4. AND Gate
//
// Author: ikarthikmb
// Website: https://ikarthikmb.github.io
//
// =================================================================

// `timescale 1ns/1ps

module dvsd_8216m3(
  input [7:0] a,
  input [7:0] b,
  output [15:0] m
  // input   a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7],
  // input   b[0], b[1], b[2], b[3], b[4], b[5], b[6], b[7],
  // output  m[0], m[1], m[2], m[3], m[4], m[5], m[6], m[7],
  // output  m[8], m[9], m[10], m[11], m[12], m[13], m[14], m[15]
);

  wire w00,w10,w20,w30,w40,w50,w60,w70;
  wire w01,w11,w21,w31,w41,w51,w61,w71;
  wire w02,w12,w22,w32,w42,w52,w62,w72;
  wire w03,w13,w23,w33,w43,w53,w63,w73;
  wire w04,w14,w24,w34,w44,w54,w64,w74;
  wire w05,w15,w25,w35,w45,w55,w65,w75;
  wire w06,w16,w26,w36,w46,w56,w66,w76;
  wire w07,w17,w27,w37,w47,w57,w67,w77;

  // ==============================================================
  // Product Generation
  // ==============================================================

  and1b AND0(a[0], b[0], w00);
  and1b AND1(a[1], b[0], w10);
  and1b AND2(a[2], b[0], w20);
  and1b AND3(a[3], b[0], w30);
  and1b AND4(a[4], b[0], w40);
  and1b AND5(a[5], b[0], w50);
  and1b AND6(a[6], b[0], w60);
  and1b AND7(a[7], b[0], w70);

  and1b AND8(a[0], b[1], w01);
  and1b AND9(a[1], b[1], w11);
  and1b AND10(a[2], b[1], w21);
  and1b AND11(a[3], b[1], w31);
  and1b AND12(a[4], b[1], w41);
  and1b AND13(a[5], b[1], w51);
  and1b AND14(a[6], b[1], w61);
  and1b AND15(a[7], b[1], w71);

  and1b AND16(a[0], b[2], w02);
  and1b AND17(a[1], b[2], w12);
  and1b AND18(a[2], b[2], w22);
  and1b AND19(a[3], b[2], w32);
  and1b AND20(a[4], b[2], w42);
  and1b AND21(a[5], b[2], w52);
  and1b AND22(a[6], b[2], w62);
  and1b AND23(a[7], b[2], w72);

  and1b AND24(a[0], b[3], w03);
  and1b AND25(a[1], b[3], w13);
  and1b AND26(a[2], b[3], w23);
  and1b AND27(a[3], b[3], w33);
  and1b AND28(a[4], b[3], w43);
  and1b AND29(a[5], b[3], w53);
  and1b AND30(a[6], b[3], w63);
  and1b AND31(a[7], b[3], w73);

  and1b AND32(a[0], b[4], w04);
  and1b AND33(a[1], b[4], w14);
  and1b AND34(a[2], b[4], w24);
  and1b AND35(a[3], b[4], w34);
  and1b AND36(a[4], b[4], w44);
  and1b AND37(a[5], b[4], w54);
  and1b AND38(a[6], b[4], w64);
  and1b AND39(a[7], b[4], w74);

  and1b AND40(a[0], b[5], w05);
  and1b AND41(a[1], b[5], w15);
  and1b AND42(a[2], b[5], w25);
  and1b AND43(a[3], b[5], w35);
  and1b AND44(a[4], b[5], w45);
  and1b AND45(a[5], b[5], w55);
  and1b AND46(a[6], b[5], w65);
  and1b AND47(a[7], b[5], w75);

  and1b AND48(a[0], b[6], w06);
  and1b AND49(a[1], b[6], w16);
  and1b AND50(a[2], b[6], w26);
  and1b AND51(a[3], b[6], w36);
  and1b AND52(a[4], b[6], w46);
  and1b AND53(a[5], b[6], w56);
  and1b AND54(a[6], b[6], w66);
  and1b AND55(a[7], b[6], w76);

  and1b AND56(a[0], b[7], w07);
  and1b AND57(a[1], b[7], w17);
  and1b AND58(a[2], b[7], w27);
  and1b AND59(a[3], b[7], w37);
  and1b AND60(a[4], b[7], w47);
  and1b AND61(a[5], b[7], w57);
  and1b AND62(a[6], b[7], w67);
  and1b AND63(a[7], b[7], w77);
  
  //==============================================================
  // Stage 1  
  //==============================================================

  wire us1,us2,us3,us4,us5,us6;
  wire uc1,uc2,uc3,uc4,uc5,uc6;
  
  halfadder HA1(w60,w51,us1,uc1);
  compressor3to2 CMP1(w70,w61,w52,us2,uc2);
  halfadder HA2(w43,w34,us3,uc3);
  compressor3to2 CMP2(w71,w62,w53,us4,uc4);
  halfadder HA3(w44,w35,us5,uc5);
  compressor3to2 CMP3(w72,w63,w54,us6,uc6);
  
  // ==============================================================
  // Partial Addition: Stage 2
  // ==============================================================

  wire vs0,vs1,vs2,vs3,vs4,vs5,vs6,vs7,vs8,vs9,vs10,vs11,vs12,vs13;
  wire vc0,vc1,vc2,vc3,vc4,vc5,vc6,vc7,vc8,vc9,vc10,vc11,vc12,vc13; 

  halfadder HA4(w40,w31,vs0,vc0);
  compressor3to2 CMP4(w50,w41,w32,vs1,vc1);
  halfadder HA5(w23,w14,vs2,vc2);
  compressor3to2 CMP5(us1,w42,w33,vs3,vc3);
  compressor3to2 CMP6(w24,w15,w06,vs4,vc4);
  compressor3to2 CMP7(uc1,us2,us3,vs5,vc5);
  compressor3to2 CMP8(w25,w16,w07,vs6,vc6);
  compressor3to2 CMP9(uc3,uc2,us5,vs7,vc7);
  compressor3to2 CMP10(us4,w26,w17,vs8,vc8);
  compressor3to2 CMP11(uc5,uc4,us6,vs9,vc9);
  compressor3to2 CMP12(w45,w36,w27,vs10,vc10);
  compressor3to2 CMP13(uc6,w73,w64,vs11,vc11);
  compressor3to2 CMP14(w55,w46,w37,vs12,vc12);
  compressor3to2 CMP15(w74,w65,w56,vs13,vc13);

  // ==============================================================
  // Partial Addition: Stage 3
  // ==============================================================

  wire ts0,ts1,ts2,ts3,ts4,ts5,ts6,ts7,ts8,ts9;
  wire tc0,tc1,tc2,tc3,tc4,tc5,tc6,tc7,tc8,tc9; 

  halfadder HA6(w30,w21,ts0,tc0);
  compressor3to2 CMP16(vs0,w22,vs13,ts1,tc1);
  compressor3to2 CMP17(vc0,vs1,vs2,ts2,tc2);
  compressor3to2 CMP18(vc1,vc2,vs3,ts3,tc3);
  compressor3to2 CMP19(vc3,vc4,vs5,ts4,tc4);
  compressor3to2 CMP20(vc5,vc6,vs7,ts5,tc5);
  compressor3to2 CMP21(vc7,vc8,vs9,ts6,tc6);
  compressor3to2 CMP22(vc9,vc10,vs11,ts7,tc7);
  compressor3to2 CMP23(vc11,vc12,vs13,ts8,tc8);
  compressor3to2 CMP24(vc13,w75,w66,ts9,tc9);

  // ==============================================================
  // Partial Addition: Stage 4
  // ==============================================================

  wire rs0,rs1,rs2,rs3,rs4,rs5,rs6,rs7,rs8,rs9,rs10,rs11;
  wire rc0,rc1,rc2,rc3,rc4,rc5,rc6,rc7,rc8,rc9,rc10,rc11; 

  halfadder HA7(w20,w11,rs0,rc0);
  compressor3to2 CMP25(ts0,w12,w03,rs1,rc1);
  compressor3to2 CMP26(tc0,ts1,w04,rs2,rc2);
  compressor3to2 CMP27(tc1,ts2,w05,rs3,rc3);
  compressor3to2 CMP28(tc2,ts3,vs4,rs4,rc4);
  compressor3to2 CMP29(tc3,ts4,vs6,rs5,rc5);
  compressor3to2 CMP30(tc4,ts5,vs8,rs6,rc6);
  compressor3to2 CMP31(tc5,ts6,vs10,rs7,rc7);
  compressor3to2 CMP32(tc6,ts7,vs12,rs8,rc8);
  compressor3to2 CMP33(tc7,ts8,w47,rs9,rc9);
  compressor3to2 CMP34(tc8,ts9,w57,rs10,rc10);
  compressor3to2 CMP35(tc9,w76,w67,rs11,rc11);
 
  // ==============================================================
  // Final Addition
  // ==============================================================

  wire mc1,mc2,mc3,mc4,mc5,mc6,mc7,mc8,mc9,mc10,mc11,mc12,mc13,mc14;
  wire ms1,ms2,ms3,ms4,ms5,ms6,ms7,ms8,ms9,ms10,ms11,ms12,ms13,ms14;

  halfadder HA8(w10,w01,ms1,mc1);
  compressor3to2 CMP36(rs0,w02,mc1,ms2,mc2);
  compressor3to2 CMP37(rc0,rs1,mc2,ms3,mc3);
  compressor3to2 CMP38(rc1,rs2,mc3,ms4,mc4);
  compressor3to2 CMP39(rc2,rs3,mc4,ms5,mc5);
  compressor3to2 CMP40(rc3,rs4,mc5,ms6,mc6);
  compressor3to2 CMP41(rc4,rs5,mc6,ms7,mc7);
  compressor3to2 CMP42(rc5,rs6,mc7,ms8,mc8);
  compressor3to2 CMP43(rc6,rs7,mc8,ms9,mc9);
  compressor3to2 CMP44(rc7,rs8,mc9,ms10,mc10);
  compressor3to2 CMP45(rc8,rs9,mc10,ms11,mc11);
  compressor3to2 CMP46(rc9,rs10,mc11,ms12,mc12);
  compressor3to2 CMP47(rc10,rs11,mc12,ms13,mc13);
  compressor3to2 CMP48(rc11,w77,mc13,ms14,mc14);
  
  // ==============================================================
  // Outputs
  // ==============================================================

  assign m[0]   = w00;
  assign m[1]   = ms1;
  assign m[2]   = ms2;
  assign m[3]   = ms3;
  assign m[4]   = ms4;
  assign m[5]   = ms5;
  assign m[6]   = ms6;
  assign m[7]   = ms7;
  assign m[8]   = ms8;
  assign m[9]   = ms9;
  assign m[10]  = ms10;
  assign m[11]  = ms11;
  assign m[12]  = ms12;
  assign m[13]  = ms13;
  assign m[14]  = ms14;
  assign m[15]  = mc14;

endmodule


// ==============================================================
// 
// Half Adder
// 
// ==============================================================

module halfadder(
  input a,
  input b,
  output sum,
  output carry
);

  assign sum = a ^ b;
  assign carry = a & b;

endmodule


// ==============================================================
// 
// 3:2 Compressor
// 
// ==============================================================

module compressor3to2(
  input a0,
  input a1,
  input a2,
  output sout,
  output cout
);
  
  assign cout = (a0 & a1) | (a2 & (a0 ^ a1));
  assign sout = ((a0 ^ a1) & (~a2)) | ((~(a0 ^ a1)) & a2);
  
endmodule

// ==============================================================
// 
// AND Gate
// 
// ==============================================================

module and1b(
  input a1,
  input a2,
  output y
);

  assign y = a1 & a2;
  
endmodule