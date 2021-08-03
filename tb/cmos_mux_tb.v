`include "../rtl/cmos_mux.v"

module cmos_mux_tb();
  reg i0;
  reg i1;
  reg s;
  wire y;

  integer i;

  initial begin 
    $dumpfile("cmos_mux_tb.vcd");
    $dumpvars(0, cmos_mux_tb);

    i0 = 0;
    i1 = 0;
    s  = 0;
    for(i=0; i<8; i=i+1) begin
      #5;
      {s,i1,i0} = i;
    end
  end
  
  initial begin
    $display("s\t|i1\t|i0\t|y");
    $display("--------|-------|-------|-------");
    $monitor(s,"\t|",i1,"\t|",i0,"\t|",y);
    #40 $finish;
  end

  cmos_mux MUX(
    .i0(i0),
    .i1(i1),
    .s(s),
    .y(y)
  );
endmodule