`timescale 1ns / 1ps
module tb();
reg clk,rst;
wire [3:0] count;

top dut(clk,rst,count);

always #10 clk<=~clk;
initial begin
clk <= 0;
repeat(4) begin
@(negedge clk)
rst <= #500 1;
#100
@(negedge clk)
rst <= #500 0;
#500 $finish;
end
end


endmodule
