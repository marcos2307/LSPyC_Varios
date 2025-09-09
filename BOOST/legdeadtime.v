`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:54:35 06/05/2024 
// Design Name: 
// Module Name:    legdeadtime 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module legdeadtime(
input clk,
input [1:0] leg,
output [3:0] out
    );
wire s_top, s_uppermiddle;

assign s_top = leg[0]; //s1
assign s_uppermiddle = leg[1]; //s2

dead_time top 
(.clk(clk),
.S(s_top),
.s(out[0]),
.nots(out[2]) 
);


dead_time uppermiddle 
(.clk(clk),
.S(s_uppermiddle),
.s(out[1]),
.nots(out[3])
);

endmodule 