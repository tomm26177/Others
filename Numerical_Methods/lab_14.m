clc
close
clearvars
 
wybor = 3;
 
switch wybor
case 1
f=@(x1,x2) x1.^2 + x2.^2;
x1p=-10;
x1k=10;
x2p=-10;
x2k=10;
x10=8;
x20=-10;
krok = 1;
case 2
f=@(x1,x2) -cos(x1).*cos(x2).*exp(-((x1-pi).^2+(x2-pi).^2));
x1p=2;
x1k=4;
x2p=2;
x2k=4;
x10=2;
x20=2;
krok = 0.1;
case 3
f=@(x1,x2) (1-8*x1+7*x1.^2-7/3*x1.^3+1/4*x1.^4).*(x2.^2.*exp(-x2));
x1p=0;
x1k=5;
x2p=0;
x2k=5;
x10=5;
x20=5;
krok = 0.2;

case 4
f=@(x1,x2) (1-x1).^2+100*(x2-x1.^2).^2;
x1p=-2;
x1k=2;
x2p=-1;
x2k=4;
x10=-2;
x20=3;
krok=1;
otherwise
f=@(x1,x2) -cos(x1).*cos(x2).*exp(-((x1-pi).^2+(x2-pi).^2));
x1p=1;
x1k=5;
x2p=1;
x2k=5;
x10=1.5;
x20=5;
krok = 0.5;

end
 
eps = 1e-4;
 
[x1, x2, dx1, dx2, it] = sww(f, x10, x20, krok, eps, x1p, x1k, x2p, x2k)
 
subplot(2,1,1)
[x,y]=meshgrid(linspace(x1p,x1k));
mesh(x,y,f(x,y));
hold on
 
subplot(2,1,2);
z=f(x,y);
[c,h]=contour(x,y,z);
clabel(c,h);
hold on
 
plot(x10,x20, 'r*');
text(x10,x20 , 'Start');
 
plot(x1,x2, 'r*');
text(x1 ,x2 , 'Stop');

line([dx1],[dx2],'Color', 'k', 'Linewidth', 1);

 
 
 
 
 
function [x1, x2, dx1, dx2, it] = sww(f, x10, x20, krok, eps, x1p, x1k, x2p, x2k)
 
 
e = [ 1 0 -1 0  1/(sqrt(2)) -1/(sqrt(2)) 1/(sqrt(2)) -1/(sqrt(2)) sqrt(3)/2 -sqrt(3)/2  sqrt(3)/2 -sqrt(3)/2
      0 1 0 -1  1/(sqrt(2)) 1/(sqrt(2))  -1/(sqrt(2)) -1/(sqrt(2)) 1/2  1/2 -1/2 -1/2];
 
dx1 = [x10];
dx2 = [x20];
fx = zeros(1, size(e,2));
f0 = f(x10, x20);
it = 0;
 
while 1
    for i = 1: size(e,2)
        fx(i) = f(x10 + e(1,i) * krok, x20 + e(2,i) * krok);
    end
    it = it + 1;
 
    [f1, i] = min(fx);
 
    if f1 >= f0
    x1 = x10;
    x2 = x20;

     if krok > eps
     krok=krok/2
     continue;
     end

    return;
    end

   
   
 
    f0 = f1;
    x10 = x10 + e(1,i)*krok;
    x20 = x20 +e(2,i)*krok;
    dx1(end+1) = x10;
    dx2(end+1) = x20;
 
end
end