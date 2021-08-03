`include "../rtl/mul2b.v"
`include "../rtl/cmos_and.v"
`include "../rtl/cmos_halfadder.v"
`include "../rtl/cmos_inverter.v"
`include "../rtl/cmos_xor_xnor.v"

module mul2b_tb();
  reg a0;
  reg a1;
  reg b0;
  reg b1;
  wire m0;
  wire m1;
  wire m2;
  wire m3;

  integer i;

  initial begin 
    $dumpfile("mul2b_tb.vcd");
    $dumpvars(0, mul2b_tb);

    a0 = 0;
    a1 = 0;
    b0 = 0;
    b1 = 0;
    for(i=0; i<16; i=i+1)
      #5 {a1,a0,b1,b0} = i;
  end
  
  initial begin
    $display("a1\ta0\tb1\tb0\tm3\tm2\tm1\tm0");
    $monitor(a1,"\t",a0,"\t",b1,"\t",b0,"\t",m3,"\t",m2,"\t",m1,"\t",m0);
    #80 $finish;
  end

  mul2b MUL(
    .a0(a0),
    .a1(a1),
    .b0(b0),
    .b1(b1),
    .m0(m0),
    .m1(m1),
    .m2(m2),
    .m3(m3)
  );
endmodule