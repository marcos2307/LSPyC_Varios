`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:45:06 09/06/2024 
// Design Name: 
// Module Name:    dead_time 
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
module dead_time(
	input clk,
	input S,
	output reg s = 0,
	output reg nots = 0
    );

reg Sant = 0;

always@(posedge clk)
begin
	if (S != Sant) begin
		s = 0;
		nots = 0;
		end
	else begin
		s = S;
		nots = !S;
	end
	Sant = S;
end
endmodule
