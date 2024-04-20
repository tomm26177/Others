clc 
clear all
close all

wybor=1;

switch wybor
    case 1
        f=@(x) cos(x);
        a=0;
        b=2;
    case 2
        f=@(x) 2.^(-x)+ exp(x)+2.*cos(x)-6;
        a=1;
        b=3;
    case 3
        f=@(x) (x+2).^(5);
        a=(-3);
        b=0;


end

tol = 10^(-5);
ftol = 10^(-4);

[xb,nb] = bisekcja(f,a,b,tol,ftol)


[xf,nf] = falsi(f,a,b,tol,ftol)

t = a:0.01:b;
plot(t,f(t))
hold on;
plot(xb, f(xb),'ro')
plot(xf, f(xf),'rx')

function[xb,nb] = bisekcja(f,a,b,tol,ftol)


assert(f(a).*f(b)<0,"nie ma pierwiastkow");
nb=0;
while 1
xb= (a+b)/2;



if abs(f(xb))<=ftol
    return
end



if f(a).*f(xb)<0
 b=xb;
else
    a=xb;
end
nb=nb+1;
end

end



function[xf,nf] = falsi(f,a,b,tol,ftol)

assert(f(a).*f(b)<0,"nie ma pierwiastkow");
nf=1;
xs=a;
xf=b;
while 1
xf= a-(f(a).*(b-a) / (f(b)-f(a)));


if abs(f(xf))<=ftol
    return
end


if f(a).*f(xf)<0
 b=xf;
else
    a=xf;
end


nf=nf+1;
end
end


