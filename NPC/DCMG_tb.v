`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:09:38 09/10/2024 
// Design Name: 
// Module Name:    DCMG_tb 
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
module DCMG_tb(
    );
	 

// Inputs
reg clk;
reg ce;

reg [4:0] state;


// Outputs
wire [3:0] npc_outa;
wire [3:0] npc_outb;
wire [3:0] npc_outc;

wire interr;

// UUT
npc uut(
	.clk(clk),
	.state_npc(state),
	.npc_outa(npc_outa),
	.npc_outb(npc_outb),
	.npc_outc(npc_outc),
	.clk_int(interr)
    );


integer i;
initial begin
	// Initialize Inputs
	ce = 0;
	state = 0;
	// Wait 1 ms for global reset to finish
	#100;
	for (i = 0; i <= 27; i=i+1) begin
		#2000000;
		state = i;
		
	end

end

always begin //master clock 10ns
	clk = 1'b0;
	#5 clk = 1'b1;
	#5;
	end

endmodule
