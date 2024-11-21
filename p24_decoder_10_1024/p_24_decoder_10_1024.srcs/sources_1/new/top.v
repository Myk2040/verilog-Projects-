`timescale 1ns / 1ps

module top (input [9:0]address,
            output reg [1023:0]y);
    
   // for counting 1024 number  
    reg [10:0]i; 
    
    
always@(address) begin

    for(i=0;i < 1024;i=i+1) begin
     y[i]=(address==i)?1'b1:1'b0;
        end
    end



endmodule
