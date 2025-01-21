clc,clear,close all

n = 0:10;

x1 = sin(((2*pi)/10)*n);
x2 = cos(((2*pi)/10)*n);

y1 = 2*x1;
y2 = 2*x2;

x3 = x1+ x2;
y3= 2*x3;

y4 = y1+y2;

if(y3 == (y1+y2))
disp("Outputs are consistant with a linear system")
else
disp("System is not linear")
end;

subplot(2,2,1)
hold on
title(['x_{' num2str(1) '}[N] & y_{' num2str(1) '}[N]'])
stem(n,x1, 'b')
stem(n, y1,'r')
legend('x[N]','y[N]')
xlabel("N")
ylabel('x[N]/y[N]')
hold off

subplot(2,2,2)
hold on
title(['x_{' num2str(2) '}[N] & y_{' num2str(2) '}[N]'])
stem(n,x2, 'b')
stem(n, y2,'r')
legend('x[N]','y[N]')
xlabel("N")
ylabel('x[N]/y[N]')
hold off

subplot(2,2,3)
hold on
title(['x_{' num2str(3) '}[N] & y_{' num2str(3) '}[N]'])
stem(n,x3, 'b')
stem(n, y3,'r')
legend('x[N]','y[N]')
xlabel("N")
ylabel('x[N]/y[N]')
hold off

subplot(2,2,4)
hold on
title([ 'y_{' num2str(3) '}[N] & y_{' num2str(4) '}[N]'])
stem(n, y3,'k')
stem(n, y4,'r')
legend('y_{3}[N]',' y_{4}[N]')
xlabel("N")
ylabel('y[N]')
hold off