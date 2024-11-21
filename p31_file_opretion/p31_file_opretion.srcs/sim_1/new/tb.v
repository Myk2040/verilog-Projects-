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
 
  //file operation
    reg [`ADDR_WIDTH-1:0] wr_addrmem1 [0:`DEPTH-1];
    reg [`DATA_WIDTH-1:0] wr_datamem2 [0:`DEPTH-1];
    reg [`ADDR_WIDTH-1:0] rd_addrmem3 [0:`DEPTH-1];
 
 
  integer ch;
  reg [5:0]i;
 
ram  dut (clk, rst, wr_enb, wr_addr,wr_data, rd_enb,rd_addr,rd_data);
  
// Clock generation
always #10 clk = ~clk;


// for reset
task reset(); begin
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
 

	   //file operation
	 
   initial begin   
	//read operation
	    $readmemh("C:/Users/mayan/OneDrive/Desktop/project/p31_file_opretion/wr_addr.txt", wr_addrmem1);
	    $readmemb("C:/Users/mayan/OneDrive/Desktop/project/p31_file_opretion/wr_data.txt", wr_datamem2);
	    $readmemb("C:/Users/mayan/OneDrive/Desktop/project/p31_file_opretion/rd_addr.txt", rd_addrmem3);
    
	  
	    //write operation
	    ch = $fopen ("C:/Users/mayan/OneDrive/Desktop/project/p31_file_opretion/rd_data.txt");
  
    	   
 end


initial begin 
        clk = 1;
		
		reset();
		 rd_enb = 1'b1;
		 rd_enb = 1'b0;
		
		for (i=0; i<16; i=i+1)begin
		  @(negedge clk)
		  wr_enb = 1'b1;
		  wr_addr = wr_addrmem1[i];
		  wr_data = wr_datamem2[i];
		  @(negedge clk)
		  wr_enb = 1'b0;
		  end
		  
		   @(negedge clk)
		
		  
		  write_data(12,56);
		  read_data(12);
		   @(negedge clk)
		  write_data({$random},{$random} );
		  read_data({$random});
		  
		  for (i=0; i<16; i=i+1)begin
		  @(negedge clk)
		  rd_enb = 1'b1;
		  rd_addr = rd_addrmem3[i];
		  @(negedge clk)
		  rd_enb = 1'b0;
		  end
		  repeat (100)@(negedge clk)
		
      
     $fclose(ch);
     $finish; 
      
       
     end



      initial 
            begin
	          $fmonitor (ch,"rd_data = %d  ",rd_data);
			end
			
			 
endmodule
