clc
fs = 8000; % czestotliwosc probkowania 
Tc = 1;
n= Tc*fs; % liczba próbek sygnału
t = linspace(0, Tc, n); % wektor czasu
fm=100;
fn=4000;
WektorRozwiazan = zeros(size(t));

%modulacja amplitudy
k=0.5;
for i=1:n

    WektorRozwiazan(i) = ZA(k,fn,fm,t(i));


end



k=6;
for i=1:n

    WektorRozwiazan(i) = ZA(k,fn,fm,t(i));


end



k=21; 
for i=1:n

    WektorRozwiazan(i) = ZA(k,fn,fm,t(i));


end
plot(WektorRozwiazan)










%modulacja fazy

k=0.5;
for i=1:n

    WektorRozwiazan(i) = ZP(k,fn,fm,t(i));


end






k=2; 
for i=1:n

    WektorRozwiazan(i) = ZP(k,fn,fm,t(i));


end






k=19; 
for i=1:n

    WektorRozwiazan(i) = ZP(k,fn,fm,t(i));


end







%modulacja czestotliwosci


k=0.5;
for i=1:n

    WektorRozwiazan(i) = ZF(k,fn,fm,t(i));


end


k=2; 
for i=1:n

    WektorRozwiazan(i) = ZF(k,fn,fm,t(i));


end
plot(WektorRozwiazan)


k=19;
for i=1:n

    WektorRozwiazan(i) = ZF(k,fn,fm,t(i));


end













function z= ZA(k,fn,fm,t)

z= (k*M(fm,t)+1)*cos(2*pi*fn*t);

end

function z= ZP(k,fn,fm,t)

z= cos(2*pi*fn*t+k*M(fm,t));

end


function z= ZF(k,fn,fm,t)

z= cos(2*pi*fn*t+(k/fm)*M(fm,t));

end


function m = M(fm,t)

m=sin(2*pi*fm*t);

end






