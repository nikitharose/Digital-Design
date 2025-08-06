// Code your design here
module driver #(parameter WIDTH = 8) (
  input [WIDTH-1 : 0] data_in,
  input data_en,
  output reg [WIDTH-1 : 0] data_out);
  
  always @ (*) begin
  if (data_en == 1'b1)
    data_out = data_in;
  else
    data_out = {WIDTH{1'bz}};
  end
endmodule
