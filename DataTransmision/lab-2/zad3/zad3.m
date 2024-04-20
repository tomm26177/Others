%run('C:\Users\kt53661\Desktop\teoriaInformacji\TD-214B-Kaminski\lab-1\zad1\Lab1_zad1.m');



fs = 22050; % czestotliwosc probkowania 

Tc = 1;
n= Tc*fs; % liczba próbek sygnału
t = linspace(0, Tc, n); % wektor czasu
WektorRozwiazan = zeros(n);



WektorWidma= zeros((n/2)-1,1);


for k=0:(n/2)-1

%f_temp = f(k,n,fs);


    WektorRozwiazan(i) = B(t(i),3);




   WektorWidma(k+1)= DFTP(k,n,WektorRozwiazan);
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



function DFTp = DFTP(k,N,probki_x)

DFTp=10*log10(DFT(k,N,probki_x));



end




function f= f(k,N,fs)
 f=k*(fs/N);

end


function x = X(t,f,o)
% funkcja nr 1 z tabelki 1

x = cos(2*pi*f*t + o)*cos(2.5*(t^(0.2))*pi);

end





function y = Y(t,fs,o)
% funkcja nr 1 z tabelki 2
y = (X(t,fs,o)*t)/(3+cos(20*pi*t));

end



function z = Z(t,f,o)
% funkcja nr 1 z tabelki 2
 z=  (t^(2))* abs(X(t,f,o)*Y(t,f,o)-(2/(10+Y(t,f,o))));



end


function v = V(t,f,o)
% funkcja nr 1 z tabelki 2
v =   (Z(t,f,o))^(3) + 3*sin(Z(t,f,o)*Y(t,f,o))*abs(Y(t,f,o)-X(t,f,o));


end


function u = U(t)

    if (t >= 0) & (t < 0.1)

        u = sin(6*pi*t)*cos(5*pi*t);

    end
       
    if (t >= 0.1) & (t < 0.4)
        
        u = -1.1*t*cos(41*pi*(t^2));

    end

    if (t >= 0.4) & (t < 0.72)

        u = t*sin(20*t^4);

    end

    if (t >= 0.72) & (t <= 1)

        u = 3.3*(t-0.72)*cos(27*t+1.3);

  
    end


end



function b = B(t,k)
H=[5,20,50];
sum=0;

for h=1:1:H(k)

   sum = sum + ((-1)^h)/(h)*sin(h*pi*2*t);


end

b=2/pi*sum;


end


