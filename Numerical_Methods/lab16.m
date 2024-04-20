clc
close all
wybor = 1;
switch wybor
case 1
f=@(x)x(1,:).^2 + x(2,:).^2;
xp=-10;
xk=10;
yp=-10;
yk=10;
x0 = [-10;10];
krok = 1;
case 2
f=@(x)3*x(1,:).^4 - 2/3*x(2,:).^3+2*x(1,:).^2.*x(2,:)-2*x(1,:).^2+x(2,:).^2;
xp=-1;
xk=0.4;
yp=-1;
yk=1;
x0=[-1;1];
krok = 0.1;
case 3
f=@(x)10*x(1,:).^2+15*x(2,:).^2+20*x(1,:).*x(2,:)+5*x(1,:)-20*x(2,:);
xp=-8;
xk=8;
yp=-8;
yk=8;
x0=[8;-8];
krok = 1;
otherwise
f=@(x) 100*(x(2,:)-x(1,:).^2).^2+(1-x(1,:)).^2;
xp=-2;
xk=2;
yp=-1;
yk=3;
x0=[-2;3];
krok = 0.5;
3
end
gtol = 1e-4;
ftol = 1e-4;
[x_opt, dx, it] = metodagrad(f, x0, gtol, ftol, krok);
[X,Y] = meshgrid(linspace(xp,xk),linspace(yp,yk));
Z = reshape(f([X(:), Y(:)]'), size(X));
figure('Name', sprintf("f(%f,%f)=%f, #it=%d", x_opt(1), x_opt(2), f(x_opt), it))
contour(X,Y,Z,100)
line( dx(1,:), dx(2,:) , 'Color', 'k') 
function [x_opt, dx, it] = metodagrad(f, x0, gtol, ftol, krok)
dx = [x0];
it = 1;
f0 = f(x0);
g=grad(f,x0);
gnorm= norm(g);

while 1
    it=it+1;
    if gnorm<=gtol
break;
    end

    f1=f(x0-krok*g);
    if f1<f0
        x0=x0-krok*g;
        dx(:,end+1)=x0;
        f0=f(x0);
        g=grad(f,x0);
        gnorm=norm(g);
      
    else
        
krok=krok/2;
    end
    x_opt=x0;
end


% Zarys algorytmu gradientu prostego:
% 1. Oblicz gradient w punkcie x0 i sprawdź pierwszy warunek stopu.
% 2. Oblicz wartość funkcji w punkcie x0 minus gradient powiększony o krok.
% 3. Jeśli wartość funkcji w nowym punkcie jest większa, zmniejsz krok i idź do p. 2.
% 4. Zaktualizuj bieżący punkt i sprawdź drugi warunek stopu.
% 5. Zaktualizuj wartość funkcji i idź do punktu 1.
end

function g=grad(f,x)
n=length(x);
h=2.^(-16);
g=zeros(n,1);
for i=1:n
    xi = x(i);
    x(i)=xi +h;
    fp=f(x);
    x(i)= xi-h;
    fn= f(x);
    g(i)=(fp-fn)/(2*h);
    x(i)=xi;
end
end





