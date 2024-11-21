`timescale 1ns / 1ps
//RAM 16x8
`define ADDR_WIDTH 4
`define DEPTH 16
`define DATA_WIDTH 8 
module tb();
 
 // input
reg clk, rst, wr_enb, rd_enb;
reg [`ADDR_WIDTH-1:0] wr_addr, rd_addr;
reg [`DATA_WIDTH-1:0] wr_data;
// Outputs
wire [`DATA_WIDTH-1:0] rd_data;
 
  
 ram  dut (clk, rst, wr_enb, wr_addr,wr_data, rd_enb,rd_addr,rd_data);
  
// Clock generation
always #10 clk = ~clk;



// for reset
task reset();
begin
@(negedge clk)
rst = 1;
@ (negedge clk)
rst =0;
end
endtask 


// for write data

task write_data(input [`ADDR_WIDTH-1:0] j,input [`DATA_WIDTH-1:0] k);
begin
@(negedge clk)
wr_enb = 1;
@(negedge clk)
wr_addr = j;
wr_data = k;
@ (negedge clk)
wr_enb = 0;
end
endtask

// for read data

task read_data(input [`ADDR_WIDTH-1:0] j);
begin
@(negedge clk)
rd_enb = 1;
@(negedge clk)
rd_addr = j;
@ (negedge clk)
rd_enb = 0;
end
endtask


initial begin 
clk = 0;
    rst = 1;
    wr_enb = 0;
    wr_addr = 0;
    wr_data = 0;
    rd_enb = 0;
    rd_addr = 0;
    #20; // Wait for 20 ns
    rst = 0; // Deassert reset
    #20; // Wait for 20 ns
   
   
   reset();
   
    write_data(2,9);
   
     read_data(2); 
  
     reset();
     
    
     read_data(2);
    
    write_data(15,123);
  
     read_data(15); 
    
    write_data({$random},{$random});
  
     read_data(4);
     
     
     repeat(16) begin
     write_data({$random},{$random});
     end
     
     
     for (rd_addr = 0;rd_addr<14;rd_addr =rd_addr + 1'b1)begin
     @(negedge clk)
      #10 
      rd_enb = 1;
      rd_addr = rd_addr;
      #2
      rd_enb = 0;
     end
     
    
     $finish;
     
    


end 



  
 
  
  
  
  
endmodule
