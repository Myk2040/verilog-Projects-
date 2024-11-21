`timescale 1ns / 1ps

module tb();

reg clk,rst;
wire [3:0]count;

top t1(clk,rst,count);

initial begin
clk <= 0;
forever
#10 clk <= ~clk;
end

initial begin

@(negedge clk)
#500 rst <= 1;
@(negedge clk)
#500  rst <= 0;
@(negedge clk)
#500 rst <= 1;
@(negedge clk)
#500  rst <= 0;


end



endmodule
