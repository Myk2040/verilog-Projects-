`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
module top(input clk,rst,
            output reg [3:0]count);
  
always@(posedge clk) begin
count <= 4'd0;
         if (rst == 1) 
            count <= 4'd0;
           
    else if (count == 4'hf)
            count <= 4'd0;
    else 
            count <= count + 1;        
end          
endmodule
