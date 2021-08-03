// `include "../rtl/cmos_xor_xnor.v"
// `include "../rtl/cmos_mux.v"
// `include "../rtl/cmos_inverter.v"

module compressor3to2(
  input a0,
  input a1,
  input a2,
  output sout,
  output cout
);
  supply0 GND;
  supply1 PWR;

  cmos_xor_xnor XOR_XNOR(a0, a1, xo, xn);
  cmos_mux MUX(xo, xn, a2, sout);
  
  // carry logic 
  wire h, w1, w2, w3;

  pmos(w1, PWR, a0);
  pmos(w1, PWR, a1);
  pmos(h, w1, a2);
  pmos(h, w1, xo);
  nmos(h, w2, a0);
  nmos(w2, GND, a1);
  nmos(h, w3, a2);
  nmos(w3, GND, xo);

  cmos_inverter INV(h, cout);

endmodule