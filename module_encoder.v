// Code your design here
module encoder #(parameter N = 8)(
  input [N-1:0] A,
  output reg valid,
  output reg [$clog2(N)-1:0] O);
  
  integer count;
  reg [$clog2(N)-1:0] temp;
  
  always @(*)begin
    integer i;
    count = 0;
    valid = 0;
    temp = 0;
    for(i=N-1; i>=0; i--)begin
      if(A[i] == 1'b1)begin
        temp = i;
        count++;
      end
    end
    
    if (count >1 || count==0)
      valid = 0;
    else if (count ==1)
      valid = 1;
    if (valid)
      O = temp;
    else
      O = 0;
      
      
  end
endmodule
  
        
  
