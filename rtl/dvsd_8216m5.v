module dvsd_8216m5(
  input clk,
  input [7:0] A,
  input [7:0] B,
  output [15:0] M
);
  reg [7:0][7:0] P;
  integer i;
  reg cin = 1'b0;

  initial begin
    for (i=7; i>=0; i=i-1) begin
      // @(posedge clk)
      if (B[i] == 1'b0) begin
        P[i] = 8'b0;
        $display("P[%0d]=%b\t%b\t",i,P[i], M, cout);
      end

      else begin
        P[i] = A;
        $display("P[%0d]=%b\t%b\t",i,P[i], M, cout);
      end
    end
  end

  // Add 
  wire [7:0] D;
  wire cout;
  
  adder9b ADDER1(.clk(clk),.cin(cin), .A(P[0][7:1]), .B(P[1]), .S(D), .cout(cout));
  
  initial begin
    #2 $display("%b",D);
  end

endmodule

module adder9b(
  input clk,
  input cin,
  input [6:0] A,
  input [7:0] B,
  output [7:0] S,
  output cout
);
  reg [8:0] sum;
  
  initial begin 
    @(posedge clk)
    sum = A + B + cin;
    $display(A,B,cin,sum);
  end

  assign S = sum[7:0];
  assign cout = sum[8];
endmodule

module dvsd_8216m5_test();
  reg [7:0] A;
  reg [7:0] B;
  reg clk;
  wire [15:0] M;
  
  integer i;
  reg [7:0][0:7] P;

  always begin
    #1 clk = ~clk;
  end

  initial begin
    clk = 0;
    A = 0;
    B = 0;
  end

  initial begin
    // for (i=0; i<8; i=i+1) begin
      // #2;
      A = {$random};
      B = {$random};
      // P[i] = i;
      // $display("%b\t%b\tP[%0d]=%b",A,B,i,M);
      @(posedge clk)
      $display("A%b\tB%b\tM=%b",A,B,i,M);
    // end
    #40 $finish;
  end

  dvsd_8216m5 M5(
    .clk(clk),
    .A(A),
    .B(B),
    .M(M)
  );

  // adder9b ADDER1(.cin(cin), .A(P[0][7:1]), .B(P[1]), .S(M[7:0]), .cout(cout));

endmodule