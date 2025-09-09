`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:36:11 09/06/2024 
// Design Name: 
// Module Name:    PWM_deadtime 
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
module pwm_deadtime(
input clk,
input [9:0] d,
output s,
output nots
    );


wire S;


pwm pwm1(
.clk(clk),
.d(d),
.S(S)
 );
 
dead_time dt1(.clk(clk),
	.S(S),
	.s(s),
	.nots(nots));

endmodule
