// Code your testbench here
// or browse Examples
module alu_test;
  
  parameter WIDTH = 8;
  
  reg [WIDTH-1 : 0] in_a, in_b;
  reg [$clog2(WIDTH) - 1 : 0] opcode;
  wire [WIDTH -1 : 0] alu_out;
  wire a_is_zero;
  
  alu #(.WIDTH(WIDTH))test(.in_a(in_a), .in_b(in_b), .opcode(opcode), .alu_out(alu_out), .a_is_zero(a_is_zero));
  
  task check;
    
    input [WIDTH-1:0] exp_out;
    input exp_a;
    static integer counter = 0;
    begin
      counter = counter+1;
      if(exp_out == alu_out && exp_a == a_is_zero)
        $display("test passed for iteration %d for opcode %b", counter,opcode);
      else begin
        $display("test failed for iteration %d for opcode %b", counter, opcode);
        $display("expected out is %b and actual out is %b", exp_out, alu_out );
        $display("expected a is %b and actual a is %b", exp_a, a_is_zero );
      end
      
    end
  endtask
    
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,alu_test);
    
    in_a = 8'b0; in_b = 8'b0; opcode = 3'b0;
  
    #5 opcode=3'b000; in_a=8'b01000010; in_b=8'b10000110; #1 check(in_a, 1'b0);
    
    #5 opcode=3'b001; in_a=8'b01000010; in_b=8'b10000110; #1 check(in_a, 1'b0);
    
    #5 opcode=3'b010; in_a=8'b01000010; in_b=8'b10000110; #1 check(8'b11001000, 1'b0);
    
    #5 opcode=3'b011; in_a=8'b01000010; in_b=8'b10000110; #1 check(8'b00000010, 1'b0);
    
    #5 opcode=3'b100; in_a=8'b01000010; in_b=8'b10000110; #1 check(8'b11000100, 1'b0);
    
    #5 opcode=3'b101; in_a=8'b01000010; in_b=8'b10000110; #1 check(8'b10000110, 1'b0);
    
    #5 opcode=3'b110; in_a=8'b01000010; in_b=8'b10000110; #1 check(8'b01000010, 1'b0);
    
    #5 opcode=3'b111; in_a=8'b01000010; in_b=8'b10000110; #1 check(8'b01000010, 1'b0);
    
    #5 opcode=3'b111; in_a=8'b00000000; in_b=8'b10000110; #1 check(in_a, 1'b1);
    
    #5 $finish;
  end
  
endmodule
