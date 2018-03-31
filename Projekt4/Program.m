function [ out ] = Program(fun, n, m)

dx=0.01;
a=0+dx;
b=2*pi+dx;
DZIEDZ = a:((b-a)/m):b;
m=m+1;
out = zeros(m, 3);
A = zeros(1,n);
B = zeros(1,n);

a0 = 1/(2*pi) * SimpsonInt(fun, a, b, 2*n);
for i = 1:n
   A(:,i) = 1/pi * SimpsonInt(@(x)(fun(x).*cos(i*x)), a, b, 2*n);
   B(:,i) = 1/pi * SimpsonInt(@(x)(fun(x).*sin(i*x)), a, b, 2*n);
end

out(:,1) = fun(DZIEDZ');
for k = 1:m
    out(k,2) = a0 + sum( A.*cos((1:n)*DZIEDZ(:,k)) + B.*sin((1:n)*DZIEDZ(:,k)) );
    %out(k,2) = a0;
    %for z = 1:n
    %    out(k,2) = out(k,2) + A(:,z)*cos(z*DZIEDZ(:,k)) + B(:,z)*sin(z*DZIEDZ(:,k));
    %end
    % to zakomentowane to to samo co wyzej tylko bez wektoryzacji!!!!!!!
end
out(:,3) = out(:,1) - out(:,2);

plot(DZIEDZ, out(:,1)', 'r-');
grid on;
hold on
plot(DZIEDZ, out(:,2)', 'g--');
legend('w³aœciwa', 'aproksymowana', 'Location', 'NorthEast');
end


