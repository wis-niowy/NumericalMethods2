%% skrypt dokonuje deflaji wielomianu czynnikiem liniowym (x - m_zerowe)
%% WSP - wspolczynniki wielomianu od a0 do an

%% zwraca wielomian po defalcji (pomniejszony o jedno miejsce zerowe)

function [ out ] = deflacja(WSP, m_zerowe)

WSP = fliplr(WSP);                      % odwracamy wektor w celu zastosowania "tabelki Hornera"
out = zeros(1, length(WSP));
out(:,1) = WSP(:,1);
for i = 1:(length(WSP) - 1)
    out(:,i+1) = m_zerowe * out(:,i) + WSP(:,i+1);
end

if (abs(out(:,end)) < 10^(-6))          % sprawdzenie, czy w tabelce Hornera ostatni wynik to zero (inaczej liczba podana nie jest miesjcem zerowym
    out = round(out(:, 1:(end-1))*10000)/10000;
    %out = out(:, 1:(end-1));
    out = fliplr(out);
else
    error('Podana wartosc nie jest miejscem zerowym');
end