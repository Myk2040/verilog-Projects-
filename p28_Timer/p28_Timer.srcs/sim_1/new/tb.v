`timescale 1ns / 1ps


module tb();
reg clk,rst,load;
reg [4:0]time_data;
wire time_out;
wire [4:0] count;

Timer dut(clk,rst,load,time_data,time_out,count);

initial begin
clk = 0;
forever  begin

#10 clk  = ~clk;


end
end  

task reset();
begin
@(negedge clk)
rst = 1;
@ (negedge clk)
#20rst =0;
end
endtask 

task load_value(input  [4:0]i );
begin
@ (negedge clk)
time_data = i;
@ (negedge clk)
load = 1;
@ (negedge clk)
load =0;
end
endtask

task cycle_delay(input integer i);
begin 
repeat(i)begin @(negedge clk); end
end
endtask



initial begin
reset();

//lode value
load_value(5'd30);

//delay
cycle_delay(10);
reset();
//lode value
cycle_delay(40);
load_value(5'd10);

//delay
cycle_delay(20);
reset();
load_value({$random});

//delay
cycle_delay(20);


// reset
reset();

load_value({$random});

//delay
cycle_delay(12);

// reset
reset();

load_value({$random});

//delay
cycle_delay(12);
end
endmodule