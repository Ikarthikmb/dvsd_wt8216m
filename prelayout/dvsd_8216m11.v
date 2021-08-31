module dvsd_8216m11(
  input [7:0] a,
  input [7:0] b,
  input clock,
  output reg [15:0] m
);

  reg [2:0] i;
  reg [15:0] dock=0;
  reg [15:0] ship=0;

  always @(a,b) begin
    for (i=0; i<8; i=i+1)
    begin
      if(b[i] == 1'b0)
        m = m + 8'b0;
      else begin
        ship = a;
        m = m + (ship << i);
      end
    end
  end

  // assign m = dock;
endmodule

