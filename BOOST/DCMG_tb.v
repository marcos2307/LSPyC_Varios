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

reg [9:0] d_hb;
reg [9:0] d_boost;



// Outputs
wire [3:0] NPC_outa;
wire [3:0] NPC_outb;
wire [3:0] NPC_outc;

wire HALF_s, HALF_nots;
wire BOOST_s, BOOST_nots;
wire interr;

// UUT
boost uut(
	.clk(clk),
    .ce(ce),
	.d_boost(d_boost),
	.boost_s(boost_s),
	.boost_nots(boost_nots),
	.clk_int(clk_int)
    );


integer i;
initial begin
	// Initialize Inputs
	ce = 0;
	state = 0;
	d_hb = 0;
	d_boost = 0;
	
	// Wait 1 ms for global reset to finish
	#100;
	for (i = 0; i <= 27; i=i+1) begin
		#2000000;
		state = i;
		d_hb = 37*i;
		d_boost = 20*i;
		
	end

end

always begin //master clock 10ns
	clk = 1'b0;
	#5 clk = 1'b1;
	#5;
	end

endmodule
