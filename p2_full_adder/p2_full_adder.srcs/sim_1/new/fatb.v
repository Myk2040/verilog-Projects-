`timescale 1ns / 1ps


module fatb();
 
 reg [1:0]a;
 reg c;
 wire sum,carry;
 reg [3:0] i;
 
 full_adder DUT(a,c,sum,carry);
 
 initial
    begin
       /* a =2'd0; c = 0;
     #5 a =2'd0; c = 1; 
     #5 a =2'd1; c = 0;
     #5 a =2'd1; c = 1;
     #5 a =2'd2; c = 0;
     #5 a =2'd2; c = 1;
     #5 a =2'd3; c = 0;
     #5 a =2'd3; c = 1; 
     #5 ; */
     
     i = 0;
     for (i = 0;i<8;i=i+1) begin
    {c,a}= {i[2],i[1:0]};
    #10;
       
     end
    
end
 
endmodule
