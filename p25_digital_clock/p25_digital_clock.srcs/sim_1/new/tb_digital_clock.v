`timescale 1ns / 1ps


module tb_digital_clock();

reg clk, rst;
wire[3:0] sec, min, hr;

digital_clock dut( clk, rst,sec, min, hr);

always #10 clk <= ~clk;

 initial begin 
  clk = 1'b1;
  #1000 rst = 1'b1;
  #1000 rst = 1'b0;
  #9000 $finish;
    
  
  
 end 

endmodule
