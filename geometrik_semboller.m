clc; clear;close all;
% Görüntü boyutu (piksel bazında)
imgSize = 500;
cember = zeros(imgSize, imgSize); % Başlangıçta siyah bir görüntü
ucgen = zeros(imgSize, imgSize);
dortgen = zeros(imgSize, imgSize);
yildiz = zeros(imgSize, imgSize);

%% ÇEMBER
radius = 100; % Çember yarıcapı
center = [250, 250]; % Çember merkezi (x, y)

theta = linspace(0, 2*pi, 1000); % Açı değerleri
x = round(center(1) + radius * cos(theta)); % X koordinatları
y = round(center(2) + radius * sin(theta)); % Y koordinatları

% Çember piksel değerlerini 1 yap
for i = 1:length(x)
    if x(i) > 0 && x(i) <= imgSize && y(i)> 0 && y(i) <= imgSize
        cember(y(i), x(i)) = 1;
    end
end

%% ÜÇGEN
triangleVertices = [150, 400; 250, 100; 350, 400]; % Köşe noktaları
triangleEdges = [1, 2; 2, 3; 3, 1]; % Üçgenin kenarları

for i = 1:size(triangleEdges, 1)
    v1 = triangleVertices(triangleEdges(i, 1), :); % İlk köşe
    v2 = triangleVertices(triangleEdges(i, 2), :); % İkinci köşe
    [x, y]=bresenham(v1(1), v1(2), v2(1),v2(2)); %Bresenham algoritmas
    for j = 1:length(x)
        if x(j) > 0 && x(j) <= imgSize && y(j) > 0&& y(j) <= imgSize
            ucgen(y(j), x(j)) = 1;
        end
    end
end

%% DİKDÖRTGEN
rectangleVertices = [150, 200; 350, 200; 350, 300; 150, 300]; % Koşele
rectangleEdges = [1, 2; 2, 3; 3, 4; 4, 1]; % Dikdortgenin kenarları

for i = 1:size(rectangleEdges, 1)
    v1 = rectangleVertices(rectangleEdges(i, 1), :); % İlk köşe
    v2 = rectangleVertices(rectangleEdges(i, 2), :); % İkinci köşe
    [x, y] = bresenham(v1(1), v1(2), v2(1), v2(2)); % Kenar çizimi
    for j = 1:length(x)
        if x(j)>0 &&x(j) <= imgSize && y(j)> 0 && y(j) <= imgSize
            dortgen(y(j), x(j)) = 1;
        end
    end
end

%% Yıldız
center = [250, 250]; % Yıldız merkezi
outerRadius = 150; % Buyuk yarıcap
innerRadius = 75; % Küçük yarıçap
numPoints = 5; % Yıldız koşe sayısı

thetaOuter = linspace(0, 2*pi, numPoints + 1); % Büyük köşe açıları
thetaInner = thetaOuter(1:end-1) + pi / numPoints; % Küçuk koşe acıları

xOuter = round(center(1) + outerRadius * cos(thetaOuter)); % Buyuk koşe X
yOuter = round(center(2) + outerRadius * sin(thetaOuter)); % Büyük köşe Y
xInner = round(center(1) + innerRadius * cos(thetaInner)); % Küçük koşe X
yInner = round(center(2) + innerRadius * sin(thetaInner)); % Kuçuk koşe Y

% Yıldızın kenarlarını çiz
for i = 1:numPoints
    % Büyük köşeden küçük köşeye çiz
    [x1, y1] = bresenham(xOuter(i), yOuter(i), xInner(i), yInner(i));
    % Küçük köşeden bir sonraki büyük köşeye çiz
    [x2, y2]= bresenham(xInner(i), yInner(i), xOuter(i+1), yOuter(i+1));
    % Piksel değerlerini matris içinde 1 yap
    x = [x1, x2]; y = [y1, y2];
    for j = 1:length(x)
        if x(j) > 0 && x(j) <= imgSize && y(j)> 0 && y(j) <= imgSize
            yildiz(y(j), x(j)) =1;
            yOuter = round(center(2) + outerRadius * sin(thetaOuter));
            xInner = round(center(1) + innerRadius * cos(thetaInner));
        end
    end
end

%% GÖRÜNTÜYÜ GÖSTERME
figure;
subplot(2,2,1); imshow(cember);
subplot(2,2,2); imshow(ucgen);
subplot(2,2,3); imshow(dortgen);
subplot(2,2,4); imshow(yildiz);