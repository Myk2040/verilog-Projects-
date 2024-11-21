`timescale 1ns / 1ps


module tb();

reg [9:0]address;
wire [1023:0]y;

top dut(address,y);

initial begin
address = 10'd0;

 for (address = 0;address < 1023;address = address + 1) begin
 address = #10 address;

 end
 
 #10 address = 10'd16;
 #10 address = 10'd215; 
end


endmodule
