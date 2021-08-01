`include "../rtl/cmos_and.v"

module cmos_and_tb();
  reg a1;
  reg a2;
  wire y;

  integer i;

  initial begin 
    $dumpfile("cmos_and_tb.vcd");
    $dumpvars(0, cmos_and_tb);

    a1 = 0;
    a2 = 0;
    for(i=0; i<4; i=i+1)
      #5 {a2,a1} = i;
  end
  
  initial begin
    $display("a2\ta1\ty");
    $monitor(a2,"\t",a1,"\t",y);
    #20 $finish;
  end

  cmos_and AND(
    .a1(a1),
    .a2(a2),
    .y(y)
  );
endmodule