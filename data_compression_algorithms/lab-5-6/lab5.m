


file = fopen('61');
A = fread(file);

A = A - 48;

% Obliczamy sumę wystąpień 1
sum = 0;
for i = 1:size(A)
    if A(i) == 1
        sum = sum + 1;
    end
end

% Obliczamy prawdopodobieństwo dla wystąpienia 1 lub 0
p = sum / size(A, 1);
p = 1 - p;

% Obliczamy stałą k
k = ceil(log2(log2((sqrt(5) - 1) / 2) / log2(p)));

% Konwersja na liczby całkowite n
n = zeros(1, sum);
j = 1;
number = 0;
for i = 1:size(A, 1)
    if A(i) == 0
        number = number + 1;
    end
    if A(i) == 1
        n(j) = number;
        j = j + 1;
        number = 0;
    end
end

% Wyznaczanie u i v
u = zeros(1, size(n, 2));
v = zeros(1, size(n, 2));
for i = 1:size(n, 2)
    u(i) = floor(n(i) / 2^k);
    v(i) = n(i) - u(i) * 2^k;
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
p
k

L_R = (1 - p) * (k + 1 / (1 - p^2));

E_R = (-(p * log2(p)) - ((1 - p) * log2(1 - p))) / L_R * 100




B= dekoder_rice(u,v,k);


length(B)





function decoded_bits= dekoder_rice(u, v, k)
    % Założenie: u i v są już wcześniej obliczone i przekazane do funkcji
    % Dekodowanie strumienia bitów na podstawie u i v
    decoded_bits = []; % Inicjalizacja macierzy dekodowanych bitów
    % Iteracja przez wszystkie elementy u i v
    for idx = 1:length(u)
        num_zeros = u(idx) * 2^k + v(idx); % Obliczenie liczby zer przed jedynką
        decoded_bits = [decoded_bits, zeros(1, num_zeros), 1]; % Dodanie zer i jedynki do macierzy wynikowej
    end
    % Zmniejszenie macierzy o ostatnią jedynkę, jeżeli jest nadmiarowa
    if length(decoded_bits) > length(u) + sum(u) * 2^k + sum(v) 
        decoded_bits(end) = [];
    end
    % Opcjonalne: Wyświetlanie dekodowanego strumienia bitów
  
    % Opcjonalne: Porównanie z oryginalnym strumieniem bitów, jeżeli dostępny
    % A = <oryginalny strumień bitów>; % Zakładając, że A jest dostępne
    % if isequal(A, decoded_bits)
    %     disp('Kod przed i po dekodowaniu jest identyczny.');
    % else
    %     disp('Kod przed i po dekodowaniu nie jest identyczny.');
    % end
end





