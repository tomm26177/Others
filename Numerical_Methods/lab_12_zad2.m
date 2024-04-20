clc
close all
clear all


x=linspace(0,4,1000);
fp=@(x) cos(x) - 2*sin(2*x);
f=@(x) sin(x) + cos(2*x);
d=fp(x);
fcs = { @(x,h) ((-3*f(x)+4*f(x+h)-f(x+2*h))/(2*h)) @(x,h) ((f(x+h)-f(x-h))/(2*h)) @(x,h) ((f(x-2*h)-4*f(x-h)+3*f(x))/(2*h)) };
h= [0.5,0.25,0.125];
m={'wprzod','centralny','wstecz'};
figure
k=1;
for i=1: length(fcs)
    for j=1:length(h)
        p=fcs{i}(x,h(j));
        mse=mean((d-p).^2);
        subplot(3,3,k)
        k=k+1;
        plot(p)
        title(sprintf('%s h=%f  blad=%f',m{i},h(j),mse))
        hold on
        plot(d)

    end
end