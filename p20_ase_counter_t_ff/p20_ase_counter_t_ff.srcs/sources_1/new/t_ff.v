`timescale 1ns / 1ps

module t_ff(
    input clk,t,
   output reg qbar,
    output reg q
    );
 initial
  q<=0;
 always@(posedge clk)begin

     if (t)begin
        q   <= ~q;
        qbar <= q;
      end 
      else begin
        q <= q; 
         qbar <= ~q;
     end
 end    
 
 

endmodule