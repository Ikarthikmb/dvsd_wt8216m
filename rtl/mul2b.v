// `include "cmos_and.v"
// `include "cmos_halfadder.v"

module mul2b(
  input a0,
  input a1,
  input b0,
  input b1,
  output m0,
  output m1,
  output m2,
  output m3
);
  // Product Generation
  cmos_and AND0(a0,b0,w0);
  cmos_and AND1(a1,b0,w1);
  cmos_and AND2(a0,b1,w2);
  cmos_and AND3(a1,b1,w3);

  // Partial Addition
  cmos_halfadder HA1(w1,w2,ws1,wc1);

  // Final Addition
  cmos_halfadder HA2(wc1,w3,ws2,wc2);

  // Outputs
  assign m0 = w0;
  assign m1 = ws1;
  assign m2 = ws2;
  assign m3 = wc2;
endmodule