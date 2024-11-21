`timescale 10ns / 10ps

module tb();
reg i0,clk,rst;
wire so;


top dut(i0,clk,rst,so);

always #10 clk <= ~clk;
always@(negedge clk) #500 rst <= ~rst ;


initial begin
clk = 0;
rst = 1;

repeat (20) begin
@(negedge clk)
#10 i0 <= 0;
@(negedge clk)
#10 i0 <= 1; 
@(negedge clk)
#10 i0 <= 1; 
@(negedge clk)
#10 i0 <= 0; 
@(negedge clk)
#10 i0 <= 1;

#10 
$finish;
end

end

endmodule
