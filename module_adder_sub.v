# implementation of adder and subtractor module for variable number of bits
module addSub #(parameter N = 8)(
  input [N-1:0] A, B,
  input cin, mode,
  output reg [N-1:0] sum,
  output reg cout, borrow);
  
  reg [N-1:0]G,P;
  reg [N:0] carry;
  reg [N-1:0] B_mode;
  
  always @(*)begin
    integer i;
    carry[0] =cin | mode;
    
    if(mode == 1'b1)begin
      B_mode = (B ^ {N{mode}});
  	end
    else begin
      B_mode = B;
    end
    
    for(i=0;i<N;i++)begin
      G[i] = A[i] & B_mode[i];
      P[i] = (A[i] ^ B_mode[i]);
      sum[i] = P[i] ^ carry[i];
      carry[i+1] = G[i] | (P[i] & carry[i]);
    end
    cout = carry[N];
   
    borrow = ~(cout & mode);
  end
  
endmodule
