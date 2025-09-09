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
module hb_inv(
	input clk,
    input ce,
	input [9:0] d_inv,
	output inv_s,
    output inv_nots,
	output reg clk_int
    );
    
	//reloj de 6us
	reg clock_6us;
	reg [9:0] counter = 0; //cuenta hasta 600 * 10ns = 6us

	always@(posedge clk)
		begin
			counter = counter + 1;
			if(counter == 1)
				clock_6us = 1;
			else if(counter == 300)
				clock_6us = 0;
			else if(counter == 600) //600 * 10ns = 6us
				counter = 0;
		end
	
	//generador de interrupcion
	reg [13:0] counter_int = 0; //cuenta 40 ciclos * 6us = 240us
	always@(posedge clock_6us)
		begin
			counter_int = counter_int + 1;
			if(counter_int == 1)
				clk_int = 1;
			else if(counter_int == 5)//30us
				clk_int = 0;
			else if(counter_int == 10)//60us
				counter_int = 0;
		end

	pwm_deadtime_VSI fpga_inv(
	.clk(clock_6us),
	.d(d_inv),
	.s(inv_s),
	.nots(inv_nots)
	);


endmodule
