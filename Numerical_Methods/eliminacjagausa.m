function x= eliminacjagausa(A,B);
n= length(B);
A=[A,B]; %dodak kolumne b do macierzy
for i=1:n
    [~, k] = max(abs(A(i:n, i)));
        k=k+i-1;

         A([i, k], :) = A([k, i], :);

       A(i, :) = A(i, :) / A(i, i);


    %zamienic wiersz k z wierszem i
    for j=i+1:n
          z = A(j, i);
            A(j, :) = A(j, :) - z * A(i, :);
        
    end
    A
end
x = zeros(n, 1);
    for i = n:-1:1
      
       x(i)= A(i, end) - A(i, i+1:n) * x(i+1:n)
        
    end


