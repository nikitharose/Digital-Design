// Code your design here
module controller(
  input [2:0] phase, opcode,
  input zero,
  output reg sel, rd, ld_ir, halt, inc_pc, ld_ac, wr, ld_pc, data_e);
  
  integer HLT=0, SKZ=1, ADD=2, AND=3, XOR=4, LDA=5, STO=6, JMP=7;
 
  always @ (*) begin
  sel=0; rd=0; ld_ir=0;halt=0;inc_pc=0;ld_ac=0;wr=0;ld_pc=0;data_e=0;
    case (opcode)
      HLT : begin
        
        case (phase)
          3'b000 : sel = 1'b1;
          3'b001 : begin
            sel = 1'b1; 
            rd = 1'b1;
          end
          
          3'b010, 3'b011 : begin
            sel = 1'b1;
            rd = 1'b1;
            ld_ir = 1'b1;
          end
          
          3'b100 :begin 
            halt = 1'b1;
            sel = 0;
            rd = 0;
            ld_ir = 0;
            inc_pc = 1;
          end
          
          3'b101, 3'b110, 3'b111 : begin
            sel = 0; 
            rd = 0; 
            ld_ir = 0; 
            halt = 0; 
            inc_pc = 0; 
            ld_ac = 0; 
            wr = 0; 
            ld_pc = 0; 
            data_e = 0;
          end
        endcase
      end
       SKZ : begin
        
        case (phase)
          3'b000 : sel = 1'b1;
          3'b001 : begin
            sel = 1'b1;
            rd = 1'b1;
          end
          
          3'b010, 3'b011 : begin
            sel = 1'b1;
            rd = 1'b1;
            ld_ir = 1'b1;
          end
          
          3'b100 :begin 
            inc_pc = 1'b1;
            sel = 0;
            rd = 0;
            ld_ir = 0;
          end
          
          
          3'b101, 3'b111 : begin
            sel = 0; 
            rd = 0; 
            ld_ir = 0; 
            halt = 0; 
            inc_pc = 0; 
            ld_ac = 0; 
            wr = 0; 
            ld_pc = 0; 
            data_e = 0;
          end
          3'b110:
            //z = zero;
            inc_pc = zero?1:0;
        endcase
       end
        
      
        ADD, AND, XOR, LDA : begin
          case(phase)
            3'b000 : sel =1'b1;
            3'b001 : begin
              sel = 1'b1;
              rd = 1'b1;
            end
            3'b010,3'b011 : begin
              sel = 1'b1;
              rd = 1'b1;
              ld_ir = 1'b1;
            end
            3'b100: inc_pc = 1'b1;
            3'b101 : begin
              rd = 1'b1;
            end
            3'b110 : begin
              rd = 1'b1;
            end
            3'b111 : begin
              rd = 1'b1;
              ld_ac = 1'b1;
            end
          endcase
        end
        STO : begin
          case(phase)
            3'b000 : sel =1'b1;
            3'b001 : begin
              sel = 1'b1;
              rd = 1'b1;
            end
            3'b010, 3'b011 : begin
              sel = 1'b1;
              rd = 1'b1;
              ld_ir = 1'b1;
            end
            3'b100 : inc_pc =1;
            3'b110 : data_e =1;
            3'b111 : begin
              data_e = 1;
              wr = 1;
            end
          endcase
        end
        JMP : begin
          case(phase)
            3'b000 : sel =1'b1;
            3'b001 : begin
              sel = 1'b1;
              rd = 1'b1;
            end
            3'b010, 3'b011 : begin
              sel = 1'b1;
              rd = 1'b1;
              ld_ir = 1'b1;
            end
            3'b100 : inc_pc =1;
            3'b110, 3'b111 : ld_pc =1;
          endcase
        end
      
              
    endcase
end
endmodule


