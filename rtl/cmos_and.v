module cmos_and(
  input a1,
  input a2,
  output y
);
  supply0 GND;
  supply1 PWR;
  
  wire w1, w2;

  pmos(w1, PWR, a1);
  pmos(w1, PWR, a2);
  nmos(w1, w2, a1);
  nmos(w2, GND, a2);
  cmos_inverter INV(w1,y);
endmodule

// CMOS 1-bit Inverter 
module cmos_inverter(
  input a,
  output y 
);
  supply0 GND;
  supply1 PWR;

  pmos(y, PWR, a);
  nmos(y, GND, a);
endmodule