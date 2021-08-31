// ==============================================================
// 
// Half Adder
// 
// ==============================================================

module halfadder(
  input a,
  input b,
  output sum,
  output carry
);

  assign sum = a ^ b;
  assign carry = a & b;

endmodule