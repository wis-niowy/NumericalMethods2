% funkcja oblicza maksymalna wartosc wlasna i odpowiadjacy jej wektor dla M
function [ v, lambda ] = CountEigen(M, b, k)

v = b;
for i = 1:k
    v = (M*v) / norm(M*v, 2);
end
lambda = (v' * M * v) / (v' * v); % metoda ilorazu Reyleigh'a

% v = b;
% for i = 1:k
%    vnew = M * v;
%    lambda = norm(vnew, 2) / norm(v, 2);
%    v = vnew;
% end
% 
% v = v/norm(v); % normalizacja wektora wlasnego

end