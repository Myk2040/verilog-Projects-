`timescale 1ns / 1ps
module mux_4x1_using_2x1_tb ();

  reg [3:0]a;
  reg [1:0]s;
  wire y;

  //design instantiation
   mux_4x1_using_2x1  dut (a,s,y);

   initial begin
        a= 4'd0;  s=2'd0;
    #5   a= 4'd1;  s=2'd0;
    #5   a= 4'd2;  s=2'd0;
    #5   a= 4'd3;  s=2'd0;
    #5   a= 4'd4;  s=2'd1;
    #5   a= 4'd5;  s=2'd1;
    #5   a= 4'd6;  s=2'd1;
    #5   a= 4'd7;  s=2'd1;
    #5   a= 4'd8;  s=2'd3;
    #5   a= 4'd9;  s=2'd3;
    #5   a= 4'd10;  s=2'd3;
    #5   a= 4'd11;  s=2'd3;
    #5   a= 4'd12;  s=2'd0;
    #5   a= 4'd13;  s=2'd0;
    #5   a= 4'd14;  s=2'd0;
    #5   a= 4'd15;  s=2'd0;
    #5    $stop;
   end

endmodule