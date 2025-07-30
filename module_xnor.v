module xnorgate(
  input wire [3:0] a,input wire[3:0] b,
  output wire [3:0] c);
  
  assign c = ~(a ^ b);
endmodule
