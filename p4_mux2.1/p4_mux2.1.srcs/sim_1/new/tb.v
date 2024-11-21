`timescale 1ns / 1ps

module tb();
   
   reg [1:0]a;
   reg s;
   wire out;
   
   mux2j1 DUT(a,s,out);
   
   initial
      begin
            a=2'd0;  s=0;
         #5 a=2'd1;  s=0;
         #5 a=2'd2;  s=0;
         #5 a=2'd3;  s=0;
         #5 a=2'd0;  s=1;
         #5 a=2'd1;  s=1;
         #5 a=2'd2;  s=1;
         #5 a=2'd3;  s=1;
         #5
         
         $finish;
      end
endmodule
