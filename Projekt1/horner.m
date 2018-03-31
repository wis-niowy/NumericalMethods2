% skrypt oblicza wartosc wielomianu algorytmem Hormera

function [ out ] = horner(wek_b, wek_t)
ile_wsp = length(wek_b);

%%%%% algorytm Hornera
w = wek_b(:,ile_wsp);
for i = 1:(ile_wsp - 1)
   w = w .* wek_t + wek_b(:, ile_wsp - i);
end
out = w;