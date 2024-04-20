clc
clearvars

A=[3,2,1;5,4,3;1,1,0;1,0,0;0,1,0;0,0,1];
b=[120;300;50;0;0;0];
c= [12;8;10];

[x,y]=method(A,b,c,10.^(-8))



function [x,f] = method(A,b,c,tol)
[m,n]= size(A);

I= eye(m,m);
A = [A, I];

c = [c; zeros(m, 1)];

  x = ones(m+n, 1);
  y = ones(m, 1);
  z = ones(m+n, 1);
sigma= 0.9; 
delta = 0.02;

while 1
        rp = A * x - b;
        rd = (A') * y + z - c;
        xz = dot(x, z);


  if norm(rp) < tol && norm(rd) < tol && xz < tol
            break;
        end

    tau=0.02;

    e= ones(size(x));
    dy= linsolve(A*diag(x./z)*A',-rp+A*(x-(rz).^(-1)*e-x*(z.^(-1))*rd);

    dz = -(A')*dy-rd;
    dx = -diag(-x./z,m) ;

ap=1;
ad=1;
 for j = 1:n

        if x(j) + ap * dx(j) < 0
                ap = -x(j) / dx(j); 
        end

        if z(j) + ad * dz(j) < 0
                ad = -z(j) / dz(j); 
            end
        end


ap= ap*sigma;
x=x + ap*dx;
y=y+ap*dy;
z=z+ap*dz;



end 
     

f=(c')*x
x=x()

end



