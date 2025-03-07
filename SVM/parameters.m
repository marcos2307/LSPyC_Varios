clear;
clc;
%parametros
fixed_io_gain = 175;
ioa_gain = 1;
ioa_offset = -39.67;
iob_gain = 1;
iob_offset = -40.05;
ioc_gain = 1;
ioc_offset = -39.51;

fixed_vi_gain = 5800;
via_gain = 1;
via_offset = -836.4;
vib_gain = 1;
vib_offset = -854.9;
vic_gain = 1;
vic_offset = -852.3;

fixed_vclamp_gain = 1000;
vclamp_gain = 1;
vclamp_offset = -0.9;

threshold = 100;


%SVM
phi = 0;
N = 500;
T = N*2e-6; %debe coincidir con el definido por la FPGA

%Matriz de estados del DMC
S(:,:,1) =	[1,0,0;0,1,0;0,1,0]; %+1
S(:,:,2) =	[0,1,0;1,0,0;1,0,0]; %-1

S(:,:,3) =	[0,1,0;0,0,1;0,0,1]; %+2
S(:,:,4) =	[0,0,1;0,1,0;0,1,0]; %-2

S(:,:,5) =  [0,0,1;1,0,0;1,0,0]; %+3
S(:,:,6) =  [1,0,0;0,0,1;0,0,1]; %-3

S(:,:,7) =  [0,1,0;1,0,0;0,1,0]; %+4
S(:,:,8) =  [1,0,0;0,1,0;1,0,0]; %-4

S(:,:,9) =  [0,0,1;0,1,0;0,0,1]; %+5
S(:,:,10) =  [0,1,0;0,0,1;0,1,0];%-5

S(:,:,11) =  [1,0,0;0,0,1;1,0,0];%+6
S(:,:,12) =  [0,0,1;1,0,0;0,0,1];%-6

S(:,:,13) =  [0,1,0;0,1,0;1,0,0];%+7
S(:,:,14) =  [1,0,0;1,0,0;0,1,0];%-7

S(:,:,15) =  [0,0,1;0,0,1;0,1,0];%+8
S(:,:,16) =  [0,1,0;0,1,0;0,0,1];%-8

S(:,:,17) =  [1,0,0;1,0,0;0,0,1];%+9
S(:,:,18) =  [0,0,1;0,0,1;1,0,0];%-9

S(:,:,19) =  [1,0,0;1,0,0;1,0,0];%0a
S(:,:,20) =  [0,1,0;0,1,0;0,1,0];%0b
S(:,:,21) =  [0,0,1;0,0,1;0,0,1];%0c

S(:,:,22) =  [1,0,0;0,1,0;0,0,1];%abc
S(:,:,23) =  [0,0,1;1,0,0;0,1,0];%cab
S(:,:,24) =  [0,1,0;0,0,1;1,0,0];%bca
S(:,:,25) =  [1,0,0;0,0,1;0,1,0];%acb
S(:,:,26) =  [0,1,0;1,0,0;0,0,1];%bac
S(:,:,27) =  [0,0,1;0,1,0;1,0,0];%cba
