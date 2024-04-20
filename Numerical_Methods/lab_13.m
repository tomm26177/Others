clc 
close all
clear all

wybor=3;

switch wybor 
    case 1
        f = @(x) x.^2 -x;
        a= 0.25;
        b=0.75;
    case 2
        f = @(x) (1/3)*x.^2 - (13/7)*x +11;
        a= -10;
        b= 10;
    case 3
        f = @(x) x.^(4) - 12*x.^(3) + x +4 ;
        a= -2;
        b= 2;

    otherwise
         f = @(x) -x.^(3) + 3*x.^(2) + 3*x ;
        a= -2;
        b= -1;

end




eps = 1e-4;

[x1,n1]=polowienia(f,a,b,eps)

[x2,n2]=newtona(f,a,b,eps)


t=a:0.01:b;
plot(t,f(t))
hold on
plot(x1,f(x1),'ro')
plot(x2,f(x2),'rx')


function [x1,n1] =polowienia(f,a,b,eps)

xm=(a+b)/2;

n1=0;

while (b-a)>eps
L=b-a;
xl=a+0.25*L;
xr=b-0.25*L;

    n1=n1+1;
    f(xl);
    f(xr);

    if f(a) < f(xl) || f(xl) <f(xm)   
    b=xm;
    xm=(a+b)/2;

  

    elseif f(xm) < f(xr)
    
    a=xl;    
    b=xr;
    xl=a+0.25*L;
    xr=b-0.25*L;
    
    else
     a=xm;
     xm=(a+b)/2;
    end

    
   
end
x1=xm;

end




function [x2,n2]=newtona(f,a,b,eps)
h=0.01

fp = @(x) (f(x+h) - f(x-h))/(2*h);
fp2 = @(x) (f(x+h) - 2*f(x-h) + f(x-h) )/(h.^2);

if(fp(a)>0)
x0=a
else
x0=b
end
n2=0;


while abs(fp(x0)) > eps

x2= x0 - fp(x0)/fp2(x0);


x0=x2;

if(x2>b||x2<a)

if(f(a)>0)
 x2=a
elseif f(b)>0
x2=b;
end

return

end

n2=n2+1;
end


end
