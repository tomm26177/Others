run('C:\Users\kt53661\Desktop\teoriaInformacji\TD-214B-Kaminski\lab-1\zad1\Lab1_zad1.m');




x = WektorRozwiazan; % probki x z pierwszej funkcji lab1zad1
N=length(x);


WektorWidma= zeros((N/2)-1,1);



% podpunkt 1
for k=0:(N/2)-1
   WektorWidma(k+1)= M(k,N,x);
   WektorWidma(k+1)=  sqrt( (real(WektorWidma(k+1)))^2 + (imag( WektorWidma(k+1)))^2  );

end


%plot(WektorWidma)
% title("widmo amplitudowe M(k)")




% podpunkt 2
for k=0:(N/2)-1
   WektorWidma(k+1)= MP(k,N,x);
   WektorWidma(k+1)=  sqrt( (real(WektorWidma(k+1)))^2 + (imag( WektorWidma(k+1)))^2  );

end


%plot(WektorWidma)
%title("widmo amplitudowe M'(k)")







%podpunk 4 
for k=0:(N/2)-1

f_temp = f(k,n,fs);

for i = 1:n
    WektorRozwiazan(i) = X(t(i), f_temp, o);
end



   WektorWidma(k+1)= MP(k,n,WektorRozwiazan);
   WektorWidma(k+1)=  sqrt( (real(WektorWidma(k+1)))^2 + (imag( WektorWidma(k+1)))^2  );

end


plot(WektorWidma)








function sum= DFT(k,N,probki_x)

e= 2.71828 ;
sum=0;
for n=0:1:N-1

  sum=sum+  probki_x(n+1)*e^(-1i*((2*pi*k*n)/N));


end

end


function m = M(k,N,probki_x)

m = sqrt(real(DFT(k,N,probki_x))^2 - imag(DFT(k,N,probki_x))^2  );


end


function mp = MP(k,N,probki_x)

mp=10*log10(M(k,N,probki_x));



end


% podpunkt 3
function f= f(k,N,fs)
 f=k*(fs/N);

end


function x = X(t,f,o)
% funkcja nr 1 z tabelki 1

x = cos(2*pi*f*t + o)*cos(2.5*(t^(0.2))*pi);

end

