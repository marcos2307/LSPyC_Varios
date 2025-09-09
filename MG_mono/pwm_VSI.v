`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:04:16 09/06/2024 
// Design Name: 
// Module Name:    PWM 
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
module pwm_VSI(
input clk,
input en,
input [9:0] d,
output reg S
    );

reg [9:0] counter = 0;
reg [9:0] d_stored = 0;

always@(posedge clk) begin
	counter = counter + 1;
	if(counter == 10) begin //no necesariamente coincide con la interrupción 10*6us
		counter = 0;
		d_stored = d;
	end
end

always@(posedge clk) begin
	if(d_stored > counter) begin
		S = 1;
	end
	else begin
		S = 0;
	end
end

endmodule
