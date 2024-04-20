b=[0,1,1,0,1,1,0,1,0,0,0,0,1,0,1,1,0];
B= length(b); 
Tc=1;
fs=500;
fn=40;
n= Tc*fs; % liczba próbek sygnału
Tb=Tc/B; %czas trwania jednego "bloku"
Tbp=Tb*fs; % ilość próbek na "blok"
t = linspace(0, Tc, n); % wektor czasu

WektorRozwiazan = zeros(size(t));


for i=1:B

for i=1:Tbp
  WektorRozwiazan(i) = Z(fn,0,t(i));
end

end

plot(WektorRozwiazan)

function z = Z(fn,fi,t)

z=sin(2*pi*fn*t+fi);

end

function za = ZA(fn,fi,b,t)


if(b==0)

z=sin(2*pi*fn*t+fi);

end


if(b==1)

z=sin(2*pi*fn*t+fi);

end

end

