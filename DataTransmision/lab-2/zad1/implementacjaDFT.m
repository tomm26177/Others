function sum= X(k,N,probki_x)

e= 2.71828 ;
sum=0;
for n=0:1:N-1

  sum=sum+  probki_x(n+1)*e^(-1i*((2*pi*k*n)/N));


end

end