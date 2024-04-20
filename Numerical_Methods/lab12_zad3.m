clc
close all
clear all


x=linspace(0,5,1000);
fp=@(x) -16*cos(4*x);
f=@(x) cos(4*x)-(1/2)*x;
d=fp(x);
fcs = { @(x,h) (f(x+h)-2*f(x)+f(x-h))/h.^2 @(x,h)  (-f(x+(2*h))+16*f(x+h)-30*f(x)+16*f(x-h)-f(x-(2*h)))/(12*(h).^2) };
h= [1,0.5,0.25];
m={'trojpunktowy','pieciopunktowy'};
figure
k=1;
for i=1: length(fcs)
    for j=1:length(h)
        p=fcs{i}(x,h(j));
        mse=mean((d-p).^2);
        subplot(2,3,k)
        k=k+1;
        plot(p)
        title(sprintf('%s h=%f  blad=%f',m{i},h(j),mse))
        hold on
        plot(d)

    end
end