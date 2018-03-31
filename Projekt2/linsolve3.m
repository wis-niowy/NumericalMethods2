% skrypt rozwiazujacy uklad rownan z macierz trojdiagonalna
% a - wektor dlugosci n-1
% b - wektor dlugosci n
% c - wektor dlugosci n-1
% d - wektor dlugosci n-2 %% powstaje przy zamianie wierszy
% r - wektor z lewa strona rownania - dlugosc n

function [ x ] = linsolve3( a,b,c,r)

n = length(b);
d = zeros(n-2, 1);
x = zeros(n, 1);

for i = 1:(n-1)
    if(abs(a(i)) > abs(b(i)))
        temp = b(i); %% zamiana wyrazow a i b
        b(i) = a(i);
        a(i) = temp;
        
        temp = c(i); %% zamiana wyrazow b i c
        c(i) = b(i+1);
        b(i+1) = temp;
        
        pom=r(i+1); %% zamiana wyrazow w r
        r(i+1)=r(i);
        r(i)=pom;
        
        if(i < n-1) %% bo w ostanim kroku juz to niepotrzebne
            temp = c(i+1); %% zamiana wyrazow c i d
            c(i+1) = d(i);
            d(i) = temp;
        end
    end
    
    l = -a(i)/b(i); %% wspolczynnik l z algorytmu GEPP
    a(i) = 0;
    b(i+1) = b(i+1) + l*c(i);
    r(i+1) = r(i+1) + l*r(i);
    
    if(i < n-1) %% bo w ostanim kroku juz to niepotrzebne
        c(i+1) = c(i+1) + l*d(i);
    end
end

    x(n) = r(n) / b(n); %% wyznaczenie ostatniego x
    x(n-1) = (r(n-1) - c(n-1)*x(n)) / b(n-1); %% wyznaczenie przedostatniego x
    
     for i = (n-2):(-1):1
         x(i) = ( r(i) - (d(i)*x(i+2)) -  (c(i)*x(i+1))) / b(i);
      end
    

    
    
    
    
    