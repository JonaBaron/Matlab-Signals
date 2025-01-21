clc,clear,close all;

fs=1800;
t=0:(1/fs):1;
x=sin(100*t)+sin(2000*t)+sin(6000*t);
x_fft = fft(x);

[b1,a1]=cheby1(4,1,[1900,2100]/(2*pi*(fs/2)),'bandpass');

x_filtered1=filter(b1,a1,x);
x_filtered_fft_1=fft(x_filtered1);

[b2,a2]=cheby1(8,1,[1900,2100]/(2*pi*(fs/2)),'bandpass');

x_filtered2=filter(b2,a2,x);
x_filtered_fft_2=fft(x_filtered2);

figure(1);

subplot(3,1,1);
plot(t,x);
title('Plot of  x(t)');

subplot(3,1,2);
plot(t,x_filtered1);
title('Plot of  x(t) for 4th order');

subplot(3,1,3);
plot(t,x_filtered2);
title('Plot of  x(t) for 8th order');

figure(2);

subplot(2,1,1);
plot(t,abs(x_fft));
title('Plot of Fourier Transform of x(t)');

subplot(2,1,2);
plot(t,abs(x_filtered_fft_2));
title('Plot of Fourier Transform of x(t) for 8th order');

figure(3);

% Magnitude response
[H1, f1] = freqz(b1, a1, 1024, fs);
[H2, f2] = freqz(b2, a2, 1024, fs);

plot(f1, abs(H1));
hold on;
plot(f2, abs(H2));
title('Magnitude Response of the Filters');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
legend('4th-order', '8th-order');