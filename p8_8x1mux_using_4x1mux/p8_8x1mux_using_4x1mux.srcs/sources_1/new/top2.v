`timescale 1ns / 1ps


module top2(a,s,z);

  input [7:0]a;
  input [2:0]s;
  output z;
  
   mux2j1   r1(a[0],a[1],s[0],x);
   mux2j1   r2(a[2],a[3],s[0],b);
   mux2j1   r3(a[4],a[5],s[0],c);
   mux2j1   r4(a[6],a[7],s[0],d);
   mux2j1   r5(x,b,s[1],e);
   mux2j1   r6(c,d,s[1],f);
   mux2j1   r7(e,f,s[2],z);
        
   
endmodule
