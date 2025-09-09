`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:08:40 06/05/2024 
// Design Name: 
// Module Name:    state_decoder 
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
module state_decoder(
input [4:0] state,
output [1:0] leg_a,
output [1:0] leg_b,
output [1:0] leg_c
    );
reg [5:0] legs;

assign leg_a = {legs[1], legs[0]};
assign leg_b = {legs[3], legs[2]};
assign leg_c = {legs[5], legs[4]};

always @(*)
		case (state)		//c b a     <- fases, donde LSB es s1 y MSB es s10
			1   : legs <= 6'b000000; //nnn
			2   : legs <= 6'b000010; //nn0
			3   : legs <= 6'b000011; //nnp
			4   : legs <= 6'b001000; //n0n
			5   : legs <= 6'b001010; //n00
			6   : legs <= 6'b001011; //n0p
			7   : legs <= 6'b001100; //npn
			8   : legs <= 6'b001110; // y asi sucesivamente
			9   : legs <= 6'b001111;
			10  : legs <= 6'b100000;
			11  : legs <= 6'b100010;
			12  : legs <= 6'b100011;
			13  : legs <= 6'b101000;
			14  : legs <= 6'b101010;
			15  : legs <= 6'b101011;
			16  : legs <= 6'b101100;
			17  : legs <= 6'b101110;
			18  : legs <= 6'b101111;
			19  : legs <= 6'b110000;
			20  : legs <= 6'b110010;
			21  : legs <= 6'b110011;
			22  : legs <= 6'b111000;
			23  : legs <= 6'b111010;
			24  : legs <= 6'b111011;
			25  : legs <= 6'b111100;
			26  : legs <= 6'b111110;
			27  : legs <= 6'b111111;
			default : legs <= 6'b101010;
		endcase

endmodule
