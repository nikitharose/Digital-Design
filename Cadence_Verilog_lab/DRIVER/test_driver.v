// Code your testbench here
// or browse Examples
module driver_test;
  
  parameter WIDTH = 8;
  
  reg [WIDTH-1:0] data_in;
  reg data_en;
  wire [WIDTH-1 : 0] data_out;
  
  driver #(.WIDTH(WIDTH)) dtest(.data_in(data_in),.data_en(data_en), .data_out(data_out));
                        
  task check;
    input [WIDTH-1 : 0] exp_out;
      begin
        if (data_out === exp_out)
          $display("TEST PASSED for data_in %b",data_in);
        else
          $display("TEST FAILED for data_in %b",data_in);
       end
  endtask
  
  //reg [WIDTH-1:0] z_val;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,driver_test);
    data_in =0; data_en= 0;
    //z_val = {8{1'bz}};
    
    #5 data_en = 1; data_in = 8'b10101010; #1 check(8'b10101010);
    #5 data_en = 0; data_in = 8'b10101010; #1 check({8{1'bz}});
    $finish;
  end
endmodule
                         
                        
                        
                        
                        
  
  
                 
                 
