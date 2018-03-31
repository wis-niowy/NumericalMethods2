% program liczacy polozenie wahadla w czasie
% wykres pokazuje predkosc wahadla w zaleznosci od kata wychylenia
% poczatkowe wartosci:
% - y1prev - wychylenie poczatkowe
% - y2prev - predkosc poczatkowa

function [] = Program(startPos, startVel, g, l, tmin, tmax, h)

global k;

tArray = tmin:h:tmax;
k = g/l;
[degreeArray, velocityArray] = modifiedEulerMethod(startPos, startVel, h, tmin, tmax);

[tt, yy] = ode23('rownanie', [tmin tmax], [startPos startVel]);
subplot(1,2,1);
plot(degreeArray, velocityArray, 'b-');
%plot(tArray, degreeArray, 'b-');
xlabel('k¹t'); ylabel('predkosc');
title('zmodyfikowana metoda Eulera');
grid on;
subplot(1,2,2);
plot(yy(:,1), yy(:,2));
%plot(tt, yy(:,2));
xlabel('k¹t'); ylabel('predkosc');
title('wbudowana');
grid on;
end