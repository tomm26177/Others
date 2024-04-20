clc
clearvars

A=[3,2,1;5,4,3;1,1,0;1,0,0;0,1,0;0,0,1];
b=[120;300;50;0;0;0];
c= [12;8;10];

[m,n]=size(A);

%dostawiamy I(mxm) do macierzy A
I= eye(m,m);
A = [A, I];

c = [c; zeros(m, 1)];

wb = [n + 1:m + n];
Cb = c(wb);
Cj = c';
f = (Cb') * b;
ww = Cj - (Cb')* A;

while any(ww>0)

    [~,kk]=max(ww);
    ilorazy= b./A(:,kk);
    %ZASTAPIC UJEMNE ILIRAZY WARTSOCIAMI NIESKONCZONOSC


for i=1:length(ilorazy)
if ilorazy(i)<0
    ilorazy(i)=inf;
end

end

   [~, wk] = min(ilorazy);
   er = A(wk, kk);
   wb(wk) = kk;

    %elementy wiersza kluczowego,podzielic przez er
    A(wk, :) = A(wk, :) / er;
   b(wk) = b(wk) / er;

    for i=1:m
         %jezeli i =!wk , to do wiersza itego dodac 
        %wielkokrotnosci wiersza kluczowego zeby w 
        % kk pojawiły sie zera

        if ~(i==wk) 
            b(i) = b(i) - A(i, kk) * b(wk);
           A(i, :) = A(i, :) - A(i, kk) * A(wk, :);
           
        end
        

Cb = c(wb);
Cj = c';
f = (Cb') * b;
ww = Cj - (Cb') * A;




    end
%wydzileic ostateczmne rozwiazanie z wektora b za pomocą wb

for i=1:n
    for j=1 :m
        if wb(j)==i
            x(i)=b(j);

        end

    end
end


end

disp('rozwiązanie:');
disp(x);
