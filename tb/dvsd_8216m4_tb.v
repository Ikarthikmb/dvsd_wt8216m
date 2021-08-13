`include "../rtl/dvsd_8216m4.v"
`timescale 1ns/1ps

module dvsd_8216m4_tb();
  reg [7:0] A;
  reg [7:0] B;
  wire [15:0] M;

  integer i;

  // Product Generation

  initial begin
    for (i=0;i<10;i=i+1) begin
      #1;
      A = {$random} % (2**8);
      B = {$random} % (2**8);
      $display("%0t\t%b\t%b\t%b",$time,A,B,M);
    end
  end

  initial begin
    $timeformat(-9,2,"ns",9);
    $display("time\tA\t\tB\t\tM");
    // $monitor("time\tA\tB\tM")
  end

  dvsd_8216m4 M4(
    .A(A),
    .B(B),
    .M(M)
  );
endmodule

