`timescale 1ns / 1ps
module top(input clk,rst,output reg [3:0] count);

///////Synchronous
/*always @(posedge clk) begin
    if (rst == 1) 
        begin
        count <= 4'b0000; // Initial state: 0
        end 
    else 
        begin
        if (count == 4'b1011) begin
            count <= 4'b0000; // Reset when count reaches 11
        end 
        else 
        begin
            count <= count + 1; // Increment count
        end
    end
end*/
///////aSynchronous
always @(posedge clk,negedge rst ) begin
    if (rst) begin
        count <= 4'b0000; // Initial state: 0
    end else begin
        if (count == 4'b1011) begin
            count <= 4'b0000; // Reset when count reaches 11
        end else begin
            count <= count + 1; // Increment count
        end
    end
end

endmodule
