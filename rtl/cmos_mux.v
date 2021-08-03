// `include "cmos_inverter.v"

module cmos_mux(
  input i0,
  input i1,
  input s,
  output y 
);
  supply0 GND;
  supply1 PWR;

  wire s_bar;
  wire h, w1, w2, w3;

  cmos_inverter INV1(s, s_bar);
  cmos_inverter INV2(h, y);

  pmos(w1, PWR, s_bar);
  pmos(w1, PWR, i0);
  pmos(h, w1, s);
  pmos(h, w1, i1);
  nmos(h, w2, s_bar);
  nmos(w2, GND, i0);
  nmos(h, w3, s);
  nmos(w3, GND, i1);
endmodule
