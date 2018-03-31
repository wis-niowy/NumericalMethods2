% skrypt oblicza i zwraca w macierzy wartosci Bi dla i <-1:n+1>
% ka¿dy wiersz posaida warotsci Bi dla zmiennej z podanej dziedziny

function [ out ] = wartosci_B(DZIEDZINA, WEKTOR_WEZLOW, n, h)

licznosc_dziedziny = length(DZIEDZINA);
out = zeros(licznosc_dziedziny, n+3);

for i = -1:n+1
    for j = 1:licznosc_dziedziny
        out(j, i+2) = licz_Bi(i, DZIEDZINA(1, j), h, n, WEKTOR_WEZLOW);
    end
end