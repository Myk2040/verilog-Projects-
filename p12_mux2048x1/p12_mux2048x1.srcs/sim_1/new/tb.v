`timescale 10ns / 10ps

module tb;

      reg [2047:0] i;
      reg [10:0] s;
      wire out;
 
  
  
 top uut (i,s,out);

 initial
  begin

 
         i = 1;        s =   11'd0;
     #10  i = 2048'd15; s =   11'd1; 
     #10  i = 2048'hff; s =   11'd2; 
     #10  i = 2048'hff; s =   11'd3; 
     #10  i = 2048'hff; s =   11'd4; 
     #10  i = 2048'hff; s =   11'd5; 
     #10  i = 2048'hff; s =   11'd6; 
     #10  i = 2048'hff; s =   11'd7; 
     #10  i = 2048'hff; s =   11'd8;
     #10  $finish;
   
      end

endmodule

