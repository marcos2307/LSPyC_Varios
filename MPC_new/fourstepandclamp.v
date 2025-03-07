module fourstepandclamp(
    input clk, //10ns
    input ce,
    input [4:0] v,
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
    output interrupt //60us-16666kHZ
    );

wire [17:0] s;
wire [17:0] v_decoded;
reg state = 0;
reg [6:0] counter = 7'd0;
reg clk_2u = 1'b0; //2us
reg [15:0] counter_int = 16'b0;
reg clk_int = 1'b0; //2*int_limit*2us

always @(posedge clk) 
begin
    counter = counter + 1'b1;
    if(counter == 7'd100) begin
        counter = 7'd0;
        clk_2u = ~clk_2u;
    end
end

always @(posedge clk_2u) 
begin
    counter_int = counter_int + 1'b1;
    if(counter_int >= 16'd10) begin
        counter_int = 16'd0;
        clk_int = ~clk_int;
    end
end
    
decoder d1 ( .clk(clk),
    .in(v),
    .out(v_decoded));

four_step fsa( .clk(clk_2u),
.vnew(v_decoded[5:0]),
.dir(dir[0]),
.vout(s[5:0]));

four_step fsb ( .clk(clk_2u),
.vnew(v_decoded[11:6]),
.dir(dir[1]),
.vout(s[11:6]));

four_step fsc( .clk(clk_2u),
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
//assign so = state ? 'b000000000000000000:s;

always @(posedge clk) begin
      if(state == 0) state <= clamp_signal;
end

assign interrupt = clk_int;

endmodule
