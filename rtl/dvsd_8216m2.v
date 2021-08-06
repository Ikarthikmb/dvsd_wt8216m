// `include "cmos_and.v"
// `include "compressor3to2.v"
// `include "cmos_halfadder.v"
// `include "ksadd16b.v"


module dvsd_8216m2(
  input a0, a1, a2, a3, a4, a5, a6, a7,
  input b0, b1, b2, b3, b4, b5, b6, b7,
  output m0, m1, m2, m3, m4, m5, m6, m7,
  output m8, m9, m10, m11, m12, m13, m14, m15
);

  wire w00,w10,w20,w30,w40,w50,w60,w70;
  wire w01,w11,w21,w31,w41,w51,w61,w71;
  wire w02,w12,w22,w32,w42,w52,w62,w72;
  wire w03,w13,w23,w33,w43,w53,w63,w73;
  wire w04,w14,w24,w34,w44,w54,w64,w74;
  wire w05,w15,w25,w35,w45,w55,w65,w75;
  wire w06,w16,w26,w36,w46,w56,w66,w76;
  wire w07,w17,w27,w37,w47,w57,w67,w77;

  //
  // Product Generation
  //

  cmos_and AND0(a0, b0, w00);
  cmos_and AND1(a1, b0, w10);
  cmos_and AND2(a2, b0, w20);
  cmos_and AND3(a3, b0, w30);
  cmos_and AND4(a4, b0, w40);
  cmos_and AND5(a5, b0, w50);
  cmos_and AND6(a6, b0, w60);
  cmos_and AND7(a7, b0, w70);

  cmos_and AND8(a0, b1, w01);
  cmos_and AND9(a1, b1, w11);
  cmos_and AND10(a2, b1, w21);
  cmos_and AND11(a3, b1, w31);
  cmos_and AND12(a4, b1, w41);
  cmos_and AND13(a5, b1, w51);
  cmos_and AND14(a6, b1, w61);
  cmos_and AND15(a7, b1, w71);

  cmos_and AND16(a0, b2, w02);
  cmos_and AND17(a1, b2, w12);
  cmos_and AND18(a2, b2, w22);
  cmos_and AND19(a3, b2, w32);
  cmos_and AND20(a4, b2, w42);
  cmos_and AND21(a5, b2, w52);
  cmos_and AND22(a6, b2, w62);
  cmos_and AND23(a7, b2, w72);

  cmos_and AND24(a0, b3, w03);
  cmos_and AND25(a1, b3, w13);
  cmos_and AND26(a2, b3, w23);
  cmos_and AND27(a3, b3, w33);
  cmos_and AND28(a4, b3, w43);
  cmos_and AND29(a5, b3, w53);
  cmos_and AND30(a6, b3, w63);
  cmos_and AND31(a7, b3, w73);

  cmos_and AND32(a0, b4, w04);
  cmos_and AND33(a1, b4, w14);
  cmos_and AND34(a2, b4, w24);
  cmos_and AND35(a3, b4, w34);
  cmos_and AND36(a4, b4, w44);
  cmos_and AND37(a5, b4, w54);
  cmos_and AND38(a6, b4, w64);
  cmos_and AND39(a7, b4, w74);

  cmos_and AND40(a0, b5, w05);
  cmos_and AND41(a1, b5, w15);
  cmos_and AND42(a2, b5, w25);
  cmos_and AND43(a3, b5, w35);
  cmos_and AND44(a4, b5, w45);
  cmos_and AND45(a5, b5, w55);
  cmos_and AND46(a6, b5, w65);
  cmos_and AND47(a7, b5, w75);

  cmos_and AND48(a0, b6, w06);
  cmos_and AND49(a1, b6, w16);
  cmos_and AND50(a2, b6, w26);
  cmos_and AND51(a3, b6, w36);
  cmos_and AND52(a4, b6, w46);
  cmos_and AND53(a5, b6, w56);
  cmos_and AND54(a6, b6, w66);
  cmos_and AND55(a7, b6, w76);

  cmos_and AND56(a0, b7, w07);
  cmos_and AND57(a1, b7, w17);
  cmos_and AND58(a2, b7, w27);
  cmos_and AND59(a3, b7, w37);
  cmos_and AND60(a4, b7, w47);
  cmos_and AND61(a5, b7, w57);
  cmos_and AND62(a6, b7, w67);
  cmos_and AND63(a7, b7, w77);
  
  //
  // Stage 1D   
  //

  wire us1,us2,us3,us4,us5,us6;
  wire uc1,uc2,uc3,uc4,uc5,uc6;
  
  cmos_halfadder HA1(w60,w51,us1,uc1);
  cmos_halfadder HA2(w43,w34,us2,uc2);
  compressor3to2 CMP1(w70,w61,w52,us3,uc3);
  cmos_halfadder HA3(w44,w35,us4,uc4);
  compressor3to2 CMP2(w71,w62,w53,us5,uc5);
  compressor3to2 CMP3(w72,w63,w54,us6,uc6);
  
  //
  // Stage 2D  
  //

  wire vs0,vs1,vs2,vs3,vs4,vs5,vs6,vs7,vs8,vs9,vs10,vs11,vs12,vs13;
  wire vc0,vc1,vc2,vc3,vc4,vc5,vc6,vc7,vc8,vc9,vc10,vc11,vc12,vc13; 

  cmos_halfadder HA4(w40,w31,vs0,vc0);
  compressor3to2 CMP4(w50,w41,w32,vs1,vc1);
  cmos_halfadder HA5(w23,w14,vs2,vc2);
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

  //
  // Stage 3D  
  //

  wire ts0,ts1,ts2,ts3,ts4,ts5,ts6,ts7,ts8,ts9;
  wire tc0,tc1,tc2,tc3,tc4,tc5,tc6,tc7,tc8,tc9; 

  cmos_halfadder HA6(w30,w21,ts0,tc0);
  compressor3to2 CMP16(vs0,w22,vs13,ts1,tc1);
  compressor3to2 CMP17(vc0,vs1,vs2,ts2,tc2);
  compressor3to2 CMP18(vc1,vc2,vs3,ts3,tc3);
  compressor3to2 CMP19(vc3,vc4,vs5,ts4,tc4);
  compressor3to2 CMP20(vc5,vc6,vs7,ts5,tc5);
  compressor3to2 CMP21(vc7,vc8,vs9,ts6,tc6);
  compressor3to2 CMP22(vc9,vc10,vs11,ts7,tc7);
  compressor3to2 CMP23(vc11,vc12,vs13,ts8,tc8);
  compressor3to2 CMP24(vc13,w75,w66,ts9,tc9);

  //
  // Stage 3D  
  //

  wire rs0,rs1,rs2,rs3,rs4,rs5,rs6,rs7,rs8,rs9,rs10,rs11;
  wire rc0,rc1,rc2,rc3,rc4,rc5,rc6,rc7,rc8,rc9,rc10,rc11; 

  cmos_halfadder HA7(w20,w11,rs0,rc0);
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

  //
  // Final Addition
  //

  ksadd16b KoggeStone(
    .k0(w10), .k1(rs0), .k2(rc0), .k3(rc1), .k4(rc2), .k5(rc3), .k6(rc4), .k7(rc5),
    .k8(rc6), .k9(rc7), .k10(rc8), .k11(rc9), .k12(rc10), .k13(rc11), .k14(), .k15(),
    .t0(w01), .t1(w02), .t2(rs1), .t3(rs2), .t4(rs3), .t5(rs4), .t6(rs5), .t7(rs6),
    .t8(rs7), .t9(rs8), .t10(rs9), .t11(rs10), .t12(rs11), .t13(w77), .t14(), .t15(),
    .s0(m1), .s1(m2), .s2(m3), .s3(m4), .s4(m5), .s5(m6), .s6(m7), .s7(m8), .s8(m9),
    .s9(m10), .s10(m11), .s11(m12), .s12(m13), .s13(m14), .s14(m15), .s15()
  ); 
  
  // Outputs
  assign m0   = w00;
  // assign m1   = ms1;
  // assign m2   = ms2;
  // assign m3   = ms3;
  // assign m4   = ms4;
  // assign m5   = ms5;
  // assign m6   = ms6;
  // assign m7   = ms6;
  // assign m8   = ms7;
  // assign m9   = ms8;
  // assign m10  = ms9;
  // assign m11  = ms10;
  // assign m12  = ms11;
  // assign m13  = ms12;
  // assign m14  = ms13;
  // assign m15  = mc14;
endmodule