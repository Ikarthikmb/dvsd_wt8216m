// `include "cmos_inverter.v"

module cmos_xor(
  input a,
  input b,
  output xor_o
);
  supply0 GND;
  supply1 PWR;
  
  wire a_bar, b_bar;
  wire w1, w2;

  cmos_inverter INV1(a, a_bar);
  cmos_inverter INV2(b, b_bar);
  cmos_inverter INV3(w2, xor_o);

  pmos(w1, PWR, b);
  pmos(w1, PWR, a_bar);
  pmos(w2, w1, b_bar);
  pmos(w2, w1, a);
  nmos(w2, w3, b);
  nmos(w3, GND, a_bar);
  nmos(w2, w4, b_bar);
  nmos(w4, GND, a);

endmodule

