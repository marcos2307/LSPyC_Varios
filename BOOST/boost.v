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
module boost(
	input clk,
    input ce,
	input [9:0] d_boost,
	output boost_s,
	output boost_nots,
	output reg clk_int
    );

	//reloj de 4us
	reg clock_4us;
	reg [7:0] counter = 0; //cuenta hasta 200 * 10ns = 2us

	always@(posedge clk)
		begin
			counter = counter + 1;
			if(counter == 1)
				clock_4us = 1;
			else if(counter == 200)
				clock_4us = 0;
			else if(counter == 400) //200 * 10ns = 4us
				counter = 0;
		end
	
	//generador de interrupcion
	reg [13:0] counter_int = 0; //cuenta hasta 10
	always@(posedge clock_4us)
		begin
			counter_int = counter_int + 1;
			if(counter_int == 1)
				clk_int = 1;
			else if(counter_int == 250)
				clk_int = 0;
			else if(counter_int == 500)//2ms
				counter_int = 0;
		end

	pwm_deadtime fpga_boost(
	.clk(clock_4us),
	.d(d_boost),
	.s(boost_s),
	.nots(boost_nots)
	);


endmodule
