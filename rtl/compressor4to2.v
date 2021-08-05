// 4:2 Compressor

// `include "cmos_inverter.v"
// `include "cmos_xor_xnor.v"
// `include "cmos_mux.v"

module compressor4to2(
	input a0,
	input a1,
	input a2,
	input a3,
	input cin,
	output sout1,
	output sout2,
	output sout3
);
	supply0 GND;
	supply1 PWR;

	wire xo1, xo2, xn1, xn2;
	//SUM Logic
	cmos_xor_xnor XOR_XNOR1(a0,a1,xo1,xn1);
	cmos_xor_xnor XOR_XNOR2(a2,a3,xo2,xn2);

	cmos_mux MUX1(a0,a2,xo1,m1);
	cmos_mux MUX2(xo1,xn1,xo2,m2);

	cmos_mux MUX3(m2,m2,cin,m3);
	cmos_mux MUX4(cin,a3,m2,m4);

	// Outputs
	assign sout1 = m3;
	assign sout2 = m1;
	assign sout3 = m4;
endmodule
