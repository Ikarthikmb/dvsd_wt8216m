// ==============================================================
// 
// 3:2 Compressor
// 
// ==============================================================

module compressor3to2(
  input a0,
  input a1,
  input a2,
  output sout,
  output cout
);
  
  assign cout = (a0 & a1) | (a2 & (a0 ^ a1));
  assign sout = ((a0 ^ a1) & (~a2)) | ((~(a0 ^ a1)) & a2);
  
endmodule