clear

%% sensores
% tensiones
fixedgain_vc1 = 10*10000/(3*100*2.5);
gain_vc1 = 1;
offset_vc1 = -0.2;

fixedgain_vc2 = 10*10000/(3*100*2.5);
gain_vc2 = 1;
offset_vc2 = -0.4;

fixedgain_vc3 = 10*22000/(3*100*2.5);
gain_vc3 = 1;
offset_vc3 = -0.6;

fixedgain_vc4 = 10*22000/(3*100*2.5);
gain_vc4 = 1;
offset_vc4 = -0.7;

fixedgain_vc5 = 10*22000/(3*100*2.5);
gain_vc5 = 1;
offset_vc5 = 1.6;

% corrientes
fixedgain_i = 10*1000/(3*100);
gain_iL1 = 1;
offset_iL1 = 0.22;

gain_iL2 = 1;
offset_iL2 = 0.275;

gain_iL3 = 1;
offset_iL3 = 0.12;

gain_iL4 = 1;
offset_iL4 = 0.136;

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
L3 = 13e-3;
RsL3 = 0.1;%0.3;
L4 = 10e-3;%5.39e-3; 
RsL4 = 0.1;%0.4;

C1 = 4700e-6;
C2 = 4700e-6;
C3 = 3300e-6;
C4 = 3300e-6;
C5 = 100e-6;

R_bat = 82;
R_load = 7.5;
Rd = 390000;
Rch2 = 0.5;

cell_temperature = 45;
irradiance = 1000;

%% Inversor

% PR controller
w0i = 2*pi*50;
Kpi = 1;
Kii = 10;
% tustin implementation
wci = 50;
a1i = 4*Kii*N*T*wci;
b0i = (N*T)^2*w0i^2 + 4*N*T*wci + 4;
b1i = 2*(N*T)^2*w0i^2 - 8;
b2i = (N*T)^2*w0i^2 - 4*N*T*wci + 4;
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