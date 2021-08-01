module mux21(
  input a,
  input b,
  input s,
  output m
);
  assign m = (s) ? b : a;
endmodule