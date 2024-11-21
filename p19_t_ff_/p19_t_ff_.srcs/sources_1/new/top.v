`timescale 1ns / 1ps

module top(
    input clk,
    input rst,
    input t,
   output qbar,
    output reg q
    );
    
 always@(posedge clk)begin
 if (rst == 1)
    q<=0;
 else begin
     if (t)
        q <= ~q;
     else 
        q <= q;   
 end
 end    
 
 
assign qbar = ~q;
    
    
    
    
endmodule
