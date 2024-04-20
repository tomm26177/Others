clc
close all


x= [1,6,14,21];
y= [13,11,18,15];

X = linspace(min(x),max(x),1000);
a = wsp(x,y);
Y = wart(a,X,x);
plot(x,y,'k*',X,Y);

temperatura_0_10_45 = wart(a,10.75,x)
%temepratura o 10:45

wartosc_maksymalnej_temperatury=max(Y)



function a = wsp(x,y)
%wzor 3
n=length(x);
a = zeros(1,n);


for i=1:n
    multiply=1
    for j=1:n
        if(i~=j)
multiply=multiply.*(x(i)-x(j));
        end
    end
a(i)=y(i)/multiply;
end

end

function Y = wart(a,X,x)
 % wzor 2
 n=length(x);
 sum=0;


 for i=1:n 
      multiply=1;     
     for j=1:n
        if(j~=i)
     multiply=multiply.*(X-x(j));
        end
        
 end
 sum=sum + a(i)*multiply;
 end
 Y=sum;

end






