module four_step(
input clk,
input [5:0] vnew,
input dir,
output reg [5:0] vout
);

reg [2:0] S = 3'b000; //state
reg [2:0] Snew = 3'b000; //new state
reg [5:0] vold = 'b000011; // old input

//next state
always @(S or dir or vnew or vold)
    case(S)
    0:
    if( (vnew!=vold) & ~dir ) Snew = 1;
    else if ( (vnew!=vold) & dir) Snew = 4;
    else Snew = 0;
    1:
    Snew = 2;
    2:
    Snew = 3;
    3:
    Snew = 0;
    4:
    Snew = 5;
    5:
    Snew = 6;
    6:
    Snew = 0;
    7:
    Snew = 0;
endcase

always @(S)
    if(S==3 || S==6) vold = vnew;

always @(posedge clk)
   S=Snew;

always @(S)
    case (S)
    0: 
        vout = vold;
    1: 
        vout = vold & 6'b010101;
    2: 
        vout = (vold & 6'b010101) | (vnew & 6'b010101);
    3: 
        vout = vnew & 6'b010101;
    4:
        vout = vold & 6'b101010;
    5:
        vout = (vold & 6'b101010) | (vnew & 6'b101010);
    6:
        vout = vnew & 6'b101010;
    7:
        vout = vold;
    endcase
endmodule
    


