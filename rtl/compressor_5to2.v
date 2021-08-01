module compressor_5to2(
  input a0,
  input a1,
  input a2,
  input a3,
  input a4,
  input ci1,
  input ci2,
  output sum,
  output carry,
  output co1,
  output co2
);
  assign co1 = ((a0 ^ a1) & a2) | (a0 & a1);
  assign co2 = ( (a3 ^ a4) & a3 ) | ( (~(a3 ^ a4)) & ci1); 
  assign sum = (a0 ^ a1 ^ a2) ^ (a3 ^ a4 ^ ci1) ^ ci2;
  assign carry = ( ((a0 ^ a1 ^ a2) ^ (a3 ^ a4 ^ ci1)) & ci2 ) | (~((a0 ^ a1 ^ a2) ^ (a3 ^ a4 ^ ci1)) & (a0 ^ a1 ^ a2));
  // assign carry = ( ((a0 ^ a1 ^ a2) ^ (a3 ^ a4 ^ Ci1)) & Ci2 ) | (~((a0 ^ a1 ^ a2) ^ (a3 ^ a4 ^ Ci1)) & (a0 ^ a1 ^ a2));
endmodule