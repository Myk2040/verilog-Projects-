`timescale 1ns / 1ps


module tb();
  
  reg [1:0]a;
  reg c;
  wire sum,carry;
 
 full_using_half DUT(a,c,sum,carry);
 
 initial
    begin
        a =2'd0; c = 0;
     #5 a =2'd0; c = 1; 
     #5 a =2'd1; c = 0;
     #5 a =2'd1; c = 1;
     #5 a =2'd2; c = 0;
     #5 a =2'd2; c = 1;
     #5 a =2'd3; c = 0;
     #5 a =2'd3; c = 1; 
     #5
     $finish;
    
    end

endmodule
