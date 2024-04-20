


%dla pliku Atrain 9,42255 b/próbkę (średnia entropia z obu kanałów).


zad3('velvet.wav')

zad4('velvet.wav')

function sum = zad3(name) 


M=audioread(name);
M=double(M);

M= floor(M*(2^15)+0.5);


ni=zeros(2^17,2);




numbersAmount = numel(M);
sum=0;



[h,w]=size(M);

  for i = 1:size(M, 1)
        ni(M(i, 1)+2^15+1, 1) = ni(M(i, 1)+2^15+1, 1) + 1;
        ni(M(i, 2)+2^15+1, 2) = ni(M(i, 2)+2^15+1, 2) + 1;
    end


sum1=0;

for i=1:2^17


p = (ni(i,1))/size(M,1);


if ~(p==0)
sum1 = sum1 + p*log2(p);
end


end
sum1 = -sum1;



sum2=0;

for i=1:2^17


p = (ni(i,2))/size(M,1);




if ~(p==0)
sum2 = sum2 + p*log2(p);
end


end
sum2 = -sum2;

sum=(sum1+sum2)/2;
sum







end





function   zad4(name)










M=audioread(name);
M=double(M);

M= floor(M*(2^15)+0.5);


ni=zeros(2^17,2);




numbersAmount = numel(M);
sum=0;



[h,w]=size(M);






for i=2:h                    
           Mp(i,1)= M(i,1)-M(i-1,1);
end

for i=2:h                    
           Mp(i,2)= M(i,2)-M(i-1,2);
end



  for i = 1:size(M, 1)
        ni(Mp(i, 1)+2^16+1, 1) = ni(Mp(i, 1)+2^16+1, 1) + 1;
        ni(Mp(i, 2)+2^16+1, 2) = ni(Mp(i, 2)+2^16+1, 2) + 1;
  end

sum1=0;

for i=1:2^17


p = (ni(i,1))/size(M,1);


if ~(p==0)
sum1 = sum1 + p*log2(p);
end


end
sum1 = -sum1;



sum2=0;

for i=1:2^17


p = (ni(i,2))/size(M,1);




if ~(p==0)
sum2 = sum2 + p*log2(p);
end


end
sum2 = -sum2;


sum=(sum1+sum2)/2;
sum






end




























