`include "../rtl/ksadd4b.v"
`include "../rtl/cmos_and.v"
`include "../rtl/cmos_xor.v"
`include "../rtl/cmos_inverter.v"

module ksadd4b_tb();

  reg   k0, k1, k2, k3;
	reg   t0, t1, t2, t3;
  reg cin;
	wire  s0, s1, s2, s3, s4;
	// wire  c0, c1, c2, c3;

  integer i;

  initial begin 
    $dumpfile("ksadd4b_tb.vcd");
    $dumpvars(0, ksadd4b_tb);

    cin = 0;
    k0 = 0;
    k1 = 0;
    k2 = 0;
    k3 = 0;
    t0 = 0;
    t1 = 0;
    t2 = 0;
    t3 = 0;

    for(i=0; i<10; i=i+1)
    #5 {k3,k2,k1,k0,t3,t2,t1,t0} = {$random}%256;
  end
  
  initial begin
    $display("Time\ta\tb\ts");
    $monitor("%0t",$time,"\t",k3, k2, k1, k0,"\t",t3, t2, t1, t0,"\t",s4,s3,s2,s1,s0);
    #80 $finish;
  end

  ksadd4b KS1(
    .k0(k0), .k1(k1), .k2(k2), .k3(k3),
    .t0(t0), .t1(t1), .t2(t2), .t3(t3),
    .s0(s0), .s1(s1), .s2(s2), .s3(s3), .s4(s4), 
    .cin(cin)
    // .c0(c0), .c1(c1), .c2(c2), .c3(c3)
  );
endmodule