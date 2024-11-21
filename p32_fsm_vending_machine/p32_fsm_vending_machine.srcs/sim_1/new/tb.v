`timescale 1ns / 1ps



module tb();

// port conetion 
reg clk,rst;
reg [1:0] coin;
wire pr,ch; 


vending_machine dut(.clk(clk),.rst(rst),.coin(coin),.pr(pr),.ch(ch));

  
// Clock generation
always #10 clk = ~clk;

// for reset
task reset(); begin
@(negedge clk)
rst = 1;
@ (negedge clk)
rst = 0; 
end
endtask 

initial begin

    $monitor($time , "coin = %0d , pr = %0d , ch = %0d" , coin , pr , ch);
  clk = 0;
  reset();
 @(negedge clk);
  coin = 2'd1;
  @(negedge clk);
  coin = 2'd2;
  repeat(2)@(negedge clk);
  
  reset();
 @(negedge clk);
  coin = 2'd1;
  @(negedge clk);
  coin = 2'd1;
  @(negedge clk);
  coin = 2'd1;
  
    reset();
 @(negedge clk);
  coin = 2'd2;
  @(negedge clk);
  coin = 2'd1;
 
    reset();
 @(negedge clk);
  coin = 2'd2;
  @(negedge clk);
  coin = 2'd2;
  
  
    reset();
 @(negedge clk);
  coin = 2'd1;
  @(negedge clk);
  coin = 2'd2;
  
   
   $finish;
 
  
  
 
    
    
 

end



endmodule
