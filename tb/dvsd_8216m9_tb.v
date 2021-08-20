// 8 bit Multiplier
// 
// A           0000 0000
// B           0000 0000
// -----------------------
//             0000 0000
//           0 0000 000
//          00 0000 00
//         000 0000 0
//        0000 0000
//      0 0000 000
//     00 0000 00
//    000 0000 0
// -----------------------
// M 0000 0000 0000 0000
// -----------------------

`include "../rtl/dvsd_8216m9.v"

module dvsd_8216m9_tb();

	reg [7:0] a, b;
	reg [15:0] p;
	wire [15:0] m;
	integer i;

	initial begin
		a = 8'b0;
		b = 8'b0;
		for(i=0; i<3; i=i+1) begin
			{b,a} = {$random} % (2**16);
			p = a * b;
			#5;
		end
		#5 {a,b} = 16'b1111_1111_1111_1111;
		p = a * b;
	end
	initial begin
		$display("time\tA\t\tB\t\tM\t\t\tP");
		$monitor("%0t\t%b %b",$time,a[7:4],a[3:0],"\t","%b %b",b[7:4],b[3:0],"\t","%b %b %b %b\t",m[15:12],m[11:8],m[7:4],m[3:0],"%b %b %b %b",p[15:12],p[11:8],p[7:4],p[3:0]);
		#25 $finish;
	end

	dvsd_8216m9 DUT(
		.A(a),
		.B(b),
		.M(m)
	);
endmodule

