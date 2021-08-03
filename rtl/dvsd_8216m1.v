`include "cmos_and.v"
`include "compressor3to2.v"
`include "cmos_halfadder.v"

module dvsd_8216m1(
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

  // Product Generation
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
  
  // stage 1
  wire vs0, vs1, vs2, vs3, vs4, vs5; 
  wire vs6, vs7, vs8, vs9, vs10, vs11; 
  wire vc0, vc1, vc2, vc3, vc4, vc5;
  wire vc6, vc7, vc8, vc9, vc10,vc11; 

  compressor3to2 CMP0(w20, w11, w22, vs0, vc0);
  compressor3to2 CMP1(w30, w21, w32, vs1, vc1);
  compressor3to2 CMP2(w40, w31, w42, vs2, vc2);
  compressor3to2 CMP3(w50, w41, w52, vs3, vc3);
  compressor3to2 CMP4(w60, w51, w62, vs4, vc4);
  compressor3to2 CMP5(w70, w61, w72, vs5, vc5);

  compressor3to2 CMP6(w23, w14, w25, vs6, vc6);
  compressor3to2 CMP7(w33, w24, w35, vs7, vc7);
  compressor3to2 CMP8(w43, w34, w45, vs8, vc8);
  compressor3to2 CMP9(w53, w44, w55, vs9, vc9);
  compressor3to2 CMP10(w63, w54, w65, vs10, vc10);
  compressor3to2 CMP11(w73, w64, w75, vs11, vc11);

  cmos_halfadder HA1(w10, w02, hs0, hc0);
  cmos_halfadder HA2(w72, w63, hs1, hc1);
  cmos_halfadder HA3(w14, w05, hs2, hc2);
  cmos_halfadder HA4(w75, w66, hs3, hc3);

  // stage 2
  compressor3to2 CMP12(vs1, vc1, w04, us0, uc0);
  compressor3to2 CMP13(vs2, vc2, hs2, us1, uc1);
  compressor3to2 CMP14(vs3, vc3, vs6, us2, uc2);
  compressor3to2 CMP15(vs4, vc4, vs7, us3, uc3);
  compressor3to2 CMP16(hs5, vs9, vc9, us4, uc4);
  compressor3to2 CMP17(w72, vs10, vc10, us5, uc5);

  // compressor3to2 CMP18(vc8, w16, w07, us6, uc6);
  // compressor3to2 CMP18(vc9, w26, w17, us7, uc7);
  // compressor3to2 CMP18(vc9, w16, w07, us6, uc6);
  // compressor3to2 CMP18(vc9, w16, w07, us6, uc6);
  // compressor3to2 CMP18(vc9, w16, w07, us6, uc6);
  // compressor3to2 CMP18(vc9, w16, w07, us6, uc6);
  
  // Outputs
  assign m0 = w00;
  assign m0 = w10;
  assign m0 = w20;

endmodule