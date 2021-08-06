/* 
 *               MSB      LSB
 * Input K  :    k3 k2 k1 k0
 * Input T  :    t3 t2 t1 t0
 * -------------------------
 * Output S : s4 s3 s2 s1 s0
 * -------------------------
 * cin      : carry in
 */

`include "cmos_and.v"
`include "cmos_xor.v"
`include "cmos_inverter.v"

module adderc4b(
	input k0, k1, k2, k3,
	input t0, t1, t2, t3,
	output s0, s1, s2, s3, s4,
  input cin
	);

  wire ls0, ls1, ls2, ls3;
  wire lc0, lc1, lc2, lc3;

	integer i;
  
  // Stage 1

  cmos_xor XOR1(k0, t0, ls0);
  cmos_xor XOR2(k1, t1, ls1);
  cmos_xor XOR3(k2, t2, ls2);
  cmos_xor XOR4(k3, t3, ls3);

  cmos_and AND1(k0, t0, lc0);
  cmos_and AND2(k1, t1, lc1);
  cmos_and AND3(k2, t2, lc2);
  cmos_and AND4(k3, t3, lc3);

  // Stage 2

  wire ms1, ms2, ms3;
  wire mc1, mc2, mc3;

  cmos_xor XOR5(ls1, lc0, ms1);
  cmos_xor XOR6(ls2, lc1, ms2);
  cmos_xor XOR7(ls3, lc2, ms3);

  cmos_and AND5(ls1, lc0, mc1);
  cmos_and AND6(ls2, lc1, mc2);
  cmos_and AND7(ls3, lc2, mc3);

  // Stage 3

  wire ns2, ns3;
  wire nc2, nc3;

  cmos_xor XOR9(ms2, mc1, ns2);
  cmos_xor XOR10(ms3, mc2, ns3);

  cmos_and AND9(ms2, mc1, nc2);
  cmos_and AND10(ms3, mc2, nc3);

  // Stage 4

  wire ps3;
  wire pc3;

  cmos_xor XOR11(ns3, nc2, ps3);

  cmos_and AND11(ns3, nc2, pc3);
endmodule