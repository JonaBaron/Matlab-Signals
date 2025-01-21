clc, clear, close all;

fs = 12000;
t = 0:1/fs:3-1/fs; 
signal = sin(100*t)+sin(2000*t)+sin(6000*t); 


figure(1)
subplot(4,1,1)
plot(signal(1:fs/2));
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');

fcutlow=1900;   %low cut frequency in Hz
fcuthigh=2100;   %high cut frequency in Hz
[b4,a4]=butter(4,[fcutlow,fcuthigh]/(fs/2),'bandpass');
filtered_signal_4th = filter(b4, a4, signal);

subplot(4,1,2)
plot(filtered_signal_4th);
xlabel('Time (s)');
ylabel('Amplitude');

%----------------------------------
Myfilter = IIR_Butter_8th;
[b8, a8] = tf(Myfilter);
filtered_signal_8th = filter(b8, a8, signal);

subplot(4,1,3)
plot(t, filtered_signal_8th);

w=-0.5:1/fs:0.5-1/fs;
freq_domain = abs(fftshift(fft(filtered_signal_8th(1:fs))));

