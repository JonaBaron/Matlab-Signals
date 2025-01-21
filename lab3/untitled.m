clc,clear,close all;

[x, Fs1] = audioread("Original.wav");

[y, Fs2] = audioread("Distorted.wav");


subplot(3,1,1)
plot(x);
title("Orginal wave");

subplot(3,1,2)
plot(y);
title("Distorted wave");
%----------------------------------
L = 44100;

sum = 0;

for k= 1:L 

    sum = sum + (x(k)-y(k))^2;

end;

MSE = (1/L) * sum
%----------------------------------
disp(MSE);

Y = fft(y);

subplot(3,1,3)
stem(Y)

