// Kogge Stone Adder

`include "cmos_and.v"

module ksadd8b(
	input k0, k1, k2, k3,
	input t0, t1, t2, t3,
	output s0, s1, s2, s3,
	output c0, c1, c2, c3
	);
		reg p0, p1, p2, p3;
		reg g0, g1, g2, g3;

		integer i;
		wire d, d0, d1, d2, d3, d4;

		initial begin
			// Pre - processing
			cmos_and AND1(k0, t0, p0, d);
			cmos_and AND2(k1, t1, p1, d);
			cmos_and AND3(k2, t2, p2, d);
			cmos_and AND4(k3, t3, p3, d);

			cmos_xor_xnor XOR_XNOR1(k0, t0, g0, d);
			cmos_xor_xnor XOR_XNOR2(k1, t1, g1, d);
			cmos_xor_xnor XOR_XNOR3(k2, t2, g2, d);
			cmos_xor_xnor XOR_XNOR4(k3, t3, g3, d);

			// Stage 1
			cmos_and AND5(p1, g0, w1, d);
			cmos_and AND6(p2, g1, w2, d);
			cmos_and AND7(p3, g2, w3, d);

			cmos_xor_xnor XOR_XNOR5(p1,p0,w4,d);
			cmos_xor_xnor XOR_XNOR6(p2,p1,w5,d);
			cmos_xor_xnor XOR_XNOR7(p3,p2,w6,d);

			// Stage 2
			cmos_xor_xnor XOR_XNOR4(s[2],s[1],s[2],d3);
			cmos_xor_xnor XOR_XNOR5(s[3],s[2],s[3],d4);
		end
	endmodule
