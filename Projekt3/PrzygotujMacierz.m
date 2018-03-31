function [ out ] = PrzygotujMacierz(n, m)

w1 = ones(n, 1);
w2 = ones(1, m);
w1(2:(end-1), 1) = 2*w1(2:(end-1), 1);
w2(1, 2:(end-1)) = 2*w2(1, 2:(end-1));

out = w1 * w2;