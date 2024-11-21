`timescale 1ns / 1ps

/*module top(input [7:0]i,
               output[2:0] p);
    reg [2:0] y;   
   
   initial begin
   y = 3'bzzz;
   end           
        
			   
          always@(*)
   begin
	       if(i[7]== 1)y=3'd7;
	  else if(i[6]== 1) y=3'd6;
      else if(i[5]== 1)  y=3'd5;
	  else if(i[4]== 1) y=3'd4;
	  else if(i[3]== 1) y=3'd3;
	  else if(i[2]== 1) y=3'd2;
	  else if(i[1]== 1) y=3'd1;
	  else if(i[0]== 1) y=3'd0;
	   
	    end
 
 assign p = y;

endmodule */

module top (
  input [7:0] i,
  output reg [2:0] p
);

always @(*) begin
  case (i)
    8'b00000001: p = 3'b000;
    8'b00000010: p = 3'b001;
    8'b00000100: p = 3'b010;
    8'b00001000: p = 3'b011;
    8'b00010000: p = 3'b100;
    8'b00100000: p = 3'b101;
    8'b01000000: p = 3'b110;
    8'b10000000: p = 3'b111;
    default: p = 3'b000; // Default case for an undefined input
  endcase
end

endmodule           