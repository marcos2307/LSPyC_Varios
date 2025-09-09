`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:03:55 06/05/2024
// Design Name:   NPC_deadtime
// Module Name:   C:/marcos/NPCMPC/NPC_tb.v
// Project Name:  NPCMPC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: NPC_deadtime
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module NPC_tb;

	// Inputs
	reg clk;
	reg ce;
	reg [4:0] state;

	// Outputs
	wire [3:0] out_a;
	wire [3:0] out_b;
	wire [3:0] out_c;

	// Instantiate the Unit Under Test (UUT)
	NPC_deadtime uut (
		.clk(clk), 
		.state(state), 
		.out_a(out_a), 
		.out_b(out_b), 
		.out_c(out_c)
	);
	integer i;
	initial begin
		// Initialize Inputs
		state = 0;

		// Wait 100 ns for global reset to finish
		#100;
		for (i = 0; i <= 27; i=i+1) begin
			#2000000;
			state = i;
		end
	
	end
	
	always begin
		clk = 1'b0;
		#1000 clk = 1'b1;
		#1000;
	end

endmodule

