module wt8b(
  input  [7:0] A,
  input  [7:0] B,
  output [15:0] Z
);
assign Z[0] = A[0] * B[0];
endmodule