`include "../rtl/mul2b.v"
`include "../rtl/mul4b.v"
`include "../rtl/cmos_and.v"
`include "../rtl/cmos_halfadder.v"
`include "../rtl/cmos_inverter.v"
`include "../rtl/cmos_xor_xnor.v"
`include "../rtl/compressor3to2.v"
`include "../rtl/cmos_mux.v"


module mul4b_tb();
  reg a0;
  reg a1;
  reg a2;
  reg a3;
  reg b0;
  reg b1;
  reg b2;
  reg b3;
  wire m0;
  wire m1;
  wire m2;
  wire m3;
  wire m4;
  wire m5;
  wire m6;
  wire m7;

  integer i;

  initial begin 
    $dumpfile("mul4b_tb.vcd");
    $dumpvars(0, mul4b_tb);

    a0 = 0;
    a1 = 0;
    a2 = 0;
    a3 = 0;
    b0 = 0;
    b1 = 0;
    b2 = 0;
    b3 = 0;

    for(i=0; i<16; i=i+1)
      #5 {a3,a2,a1,a0,b3,b2,b1,b0} = {$random}%256;
  end
  
  initial begin
    $display("Time\ta\tb\tm");
    $monitor("%0t",$time,"\t",a3,a2,a1,a0,"\t",b3,b2,b1,b0,"\t",m7,m6,m5,m4,m3,m2,m1,m0);
    #80 $finish;
  end

  mul4b MUL(
    .a0(a0),
    .a1(a1),
    .a2(a2),
    .a3(a3),
    .b0(b0),
    .b1(b1),
    .b2(b2),
    .b3(b3),
    .m0(m0),
    .m1(m1),
    .m2(m2),
    .m3(m3),
    .m4(m4),
    .m5(m5),
    .m6(m6),
    .m7(m7)
  );
endmodule