function [ out ] = SimpsonInt(fun, a, b, n)

H = (b-a)/n;
WEZLY = linspace(a, b, n);
TEST = fun(pi/2);
out = H/6 * sum( fun(WEZLY(:,1:end-1)) + 4*fun((WEZLY(:,1:end-1)+WEZLY(:,2:end))/2) + fun(WEZLY(:,2:end)) );

end