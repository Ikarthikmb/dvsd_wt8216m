// // Kogge Stone Adder

// `include "cmos_and.v"
// `include "cmos_xor.v"
// `include "cmos_inverter.v"

/*******************************************************
 *  Configuration
 *  
 *                MSB      LSB
 *  Input K  :    k3 k2 k1 k0
 *  Input T  :    t3 t2 t1 t0
 *  -------------------------
 *  Output S : s4 s3 s2 s1 s0
 *  -------------------------
 *  cin      : carry in
 * 
 *******************************************************/

module ksadd4b(
	input k0, k1, k2, k3,
	input t0, t1, t2, t3,
	output s0, s1, s2, s3, s4,
  input cin
	);

  wire ls0, ls1, ls2, ls3;
  wire lc0, lc1, lc2, lc3;

	integer i;
  
  cmos_xor XOR1(k0,t0,p0);
  cmos_and AND1(k0,t0,g0);
  carry_gen CG1(p0,g0,cin,c0);
  assign s0 = p0;

  cmos_xor XOR2(k1,t1,w1);
  cmos_and AND2(k1,t1,g1);
  carry_gen CG2(w1,g1,g0,c1);
  cmos_xor XOR3(w1,c0,p1);
  assign s1 = p1;

  cmos_xor XOR4(k2,t2,w2);
  cmos_and AND3(k2,t2,g2);
  carry_gen CG3(w2,g2,g1,c2);
  cmos_xor XOR5(w2,c1,p2);
  assign s2 = p2;

  cmos_xor XOR6(k3,t3,w3);
  cmos_and AND4(k3,t3,g3);
  carry_gen CG4(w3,g3,g2,c3);
  cmos_xor XOR7(w3,c2,p3);
  assign s3 = p3;
  assign s4 = c3;

  // test cases
  // assign s0 = k1;
  // assign s1 = w1;
  // assign s2 = w1;
  // assign s3 = g1;
  // assign s4 = c1;
endmodule


// Carrry Generation CMOS Circuit

module carry_gen(
  input p1,
  input g1,
  input g0,
  output gout
  );
  supply0 GND;
  supply1 PWR;
  wire h, w1, w2;

  pmos(w1, PWR, p1);
  pmos(w1, PWR, g0);
  pmos(h, w1, g1);
  nmos(h, w2, p1);
  nmos(w2, GND, g0);
  nmos(h, GND, g1);

  cmos_inverter INV1(h,gout);
endmodule