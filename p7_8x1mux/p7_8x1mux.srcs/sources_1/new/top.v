`timescale 1ns / 1ps


module top(input [7:0]a,
         input [2:0]s,
        output  y);

         //tarnary opretor
         assign y = s[2]?(s[1]?(s[0]?a[7]:a[6]):(s[0]?a[5]:a[4])):(s[1]?(s[0]?a[3]:a[2]):(s[0]?a[1]:a[0]));

endmodule
