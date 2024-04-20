clc;
close all;
clear all;

% Załadowanie obrazu (należy zmienić ścieżkę do pliku)
M = imread("lennagrey.bmp");
M = double(M);

% Wstępne przygotowanie
[numRows, numCols] = size(M);
D = zeros(size(M)); % Obraz różnicowy

% Kodowanie różnicowe
D(1,:) = diff([0 M(1,:)]);
D(:,1) = diff([0; M(:,1)]);
for i = 2:numRows
    for j = 2:numCols
        D(i,j) = M(i,j) - M(i,j-1);
    end
end

% Dekodowanie różnicowe
R = zeros(size(M));
R(1,:) = cumsum(D(1,:));
R(:,1) = cumsum(D(:,1));
for i = 2:numRows
    for j = 2:numCols
        R(i,j) = D(i,j) + R(i,j-1);
    end
end

% Obliczenie histogramów
histOriginal = hist(M(:),0:255) / numel(M);
histDiff = hist(D(:),-255:255) / numel(D);

% Obliczenie entropii obrazu różnicowego
entropyDiff = -sum(histDiff(histDiff>0) .* log2(histDiff(histDiff>0)));

% Wykres porównawczy
figure;
hold on;
plot(0:255, histOriginal, 'r', 'LineWidth', 1);
plot(-255:255, histDiff, 'k', 'LineWidth', 1);
hold off;

xlim([-255, 255]);

% Wyniki
fprintf("Entropia obrazu różnicowego: %f bits/pixel\n", entropyDiff);