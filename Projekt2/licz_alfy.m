% skrypt obliczajacy wspolczynniki alfa do interpolacji funkcji

function [ out ] = licz_alfy(WEKTOR_WEZLOW, WARTOSCI_WEZLOW, fun, h, n)

out = zeros(n+3, 1);
a = ones(1, n+1)*4;
b = ones(1, n);
c = ones(1, n);
b(1, 1) = 2;
c(1, end) = 2; % a, b, c - wektory reprezentujace przekatne macierzy trojdiagonalnej

pochodna1 = I_poch(fun,WEKTOR_WEZLOW(1, 1));
pochodna2 = I_poch(fun,WEKTOR_WEZLOW(1, n+1));

WARTOSCI_WEZLOW(1, 1) = WARTOSCI_WEZLOW(1, 1) + h/3 * pochodna1;
WARTOSCI_WEZLOW(1, n+1) = WARTOSCI_WEZLOW(1, n+1) - h/3 * pochodna2;

out(2:n+2, 1) = linsolve3( c,a,b,WARTOSCI_WEZLOW);
out(1, 1) = out(3, 1) - h/3 * pochodna1;
out(n+3, 1) = out(n+1, 1) + h/3 * pochodna2;
