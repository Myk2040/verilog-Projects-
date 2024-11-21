`timescale 1ns / 1ps


module full_adder(a,c,sum,carry);
    
   input [1:0]a;
   input c;
   output sum, carry;
   wire x,y,z;
   
   /* gate leval
   xor a1 (x,a[0],a[1]);
   xor a2 (sum,x,c);
   and a3 (y,x,c);
   and a4 (z,a[0],a[1]);
    or a5 (carry,y,z);
   */
   //data flow level 
   assign sum =  a[0]^ a[1] ^ c;
   assign carry = a[0]&a[1] | c & (a[0]^a[1]);
   
endmodule
