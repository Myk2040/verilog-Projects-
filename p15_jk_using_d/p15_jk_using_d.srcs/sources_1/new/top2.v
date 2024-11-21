`timescale 10ns / 10ps


module top2( clk,rst,j,k,q, qbar);

input clk,rst,j,k;
output q, qbar;
wire din;
 
assign din = (~k & q )|(j & ~q );

    top t1( clk,din,rst,q,qbar);

endmodule
