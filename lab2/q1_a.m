clc,clear,close all

global w n;

period = input("the number of periods: ");
step_size = input("the step size: ");


w = [ -period *pi : step_size : period*pi ];

for i = 1:5
    N= floor(input("the sampling rate in terms of the number of times of the Nyquist rate: ")) * 2;
    n = 0: 2*N-1;
    x = sin( (2*pi)/N * n);
    
    x_dtft = func_dtft(x)

    subplot(2,1,1)
    stem(x)

    subplot(2,1,2)
    plot(w, abs(x_dtft))

end;


