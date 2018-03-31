function [] = test(M, b, k)

[~,EigVal1] = eig(M);
[EigVal2] = Program(M, b, k);
EigVal1 = sort(diag(EigVal1), 'descend');
EigVal1=EigVal1';
subplot(1,2,1);
plot(1:length(M), EigVal2, 'r+');
hold on;
grid on;
plot(1:length(M), EigVal1, 'bo');
title('Eigen Values');
legend('Estimated Vals','Accurate Vals');
subplot(1,2,2);
bar(1:length(M), abs(EigVal2-EigVal1));
title('Errors (abs)');
end