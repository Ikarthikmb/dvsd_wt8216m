module cmos_or_nor(
	input a,
	input b,
	output yor,
	output ynor
);
	supply0 GND;
	supply1 PWR;

	pmos(w1,PWR,a);
	pmos(h,w1,b);
	nmos(h,GND,a);
	nmos(h,GND,b);

	assign ynor = h;
	cmos_inverter INV0(h,yor);
endmodule
