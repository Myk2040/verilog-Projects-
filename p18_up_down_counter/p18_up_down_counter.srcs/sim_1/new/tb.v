`timescale 1ns / 1ps

module tb( );
 reg clk,rst,up_down;
 wire [3:0]count;
 
 top dut(clk,rst,up_down,count);
 
 always #10 clk <= ~clk;
 initial begin
 clk <= 1'b0;
 rst <= 1'b1;
 repeat (4) begin
 @(negedge clk)
 #1000 rst <= 1'b0;
 #500  up_down <= 1'b1;
 #500  up_down <= 1'b0;
 @(negedge clk)
 #1000 rst <= 1'b1;
 #500  up_down <= 1'b1;
 #500  up_down <= 1'b0;
 
 end
 end
endmodule
