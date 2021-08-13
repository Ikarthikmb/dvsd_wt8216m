`timescale 1ns/1ps

module dvsd_8216m4(
  input [7:0] A,
  input [7:0] B,
  output [15:0] M
);

  reg [7:0][63:0] P;
  reg [7:0][62:0] PS1;

  integer i;
  integer j;
  integer k;

  // Product Generation

  initial begin
    for (i=0;i<8;i=i+1)
      for (j=0;j<8;j=j+1)
      begin
        P[k] = A[i] & B[i];
        k = k + 1'b1;
      end
  end

  // stage 1

  //     7  6  5  4  3  2 1 0
  //  15 14 13 12 11 10 9 8

  initial begin
    for (i=1; i<8; i=i+1) begin
      if(i!=0) 
      begin
        PS1[i] = P[i] ^ P[i + 7];
      end
    end
  end

  // stage 2
  // stage 3
  // final addition

endmodule

// ============================================
// 
// Test Module 
// 
// ============================================

module dvsd_8216m4_test();
  reg [7:0] A;
  reg [7:0] B;
  wire [15:0] M;

  reg [63:0] P;
  reg [7:0] i,j;
  reg [63:0] k=0;
  
  initial begin
    for(i=0; i<8; i=i+1) begin
      A[i] = 0;
      B[i] = 0;
    end
  end

  // Test outputs
  initial begin
    A = 8'b11111011;
    B = 8'b01111110;

    for(i=0;i<8;i=i+1) begin
      for (j=0;j<8;j=j+1) begin
        #1;
        P[k] = A[i] & B[j];
        k=k+1;
      end
    end
    $display("P=%b",P);
  end
  
  // Module Instantiation
  dvsd_8216m4 M41(
    .A(A),
    .B(B),
    .M(M)
  );
endmodule

