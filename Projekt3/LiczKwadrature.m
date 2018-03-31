function [ out ] = LiczKwadrature(fun, C, X, Y, n, m)

%out = 0;
H1 = (X(end)-X(1))/n;
H2 = (Y(end)-Y(1))/m;
[h1, h2] = meshgrid(X, Y);  %wektoryzacja
WART = fun(h1, h2); % wektoryzacja
%  for i = 1:n
%      for j = 1:m
%          out = out + C(i,j) * fun(X(i), Y(j));
%      end
%  end
out = sum(sum(C .* WART)); % wektoryzacja
out = H1*H2/4 * out;