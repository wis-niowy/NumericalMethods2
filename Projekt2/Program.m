% program interpoluje podana funkcje fun w n wezlach rownoodleglych
%

function [ out, blad_max ] = Program(fun, a, b, n, m, xmin, xmax, ymin, ymax)

DZIEDZINA = linspace(a, b, m);
WEKTOR_WEZLOW = linspace(a, b, n+1);
WARTOSCI_WEZLOW = fun(WEKTOR_WEZLOW);
h = (b-a)/n;


alfy = licz_alfy(WEKTOR_WEZLOW, WARTOSCI_WEZLOW, fun, h, n);
funkcje_B = wartosci_B(DZIEDZINA, WEKTOR_WEZLOW, n, h);

INTERPOL = funkcje_B * alfy;        % wartosci funkcji interpolowanej na dziedzinie
% rysowanie wykresu
plot(DZIEDZINA, fun(DZIEDZINA), 'g-');
hold on;
plot(DZIEDZINA, INTERPOL, 'r--');
legend('f. wlasciwa', 'f. interpolowana', 'Location', 'northeast');
grid on
axis([xmin xmax ymin ymax]);

out = zeros(length(DZIEDZINA), 3);
out(:, 1) = fun(DZIEDZINA);
out(:, 2) = INTERPOL;
out(:, 3) = out(:, 1) - out(:, 2);
blad_max = max(out(:, 3));
fprintf('Maksymalny blad to %d:\n', blad_max);