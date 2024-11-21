`timescale 1ns / 1ps


module tb();
  reg [3:0]i;
   reg [1:0]s;
   wire y;
   
 mux_4x1_with_function dut(i,s,y);
 
  initial begin
	    s=2'd0; i=4'b0000;
	    #10;
	    s=2'd1; i=4'b0010;
	    #10;
	    s=2'd2; i=4'b0110;
	    #10;
            s=2'b11; i=4'b1000;
	    #10;
   	    s=2'b11; i=4'b0000;
	    #10;
	    $finish;
    end
 
   
   
   
endmodule
