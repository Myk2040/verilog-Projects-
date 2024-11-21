`timescale 10ns / 10ps


module top( clk,din,rst, q , qbar);
            
      input clk,din,rst;
      output reg q;
      output reg qbar ;
            
            
  always@(posedge clk) 
  if (rst == 1) 
  begin
       q    <= 0;
       qbar <= 1;
  end
  else if(rst == 0) 
       begin
     q       <=   din;
     qbar    <=  ~din;
       end
        

endmodule
