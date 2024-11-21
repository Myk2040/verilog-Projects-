`timescale 1ns / 1ps



module mux_4x1_with_function(i,s,y);

//port direction
input [3:0]i;
input [1:0]s;
output reg y;

//funtcion declaration
function [1:0] mux_4x1_funtcion(input [3:0]i,input [1:0]s);
begin
   case(s)
   2'b00: mux_4x1_funtcion=i[0];
   2'b01: mux_4x1_funtcion=i[1];
   2'b10: mux_4x1_funtcion=i[2];
   2'b11: mux_4x1_funtcion=i[3];
   endcase
end 
endfunction

 //procedural block funtcion
always@(*)
 begin
	  y = mux_4x1_funtcion(i,s);
 end
    

endmodule
