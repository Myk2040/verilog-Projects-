`timescale 1ns / 1ps


module Timer(clk,rst,load,time_data,time_out,count);

input clk,rst,load;
input [4:0]time_data;
output reg time_out;

output reg [4:0] count;
always @(posedge clk, posedge rst)begin
      if (rst == 1)begin 
          time_out <= 0;
           count <= 5'b00000;
       end
      
       else 
               begin
           
              if (load == 1) begin
               count <= time_data;
               time_out <= 0;
              end
         
          else if (count == 5'b00001) begin
                    time_out <= 1; 
                    
                    
                     
                    
              end
        
              
          else if (load == 0) begin
              count <= count - 1'b1;
              time_out <= 0;
              end
       end
end

endmodule
