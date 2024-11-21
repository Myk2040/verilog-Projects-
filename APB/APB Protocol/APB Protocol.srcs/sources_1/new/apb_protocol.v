`timescale 1ns / 1ps


module apb_protocol( input wire         PCLK,    // Clock
                     input wire         PRESETn, // Reset (active low)
                     input wire [31:0]  PADDR,   // Address
                     input wire [31:0]  PWDATA,  // Write data
                     input wire         PWRITE,  // Write enable
                     input wire         PSEL,    // Peripheral select
                     input wire         PENABLE, // Enable
                     output reg [31:0]  PRDATA,  // Read data
                     output reg         PREADY,  // Ready
                     output reg         PSLVERR  // Slave error
    );
endmodule
