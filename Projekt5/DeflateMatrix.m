% funckja dokonuje deflacji macierzy M przeksztalceniem L1

function [ A ] = DeflateMatrix(M, maxv)

%p = 1;
%while(maxv(p) == 0)
%    p = p + 1;
%end
[~,p] = max(abs(maxv));
if (p > length(maxv))
    A = 'error';
end

A = M - 1/maxv(p) * maxv * M(p, :);

end