`include "../rtl/compressor3to2.v"
`include "../rtl/cmos_xor_xnor.v"
`include "../rtl/cmos_mux.v"
// `include "../rtl/cmos_inverter.v"

module compressor3to2_tb();
  reg a0;
  reg a1;
  reg a2;
  wire sout;
  wire cout;

  integer i;

  initial begin 
    $dumpfile("compressor3to2_tb.vcd");
    $dumpvars(0, compressor3to2_tb);

    a0 = 0;
    a1 = 0;
    a2 = 0;
    for(i=0; i<8; i=i+1)
      #5 {a2,a1,a0} = i;
  end
  
  initial begin
    $display("a2\ta1\ta0\tsout\tcout");
    $monitor(a2,"\t",a1,"\t",a0,"\t",sout,"\t",cout);
    #40 $finish;
  end

  compressor3to2 CMP3to2(
    .a0(a0),
    .a1(a1),
    .a2(a2),
    .sout(sout),
    .cout(cout)
  );
endmodule