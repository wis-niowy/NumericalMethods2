% skrypt oblicza wartosc funkcji bazowej Bi dla podanego argumentu w
% zaleznosci od przedzialu w jakim argument sie znajduje
% na poczatku rozpatrujemy 6 przypadkow skrajnych

function [ out ] = licz_Bi(i, arg, h, n, WEKTOR_WEZLOW)

if (i == -1) % skrajny lewy przypadek B(-1)
    if (WEKTOR_WEZLOW(1,1) <= arg && arg <= WEKTOR_WEZLOW(1,1)+h)        % x nale퓓 (x(0);x(1)>
    out = (WEKTOR_WEZLOW(1,2)-arg)^3 / h^3;
    else
    out = 0;
    end
elseif (i == 0) %skrajny lewy przypadek B(0)
    if (WEKTOR_WEZLOW(1,1) < arg && arg <= WEKTOR_WEZLOW(1,2))        % x nale퓓 (x(0);x(1)>
    out = (h^3 + 3*h^2*(WEKTOR_WEZLOW(1,2)-arg)+3*h*(WEKTOR_WEZLOW(1,2)-arg)^2-3*(WEKTOR_WEZLOW(1,2)-arg)^3)/h^3;
    elseif (WEKTOR_WEZLOW(1,2) <= arg && arg <= WEKTOR_WEZLOW(1,3))        % x nale퓓 (x(1);x(2)>
    out = (WEKTOR_WEZLOW(1,3)-arg)^3 / h^3;
    else
    out = 0;
    end
elseif (i == 1) %skrajny lewy przypadek B(1)
    if (WEKTOR_WEZLOW(1,1) < arg && arg <= WEKTOR_WEZLOW(1,2))       % x nale퓓 (x(0);x(1)>
    out = (h^3 + 3*h^2*(arg-WEKTOR_WEZLOW(1,1))+3*h*(arg-WEKTOR_WEZLOW(1,1))^2-3*(arg-WEKTOR_WEZLOW(1,1))^3)/h^3;
    elseif (WEKTOR_WEZLOW(1,2) < arg && arg <= WEKTOR_WEZLOW(1,3))        % x nale퓓 (x(1);x(2)>
    out = (h^3 + 3*h^2*(WEKTOR_WEZLOW(1,3)-arg)+3*h*(WEKTOR_WEZLOW(1,3)-arg)^2-3*(WEKTOR_WEZLOW(1,3)-arg)^3)/h^3;
    elseif (WEKTOR_WEZLOW(1,3) <= arg && arg <= WEKTOR_WEZLOW(1,4))        % x nale퓓 (x(2);x(3)>
    out = (WEKTOR_WEZLOW(1,4)-arg)^3 / h^3;
    else
    out = 0;
    end
elseif (i == n+1) % skrajny prawy przypadek B(n+1)
    if (WEKTOR_WEZLOW(1,n) <= arg && arg <= WEKTOR_WEZLOW(1,n+1))        % x nale퓓 (x(n-1);x(n)>
    out = (arg- WEKTOR_WEZLOW(1,n-1))^3 / h^3; 
    else
    out = 0;
    end
elseif (i == n) % skrajny prawy przypadek B(n)
    if (WEKTOR_WEZLOW(1,n-1) <= arg && arg <= WEKTOR_WEZLOW(1,n))        % x nale퓓 (x(n-2);x(n-1)>
    out = (arg- WEKTOR_WEZLOW(1,n-1))^3 / h^3;
    elseif (WEKTOR_WEZLOW(1,n) < arg && arg <= WEKTOR_WEZLOW(1,n+1))       % x nale퓓 (x(n-1);x(n)>
    out = (h^3 + 3*h^2*(arg-WEKTOR_WEZLOW(1,n))+3*h*(arg-WEKTOR_WEZLOW(1,n))^2-3*(arg-WEKTOR_WEZLOW(1,n))^3)/h^3;
    else
    out = 0;
    end
elseif (i == n-1) % skrajny prawy przypadek B(n-1)
    if (WEKTOR_WEZLOW(1,n-2) <= arg && arg <= WEKTOR_WEZLOW(1,n-1))        % x nale퓓 (x(n-3);x(n-2)>
    out = (arg- WEKTOR_WEZLOW(1,n-1))^3 / h^3;
    elseif (WEKTOR_WEZLOW(1,n-1) < arg && arg <= WEKTOR_WEZLOW(1,n))       % x nale퓓 (x(n-2);x(n-1)>
    out = (h^3 + 3*h^2*(arg-WEKTOR_WEZLOW(1,n))+3*h*(arg-WEKTOR_WEZLOW(1,n))^2-3*(arg-WEKTOR_WEZLOW(1,n))^3)/h^3;
    elseif (WEKTOR_WEZLOW(1,n) < arg && arg <= WEKTOR_WEZLOW(1,n+1))        % x nale퓓 (x(n-1);x(n)>
    out = (h^3 + 3*h^2*(WEKTOR_WEZLOW(1,n+1)-arg)+3*h*(WEKTOR_WEZLOW(1,n+1)-arg)^2-3*(WEKTOR_WEZLOW(1,n+1)-arg)^3)/h^3;
    else
    out = 0;
    end
    % w srodku przedzialu:
else

i = i + 1;          % zwiekszamy i aby mozliwe bylo iterowanie po wektorze
                    % i podawane przez argument jest z przedzialu <-1:n+1>
if (WEKTOR_WEZLOW(1,i)-2*h <= arg && arg <= WEKTOR_WEZLOW(1,i)-h)       % x nale퓓 <x(i-2);x(i-1)>
    out = (arg- WEKTOR_WEZLOW(1,i-2))^3 / h^3;
elseif (WEKTOR_WEZLOW(1,i)-h < arg && arg <= WEKTOR_WEZLOW(1,i))       % x nale퓓 (x(i-1);x(i)>
    out = (h^3 + 3*h^2*(arg-WEKTOR_WEZLOW(1,i-1))+3*h*(arg-WEKTOR_WEZLOW(1,i-1))^2-3*(arg-WEKTOR_WEZLOW(1,i-1))^3)/h^3;
elseif (WEKTOR_WEZLOW(1,i) < arg && arg <= WEKTOR_WEZLOW(1,i)+h)        % x nale퓓 (x(i);x(i+1)>
    out = (h^3 + 3*h^2*(WEKTOR_WEZLOW(1,i+1)-arg)+3*h*(WEKTOR_WEZLOW(1,i+1)-arg)^2-3*(WEKTOR_WEZLOW(1,i+1)-arg)^3)/h^3;
elseif (WEKTOR_WEZLOW(1,i)+h < arg && arg <= WEKTOR_WEZLOW(1,i)+2*h)        % x nale퓓 (x(i+1);x(i+2)>
    out = (WEKTOR_WEZLOW(1,i+2)-arg)^3 / h^3;
else
    out = 0;
end

end