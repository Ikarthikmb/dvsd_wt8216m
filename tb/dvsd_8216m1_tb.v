`timescale 1ns/1ps

`include "../rtl/dvsd_8216m1.v"

module dvsd_8216m1_tb();
  reg a0, a1, a2, a3, a4, a5, a6, a7;
  reg b0, b1, b2, b3, b4, b5, b6, b7;
  wire m0, m1, m2, m3, m4, m5, m6, m7;
  wire m8, m9, m10, m11, m12, m13, m14, m15;

  integer i;

  initial begin
    a0 = 0; 
    a1 = 0; 
    a2 = 0; 
    a3 = 0;
    a4 = 0;
    a5 = 0;
    a6 = 0;
    a7 = 0;
    b0 = 0; 
    b1 = 0; 
    b2 = 0; 
    b3 = 0;
    b4 = 0;
    b5 = 0;
    b6 = 0;
    b7 = 0;
  end

  integer ran1, ran2;

  initial begin
    $dumpfile("dvsd_8216m1_tb.vcd");
    $dumpvars(0, dvsd_8216m1_tb);
    for(i=0; i<10; i=i+1) begin
      #5;
      ran1 = {$random} % 256;
      {a0, a1, a2, a3, a4, a5, a6, a7} = ran1;
      ran2 = {$random} % 256;
      {b0, b1, b2, b3, b4, b5, b6, b7} = ran2;
    end
  end

  initial begin
    $timeformat(-9,4," ns",9);
    $display("time\t\ta\t\tb\t\tm");
    $monitor(
      "%0t",$realtime,"\t",a7,a6,a5,a4," ",a3,a2,a1,a0,"\t",
      b7,b6,b5,b4," ",b3,b2,b1,b0,
      "\t",m15,m14,m13,m12," ",m11,m10,m9,m8," ",m7,m6,m5,m4," ",m3,m2,m1,m0
    );
    #50 $finish;
  end

  dvsd_8216m1 MULTIPLIER(
  .a0(a0),
  .a1(a1),
  .a2(a2),
  .a3(a3),
  .a4(a4),
  .a5(a5),
  .a6(a6),
  .a7(a7),
  .b0(b0),
  .b1(b1),
  .b2(b2),
  .b3(b3),
  .b4(b4),
  .b5(b5),
  .b6(b6),
  .b7(b7),
  .m0(m0),
  .m1(m1),
  .m2(m2),
  .m3(m3),
  .m4(m4),
  .m5(m5),
  .m6(m6),
  .m7(m7),
  .m8(m8),
  .m9(m9),
  .m10(m10),
  .m11(m11),
  .m12(m12),
  .m13(m13),
  .m14(m14),
  .m15(m15)
 );
endmodule