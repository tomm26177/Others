fs = 22050; % czestotliwosc probkowania 
Tc = 1;
n= Tc*fs; % liczba próbek sygnału
t = linspace(0, Tc, n); % wektor czasu
WektorRozwiazan = zeros(size(t));

for i = 1:length(t)
    WektorRozwiazan(i) = B(t(i), 1);
end
%subplot(3,1,1)
%plot(t, WektorRozwiazan)
%title('b(t), k=1')
%xlabel('t')
%ylabel('B(t)')

for i = 1:length(t)
    WektorRozwiazan(i) = B(t(i), 2);
end
%subplot(3,1,2)
%plot(t, WektorRozwiazan)
%title('b(t), k=2')
%xlabel('t')
%ylabel('B(t)')

for i = 1:length(t)
    WektorRozwiazan(i) = B(t(i), 3);
end
%subplot(3,1,3)
%plot(t, WektorRozwiazan)
%title('b(t), k=3')
%xlabel('t')
%ylabel('B(t)')



function b = B(t,k)
H=[5,20,50];
sum=0;

for h=1:1:H(k)

   sum = sum + ((-1)^h)/(h)*sin(h*pi*2*t);


end

b=2/pi*sum;


end
