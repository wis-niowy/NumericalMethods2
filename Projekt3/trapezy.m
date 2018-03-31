function [ out ] = trapezy(f, a, b, c, d, n)

WEZLY = a:((b-a)/n):b;
Y = c:((d-c)/n):d;
ile_wezlow = length(WEZLY);
out = 0;

for i = 2:(length(Y)-1)
out = out + ((b-a)/n)/2 * (f(a, Y(1)) + f(b, Y(end)) + 2 * sum ( f ( WEZLY(2:(ile_wezlow - 1)), i) ) );
end