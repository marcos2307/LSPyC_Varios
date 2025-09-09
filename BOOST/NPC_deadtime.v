`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:03:32 06/05/2024 
// Design Name: 
// Module Name:    NPC_deadtime 
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
module NPC_deadtime(
input clk,
input [4:0] state,
output [3:0] out_a,
output [3:0] out_b,
output [3:0] out_c
);
	 
wire [1:0] leg_a;
wire [1:0] leg_b;
wire [1:0] leg_c;

state_decoder dec(
.state(state),
.leg_a(leg_a),
.leg_b(leg_b),
.leg_c(leg_c)
 );

legdeadtime dt_leg_a
(.clk(clk),
.leg(leg_a),
.out(out_a)
);

legdeadtime dt_leg_b
(.clk(clk),
.leg(leg_b),
.out(out_b)
);

legdeadtime dt_leg_c
(.clk(clk),
.leg(leg_c),
.out(out_c)
);

endmodule
