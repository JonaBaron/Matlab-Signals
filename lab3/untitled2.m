clc,clear,close all;

% Load the audio files
[x, Fs] = audioread('Original.wav');
[y, ~] = audioread('Distorted.wav');

% Plot the original and distorted signals
figure;
subplot(2,1,1);
plot(x);
title('Original Signal');
xlabel('Sample Number');
ylabel('Amplitude');

subplot(2,1,2);
plot(y);
title('Distorted Signal');
xlabel('Sample Number');
ylabel('Amplitude');

% Compute the MSE between the original and distorted signals
L = length(x); % Number of samples
MSE = sum((x - y).^2) / L;
fprintf('MSE between Original and Distorted signal: %f\n', MSE);

% Transform the signals to the frequency domain
X = fft(x);
Y = fft(y);

% Compute the magnitude spectrum
f = (0:L-1)*(Fs/L); % Frequency vector

figure;
subplot(2,1,1);
plot(f, abs(X));
title('Original Signal Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

subplot(2,1,2);
plot(f, abs(Y));
title('Distorted Signal Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% Design a low-pass filter in the frequency domain
cutoff_freq = 4999; % Cutoff frequency in Hz
H = ones(size(Y)); % Initialize the filter
H(f > cutoff_freq) = 0; % Zero out frequencies above the cutoff

% Apply the filter to the distorted signal in the frequency domain
Y_filtered = Y .* H;

figure;
subplot(2,1,1);
plot(f, abs(H));
title('Frequency Domain Filter');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

subplot(2,1,2);
plot(f, abs(Y_filtered));
title('Filtered Distorted Signal Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% Transform the filtered signal back to the time domain
recovered_signal = ifft(Y_filtered, 'symmetric');

% Save the recovered signal
audiowrite('Recovered.wav', recovered_signal, Fs);

% Compute the MSE between the original and recovered signals
MSE_recovered = sum((x - recovered_signal).^2) / L;
fprintf('MSE between Original and Recovered signal: %f\n', MSE_recovered);

% Check for improvement
if MSE_recovered < MSE
    fprintf('The recovery system improved the MSE.\n');
else
    fprintf('The recovery system did not improve the MSE.\n');
end
