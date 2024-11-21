`timescale 10ns / 10ps

module tb();
reg clk,din,rst;
wire q , qbar;

top dut(clk,din,rst,q,qbar);



always #10 clk = ~clk;
always@(negedge clk) #6  din = ~din;
always@(negedge clk) #100 rst = ~rst;

initial begin
clk <= 0;
din <= 0;
rst <= 0;

#50 $finish;
end

endmodule
