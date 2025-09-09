clear

%% sensores
% tensiones
fixedgain_vc1 = 10*10000/(3*100*2.5);
gain_vc1 = 1;
offset_vc1 = -0.21;

fixedgain_vc2 = 10*10000/(3*100*2.5);
gain_vc2 = 1;
offset_vc2 = -0.17;

fixedgain_vc3 = 10*22000/(3*100*2.5);
gain_vc3 = 1;
offset_vc3 = 0.2;

fixedgain_vc4 = 10*22000/(3*100*2.5);
gain_vc4 = 1;
offset_vc4 = -0.05;

fixedgain_vc5 = 10*22000/(3*100*2.5);
gain_vc5 = 1;
offset_vc5 = -0.01;

% corrientes
fixedgain_i = 10*1000/(3*100);
gain_iL1 = 1;
offset_iL1 = 0.2;

gain_iL2 = 1;
offset_iL2 = 0.2;

gain_iL3 = 1;
offset_iL3 = -2e-3;

gain_iL4 = 1;
offset_iL4 = -2e-3;

Tf = 1/1000; %corte a 1000Hz para ac;
Tfdc = 1/20; %corte a 20Hz para dc;

%% parametros

T = 6e-6;
N = 10;
mind = 1;
maxd = N-1;

vi = 12;
vo = 40;

d_boost = 1 - (vi/vo);


L1 = 144e-3;
RsL1 = 45;
L2 = 144e-3;
RsL2 = 45;
L3 = 22.1e-3;%5.41e-3;
RsL3 = 0.4;%0.3;
L4 = 21.5e-3;%5.39e-3; 
RsL4 = 0.4;%0.4;

C1 = 4700e-6;
C2 = 4700e-6;
C3 = 3300e-6;
C4 = 3300e-6;
C5 = 100e-6;

R_bat = 82;
R_load = 5;
Rd = 390000;
Rch2 = 0.5;

cell_temperature = 45;
irradiance = 1000;

%% Inversor

% PR controller
w0 = 2*pi*50;
Kp = 0.5;
Ki = 1e-7;
% tustin implementation
wc = 60;
a1 = 4*Ki*N*T*wc;
b0 = (N*T)^2*w0^2 + 4*N*T*wc + 4;
b1 = 2*(N*T)^2*w0^2 - 8;
b2 = (N*T)^2*w0^2 - 4*N*T*wc + 4;
% reference
amp = 1;
freq = 50;

%% ESS
% control de tension en bus DC
v_dc_ref = 80;
Pv = 0.01;
Iv = 0.1;
Pi = 0.3;
Ii = 10;

%% PV
Ppv = 0.05;
Ipv = 0.01;