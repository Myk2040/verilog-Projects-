module fifo (clk,rst,wr_en,rd_en,data_in,data_out,full,empty);

parameter DATA_WIDTH = 8;
parameter DEPTH = 16;

//input

    input clk, rst, wr_en,rd_en;
    input [DATA_WIDTH-1:0] data_in;
    
    
// output   
    output reg [DATA_WIDTH-1:0] data_out;
    output full, empty;
    
    
// memory
reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];


// for counting addrese place 
reg [DEPTH-1:0] wr_pointer, rd_pointer;
reg [DEPTH-1:0] fifo_count;


// declaration of empty and full
  assign empty = (fifo_count == 0);
  assign full  = (fifo_count == DEPTH-1);
  
  
//logic for wr_en and rd_en
always@(posedge clk, posedge rst) begin
         
         
            // reset condtion
       if (rst) begin
                wr_pointer <= 0;
                rd_pointer <= 0;
                fifo_count <= 0;
                data_out  <= 0;
               end
               
       else if (wr_en && !full) begin
                mem[wr_pointer] <= data_in;
                wr_pointer <= wr_pointer + 1;
                fifo_count <= fifo_count + 1;
            end 
            
       else if (rd_en && !empty) begin
              data_out <= mem[rd_pointer];
                rd_pointer <= rd_pointer+ 1;
                fifo_count <= fifo_count - 1;
            end       
               
               
end 

always@(posedge clk, posedge rst) begin
 if (wr_en && rd_en) begin
                mem[wr_pointer] = data_in;
                wr_pointer = wr_pointer + 1;
                data_out = mem[rd_pointer];
                rd_pointer = rd_pointer + 1;
                fifo_count = fifo_count;

            end 
end





    
    
    
endmodule
    
  
