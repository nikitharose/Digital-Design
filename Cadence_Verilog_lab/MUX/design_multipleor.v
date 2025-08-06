// Code your design here
module multiplexor #(parameter N = 5)(
  input [N-1:0] in0, in1,
  input sel,
  output reg [N-1:0] mux_out);
  
  always @(*) begin
    if (sel == 1'b0)
      mux_out = in0;
    else
      mux_out = in1;
  end
  
endmodule
      
   
      
