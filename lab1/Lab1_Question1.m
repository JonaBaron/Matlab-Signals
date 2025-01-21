clc;clear,close all

n = 0:9;
x = n;
x2 =sin(((2*pi)/10)*n);
y = x.^2;
y2 = x2.^2;
Ex=0;
Ey=0;

 for i = 1:10
    Ex = Ex + x(i)^2 ;
    Ey = Ey + y(i)^2 ;
 end; 

disp("Energy of signal X[N] =")
disp(Ex)
disp("Energy of signal Y[N] =")
disp(Ey)

subplot(2,2,1);
hold on;
stem(n,y,'r');
xlabel("N");
ylabel("Y[N]");
hold off;

subplot(2,2,3);
hold on;
stem(n, x , 'b');
xlabel("N");
ylabel("X[N]");
hold off;

subplot(2,2,2);
hold on;
stem(n,y2,'r');
xlabel("N");
ylabel("Y[N]");
hold off;

subplot(2,2,4);
hold on;
stem(n, x2 , 'b');
xlabel("N");
ylabel("X[N]");
hold off;