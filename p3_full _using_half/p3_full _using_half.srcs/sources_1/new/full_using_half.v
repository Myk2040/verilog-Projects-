`timescale 1ns / 1ps


module full_using_half(a,c,sum,carry);

    
    
   input [1:0]a;
   input c;
   output sum, carry;
   wire x,y,z;
  
  assign x = a[0]^a[1];
  assign y = a[0]&a[1];
  
  assign sum = x ^ c;
  assign   z = x & c;
  assign carry = z | y; 
  


endmodule
