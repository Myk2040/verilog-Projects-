`timescale 1ns / 1ps

module vending_machine (clk,rst,coin,pr,ch);

                     //Port_direction
                       input clk,rst;
                       input [1:0] coin;
                       output reg pr,ch; 

    //States binary encoding system. we have 5 states 
    parameter  IDLE = 3'b000,
                RS1 = 3'b001,
                RS2 = 3'b010,
            PRODUCT = 3'b011,
             CHANGE = 3'b100;
        
            reg [2:0] pr_state,next_state;

    
    
    //Present_State_logic
  always@(posedge clk) 
    begin
             if (rst == 1) begin
                     pr_state <= IDLE;
                     pr = 0;
                     ch = 0;
                     end
                     
             else
                     pr_state <= next_state;     
     end
      
      
      
      
      
      
    //Next_State_logic  
    always@(pr_state,coin) begin
      
    case(pr_state)
        IDLE :       if (coin == 1)   next_state = RS1; 
                else if (coin == 2)    next_state = RS2; 
                else        next_state = IDLE; 
                        
         RS1 :     if (coin == 1) next_state = RS2;
              else if (coin == 2) next_state = PRODUCT;
               else               next_state = RS1;
                    
         RS2 :      if (coin == 1)  next_state = PRODUCT;
               else if (coin == 2)  next_state = CHANGE;
               else                 next_state = RS2;
                     
    PRODUCT :      next_state = IDLE;
    CHANGE  :      next_state = IDLE; 
                   
    default :      next_state = IDLE; 
    endcase 
                     
         end 
         
         
     /*output logic
      assign pr = (pr_state == PRODUCT) || (pr_state == CHANGE);
      assign ch  = (pr_state == CHANGE);*/
         
    //Output_Logic
    always@(posedge clk) begin
                      if (rst == 1)   // active high
                         begin
                            pr <= 1'b0;
                            ch <= 1'b0;
                          end
                      else if (pr_state == PRODUCT) 
                            pr <= 1'b1;
                      else if (pr_state == CHANGE) 
                          begin
                            pr <= 1'b1;
                            ch <= 1'b1;
                          end
                      else begin
                            pr <= 1'b0;
                            ch <= 1'b0;
                            end
               end 
       
endmodule
