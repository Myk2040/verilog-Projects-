`timescale 10ns / 10ps


module top( clk,din,rst, q , qbar);
            
      input clk,din,rst;
      output reg q;
      output reg qbar ;
      
 // Synchronous reset          
  always@(posedge clk) 
  if (rst == 1)   /// activ high
  begin
       q    <= 0;
       qbar <= 1;
  end
  else if(rst == 0)      //activ low
       begin
     q       <=   din;
     qbar    <=  ~din;
       end 
       
/* asynchronous reset
 always@(posedge clk , posedge rst) 
  if (rst) 
  begin
       q    <= 0;
       qbar <= 1;
  end
  else  
       begin
     q       <=   din;
     qbar    <=  ~din;
       end*/ 
       
endmodule
