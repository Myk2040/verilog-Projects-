`timescale 1ns / 1ps


module rotate_bit( input [15:0]i,
                   input [2:0]shift_number,
                   input right_left,
                   output [15:0]y);

assign y = (shift_number == 1) ? ((right_left == 1)? {i[14:0],i[15:15]}:{i[0:0],i[15:1]}) :
           (shift_number == 2) ? ((right_left == 1)? {i[13:0],i[15:14]}:{i[1:0],i[15:2]}) :
           (shift_number == 3) ? ((right_left == 1)? {i[12:0],i[15:13]}:{i[2:0],i[15:3]}) :
           (shift_number == 4) ? ((right_left == 1)? {i[11:0],i[15:12]}:{i[3:0],i[15:4]}) :
           (shift_number == 5) ? ((right_left == 1)? {i[10:0],i[15:11]}:{i[4:0],i[15:5]}) :
           (shift_number == 6) ? ((right_left == 1)? {i[9:0],i[15:10]}:{i[5:0],i[15:6]}) :
           (shift_number == 7) ? ((right_left == 1)? {i[8:0],i[15:9]}:{i[6:0],i[15:7]}) :
                                   {i[15:0]};
          
                

endmodule
