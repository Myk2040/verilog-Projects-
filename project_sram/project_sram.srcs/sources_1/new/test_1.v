/////////////////////////////////////////////////////////////////////////////
// Project Name	: Static Single Port 3 State RAM_1024x36 I/O Bi-directional
// Author Name	: 
// Created Date	:
////////////////////////////////////////////////////////////////////////////
`timescale 1ns/100ps

`define DATA_WIDTH 36 
`define ADDR_WIDTH 10
`define RAM_DEPTH 1 << `ADDR_WIDTH

module SRAM_1024x36_bidir (
    input wire 					 clk0,         // Clock signal
    input wire 					 csb0,         // Chip select (active low)
    input wire 					 web0,         // Write enable (active low)
    input wire 					 oeb0,         // Output enable (active low)
    input wire [`ADDR_WIDTH-1:0] addr0,  	  // 10-bit address bus for 1024 addresses
    inout wire [`DATA_WIDTH-1:0] IO			  // 36-bit bidirectional data bus (inout)
);

    // Memory declaration (1024 addresses, each 36 bits wide)
    reg [`DATA_WIDTH-1:0] mem [0:`RAM_DEPTH-1];
    reg [`DATA_WIDTH-1:0] data_out;
    reg [`ADDR_WIDTH-1:0] addr_reg;

    // Internal signal to control data direction (inout bus)
    wire [`DATA_WIDTH-1:0] data_in;
    reg  [`DATA_WIDTH-1:0] io_reg;

    // Latch address to prevent glitches
    always @(posedge clk0) begin
        if (!csb0) begin
            addr_reg <= addr0;  // Latch the address when chip is selected, Here Addr0 is coming 

            // Write operation
            if (!web0) begin
                mem[addr_reg] <= IO;  // Write data from IO bus into memory
				//$display($time,"Write Data Input = %0d : At In I/O Port = %0d", mem[addr_reg], IO);
            end
            // Read operation (data is latched to prevent transparent reads)
            else if (!oeb0) begin
                data_out <= mem[addr_reg];  // Read data from memory into data_out
				//$display($time,"Read Data Output = %0d : At In Memory = %0d", data_out, mem[addr_reg]);
            end
        end
    end

    // Output control: assign output when OEB is low (3-state logic)
    assign IO = (!oeb0 && !csb0 && web0) ? data_out : 36'bz;

endmodule