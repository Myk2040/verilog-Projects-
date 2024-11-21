`timescale 1ns / 1ps
//port direction
module mux_4x1_with_task(i,s,y);
input [3:0]i;
input [1:0]s;
output reg y;

//task declaration
task  mux_4x1_task(input [3:0]i,input [1:0]s,output reg y);
begin
 case(s)
   2'b00: y=i[0];
   2'b01: y=i[1];
   2'b10: y=i[2];
   2'b11: y=i[3];
   endcase
end 
endtask

 //procedural block task
always@(*)
 begin
	    mux_4x1_task(i,s,y);
 end
    

endmodule
