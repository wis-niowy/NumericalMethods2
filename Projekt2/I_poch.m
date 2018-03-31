%skrypt liczacy I pochodna podanej funkcji fun w pkt x

function [ out ] = I_poch(fun, x)

h = 1e-5;

out = (fun(x + h) - fun(x - h)) / (2 * h);

end

