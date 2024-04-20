

%Przykładowy wynik dla pliku ATrain (Lab. 7/8) L_sr = 9,4774, efektywność 99,4213%.



e=audioread("ATrain.wav");
e=double(e);

e= floor(e*(2^16)+0.5);


%algorytm nr1 
for n=1:numel(e)
if e(n) >= 0 
    ep(n) = 2*e(n);
else
    ep(n) = -2*e(n)-1;
end
end

%wzor na s

sum=0;
for j=1:numel(ep,1)
    
    sum=sum+ep(j);
end
s= 1/numel(ep,1)*sum;

%wzor na p
if(s>=2)
p=s-1
p=p/s
end

if(s<2)
p=0.5
end



%wzor na k (osobne k dla kazdego kanalu)


k= sqrt(5)-1;
k=k/2;
k= log2(k);
k=k/log2(p);
k=ceil( log2(k));


%obliczanie L_sr dla obu kanlow

%obliczanie H(s) etropi 

  for i = 1:size(ep, 1)
        ni(ep(i, 1)+2^16+1, 1) = ni(ep(i, 1)+2^16+1, 1) + 1;
        ni(ep(i, 2)+2^16+1, 2) = ni(ep(i, 2)+2^16+1, 2) + 1;
  end

sum1=0;

for i=1:2^17


p = (ni(i,1))/size(ep,1);


if ~(p==0)
sum1 = sum1 + p*log2(p);
end


end
sum1 = -sum1;



sum2=0;

for i=1:2^17


p = (ni(i,2))/size(ep,1);




if ~(p==0)
sum2 = sum2 + p*log2(p);
end


end
sum2 = -sum2;


HS1=sum1;
HS2=sum2;


% konwersja wektora e(n) na u i v
coded_e=[];

% Wyznaczanie u i v
u = zeros(1, size(ep, 2));
v = zeros(1, size(ep, 2));
for i = 1:size(ep, 2)
    u(i) = floor(ep(i) / 2^k);
    v(i) = ep(i) - u(i) * 2^k;
end


% Zakodowany strumień bitów
    encoded_bits = [];
    for i = 1:length(u)
        % Dodajemy kod unarny dla 'u' plus jedynka na końcu
        unar = [repmat('0', 1, u(i)), '1'];
        % Dodajemy kod binarny dla 'v'
        bin = dec2bin(v(i), k);
        % Sklejamy i dodajemy do zakodowanego ciągu
        encoded_bits = [encoded_bits, unar, bin];
    end

 length(encoded_bits)






%Lw

Lw1 = coded_e/ 2*numel(ep);




























% to samo dla kanalu drugiego
for n=1:numel(e,2)
if e(n,2) >= 0 
    ep(n,2) = 2*e(n,2);
else
    ep(n,2) = -2*e(n,2)-1;
end
end
































