`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:10:56 09/10/2024 
// Design Name: 
// Module Name:    DCMG 
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
module npc(
	input clk,
	input ce,
	input [4:0] state_npc,
	output [3:0] npc_outa,
	output [3:0] npc_outb,
	output [3:0] npc_outc,
	output reg clk_int
    );

	//reloj de 2us
	reg clock_2us;
	reg [7:0] counter = 0; //cuenta hasta 200 * 10ns = 2us

	always@(posedge clk)
		begin
			counter = counter + 1;
			if(counter == 1)
				clock_2us = 1;
			else if(counter == 99)
				clock_2us = 0;
			else if(counter == 200) //200 * 10ns = 2us
				counter = 0;
		end
	
	//generador de interrupcion
	reg [11:0] counter_int = 0; //cuenta hasta 50
	always@(posedge clock_2us)
		begin
			counter_int = counter_int + 1;
			if(counter_int == 1)
				clk_int = 1;
			else if(counter_int == 25)
				clk_int = 0;
			else if(counter_int == 50)//20us
				counter_int = 0;
		end

	// Instantiate npc module
	npc_deadtime fpga_npc(
		.clk(clock_2us),  
		.state(state_npc), 
		.out_a(npc_outa), 
		.out_b(npc_outb), 
		.out_c(npc_outc)
	);


endmodule
