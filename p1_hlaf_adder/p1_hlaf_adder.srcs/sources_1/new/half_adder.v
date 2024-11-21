`timescale 1ns / 1ps

module half_adder( input [1:0]a, output sum, carry );
    
  /* gate level  
    xor m1(sum,a[0],a[1]);
    and m2(carry,a[0],a[1]); */
    
    // Data flow level
    
    assign sum = a[0] ^ a[1];
    assign carry = a[0] & a[1];
    
endmodule
