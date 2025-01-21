clc,clear,close all;
% Parameters
fs = 15000; % Sampling frequency
t = 0:1/fs:1-1/fs; % Time vector

% Input signal
x_t = sin(100*t) + sin(2000*t) + sin(6000*t);

% Frequency specifications
f_pass1 = 1900; 
f_pass2 = 2100; 
f_stop1 = 100;
f_stop2 = 6000; 

% Normalized frequencies
Wn_pass = [f_pass1 f_pass2]/(fs/2); % Normalized pass frequencies
Wn_stop1 = f_stop1/(fs/2); % Normalized lower stop frequency
Wn_stop2 = f_stop2/(fs/2); % Normalized upper stop frequency

% Design 4th-order Butterworth filter
[n1, Wn1] = buttord(Wn_pass, [Wn_stop1 Wn_stop2], 3, 40);
[b1, a1] = butter(4, Wn1, 'bandpass');

% Design 8th-order Butterworth filter
[n2, Wn2] = buttord(Wn_pass, [Wn_stop1 Wn_stop2], 3, 40);
[b2, a2] = butter(8, Wn2, 'bandpass');

% Filter the signal
y1 = filter(b1, a1, x_t);
y2 = filter(b2, a2, x_t);

% Magnitude response
[H1, f1] = freqz(b1, a1, 1024, fs);
[H2, f2] = freqz(b2, a2, 1024, fs);

y1_fft = abs(fftshift(fft(x_t(1:fs))));
y2_fft = abs(fftshift(fft(y2(1:fs))));

% Plotting
figure;
subplot(4,1,1);
plot(t, x_t(1:fs));
title('Input Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4,1,2);
plot(f1, abs(H1));
hold on;
plot(f2, abs(H2));
title('Magnitude Response of the Filters');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
legend('4th-order', '8th-order');

subplot(4,1,3);
plot(y1);
hold on;
plot(y2);
title('Filtered Signals');
xlabel('Time (s)');
ylabel('Amplitude');
legend('4th-order', '8th-order');

subplot(4,1,4);
plot(y1_fft);
hold on;
plot(y2_fft);
title('Fourier transform of the input signal and the output signal');
xlabel('Time (s)');
ylabel('Amplitude');
legend('original','8th-order');
