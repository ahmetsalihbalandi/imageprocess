function [x, y] = bresenham(x1, y1, x2, y2)
% Bresenham cizgi algoritması
x1=round(x1);
y1= round(y1);
x2 = round(x2);
y2=round(y2);
dx = abs(x2-x1);
dy = abs(y2 - y1);
sx = sign(x2- x1);
sy = sign(y2 -y1);
if dy <= dx
    d = 2 * dy - dx;
    dinc1 = 2 * (dy - dx);
    dinc2 = 2 * dy;
    x = x1:sx:x2;
    y = zeros(size(x));
    y(1)= y1;
    for i = 2:length(x)
        if d > 0
            y(i)=y(i-1) + sy;
            d = d + dinc1;
        else
            y(i)=y(i-1);
            d = d + dinc2;
        end
    end
else   
    d = 2 * dx - dy;
    dinc1 = 2 * (dx - dy);
    dinc2 = 2 * dx;
    y = y1: sy: y2;
    x = zeros(size(y));
    x(1) = x1;
    for i = 2:length(y)
        if d > 0
        x(i) = x(i-1) + sx;
        d = d + dinc1;
        else
        x(i) = x(i-1);
        d = d + dinc2;
        end
    end
end