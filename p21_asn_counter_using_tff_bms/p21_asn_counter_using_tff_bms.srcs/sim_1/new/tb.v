`timescale 1ns / 1ps

module tb( );
reg clk,rst; 
 wire [3:0] out;
 
 top dut(clk,rst,out);
 
 always #10 clk <= ~clk;
 always@(negedge clk) #1000 rst <= ~rst;
 initial begin
 clk <= 0;
 rst <= 1;
 end
endmodule
