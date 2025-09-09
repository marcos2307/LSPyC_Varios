load('test_MG.mat');
t = test_MG.X(1).Data;
t2 = test_MG.X(2).Data;

iL2ref = test_MG.Y(1).Data;
dESS = test_MG.Y(2).Data;
dPV = test_MG.Y(3).Data;
P = test_MG.Y(4).Data;
vPandO = test_MG.Y(5).Data;
dVSI = test_MG.Y(6).Data;
iL3ref = test_MG.Y(7).Data;
vc1 = test_MG.Y(8).Data;
iL1 = test_MG.Y(9).Data;
iL2 = test_MG.Y(10).Data;
iL3 = test_MG.Y(11).Data;
iL4 = test_MG.Y(12).Data;
vc5 = test_MG.Y(13).Data;
vdc = test_MG.Y(14).Data;
vdcref = test_MG.Y(15).Data;
figure(1)
subplot(311)
plot(t,vdc);
hold on;
plot(t2,vdcref);
subplot(312);
plot(t,iL2);
hold on
plot(t,iL2ref);
subplot(313);
plot(t,dESS);


figure(2)
subplot(221)
plot(t,P);
subplot(222)
plot(t,iL1);
subplot(223)
plot(t,vc1);
hold on
plot(t,vPandO);
subplot(224)
plot(t,dPV);


figure(3)
subplot(311)
plot(t,iL3);
hold on
plot(t,iL3ref);
subplot(312)
plot(t,vc5);
subplot(313)
plot(t,iL4);

