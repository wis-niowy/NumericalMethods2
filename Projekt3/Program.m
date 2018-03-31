function [ out] = Program(fun, a, b, c, d, n, m)
%tic

X = linspace(a, b, n);
Y = linspace(c, d, m);

C = PrzygotujMacierz(n, m);     %macierz ze wspolczynnikami C(i,j)

out = LiczKwadrature(fun, C, X, Y, n, m);
%toc
