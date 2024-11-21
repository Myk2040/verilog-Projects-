`timescale 1ns / 1ps
module top(a,s,z, zbar);
  input [3:0]a;    //input
  input[1:0]s ;    // select line 
  output z , zbar;       // output
  wire x,z;
  
 /* data flow laval
  assign x = ~s[0]&a[0] |s[0]&a[1] ;
  assign y = ~s[0]&a[2] |s[0]&a[3] ;
  assign z = ~s[1]& x |s[1]& y ;
  assign zbar = ~(~s[1]& x |s[1]& y );
  */
  
  /*behavior laval
  reg y;
  initial begin
  y = 0;
  end 
  
  always@(*) begin
    case(s)
   2'b00: y=a[0];
   2'b01: y=a[1];
   2'b10: y=a[2];
   2'b11: y=a[3];
   endcase
  end
  assign z = y; 
  assign zbar =~y;*/
  
  //tarnary opretor
   assign    z =    s[1]? (s[0]?a[3]:a[2]) :(s[0]?a[1]:a[0]);
   assign zbar =  ~(s[1]? (s[0]?a[3]:a[2]) :(s[0]?a[1]:a[0]));
endmodule
