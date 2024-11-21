`timescale 1ns / 1ps

// port Direction

module digital_clock(input clk, rst,
                     output reg [3:0] sec,
                     output reg [3:0] min,
                     output reg [3:0] hr);
                     
    reg [3:0]counter;  
    

    
    
    
    parameter CYCLE  = 9;
    parameter SECOND = 5;
    parameter MINUTE = 5;
    parameter HOUR   = 11;            
    
    
    // logic start
                     
                     
 always @(posedge clk or posedge rst) begin
    if (rst == 1'b1) begin   // active high 
      counter <= 0;
      sec <= 4'b0;
      min <= 4'b0;
      hr <= 4'b0;
    end 
    else begin      // active  low 
    
        // for counting cycle
         counter <= counter + 1'b1; 
         
         
         
         // if counter is equal to cycle then counter will become zero as well as sec will increments
         
         if (counter == CYCLE) begin      
             counter <= 1'b0;
             sec <= sec + 1'b1;
               
               
            
           if (sec == SECOND)begin
             sec <= 1'b0;
             min <= min + 1'b1;
           
            
            
             if (min == MINUTE)begin
             min <= 1'b0;
             hr <= hr + 1'b1;
            
            
               if (hr == HOUR)begin
                hr <= 1'b0;
                end    
              end
           end
         end
    end
 end                 
endmodule
