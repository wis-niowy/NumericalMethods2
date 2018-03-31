% program licz¹cy wszystkie wartosci wlasne macierzy M z dokladnoscie do k
% iteracji metod¹ potêgowa z normowaniem oraz wykonujacy deflacje
% przeksztalceniem L1
% b - przyblizenie poczatkowe wektora wlasnego dla maksymalnej wartosci
% wlasenj macierzy M (b podany jako wektor pionowy)

%function [ VectMatrix, LambdaArray ] = Program(M, b, k)
function [ LambdaArray ] = Program(M, b, k)

LambdaArray = zeros(1, length(M));
VectMatrix = zeros(length(M), length(M));
iterator = 1;
while(iterator <= length(M))
    [VectMatrix(:,iterator),LambdaArray(iterator)] = CountEigen(M, b, k);
    %fprintf('Eigenvalue %.4f with its eigenvector [%6s]\n', LambdaArray(iterator), sprintf('%f ',VectMatrix(:,iterator)));
    fprintf('Eigenvalue %.4f\n', LambdaArray(iterator));
    M = DeflateMatrix(M, VectMatrix(:,iterator));
    iterator=iterator+1;
end

end