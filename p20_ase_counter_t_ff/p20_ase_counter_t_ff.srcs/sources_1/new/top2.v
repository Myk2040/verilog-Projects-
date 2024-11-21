`timescale 1ns / 1ps


module top2(input clk, t, output [3:0]q, qbar);

t_ff  t1(.clk(clk),.t(t),.qbar(qbar[0]),.q(q[0]));
t_ff  t2(.clk(qbar[0]),.t(t),.qbar(qbar[1]),.q(q[1]));
t_ff  t3(.clk(qbar[1]),.t(t),.qbar(qbar[2]),.q(q[2]));
t_ff  t4(.clk(qbar[2]),.t(t),.qbar(qbar[3]),.q(q[3]));


endmodule
