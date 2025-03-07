`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: FIUNA
// Engineer: Marcos Gómez
// 
// Create Date: 20.05.2024 21:15:57
// Design Name: 
// Module Name: symetrical
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module symmetrical(
input clk,
input ce,
input [9:0] d1,
input [9:0] d2,
input [9:0] d3,
input [9:0] d4,
input [7:0] input_set,
output reg [7:0] v,
output reg interrupt = 0
    );

reg [9:0] counter = {10{1'b0}};
reg [9:0] t0, t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12;

//contador
always @(posedge clk)begin
    counter <= counter + 1'b1;
    if(counter==500)
        counter <= 0;
    end
//set
reg [7:0] set;   
// ROMs de vectores
reg [7:0] v1;//{{8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00},{8'h15, 8'h06, 8'h11, 8'h13, 8'h0d, 8'h01, 8'h14, 8'h01, 8'h0d, 8'h13, 8'h11, 8'h06, 8'h15},{8'h14, 8'h10, 8'h03, 8'h15, 8'h06, 8'h11, 8'h13, 8'h11, 8'h06, 8'h15, 8'h03, 8'h10, 8'h14},{8'h13, 8'h02, 8'h0d, 8'h14, 8'h10, 8'h03, 8'h15, 8'h03, 8'h10, 8'h14, 8'h0d, 8'h02, 8'h13},{8'h15, 8'h0c, 8'h11, 8'h13, 8'h0e, 8'h07, 8'h14, 8'h07, 8'h0e, 8'h13, 8'h11, 8'h0c, 8'h15},{8'h14, 8'h10, 8'h09, 8'h15, 8'h0c, 8'h11, 8'h13, 8'h11, 8'h0c, 8'h15, 8'h09, 8'h10, 8'h14},{8'h13, 8'h08, 8'h0d, 8'h14, 8'h10, 8'h09, 8'h15, 8'h09, 8'h10, 8'h14, 8'h0d, 8'h08, 8'h13},{8'h15, 8'h0c, 8'h05, 8'h13, 8'h02, 8'h07, 8'h14, 8'h07, 8'h02, 8'h13, 8'h05, 8'h0c, 8'h15},{8'h14, 8'h04, 8'h09, 8'h15, 8'h0c, 8'h05, 8'h13, 8'h05, 8'h0c, 8'h15, 8'h09, 8'h04, 8'h14},{8'h13, 8'h08, 8'h01, 8'h14, 8'h04, 8'h09, 8'h15, 8'h09, 8'h04, 8'h14, 8'h01, 8'h08, 8'h13},{8'h15, 8'h12, 8'h05, 8'h13, 8'h02, 8'h0d, 8'h14, 8'h0d, 8'h02, 8'h13, 8'h05, 8'h12, 8'h15},{8'h14, 8'h04, 8'h0f, 8'h15, 8'h12, 8'h05, 8'h13, 8'h05, 8'h12, 8'h15, 8'h0f, 8'h04, 8'h14},{8'h13, 8'h0e, 8'h01, 8'h14, 8'h04, 8'h0f, 8'h15, 8'h0f, 8'h04, 8'h14, 8'h01, 8'h0e, 8'h13},{8'h15, 8'h12, 8'h0b, 8'h13, 8'h08, 8'h0d, 8'h14, 8'h0d, 8'h08, 8'h13, 8'h0b, 8'h12, 8'h15},{8'h14, 8'h0a, 8'h0f, 8'h15, 8'h12, 8'h0b, 8'h13, 8'h0b, 8'h12, 8'h15, 8'h0f, 8'h0a, 8'h14},{8'h13, 8'h0e, 8'h07, 8'h14, 8'h0a, 8'h0f, 8'h15, 8'h0f, 8'h0a, 8'h14, 8'h07, 8'h0e, 8'h13},{8'h15, 8'h06, 8'h0b, 8'h13, 8'h08, 8'h01, 8'h14, 8'h01, 8'h08, 8'h13, 8'h0b, 8'h06, 8'h15},{8'h14, 8'h0a, 8'h03, 8'h15, 8'h06, 8'h0b, 8'h13, 8'h0b, 8'h06, 8'h15, 8'h03, 8'h0a, 8'h14},{8'h13, 8'h02, 8'h07, 8'h14, 8'h0a, 8'h03, 8'h15, 8'h03, 8'h0a, 8'h14, 8'h07, 8'h02, 8'h13},{8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00}};
reg [7:0] v2;
reg [7:0] v3;
reg [7:0] v4;
reg [7:0] v5;
reg [7:0] v6;
reg [7:0] v7;


always @(posedge clk)
     case (set)
        8'h01: v1 <= 8'h15;
        8'h02: v1 <= 8'h14;
        8'h03: v1 <= 8'h13;
        8'h04: v1 <= 8'h15;
        8'h05: v1 <= 8'h14;
        8'h06: v1 <= 8'h13;
        8'h07: v1 <= 8'h15;
        8'h08: v1 <= 8'h14;
        8'h09: v1 <= 8'h13;
        8'h0a: v1 <= 8'h15;
        8'h0b: v1 <= 8'h14;
        8'h0c: v1 <= 8'h13;
        8'h0d: v1 <= 8'h15;
        8'h0e: v1 <= 8'h14;
        8'h0f: v1 <= 8'h13;
        8'h10: v1 <= 8'h15;
        8'h11: v1 <= 8'h14;
        8'h12: v1 <= 8'h13;
        default: ;
     endcase

always @(posedge clk)
         case (set)
            8'h01: v2 <= 8'h06;
            8'h02: v2 <= 8'h10;
            8'h03: v2 <= 8'h02;
            8'h04: v2 <= 8'h0c;
            8'h05: v2 <= 8'h10;
            8'h06: v2 <= 8'h08;
            8'h07: v2 <= 8'h0c;
            8'h08: v2 <= 8'h04;
            8'h09: v2 <= 8'h08;
            8'h0a: v2 <= 8'h12;
            8'h0b: v2 <= 8'h04;
            8'h0c: v2 <= 8'h0e;
            8'h0d: v2 <= 8'h12;
            8'h0e: v2 <= 8'h0a;
            8'h0f: v2 <= 8'h0e;
            8'h10: v2 <= 8'h06;
            8'h11: v2 <= 8'h0a;
            8'h12: v2 <= 8'h02;
            default: ;
         endcase
         
always @(posedge clk)
         case (set)
            8'h01: v3 <= 8'h11;
            8'h02: v3 <= 8'h03;
            8'h03: v3 <= 8'h0d;
            8'h04: v3 <= 8'h11;
            8'h05: v3 <= 8'h09;
            8'h06: v3 <= 8'h0d;
            8'h07: v3 <= 8'h05;
            8'h08: v3 <= 8'h09;
            8'h09: v3 <= 8'h01;
            8'h0a: v3 <= 8'h05;
            8'h0b: v3 <= 8'h0f;
            8'h0c: v3 <= 8'h01;
            8'h0d: v3 <= 8'h0b;
            8'h0e: v3 <= 8'h0f;
            8'h0f: v3 <= 8'h07;
            8'h10: v3 <= 8'h0b;
            8'h11: v3 <= 8'h03;
            8'h12: v3 <= 8'h07;
            default: ;
         endcase

always @(posedge clk)
         case (set)
            8'h01: v4 <= 8'h13;
            8'h02: v4 <= 8'h15;
            8'h03: v4 <= 8'h14;
            8'h04: v4 <= 8'h13;
            8'h05: v4 <= 8'h15;
            8'h06: v4 <= 8'h14;
            8'h07: v4 <= 8'h13;
            8'h08: v4 <= 8'h15;
            8'h09: v4 <= 8'h14;
            8'h0a: v4 <= 8'h13;
            8'h0b: v4 <= 8'h15;
            8'h0c: v4 <= 8'h14;
            8'h0d: v4 <= 8'h13;
            8'h0e: v4 <= 8'h15;
            8'h0f: v4 <= 8'h14;
            8'h10: v4 <= 8'h13;
            8'h11: v4 <= 8'h15;
            8'h12: v4 <= 8'h14;
            default: ;
         endcase
always @(posedge clk)
         case (set)
            8'h01: v5 <= 8'h0e;
            8'h02: v5 <= 8'h06;
            8'h03: v5 <= 8'h10;
            8'h04: v5 <= 8'h0e;
            8'h05: v5 <= 8'h0c;
            8'h06: v5 <= 8'h10;
            8'h07: v5 <= 8'h02;
            8'h08: v5 <= 8'h0c;
            8'h09: v5 <= 8'h04;
            8'h0a: v5 <= 8'h02;
            8'h0b: v5 <= 8'h12;
            8'h0c: v5 <= 8'h04;
            8'h0d: v5 <= 8'h08;
            8'h0e: v5 <= 8'h12;
            8'h0f: v5 <= 8'h0a;
            8'h10: v5 <= 8'h08;
            8'h11: v5 <= 8'h06;
            8'h12: v5 <= 8'h0a;
            default: ;
         endcase
 always @(posedge clk)
         case (set)
            8'h01: v6 <= 8'h01;
            8'h02: v6 <= 8'h11;
            8'h03: v6 <= 8'h03;
            8'h04: v6 <= 8'h07;
            8'h05: v6 <= 8'h11;
            8'h06: v6 <= 8'h09;
            8'h07: v6 <= 8'h07;
            8'h08: v6 <= 8'h05;
            8'h09: v6 <= 8'h09;
            8'h0a: v6 <= 8'h0d;
            8'h0b: v6 <= 8'h05;
            8'h0c: v6 <= 8'h0f;
            8'h0d: v6 <= 8'h0d;
            8'h0e: v6 <= 8'h0b;
            8'h0f: v6 <= 8'h0f;
            8'h10: v6 <= 8'h01;
            8'h11: v6 <= 8'h0b;
            8'h12: v6 <= 8'h03;
            default: ;
         endcase
         
 always @(posedge clk)
         case (set)
            8'h01: v7 <= 8'h14;
            8'h02: v7 <= 8'h13;
            8'h03: v7 <= 8'h15;
            8'h04: v7 <= 8'h14;
            8'h05: v7 <= 8'h13;
            8'h06: v7 <= 8'h15;
            8'h07: v7 <= 8'h14;
            8'h08: v7 <= 8'h13;
            8'h09: v7 <= 8'h15;
            8'h0a: v7 <= 8'h14;
            8'h0b: v7 <= 8'h13;
            8'h0c: v7 <= 8'h15;
            8'h0d: v7 <= 8'h14;
            8'h0e: v7 <= 8'h13;
            8'h0f: v7 <= 8'h15;
            8'h10: v7 <= 8'h14;
            8'h11: v7 <= 8'h13;
            8'h12: v7 <= 8'h15;
            default: ;
         endcase


//lógica de salida y calculos de tiempos
always @(posedge clk)
  case (counter)
     32'd0:
     begin
     interrupt = 1'b1;
     end
     32'd499:
     begin
     interrupt = 1'b0;
     end
     default:
     begin
     end
 endcase

always @(posedge clk)
  case (counter)
     32'd0:
     begin
        t0 = (500 - (d1 + d2 + d3 + d4));
        t1 = t0/6;
        t2 = t1 + d1/2;
        t3 = t2 + d2/2;
        t4 = t3 + t0/6;
        t5 = t4 + d3/2;
        t6 = t5 + d4/2;
        t7 = t6 + t0/3;
        t8 = t7 + d4/2;
        t9 = t8 + d3/2;
        t10 = t9 + t0/6;
        t11 = t10 + d2/2;
        t12 = t11 + d1/2;
        set = input_set;
     end
     t1 + 1:
     begin
        v = v2;
        end
     t2 + 1:
     begin
        v = v3;
     end
     t3 + 1:
     begin
         v = v4;
     end
     t4 + 1:
     begin
         v = v5;
     end
     t5 + 1:
     begin
         v = v6;
     end
     t6 + 1:
     begin
         v = v7;
     end
     t7 + 1:
     begin
         v = v6;
     end     
     t8 + 1:
     begin
         v = v5;
     end
     t9 + 1:
     begin
         v = v4;
     end
     t10 + 1:
     begin
         v = v3;
     end
     t11 + 1:
     begin
         v = v2;
     end
     t12 + 1:
     begin
         v = v1;
     end
     default:
        begin
        end
  endcase
  
  endmodule
 
