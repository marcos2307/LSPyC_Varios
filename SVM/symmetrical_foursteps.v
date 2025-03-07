module symmetrical_foursteps(
    input clk, //10ns
    input ce,
    input [9:0] d1,
    input [9:0] d2,
    input [9:0] d3,
    input [9:0] d4,
    input [7:0] input_set,
    input [2:0] dir,
    input clamp_signal,
    output s1,
    output s2,
    output s3,
    output s4,
    output s5,
    output s6,
    output s7,
    output s8,
    output s9,
    output s10,
    output s11,
    output s12,
    output s13,
    output s14,
    output s15,
    output s16,
    output s17,
    output s18,
    output [7:0] r,
    output [7:0] g,
    output [7:0] b,
    output interrupt,
    output ninterrupt
    );

wire [7:0] v; //conecta la salida del patron simetrico con el decoder
wire [17:0] s;
wire [17:0] v_decoded;
reg state = 0;

reg [7:0] contador = 8'd0;
reg fastclock = 1'b0; 
always @(posedge clk) 
begin
    contador = contador + 1'b1;
    if(contador == 8'd100) begin //2us
        contador = 8'd0;
        fastclock = ~fastclock;
    end
end

reg [7:0] counter = 8'd0;
reg clock4us = 1'b0; 
always @(posedge fastclock) 
begin
    counter = counter + 1'b1;
    if(counter == 8'd5) begin //4us
        counter = 8'd0;
        clock4us = ~clock4us;
    end
end


assign ninterrupt = ~interrupt;

symmetrical test_symmetrical(
.clk(fastclock),
.ce(ce),
.d1(d1),
.d2(d2),
.d3(d3),
.d4(d4),
.input_set(input_set),
.v(v),
.interrupt(interrupt));
    
decoder dec1 (.clk(fastclock),
.in(v),
.out(v_decoded));

four_step fsa( .clk(fastclock),
.vnew(v_decoded[5:0]),
.dir(dir[0]),
.vout(s[5:0]));

four_step fsb ( .clk(fastclock),
.vnew(v_decoded[11:6]),
.dir(dir[1]),
.vout(s[11:6]));

four_step fsc( .clk(fastclock),
.vnew(v_decoded[17:12]),
.dir(dir[2]),
.vout(s[17:12]));

assign s1 = state ? 0:s[0];
assign s2 = state ? 0:s[1];
assign s3 = state ? 0:s[2];
assign s4 = state ? 0:s[3];
assign s5 = state ? 0:s[4];
assign s6 = state ? 0:s[5];
assign s7 = state ? 0:s[6];
assign s8 = state ? 0:s[7];
assign s9 = state ? 0:s[8];
assign s10 = state ? 0:s[9];
assign s11 = state ? 0:s[10];
assign s12 = state ? 0:s[11];
assign s13 = state ? 0:s[12];
assign s14 = state ? 0:s[13];
assign s15 = state ? 0:s[14];
assign s16 = state ? 0:s[15];
assign s17 = state ? 0:s[16];
assign s18 = state ? 0:s[17];
assign r = state ? 255:0;
assign g = state ? 0:255;
assign b = state ? 0:0;


always @(posedge clk) begin
      if(state == 0) state <= clamp_signal;
end

endmodule
