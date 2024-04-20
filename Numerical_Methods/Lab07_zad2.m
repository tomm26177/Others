clc
close all



p=3
switch p
case 1
x= linspace(-3,3,5);
case 2
x= linspace(-3,3,10);
case 3
x= linspace(-3,3,15);
end

y= abs(x);
V=[];
for i=1:length(x)

    for j=1:length(x)

        V(i,j) = x(i)^(j-1);

    end

end

a=V/y;
V
    X= linspace(-3,3,1000);
    Y=0;
    for i=1:length(a)
        Y=Y+ a*X.^i; 

    end

    plot(x,y,'k*',X,Y)
    

    

    % Efekt Rungego odpowiada pogorszenie jakości interpolacji wielomianowej, mimo zwiększenia liczby jej węzłów
