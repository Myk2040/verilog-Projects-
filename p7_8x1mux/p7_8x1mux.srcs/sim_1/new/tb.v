`timescale 1ns / 1ps

module tb();

         reg [7:0]a;
         reg [2:0]s;
         wire   y;
         
      top DUT(a,s,y);   
      
      initial
        begin
           s =3'd0;  a=8'b11111110;
       #10     s =3'd0;  a=8'b00000001;
       #10     s =3'd1;  a=8'b11111101;
       #10     s =3'd1;  a=8'b00000010;
       #10     s =3'd2;  a=8'b11111011;
       #10     s =3'd2;  a=8'b00000100;
       #10     s =3'd3;  a=8'b11110111;
       #10     s =3'd3;  a=8'b00001000;
       #10     s =3'd4;  a=8'b11101111;
       #10     s =3'd4;  a=8'b00010000;
       #10     s =3'd5;  a=8'b11011111;
       #10     s =3'd5;  a=8'b00100000;
       #10     s =3'd6;  a=8'b10111111;
       #10     s =3'd6;  a=8'b01000000;
       #10     s =3'd7;  a=8'b00111111;
       #10     s =3'd7;  a=8'b10000000;
       #10
       $finish;
           
           
           
        end

endmodule
