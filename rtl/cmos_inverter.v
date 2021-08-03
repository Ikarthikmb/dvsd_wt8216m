// CMOS 1-bit Inverter 

module cmos_inverter(
  input in,
  output out 
);
  supply0 GND;
  supply1 PWR;

  pmos(out, PWR, in);
  nmos(out, GND, in);
endmodule