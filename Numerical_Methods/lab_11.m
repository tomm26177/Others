clc
clear all

xg = [0,20,40,60,70,90,110,120,140,150];
yg = [0,30,20,8,11,20,16,20,30,0];

xd = [0,20,45,80,100,120,150];
yd = [0,-30,-20,-8,-15,-40,0];


fg = griddedInterpolant(xg,yg,'spline');
fd = griddedInterpolant(xd,yd,'spline');

x = linspace(0,150,1000);
plot(x,fg(x),x,fd(x));
h=20;
calka(fg,0,150,h) - calka(fd,0,150,h)

function S = calka(f,a,b,h)
S=0;

for x=a:h:b-h
    S=S+ (h*f(x)) ;
    patch([x,x+h,x+h,x],[0,0,f(x),f(x)],'y')


if x+h>b
    x=x+h;
    c=b-x;
  S=S+ c*f(x);
    patch([x,x+c,x+c,x],[0,0,f(x),f(x)],'y')
    return;

end

end




end