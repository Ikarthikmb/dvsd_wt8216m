`include "../rtl/compressor4to2.v"
`include "../rtl/cmos_xor_xnor.v"
`include "../rtl/cmos_mux.v"
`include "../rtl/cmos_or_nor.v"
`include "../rtl/cmos_inverter.v"

module compressor4to2_tb();
	reg a0;
  reg a1;
  reg a2;
  reg a3;
  reg cin;
  wire sout;
  wire cout;

	integer i;

  initial begin 
    $dumpfile("compressor4to2_tb.vcd");
    $dumpvars(0, compressor4to2_tb);
    cin = 0;
    a0 = 0;
    a1 = 0;
    a2 = 0;
    a3 = 0;
    for(i=0; i<16; i=i+1)
      #5 {a3,a2,a1,a0} = i;
  end
  
  initial begin
    $display("a3\ta2\ta1\ta0\tsout3\tsout2\tsout1");
    $monitor(a3,"\t",a2,"\t",a1,"\t",a0,"\t",sout3,"\t",sout2,"\t",sout1);
    #80 $finish;
  end

  compressor4to2 CMP4to2(
    .a0(a0),
    .a1(a1),
    .a2(a2),
    .a3(a3),
    .cin(cin),
    .sout1(sout1),
    .sout2(sout2),
    .sout3(sout3)
  );

endmodule
