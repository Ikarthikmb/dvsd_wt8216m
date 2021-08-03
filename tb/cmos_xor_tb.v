`include "../rtl/cmos_xor_xnor.v"
// `include "../rtl/cmos_inverter.v"

module cmos_xor_tb();
  reg a;
  reg b;
  wire xor_o;
  wire xnor_o;

  integer i;

  initial begin 
    $dumpfile("cmos_xor_tb.vcd");
    $dumpvars(0, cmos_xor_tb);

    a = 0;
    b = 0;
    for(i=0; i<4; i=i+1)
      #5 {b,a} = i;
  end
  
  initial begin
    $display("b\t|a\t|xor_o\t|xnor_o");
    $display("--------|-------|-------|-------");
    $monitor(b,"\t|",a,"\t|",xor_o, "\t|", xnor_o);
    #20 $finish;
  end

  cmos_xor_xnor XOR(
    .a(a),
    .b(b),
    .xor_o(xor_o),
    .xnor_o(xnor_o)
  );
endmodule