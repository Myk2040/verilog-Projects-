`timescale 1ns / 1ps

module tb();
reg clk, rst, ld;
reg [4:0] ldvalue;
wire [4:0] dout;

top  dut(clk, rst, ld, ldvalue, dout);

always #10 clk <= ~clk;


task reset();
begin
@(negedge clk)
rst = 1'b1;
@(negedge clk)
rst = 1'b0;
end
endtask

task ld_value(input integer i);
begin
@(negedge clk)
ld = 1'b1;
@(negedge clk)
ldvalue = i;
@(negedge clk)
ld = 1'b0;
end
endtask

task cycle_delay(input integer i);
begin 
repeat(i)begin @(negedge clk); end
end
endtask


initial begin 
clk <= 0;

// reset
reset();

//lode value
ld_value(5'd15);

//delay
cycle_delay(20);

//lode value
ld_value({$random});

//delay
cycle_delay(12);


end

endmodule
