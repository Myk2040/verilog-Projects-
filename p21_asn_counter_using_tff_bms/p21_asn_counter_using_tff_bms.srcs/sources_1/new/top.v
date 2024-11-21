`timescale 1ns / 1ps
module top( input clk,rst, // Clock input,
            output [3:0] out    // 4-bit counter output
   );
 
 reg [3:0] count; 
 reg t1,t2,t3,t4;

//assign out is count
assign out = count;



//for t1 
always @(posedge clk , posedge rst) begin
    if (rst == 1) begin
        // Reset condition
        t1 <= 1'b0;
    end 
    else begin
        t1 <= ~t1;
    end
end



//for t2 
always @(posedge t1 , posedge rst) begin
    if (rst == 1) begin
        // Reset condition
        t2 <= 1'b0;
    end 
    else begin
        t2 <= ~t2;
    end
end




//for t3 
always @(posedge t2 , posedge rst) begin
    if (rst == 1) begin
        // Reset condition
        t3 <= 1'b0;
    end 
    else begin
        t3 <= ~t3;
    end
    
 end
 
 //for t4 
always @(posedge t3 , posedge rst) begin
    if (rst == 1) begin
        // Reset condition
        t4 <= 1'b0;
    end 
    else begin
        t4 <= ~t4;
    end
end

//for count
always @(posedge clk or posedge rst) begin
    if (rst)
        count <= 4'b0000;
    else
        count <= ~{t4, t3, t2, t1};
end

endmodule
/*
module async_counter_4bit(
    input wire clk,    // Clock input
    input wire rst,    // Reset input
    output [3:0] out // 4-bit outpu
);

// Internal signals
reg [3:0] count_next; // Next state of the counter

// T flip-flop instances
reg t1, t2, t3, t4;

// Output assignment
assign out = count_next;

// DFF1
always @(posedge clk or posedge rst) begin
    if (rst)
        t1 <= 1'b0;
    else
        t1 <= ~t1;
end

// DFF2
always @(posedge t1 or posedge rst) begin
    if (rst)
        t2 <= 1'b0;
    else
        t2 <= ~t2;
end

// DFF3
always @(posedge t2 or posedge rst) begin
    if (rst)
        t3 <= 1'b0;
    else
        t3 <= ~t3;
end

// DFF4
always @(posedge t3 or posedge rst) begin
    if (rst)
        t4 <= 1'b0;
    else
        t4 <= ~t4;
end

// Counting logic
always @(posedge clk or posedge rst) begin
    if (rst)
        count_next <= 4'b0000;
    else
        count_next <= {t4, t3, t2, t1};
end

endmodule */
