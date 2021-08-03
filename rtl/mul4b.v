// `include "../rtl/mul2b.v"
// `include "../rtl/cmos_and.v"
// `include "../rtl/cmos_halfadder.v"
// `include "../rtl/cmos_inverter.v"
// `include "../rtl/cmos_xor_xnor.v"
// `include "../rtl/compressor3to2.v"
// `include "../rtl/cmos_mux.v"

module mul4b(
  input a0,
  input a1,
  input a2,
  input a3,
  input b0,
  input b1,
  input b2,
  input b3,
  output m0,
  output m1,
  output m2,
  output m3,
  output m4,
  output m5,
  output m6,
  output m7
);
  // Stage 1
  wire ws0, ws1, ws2, ws3;
  wire wc01, wc02, wc03;
  wire wc11, wc12, wc13;
  wire wc21, wc22, wc23;
  wire wc31, wc32, wc33;

  mul2b MUL1(a1,a0,b1,b0,ws0,wc01,wc02,wc03);
  mul2b MUL2(a3,a2,b1,b0,ws1,wc11,wc12,wc13);
  mul2b MUL3(a1,a0,b3,b2,ws2,wc21,wc22,wc23);
  mul2b MUL4(a3,a2,b3,b2,ws3,wc31,wc32,wc33);

  // Stage 2
  wire us0,us1,us2,us3;
  wire uc0,uc1,uc2,uc3;

  compressor3to2 CMP1(wc02,ws1,ws2,us0,uc0);
  compressor3to2 CMP2(wc03,wc11,wc21,us1,uc1);
  compressor3to2 CMP3(wc12,wc22,ws3,us2,uc2);
  compressor3to2 CMP4(wc13,wc23,wc31,us3,uc3);

  // Stage 2
  wire vs0, vs1, vs2, vs3;
  wire vc0, vc1, vc2, vc3;

  cmos_halfadder HA1(uc0,us1,vs0,vc0);
  compressor3to2 CMP5(uc1,us2,vc0,vs1,vc1);
  compressor3to2 CMP6(uc2,us3,vc1,vs2,vc2);
  compressor3to2 CMP7(wc32,vc2,wc33,vs3,vc3);

  // Outputs
  assign m0 = ws0;
  assign m1 = wc01;
  assign m2 = us0;
  assign m3 = vs0;
  assign m4 = vs1;
  assign m5 = vs2;
  assign m6 = vs3;
  assign m7 = vc3;
endmodule