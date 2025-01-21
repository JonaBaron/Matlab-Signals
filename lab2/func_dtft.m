function result = func_dtft(x)
global n w 
for i = 1: length(w);
    sum = 0;
    for k = 1: length(n);
        sum = sum + x(k)*exp(-j*w(i)*n(k));
    end
    result(i)=sum;
end