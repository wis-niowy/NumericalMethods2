% funkcja liczacy zmodyfikowana metoda Euelra uklad 2 rownan rozniczkowych
% y''(t) = -k*sin(y)
% funkcja zwraca: 
% y - wektor z wartosciami y
% yprim - wektor z wartosciami y'
function [y, yprim] = modifiedEulerMethod(y0, y0prim, h, tmin, tmax)

global k;
tArray = tmin:h:tmax;
y = zeros(1,length(tArray));
yprim = zeros(1,length(tArray));
y1prev = y0;
y2prev = y0prim;
y(1) = y0;
yprim(1) = y0prim;

for i = 1:length(tArray)-1
    y1akt = y1prev + h * (y2prev + h/2 * y2prev);
    y2akt = y2prev + h * (-k * sin(y1prev + h/2 * (-k*sin(y1prev))));
    %y1akt = y1prev + h * y2prev;
    %y2akt = y2prev + h * (-k * sin(y1prev));
    y1prev = y1akt;
    y2prev = y2akt;
    y(i+1) = y1prev;
    yprim(i+1) = y2prev;
end

end