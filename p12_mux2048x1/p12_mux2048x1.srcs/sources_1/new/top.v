`timescale 10ns / 10ps

module top (
  input [2047:0] i ,
  input [10:0] s,
  output  out
);

assign  out = i[s];
endmodule

