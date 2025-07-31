module tb;
  parameter N = 8;
  reg [N-1:0] Atb, Btb;
  reg cintb, modetb;
  wire [N-1:0] sumtb;
  wire couttb, borrowtb, overflowtb;
  
  addSub #(N) astb(.A(Atb), .B(Btb), .cin(cintb), .mode(modetb), .sum(sumtb), .cout(couttb), .borrow(borrowtb));
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);
    
    Atb = 0; Btb =0; cintb=0; modetb = 0;
    
    #5 Atb = 18; Btb = 20;
    #5 Atb = 200; Btb = 46; modetb = 1;
    #5 Atb = 228; Btb = 50; modetb = 0;
    #5 Atb = 33; Btb = 50; modetb = 1;
    #5 $finish;
    
  end
endmodule
