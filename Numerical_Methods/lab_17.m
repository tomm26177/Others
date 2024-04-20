clc
close all
clearvars
wybor = 1;
switch wybor
case 1
f=@(x) 10*x(1,:).^2+15*x(2,:).^2+20*x(1,:).*x(2,:)+5*x(1,:)-20*x(2,:);
xp=-8; xk=8; yp=-8; yk=8; x0 = [7;-8];
case 2
f=@(x) 100*(x(2,:)-x(1,:).^2).^2+(1-x(1,:)).^2;
xp=-2; xk=2; yp=-1; yk=4; x0=[-2;3];
case 3
f=@(x)log(exp(x(1,:)+3*x(2,:)-0.1)+exp(x(1,:)-3*x(2,:)-0.1)+exp(-x(1,:)-0.1));
xp=-4; xk=4; yp=-2; yk=2; x0=[2;2];
otherwise
end
hess(f,x0)
tol = 1e-4; ftol = 1e-4;
[x_opt_1, dx_1, it_1] = newton(f, x0, tol, ftol); % zwyczajna metoda Newtona
%[x_opt_2, dx_2, it_2] = hess(f, x0, tol, ftol); % metoda z minimalizacją kierunkową
[X,Y] = meshgrid(linspace(xp, xk, 100), linspace(yp, yk, 100));
Z = reshape(f([X(:), Y(:)]'), size(X));
figure;
contour(X,Y,Z,100)
hold on
plot(x0(1), x0(2), 'r*'); text(x0(1), x0(2), 'START')
if exist('x_opt_1')
disp(sprintf('f(%f,%f)=%f, #it=%d', x_opt_1(1), x_opt_1(2), f(x_opt_1), it_1))
plot(x_opt_1(1), x_opt_1(2), 'r*'); text(x_opt_1(1), x_opt_1(2), 'STOP1')
line(dx_1(1,:), dx_1(2,:), 'Color', 'k')
end
if exist('x_opt_2')
disp(sprintf('f(%f,%f)=%f, #it=%d', x_opt_2(1), x_opt_2(2), f(x_opt_2), it_2))
plot(x_opt_2(1), x_opt_2(2), 'r*'); text(x_opt_2(1), x_opt_2(2), 'STOP2')
line(dx_2(1,:), dx_2(2,:), 'Color', 'r')
end

function [x_opt, dx, it] = newton(f, x0, tol, ftol) % zwyczajna metoda Newtona
h = 2^-16;
dx = [x0];
it = 1;
g = grad(f,x0);
H = hess(f,x0);
f0 = f(x0);
t=0;
while 1
it=it+1;

 u=(H^-1)*g;

if sqrt(g'.*u)<= tol
 break;
end
 t=1;
    x0=x0-t*u;
    it=it+1;
    f1=f(x0-t*u);
    g = grad(f,x0);
    H = hess(f,x0);
    dx(:,end+1) = x0;
    f0=f(x0);


    if abs((f1-f0)/f0)<=ftol
        break
    end


 x_opt=x0;
end

% Zarys algorytmu:
% 1. Oblicz gradient i macierz Hessego w punkcie x0.
% 2. Oblicz kierunek u, korzystając z gradientu i macierzy Hessego.
% 3. Sprawdź pierwszy warunek stopu.
% 4. Wykonaj skok do nowego punktu z krokiem t=1.
% 5. Dodaj nowy punkt do ścieżki i zwiększ licznik iteracji o 1.
% 6. Oblicz wartość funkcji w nowym punkcie i sprawdź drugi warunek stopu.
% 7. Idź do kroku 1.
end


    function H=hess(f,x)
n=length(x);
H=zeros(n);
h=2^-16;
for i=1:n
    xi=x(i);
    x(i)=xi+h;
    fp=f(x);
    x(i)=xi-h;
    fn=f(x);
    x(i)=xi;
    H(i,i)=(fp-2*f(x)+fn)/h^2;
    for j=i+1:n
        xi=x(i);
        xj=x(j);
        x(i)=xi+h;
        x(j)=xj+h;
        fpp=f(x);
        x(i)=xi-h;
        x(j)=xj+h
        fnp=f(x);
        x(i)=xi+h;
        x(j)=xj-h;
        fpn=f(x);
        x(i)=xi-h;
        x(j)=xj-h;
        fnn=f(x);
        H(i,j)=(fpp-fnp-fpn+fnn)/(4*(h^2));
        H(j,i)=H(i,j);
        x(i)=xi;
        x(j)=xj;
 
    end
end
 
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