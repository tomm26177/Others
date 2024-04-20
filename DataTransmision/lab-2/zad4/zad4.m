%run('C:\Users\kt53661\Desktop\teoriaInformacji\TD-214B-Kaminski\lab-1\zad1\Lab1_zad1.m');

fs = 8000; % czestotliwosc probkowania 
f= 4500; % czestotliwosc sygnalu
Tc = 2;
o = 0;
n= Tc*fs; % liczba próbek sygnału
t = linspace(0, Tc, n); % wektor czasu
WektorRozwiazan = zeros(n);




























x=zeros(n);
for i = 1:n
    x(i) = X(t(i), f, o);
end

y=zeros(n);
for i = 1:n
    y(i) = Y(t(i), f, o);
end

z=zeros(n);
for i = 1:n
    z(i) = Z(t(i), f, o);
end


v=zeros(n);
for i = 1:n
    v(i) = V(t(i), f, o);
end

Tc = 1;
n= Tc*fs; 
t = linspace(0, Tc, n); 
u=zeros(n);
for i = 1:n
    u(i) = U(t(i));
end

fs = 22050;

b1=zeros(n);
for i = 1:n
    b1(i) = B(t(i),1);
end

b2=zeros(n);
for i = 1:n
    b2(i) = B(t(i),2);
end

b3=zeros(n);
for i = 1:n
    b3(i) = B(t(i),3);
end






fs = 8000; % czestotliwosc probkowania 
f= 4500; % czestotliwosc sygnalu
Tc = 2;
n= Tc*fs; % liczba próbek sygnału


dft_x=zeros((n/2)-1,1);
tic;
for k=0: (n/2)-1

dft_x = DFT(k,n,x);

end
czas1_DFT = toc;




dft_y=zeros((n/2)-1,1);
tic;
for k=0: (n/2)-1

dft_y = DFT(k,n,y);

end
czas2_DFT = toc;





dft_z=zeros((n/2)-1,1);
tic;
for k=0: (n/2)-1

dft_z = DFT(k,n,z);

end
czas3_DFT = toc;



dft_v=zeros((n/2)-1,1);
tic;
for k=0: (n/2)-1

dft_v = DFT(k,n,v);

end
czas4_DFT = toc;




fs = 8000; % czestotliwosc probkowania 
Tc = 1;
n= Tc*fs; % liczba próbek sygnału

dft_u=zeros((n/2)-1,1);
tic;
for k=0: (n/2)-1

dft_u = DFT(k,n,u);

end
czas5_DFT = toc;




fs = 22050; % czestotliwosc probkowania 
n= Tc*fs; % liczba próbek sygnału

dft_b1=zeros((n/2)-1,1);
tic;
for k=0: (n/2)-1

dft_b1 = DFT(k,n,b1);

end
czas6_DFT = toc;

dft_b2=zeros((n/2)-1,1);
tic;
for k=0: (n/2)-1

dft_b2 = DFT(k,n,b2);

end
czas7_DFT = toc;


dft_b3=zeros((n/2)-1,1);
tic;
for k=0: (n/2)-1

dft_b3 = DFT(k,n,b3);

end
czas8_DFT = toc;





fs = 8000; % czestotliwosc probkowania 
Tc = 2;
n= Tc*fs; % liczba próbek sygnału

tic;
fft_x = fft(x, (n/2)-1);
czas1_FFT = toc;

tic;
fft_y = fft(y, (n/2)-1);
czas2_FFT = toc;

tic;
fft_z = fft(z, (n/2)-1);
czas3_FFT = toc;

tic;
fft_v = fft(v, (n/2)-1);
czas4_FFT = toc;



Tc = 1;
n= Tc*fs; % liczba próbek sygnału

tic;
fft_u = fft(u, (n/2)-1);
czas5_FFT = toc;


fs = 22050;
n= Tc*fs; 

tic;
fft_b1 = fft(b1, (n/2)-1);
czas6_FFT = toc;

tic;
fft_b2 = fft(b2, (n/2)-1);
czas7_FFT = toc;

tic;
fft_b3 = fft(b3, (n/2)-1);
czas8_FFT = toc;

T_DFT = table(czas1_DFT, czas2_DFT, czas3_DFT, czas4_DFT, czas5_DFT, czas6_DFT, czas7_DFT, czas8_DFT, ...
    'VariableNames', {'czas_x_DFT', 'czas_y_DFT', 'czas_z_DFT', 'czas_v_DFT', 'czas_u_DFT', 'czas_b1_DFT', 'czas_b2_DFT', 'czas_b3_DFT'});

T_FFT = table(czas1_FFT, czas2_FFT, czas3_FFT, czas4_FFT, czas5_FFT, czas6_FFT, czas7_FFT, czas8_FFT, ...
    'VariableNames', {'czas_x_FFT', 'czas_y_FFT', 'czas_z_FFT', 'czas_v_FFT', 'czas_u_FFT', 'czas_b1_FFT', 'czas_b2_FFT', 'czas_b3_FFT'});

T = [T_DFT, T_FFT];


disp(T);












function sum= DFT(k,N,probki_x)

e= 2.71828 ;
sum=0;
for n=0:1:N-1

  sum=sum+  probki_x(n+1)*e^(-1i*((2*pi*k*n)/N));


end

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


