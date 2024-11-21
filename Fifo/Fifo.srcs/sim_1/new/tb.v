module fifo_tb;

    parameter DATA_WIDTH = 8;
    parameter DEPTH = 16;
    
    reg clk;
    reg rst;
    reg wr_en;
    reg rd_en;
    reg [DATA_WIDTH-1:0] data_in;
    wire [DATA_WIDTH-1:0] data_out;
    wire full;
    wire empty;

    // Instantiate the FIFO
    fifo #(DATA_WIDTH, DEPTH) uut (
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .data_in(data_in),
        .data_out(data_out),
        .full(full),
        .empty(empty)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        rst = 0;
        wr_en = 0;
        rd_en = 0;
        data_in = 0;

        // Apply reset
        rst = 1;
        #10;
        rst = 0;
        #10;
        data_in = 0;

          // Fill FIFO to test full flag
        @(posedge clk);
        wr_en = 1;
        repeat (DEPTH) begin
            @(posedge clk);
            data_in = data_in + 1;
        end
        wr_en = 0;
        @(posedge clk);
       
        rd_en = 1;
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
          @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
          @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
          @(posedge clk);
          @(posedge clk);
          @(posedge clk);
          @(posedge clk);
          @(posedge clk);
          
      
        rd_en = 0;

        // Reset the FIFO
        @(posedge clk);
        rst = 1;
        #10;
        rst = 0;
        #10;

        // End simulation
        $finish;
    end

    // Monitor the outputs
    initial begin
        $monitor("Time: %0d, clk: %b, rst: %b, wr_en: %b, rd_en: %b, data_in: %h, data_out: %h, full: %b, empty: %b, wr_pointer: %d, rd_pointer: %d, fifo_count: %d",
            $time, clk, rst, wr_en, rd_en, data_in, data_out, full, empty, uut.wr_pointer, uut.rd_pointer, uut.fifo_count);
    end

endmodule
