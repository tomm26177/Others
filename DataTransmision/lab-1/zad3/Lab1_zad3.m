fs = 8000; % czestotliwosc probkowania 
Tc = 1;
n= Tc*fs; % liczba próbek sygnału
t = linspace(0, Tc, n); % wektor czasu
WektorRozwiazan = zeros(size(t));

for i = 1:length(t)
    WektorRozwiazan(i) = U(t(i));
end

plot(t, WektorRozwiazan)
title('u(t)')
xlabel('t')
ylabel('U(t)')


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

