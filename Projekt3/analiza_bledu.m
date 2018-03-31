function [ ] = analiza_bledu(fun, a, b, c, d)

wezly = 50:50:2000;
calka = zeros(1, length(wezly));

for i = 1:length(wezly)
    calka(1, i) = Program(fun, a, b, c, d, wezly(1, i), wezly(1, i));
end

hold on;
plot(wezly, calka, 'r-');
plot(50:2000, integral2(fun, a, b, c, d), 'b');
grid on;

end