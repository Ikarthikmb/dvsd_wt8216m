`include "../rtl/ksadd16b.v"
`include "../rtl/cmos_and.v"
`include "../rtl/cmos_xor.v"
`include "../rtl/cmos_inverter.v"

module ksadd16b_tb();

  reg k0, k1, k2, k3, k4, k5, k6, k7;
  reg k8, k9, k10, k11, k12, k13, k14, k15;  
	reg t0, t1, t2, t3, t4, t5, t6, t7;
  reg t8, t9, t10, t11, t12, t13, t14, t15;
  reg cin;
	wire s0, s1, s2, s3, s4, s5, s6, s7, s8;
	wire s9, s10, s11, s12, s13, s14, s15;

  integer i;

  initial begin 
    $dumpfile("ksadd16b_tb.vcd");
    $dumpvars(0, ksadd16b_tb);

    cin = 0;
    k0  = 0;
    k1  = 0;
    k2  = 0;
    k3  = 0;
    k4  = 0;
    k5  = 0;
    k6  = 0;
    k7  = 0;
    k8  = 0;
    k9  = 0;
    k10 = 0;
    k11 = 0;
    k12 = 0;
    k13 = 0;
    k14 = 0;
    k15 = 0; 
    t0  = 0;
    t1  = 0;
    t2  = 0;
    t3  = 0;
    t4  = 0;
    t5  = 0;
    t6  = 0;
    t7  = 0;
    t8  = 0;
    t9  = 0;
    t10 = 0;
    t11 = 0;
    t12 = 0;
    t13 = 0;
    t14 = 0;
    t15 = 0;

    for(i=0; i<10; i=i+1) begin
      #5;
      {k15,k14,k13,k12,k11,k10,k9,k8,k7,k6,k5,k4,k3,k2,k1,k0} = {$random}%(2**16);
      {t15,t14,t13,t12,t11,t10,t9,t8,t7,t6,t5,t4,t3,t2,t1,t0} = {$random}%(2**16);
    end
  end
  
  initial begin
    $display("Time\tK\t\t\tT\t\t\tS");
    $monitor("%0t",$time,"\t",k15,k14,k13,k12," ",k11,k10,k9,k8," ",k7,k6,k5,k4," ",k3,k2,k1,k0,"\t",t15,t14,t13,t12," ",t11,t10,t9,t8," ",t7,t6,t5,t4," ",t3,t2,t1,t0,"\t",s15,s14,s13,s12," ",s11,s10,s9,s8," ",s7,s6,s5,s4," ",s3,s2,s1,s0);
    #80 $finish;
  end

  ksadd16b KS1(
  .k0(k0), .k1(k1), .k2(k2), .k3(k3),
  .k4(k4), .k5(k5), .k6(k6), .k7(k7),
  .k8(k8), .k9(k9), .k10(k10), .k11(k11),
  .k12(k12), .k13(k13), .k14(k14), .k15(k15),  
	.t0(t0), .t1(t1), .t2(t2), .t3(t3),
  .t4(t4), .t5(t5), .t6(t6), .t7(t7),
  .t8(t8), .t9(t9), .t10(t10), .t11(t11),
  .t12(t12), .t13(t13), .t14(t14), .t15(t15),
	.s0(s0), .s1(s1), .s2(s2), .s3(s3),
  .s4(s4), .s5(s5), .s6(s6), .s7(s7), .s8(s8),
	.s9(s9), .s10(s10), .s11(s11), .s12(s12),
  .s13(s13), .s14(s14), .s15(s15), .s16(s16),
  .cin(cin)
  );
endmodule