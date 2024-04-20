clc 
clear all
close all

wybor=4;

switch wybor
    case 1
        f=@(x) exp(x-1)-2 ;
        a=-1;
        b=2;
    case 2
        f=@(x) 2.^(-x) + exp(x) + 2.*cos(x)-6;
        a=1;
        b=3;
    case 3
        f=@(x) log(x+2./3);
        a=(-1./2);
        b=2;
    case 4
        f=@(x) x.^(3) -2.*x - 5
        a=0;
        b=3;


end

tol = 10^(-5);
ftol = 10^(-4);

[xb,nb] = sieczne(f,a,b,tol,ftol)


[xf,nf] = styczne(f,a,b,tol,ftol)

t = a:0.01:b;
plot(t,f(t))
hold on;
plot(xb, f(xb),'ro')
plot(xf, f(xf),'rx')

function[xb,nb] = sieczne(f,a,b,tol,ftol)


assert(f(a).*f(b)<0,"nie ma pierwiastkow");
nb=0;

h=2.^(-16);
if sign(f(a)) == sign((f(a+h)-2.*f(a)+f(a-h))./(h.^2))
    x0=a;
    x1=b;
else 
 x0=b;
 x1=a;
end

while 1

xb=x1-(f(x1).*(x1-x0)./(f(x1)-f(x0)));

if abs(f(xb))<=ftol
    return
end

if abs(x1-x0)<=tol
    return
end




x0=x1;
x1=xb;

nb=nb+1;
end

end



function[xf,nf] = styczne(f,a,b,tol,ftol)


assert(f(a).*f(b)<0,"nie ma pierwiastkow");
nf=0;
h=2.^(-16);

if sign(f(a)== sign((f(a+h)-2.*f(a)+f(a-h))./(h.^2)))
x0=a;
else
x0=b;
end


while 1
xf = x0 - f(x0)./( (f(x0+h)-f(x0-h))./(2.*h) )


if abs(f(xf))<=ftol
    return
end

if abs(xf-x0)<=tol
    return
end



x0=xf;

nf=nf+1;
end
end
