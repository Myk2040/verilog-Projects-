`timescale 1ns / 1ps


module tb();
reg clk, t;
wire [3:0]q, qbar;

top2  dut(.clk(clk),.t(t),.q(q),.qbar(qbar));

always #10 clk <= ~clk;
always@(negedge clk) #20 t <= ~t;

initial begin
clk <= 0;
t <=   0;
end

endmodule
