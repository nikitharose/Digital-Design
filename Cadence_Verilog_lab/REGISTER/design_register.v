// Code your design here
module register #(parameter N = 8)(
  input [N-1 : 0] data_in,
  input clk, rst,load,
  output reg [N-1 : 0]data_out);
  
  always @ (posedge clk) begin
    if (rst)
      data_out <= 0;
    else if (load)
        data_out <= data_in;
       
   
  end
endmodule
