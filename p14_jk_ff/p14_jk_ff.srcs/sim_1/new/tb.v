`timescale 10ns / 10ps

module tb();
reg  clk,rst,j,k;
wire  q, qbar;

jk_ff dut(clk,rst,j,k,q,qbar);


always #1 clk = ~ clk;
initial begin
clk <= 1'b0; 

rst <= 1'b1;
#5 {j,k} <= 2'b00;
#5 {j,k} <= 2'b01;
#5 {j,k} <= 2'b10;
#5 {j,k} <= 2'b11;
#5 {j,k} <= 2'b00;
#5 {j,k} <= 2'b01;
#5 {j,k} <= 2'b10;
#5 {j,k} <= 2'b11;
#5 {j,k} <= 2'b00;
#5 {j,k} <= 2'b01;
#5 {j,k} <= 2'b10;
#5 {j,k} <= 2'b11;
#5 {j,k} <= 2'b00;
#5 {j,k} <= 2'b01;
#5 {j,k} <= 2'b10;
#5 {j,k} <= 2'b11;
#5  rst <= 1'b0; 
   {j,k} <= 2'b00;
#5 {j,k} <= 2'b01;
#5 {j,k} <= 2'b10;
#5 {j,k} <= 2'b11;
#5 {j,k} <= 2'b00;
#5 {j,k} <= 2'b01;
#5 {j,k} <= 2'b10;
#5 {j,k} <= 2'b11;
#5
$finish;

end 
endmodule
