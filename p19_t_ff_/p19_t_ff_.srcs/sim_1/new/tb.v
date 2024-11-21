`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////////////////////


module tb();

reg clk,rst,t;
wire q,qbar;

top dut(clk,rst,t,q,qbar);

always #10 clk <= ~clk;
always@(negedge clk) #50 t  <= ~ t;
always@(negedge clk) #1000 rst  <= ~ rst;

initial begin
clk <= 0;
rst <= 1;
t   <= 0;

end

endmodule
