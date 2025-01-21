clc, clear, close all;

fs = 8192;
t = 0:1/fs:3-1/fs; 
x_1 = sin(2*pi*200*t); 
x_2 = sin(2*pi*330*t); 
x_3 = sin(2*pi*480*t); 

signal = zeros(size(t));

signal = signal + x_1;

signal(t > 1) = signal(t > 1) + x_2(t > 1);

signal(t > 2) = signal(t > 2) + x_3(t > 2);

subplot(4,1,1)
plot(t, signal);

w=-0.5:1/fs:0.5-1/fs;
freq_domain = fftshift(fft(signal(1:fs)));

subplot(4,1,2)
plot(w, abs(freq_domain));

%soundsc(signal,fs);

%--------------------------------------------------
% B
Myfilter = notch_filter;
a =Myfilter.Denominator;
b =Myfilter.Numerator;

filtered_signal = filter(b,a,signal);

subplot(4,1,3)
plot(t,filtered_signal);

filtered_signal_freq_domain = fftshift(fft(filtered_signal(1:fs)));

subplot(4,1,4)
plot(w, abs(filtered_signal_freq_domain));

soundsc(filtered_signal,fs);
[H, f] = freqz(b, a, 1024, fs);

figure(2)
subplot(2,1,1)
plot(f, abs(H)); 
title('Magnitude Response');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

subplot(2, 1, 2); 
plot(f, angle(H)); 
title('Phase Response');
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');
