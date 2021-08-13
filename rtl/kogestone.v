`timescale 1ns/1ps

module adder16b1(
	input [15:0] A,
	input [15:0] B,
	input cin,
	output [16:0] S
);
	assign S = A + B;
endmodule

module adder16b1_tb();
	reg [15:0] A;
	reg [15:0] B;
	reg cin;
	wire [16:0] S;

	integer i;

	initial begin
		cin = 0;
		A = 0;
		B = 0;
		for(i=0; i<10; i=i+1)
		begin
			#0.1;
			A = {$random} % (2**16);
			B = {$random} % (2**16);
		end
	end

	initial begin
		$timeformat(-9,2,"ns",9);
		$display("Time\tcin\tA\t\t\tB\t\t\tS");
		$display("---------------------------------------------------------------------------------------");
		$monitor("%0t\t%b",$time, cin,
			"\t%b %b %b %b",A[15:12],A[11:8],A[7:4],A[3:0],
			"\t%b %b %b %b",B[15:12],B[11:8],B[7:4],B[3:0],
			"\t%b %b %b %b %b",S[16],S[15:12],S[11:8],S[7:4],S[3:0]
		);
		#40 $finish;
	end

	adder16b1 ADDER(
		.A(A),
		.B(B),
		.cin(cin),
		.S(S)
	);
endmodule