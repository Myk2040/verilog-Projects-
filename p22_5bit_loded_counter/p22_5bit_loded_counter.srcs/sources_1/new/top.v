`timescale 1ns / 1ps

module top(input clk, rst,///active high
           input ld,
           input [4:0] ldvalue,
           output reg [4:0] dout );


always@(posedge clk)
begin
             if (rst == 1)begin
                  dout <= 5'b00000; // reset zero
                          end
            else    
       begin
                     if(dout == 5'b11111)
                     dout <=5'b00000 ;
                else if(ld == 1'b1)
                     dout <= ldvalue;
                else if(ld == 1'b0)
                     dout <= dout + 1;
       end

end
endmodule
