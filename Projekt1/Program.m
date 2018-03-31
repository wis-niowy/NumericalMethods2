%% Program oblicza wszystkie zera wielomainu metod¹ stycznych w dziedzinie rzeczywistj

function [ out ] = Program(WSP, zero_poczatkowe)

i = 1;
M_ZEROWE = zeros(1, length(WSP));

while (length(WSP) > 1)
    temp = szukaj_zera(WSP, zero_poczatkowe);
    if (temp == 'e')
        fprintf('Do tej pory znaleziono %d zer wielomianu\n', i-1);       %% jeœli szukaj_zera zwróci³a b³¹d
        break;
    end
    M_ZEROWE(:, i) = temp;
    zero_poczatkowe = temp;
    WSP = deflacja(WSP, M_ZEROWE(:, i));
    i = i + 1;
    
end
i = i - 1;
if (i == 0)
    out = 'Podany wielomian nie ma miesjc zerowych';

else
out = sort(M_ZEROWE(:, 1:i));
end