clc
close all
clear all

x=linspace(0,6,1000);
fp = @(x) -sin(2*x)*2;
f= @(x) cos(2*x);
d=fp(x);
fcs = {@(x,h) (f(x+h)-f(x))/h @(x,h) (f(x+h)-f(x-h))/(2*h) @(x,h) (-(f(x+(2*h)))+(8*f(x+h))-(8*f(x-h))+f(x-(2*h)))/12*h };
h= [1,0.5,0.25];
m={'2pkt','3pkt','5pkt'};
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
