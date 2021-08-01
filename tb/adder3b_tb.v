`include "../rtl/adder3b.v"

module adder3b_tb();
  reg a;
  reg b;
  reg c;
  wire sum;
  wire carry;

  integer i;

  initial begin
    a = 0;
    b = 0;
    c = 0;
  end

  initial begin
    for(i=0; i<8; i=i+1)
      #5 {a,b,c} = i;
  end

  initial begin
    $display("a\tb\t\c\tsum\tcarry");
    $monitor(a,"\t",b,"\t",c,"\t",sum,"\t",carry);
    #100 $finish;
  end

  adder3b DUT(
    .a(a),
    .b(b),
    .c(c),
    .sum(sum),
    .carry(carry)
  );
endmodule 