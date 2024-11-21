`timescale 1ns / 1ps
module tb();

	
	reg [7:0] i;
	wire [2:0] p ;
	

	top dut(i,p);

	initial begin
		     i=8'b00000000;
		#10  i=8'b00000001;
		#10  i=8'b00000010; 
		#10  i=8'b00000100;
		#10  i=8'b00001000;
		#10  i=8'b00010000;
		#10  i=8'b00100000;
		#10  i=8'b01000000;
		#10  i=8'b10000000;
		#10  i=8'b01100000;
		#10  i=8'b11000000;
		#10  i=8'b00011000;
		#10
		
		$finish;
		end
      
endmodule


