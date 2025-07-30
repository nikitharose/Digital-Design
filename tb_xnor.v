module tb;
  reg [3:0]a;
  reg [3:0]b;
  wire [3:0] c;
  xnorgate xn(.a(a), .b(b), .c(c));
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
    a = 0;
    b = 0;
    #5 a = 4'b1010;
    #5 b = 4'b0010;
    #5 $finish;
    
    
  end
endmodule
