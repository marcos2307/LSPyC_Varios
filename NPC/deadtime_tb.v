`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:46:50 06/05/2024
// Design Name:   deadtime
// Module Name:   C:/marcos/NPCMPC/deadtime_tb.v
// Project Name:  NPCMPC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: deadtime
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module deadtime_tb;

	// Inputs
	reg clk;
	reg sp;

	// Outputs
	wire [1:0] s;

	// Instantiate the Unit Under Test (UUT)
	deadtime uut (
		.clk(clk), 
		.sp(sp), 
		.s(s)
	);

	
	initial begin
		// Initialize Inputssp = 0;
		sp = 0;

		// Wait 100 ns for global reset to finish
		#23;
      sp = 1;
	   #30;
		sp = 0;
		// Add stimulus here

	end
	
	always begin
	clk = 1'b0;
	#5 clk = 1'b1;
	#5;
   end  
endmodule

