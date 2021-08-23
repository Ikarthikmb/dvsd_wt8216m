// ==============================================================
// 
// Testbench for dvsd_8216m3
// 
// ==============================================================

`timescale 1ns/1ps
`include "../rtl/dvsd_8216m3.v"

module dvsd_8216m3_tb();

	reg [7:0] a, b;
	reg [15:0] p;
	reg clock;
	wire [15:0] m;
	integer i;
	
	always begin
	  #2 clock = ~clock;
	end

	initial begin
		clock = 1'b0;
		a = 8'b0;
		b = 8'b0;
		p = a * b;

		for(i=0; i<4; i=i+1) begin
			@(posedge clock)
			{b,a} = {$random} % (2**16);
			p = a * b;
		end
		
		@(posedge clock)
		{a,b} = 16'b1111_1111_1111_1111;
		p = a * b;
	end

	initial begin
		$timeformat(-9,3," ns",9);
		$dumpfile("dvsd_8216m3_tb.vcd");
		$dumpvars(0, dvsd_8216m3_tb);

		$display("Time\t\tA\t\tB\t\tM(Obtained)\t\tP(Required)");
		$monitor(
			"%0t\t%b %b",$time,a[7:4],a[3:0],"\t","%b %b",b[7:4],b[3:0],
			"\t","%b %b %b %b\t",m[15:12],m[11:8],m[7:4],m[3:0],
			"%b %b %b %b",p[15:12],p[11:8],p[7:4],p[3:0]
		);
		#25 $finish;
	end

	dvsd_8216m3 DUT(
		.a(a),
		.b(b),
		.m(m)
	);
endmodule