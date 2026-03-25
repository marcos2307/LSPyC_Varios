`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:52:04 06/05/2024
// Design Name:   legdeadtime
// Module Name:   C:/marcos/NPCMPC/legdeadtime_tb.v
// Project Name:  NPCMPC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: legdeadtime
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module legdeadtime_tb;

	// Inputs
	reg clk;
	reg ce;
	reg [1:0] leg;

	// Outputs
	wire [3:0] out;

	// Instantiate the Unit Under Test (UUT)
	legdeadtime uut (
		.clk(clk), 
		.ce(ce), 
		.leg(leg), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		ce = 0;
		leg = 0; //-
		//#34;
		//leg = 1; //(no valido)
		#34;
		leg = 2; // (0)
		#34;
		leg = 3; //+
		#34;
		leg = 0;
      #34;
		leg = 3;
		#34;
		leg = 2;
		#34;
		leg = 0;

	end
   
		
	always begin
	clk = 1'b0;
	#5 clk = 1'b1;
	#5;
   end  
endmodule

