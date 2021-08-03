// Half Adder

// `include "cmos_xor_xnor.v"
// `include "cmos_and.v"

module cmos_halfadder(
  input a,
  input b,
  output sum,
  output carry
);
  cmos_xor_xnor XOR_XNOR(a,b,sum,null);
  cmos_and AND(a,b,carry);
endmodule