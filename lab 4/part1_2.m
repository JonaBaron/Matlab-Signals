%40210330
%Jonathan Mehmannavaz
clc;clear;close all;

Myfunc= Butterworth_q2;

[b,a]=sos2tf(Myfunc.sosMatrix,Myfunc.ScaleValues);

subplot(2,1,1);
zplane(b,a);

subplot(2,1,2);
zplane(round(b),round(a));