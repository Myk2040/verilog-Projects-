`timescale 1ns / 1ps

module top(input i0, clk,rst, output so);

reg [3:0]temp;



always@(posedge clk)begin
               if (rst == 1)begin
                     temp <= 4'b0000;    // active high
                   end 
                   
              else begin 
                    temp[0] <= i0;
                    temp[1] <= temp[0];
                    temp[2] <= temp[1]; 
                    temp[3] <= temp[2];
                    
              
                   end 
end

assign so = temp[3] ;
endmodule
