`timescale 1ns / 1ps

module mux_4x1_using_2x1 (a,s,z);

  //port dorectaon
  input [3:0]a;
  input [1:0]s;
  output z;
  

   //implementataon
   mux2j1 m1(a[0],a[1],s[0],x);
   mux2j1 m2(a[2],a[3],s[0],y);
   mux2j1 m3(x,y,s[1],z);
   

endmodule