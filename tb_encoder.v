// Code your testbench here
// or browse Examples
module tb;
  parameter N = 8;
  
  reg [N-1:0] Atb;
  wire [$clog2(N)-1:0] Otb;
  wire validtb;
  
  encoder test(.A(Atb), .O(Otb), .valid(validtb));
  
  initial begin
    $dumpfile("dump_file.vcd");
    $dumpvars(0, tb);
  
    Atb = 0;
    
   // #5 Atb = 
    #5 Atb = 8'b00001000;
    #5 Atb = 8'b0010;
    #5 Atb = 8'b0110;
  	#5 Atb = 0;
    #5 Atb = 8'b10000000;
    #5 Atb = 8'b1;
    #5 $finish;
  end
endmodule
    
    
    
