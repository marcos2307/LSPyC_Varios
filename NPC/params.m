%Carga
R = 7.5;
L = 10e-3;


%Vdc
Vdc = 50;
C = 170e-6;

% Tiempo de muestreo
Tm = 1/10000;

% Corriente de referencia
Amplitude = 1;

%Estados (en el mismo orden que en la fpga)
S = [-1 -1 -1;
    -1 -1 0;
    -1 -1 1;
    -1 0 -1;
    -1 0 0;
    -1 0 1;
    -1 1 -1;
    -1 1 0;       
    -1 1 1;
    0 -1 -1;
    0 -1 0;
    0 -1 1;
    0 0 -1;
    0 0 0;
    0 0 1;
    0 1 -1;
    0 1 0;
    0 1 1;
    1 -1 -1;
    1 -1 0;
    1 -1 1;
    1 0 -1;
    1 0 0;
    1 0 1;
    1 1 -1;
    1 1 0;
    1 1 1]

%sensores
%fixed_gain_ia = 1000*3*10;
fixed_gain_ia = 10/0.0373;
offset_ia = 0;
gain_ia = 1;

fixed_gain_ib = 10/0.0373;
offset_ib = 0;
gain_ib = 1;

fixed_gain_ic = 10/0.0373;
offset_ic = 0;
gain_ic = 1;

fixed_gain_vp = 10*100;
offset_vp = 0;
gain_vp = 1;

fixed_gain_vn = 10*100;
offset_vn = 0;
gain_vn = 1;

