`timescale 1ns / 1ps

module mux2j1(a0,a1,s,out);

 input a0,a1,s;
 output out;
 wire x,y,z,sbar;
  
  //gate level
  /*and  a3(y,a1,s);
  not  n1(sbar,s);
  and  a2(z,a0,sbar);
  or   o1(out,y,z);*/
  
  // data flow level
  assign out = ~s&a0|s&a1;
   
   //taranary opretor
  // assign out = s?a[1]:a[0];
 
endmodule
