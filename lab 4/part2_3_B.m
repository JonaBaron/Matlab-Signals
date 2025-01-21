clc, clear;

from_sim = sim("q2");

[y_t,fs]=audioread('ELEC_364_lab_5_Audio_S.wav');
t=0:1/fs:1-1/fs;

y_f = fft(y_t(1:fs));
y_f_shift = fftshift(y_f);

subplot(4,1,1);
plot(t,y_t(1:fs));
title("Time domain of the original sample signal");

%------------------------------------------------

w=-0.5:1/fs:0.5-1/fs;

subplot(4,1,2);
plot(w , abs(y_f_shift));
title("Frequency domain of the original sample signal");

%------------------------------------------------
% Change factor!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
%------------------------------------------------
upsample_factor = 16;
fs_upsample = fs * upsample_factor;

t=0:1/fs_upsample:1-1/fs_upsample;

y_sim = from_sim.audio_down_sampled;

subplot(4,1,3)
plot(t, y_sim(1:fs_upsample));
title("Time domain of the down sample signal");

%------------------------------------------------

w=-0.5:1/fs_upsample:0.5-1/fs_upsample;

ys_f = fft(y_sim(1:fs_upsample));
ys_f_shift = fftshift(ys_f);


subplot(4,1,4)
plot(w , abs(ys_f_shift));
title("Frequency domain of the down sample signal");







