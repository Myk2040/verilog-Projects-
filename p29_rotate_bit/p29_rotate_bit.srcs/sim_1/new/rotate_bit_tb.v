`timescale 1ns / 1ps


module rotate_bit_tb();
reg   [15:0]i;
reg   [2:0]shift_number;
reg   right_left;
wire  [15:0]y;

rotate_bit   dut(  i,shift_number,right_left, y);

task rigit_shift(input [2:0] w);
begin
right_left =0;
shift_number = w;
end 
endtask
task left_shift(input [2:0] a);
begin
right_left =1;
shift_number = a;
end 
endtask



initial begin
i = 16'd1;


#10 rigit_shift(1);
#10 rigit_shift(2);
#10 rigit_shift(3);
#10 rigit_shift(4);
#10 rigit_shift(6);
#10 rigit_shift(7);
#10 rigit_shift(0);

#10 left_shift(1);
#10 left_shift(2);
#10 left_shift(3);
#10 left_shift(4);
#10 left_shift(6);
#10 left_shift(7);
#10 left_shift(0);





end
       
                    
                  

endmodule
