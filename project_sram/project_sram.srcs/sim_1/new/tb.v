`timescale 1ns/100ps

`define DATA_WIDTH 36 
`define ADDR_WIDTH 10
`define RAM_DEPTH 1 << `ADDR_WIDTH
//`define CYCLE 15.625 // 64 MHz Frequency
//`define CYCLE 0.2

module tb_SRAM_1024x36_bidir;

    // Inputs to DUT
    reg clk0;
    reg csb0;
    reg web0;
    reg oeb0;
    reg [`ADDR_WIDTH-1:0] addr0;
    
    // Bidirectional IO
    wire [`DATA_WIDTH-1:0] IO;
    reg [`DATA_WIDTH-1:0] io_driver;
    reg io_enable;
    
    // Internal reference memory model
    reg [`DATA_WIDTH-1:0] ref_mem [0:`RAM_DEPTH-1];
    
    // Bidirectional bus control
    assign IO = (io_enable) ? io_driver : {`DATA_WIDTH{1'bz}};  // Tristate IO

    // DUT instantiation
    SRAM_1024x36_bidir DUT (
        .clk0(clk0),
        .csb0(csb0),
        .web0(web0),
        .oeb0(oeb0),
        .addr0(addr0),
        .IO(IO)
    );

		initial begin
		
			$display("                     ________________                     ");
			$display("                    |                |                    ");
			$display("           clk0 --->|                |                    ");
			$display("                    |                |<---> I/O Port      ");
			$display("           web0 --->|                |                    ");
			$display("                    |                |                    ");
			$display("           csb0 --->|      SRAM      |---> dout0 [35:0]   ");
			$display("                    |                |                    ");
			$display("    addr0 [9:0] --->|                |                    ");
			$display("                    |                |<--- oeb0           ");
			$display("    din0 [35:0] --->|                |                    ");
			$display("                    ||                    ");

		end


    // Clock generation
    initial begin
		forever begin
	  #0.08 clk0 = ~clk0;	// here the clock is 64 MHz (15.625ns) 
								// which is 15.625ns/2 = 7.8125ns
		end
	end
	
	
	initial begin
		#160;
		$finish;
	end

    // Integer for loops (must be declared outside initial block in Verilog)
    integer i;

    // Stimulus and reference model
    initial begin
        // Initialize signals
        clk0 = 0;
        csb0 = 1;
        web0 = 1;
        oeb0 = 1;
        addr0 = 0;
        io_driver = 0;
        io_enable = 0;
        
        // Reset memory
        for (i = 0; i < `RAM_DEPTH; i = i + 1) begin
            ref_mem[i] = {`DATA_WIDTH{1'b0}};
        end

        // Wait for reset completion
        #10;
        
		/*repeat (10)
			write_to_memory ({$random},{$random});
			web0 = 1;
			csb0 = 1;
		
		repeat (10)
			read_from_memory ({$random});
			web0 = 0;
			csb0 = 1;
		*/	
        // Test 1: Write to several addresses
        for (i = 0; i < 10; i = i + 1) begin
            write_to_memory(i, i * {$random});
        end
        
        // Test 2: Read from the same addresses
        for (i = 0; i < 10; i = i + 1) begin
            read_from_memory(i);
        end
        
        // End of simulation
        #100;
        $finish;
    end

    // Task to write to memory
    task write_to_memory;
        input [`ADDR_WIDTH-1:0] address;
        input [`DATA_WIDTH-1:0] data;
        begin
            @(posedge clk0);
            csb0 = 0;
            web0 = 0;
            oeb0 = 1;
            addr0 = address;
            io_enable = 1;
            io_driver = data;
            ref_mem[address] = data;  // Write to reference model
            @(posedge clk0);
            csb0 = 1;
            io_enable = 0;
            #10;
        end
    endtask

    // Task to read from memory
    task read_from_memory;
        input [`ADDR_WIDTH-1:0] address;
        begin
            @(posedge clk0);
            csb0 = 0;
            web0 = 1;
            oeb0 = 0;
            addr0 = address;
            @(posedge clk0);
           //$display("REF MEMORY %0d",ref_mem[address]);
            if (IO !== ref_mem[address]) begin
			#1;
                $display("-----------------------------------------------------------");
				$display("ERROR : Mismatch at address = %0d : Expected = %0d, Got = %0d", address, ref_mem[address], IO);
            end 
			else begin
				$display("-----------------------------------------------------------");
                $display("SUCCESS : Read from address = %0d : Data = %0d", address, IO);
            end
            @(posedge clk0);
            csb0 = 1;
            oeb0 = 1;
            #10;
        end
    endtask

endmodule