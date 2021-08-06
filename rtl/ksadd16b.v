// Kogge Stone Adder

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

module ksadd16b(
	input k0, k1, k2, k3, k4, k5, k6, k7,
  input k8, k9, k10, k11, k12, k13, k14, k15,  
	input t0, t1, t2, t3, t4, t5, t6, t7,
  input t8, t9, t10, t11, t12, t13, t14, t15,
	output s0, s1, s2, s3, s4, s5, s6, s7, s8,
	output s9, s10, s11, s12, s13, s14, s15,
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

  cmos_xor XOR8(k4,t4,w4);
  cmos_and AND5(k4,t4,g4);
  carry_gen CG5(w4,g4,g3,c4);
  cmos_xor XOR9(w4,c3,p4);
  assign s4 = p4;

  cmos_xor XOR10(k5,t5,w5);
  cmos_and AND6(k5,t5,g5);
  carry_gen CG6(w5,g5,g4,c5);
  cmos_xor XOR11(w5,c4,p5);
  assign s5 = p5;

  cmos_xor XOR12(k6,t6,w6);
  cmos_and AND7(k6,t6,g6);
  carry_gen CG7(w6,g6,g5,c6);
  cmos_xor XOR13(w6,c5,p6);
  assign s6 = p6;

  cmos_xor XOR14(k7,t7,w7);
  cmos_and AND8(k7,t7,g7);
  carry_gen CG8(w7,g7,g6,c7);
  cmos_xor XOR15(w7,c6,p7);
  assign s7 = p7;

  cmos_xor XOR16(k8,t8,w8);
  cmos_and AND9(k8,t8,g8);
  carry_gen CG9(w8,g8,g7,c8);
  cmos_xor XOR17(w8,c7,p8);
  assign s8 = p8;

  cmos_xor XOR18(k9,t9,w9);
  cmos_and AND10(k9,t9,g9);
  carry_gen CG10(w9,g9,g8,c9);
  cmos_xor XOR19(w9,c8,p9);
  assign s9 = p9;

  cmos_xor XOR20(k10,t10,w10);
  cmos_and AND11(k10,t10,g10);
  carry_gen CG11(w10,g10,g9,c10);
  cmos_xor XOR21(w10,c9,p10);
  assign s10 = p10;

  cmos_xor XOR22(k11,t11,w11);
  cmos_and AND12(k11,t11,g11);
  carry_gen CG12(w11,g11,g10,c11);
  cmos_xor XOR23(w11,c10,p11);
  assign s11 = p11;
  
  cmos_xor XOR24(k12,t12,w12);
  cmos_and AND13(k12,t12,g12);
  carry_gen CG13(w12,g12,g11,c12);
  cmos_xor XOR25(w12,c11,p12);
  assign s12 = p12;

  cmos_xor XOR26(k13,t13,w13);
  cmos_and AND14(k13,t13,g13);
  carry_gen CG14(w13,g13,g12,c13);
  cmos_xor XOR27(w13,c12,p13);
  assign s13 = p13;

  cmos_xor XOR28(k14,t14,w14);
  cmos_and AND15(k14,t14,g14);
  carry_gen CG15(w14,g14,g13,c14);
  cmos_xor XOR29(w14,c13,p14);
  assign s14 = p14;
  assign s15 = c14;

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