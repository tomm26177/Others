fs = 800; % czestotliwosc probkowania 
f= 4500; % czestotliwosc sygnalu
Tc = 2;
o = 0;
n= Tc*fs; % liczba próbek sygnału
t = linspace(0, Tc, n); % wektor czasu
WektorRozwiazan = zeros(n);


for i = 1:length(t)
    WektorRozwiazan(i) = Y(t(i), f, o);
end

%subplot(3,1,1)
%plot(t, WektorRozwiazan)
title('y(t)')
xlabel('t')
ylabel('y(t)')

for i = 1:length(t)
    WektorRozwiazan(i) = Z(t(i), f, o);
end

%subplot(3,1,2)
%plot(t, WektorRozwiazan)
title('z(t)')
xlabel('t')
ylabel('z(t)')

for i = 1:length(t)
    WektorRozwiazan(i) = V(t(i), f, o);
end

%subplot(3,1,3)
%plot(t, WektorRozwiazan)
title('v(t)')
xlabel('t')
ylabel('v(t)')








function x = X(t,fs,o)
% funkcja nr 1 z tabelki 1
x = cos(2*pi*fs*t + o)*cos(2.5*t^(0.2)*pi);

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