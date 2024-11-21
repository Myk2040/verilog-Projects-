`timescale 1ns / 1ps


module top(input clk,rst,up_down, output reg [3:0] count);

always@(posedge clk)
begin
                if (rst == 1)
                    count <= 4'b0000;
                else begin
                     if (up_down)begin
                          if(count == 4'b1111)
                             count <= 4'b0000;
                          else   
                            count <= count +1;    
                           end
                     else begin
                          if(count == 4'b0000)
                             count <= 4'b1111;
                          else   
                            count <= count - 1;    
                           end
                end
                   
               
end
endmodule
