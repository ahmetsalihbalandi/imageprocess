A = imread('cameraman.tif');       % Görüntüyü oku
subplot(1,2,1), imshow(A);         % Orijinal görüntüyü göster

func = @(x) max(x(:));             % Her pencere içindeki maksimum değeri bulan fonksiyon tanımla
B = nlfilter(A, [3 3], func);      % 3x3 pencere ile maksimum filtre (maksimum filtreleme) uygula

subplot(1,2,2), imshow(B);         % Filtre uygulanmış görüntüyü göster
