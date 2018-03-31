%% skrypt znajdujacy zero wielomianu
%% WSP - wekstor ze wspolczynnikami wielomianu od a0 do an
%% x_akt - przyblizenie poczatkowe

%% zwraca miejsce zerowe

function [ x_akt ] = szukaj_zera(WSP, x_akt)
epsilon = 10*eps;
if (abs(horner(WSP, x_akt)) < eps)    % sprawdzenie, czy nie podano zera na poczatku
   
   
else
    
x_poprz = x_akt + 100 * epsilon;                    % poprzednie przyblizenie zera wielomianu  --  na poczatku dostatecznie rozne od x_akt
WSP_POCH = WSP(:, 2:end) .* [1:(length(WSP) - 1)];  % wspolczynniki wielomianu pochodnego
licznik = 0;                                        % licznik iteracji pêtli while
while (abs(x_akt - x_poprz) > epsilon)
    x_poprz = x_akt;
   	ulamek = horner(WSP, x_poprz) / horner(WSP_POCH, x_poprz);  % wzór na liczenie kolejnego przybli¿enia miejsca zerowego
    x_akt = x_poprz - ulamek;
    licznik = licznik + 1;
    if (licznik > 10000)
        fprintf('Podane przybli¿enie pocz¹tkowe jest zbyt niedok³adne lub (kolejne) miesjce zerowe nie istnieje\n');
        x_akt = 'e';
        break;
    end
end

end