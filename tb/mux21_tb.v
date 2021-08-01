`include "../rtl/mux21.v"

module mux21_tb();
  reg a0;
  reg a1;
  reg s;
  wire m;

  integer i;

  initial begin
    s = 0;
    a0 = 0;
    a1 = 0;
  end

  initial begin
    for(i=0; i<8; i=i+1) begin
      #10 {s, a1, a0} = i;
    end
  end
  
  initial begin
    $display("s\ta1\ta0\tm");
    $display("---------------------------");
    $monitor(s,"\t", a1,"\t", a0,"\t", m);
    #100 $finish;
  end

  mux21 MUX(
    .a(a0),
    .b(a1),
    .s(s),
    .m(m)
  );
endmodule