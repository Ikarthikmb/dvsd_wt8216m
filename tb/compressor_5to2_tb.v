`include "../rtl/compressor_5to2.v"

module compressor_5to2_tb();
  reg a0;
  reg a1;
  reg a2;
  reg a3;
  reg a4;
  reg ci1;
  reg ci2;
  wire sum;
  wire carry;
  wire co1;
  wire co2;

  integer i;

  initial begin 
    for(i=0; i<128; i=i+1)
      #5 {ci1,ci2,a4,a3,a2,a1,a0} = i;
  end
  
  initial begin
    $display("ci1\tci2\ta4\ta3\ta2\ta1\ta0\tsum\tcarry\tco1\tco2");
    $monitor(ci1,"\t",ci2,"\t",a4,"\t",a3,"\t",a2,"\t",a1,"\t",a0,"\t",sum,"\t",carry,"\t",co1,"\t",co2);
    #250 $finish;
  end
  compressor_5to2 CMP52(
    .a0(a0),
    .a1(a1),
    .a2(a2),
    .a3(a3),
    .a4(a4),
    .ci1(ci1),
    .ci2(ci2),
    .sum(sum),
    .carry(carry),
    .co1(co1),
    .co2(co2)   
  );
endmodule