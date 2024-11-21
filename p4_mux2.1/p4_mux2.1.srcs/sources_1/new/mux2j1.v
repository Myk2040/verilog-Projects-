`timescale 1ns / 1ps

module mux2j1(a,s,out);

 input [1:0]a;
 input s;
 output out;
 wire x,y,z,sbar;
  
  //gate level
  /*and  a1(y,a[1],s);
  not  n1(sbar,s);
  and  a2(z,a[0],sbar);
  or   o1(out,y,z);*/
  
  // data flow level
   /*assign out = ~s&a[0]|s&a[1];*/
   
   //taranary opretor
   assign out = s?a[1]:a[0];
 
endmodule
