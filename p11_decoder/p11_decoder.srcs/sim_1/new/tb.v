`timescale 1ns / 1ps

module tb();

reg [2:0]i;
wire [7:0] y;

top dut (i,y);

initial 
begin
        i = 3'd0;  
        #10
        i = 3'd1;  
        #10
        i = 3'd2;  
        #10
        i = 3'd3;  
        #10
        i = 3'd4;  
        #10
        i = 3'd5;  
        #10
        i = 3'd6;  
        #10
        i = 3'd7;  
        #10
        $finish;
end
endmodule
