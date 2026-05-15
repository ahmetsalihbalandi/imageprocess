clc;clear all;
I = imread('eight.tif');                       % Görüntüyü oku
subplot(1,3,1), imshow(I);                     % Orijinal görüntüyü göster

Isp = imnoise(I, 'salt & pepper', 0.03);       % Görüntüye %3 oranında tuz-biber gürültüsü ekle
subplot(1,3,2), imshow(Isp);                   % Tuz-biber gürültülü görüntüyü göster

Ig = imnoise(I, 'gaussian', 0.02);             % Görüntüye Gauss gürültüsü ekle
subplot(1,3,3), imshow(Ig);

k = fspecial('gaussian', [5 5], 2);   % 5x5 boyutunda, sigma=2 olan Gauss filtresi oluştur
I_g   = imfilter(I, k);               % Orijinal görüntüye Gauss filtresi uygula
Isp_g = imfilter(Isp, k);             % Tuz-biber gürültülü görüntüye uygula
Ig_g  = imfilter(Ig, k);              % Gauss gürültülü görüntüye uygula

subplot(1,3,1), imshow(I_g);          % Orijinal görüntü (bulanıklaştırılmış)
subplot(1,3,2), imshow(Isp_g);        % Tuz-biber gürültülü görüntü (filtre sonrası)
subplot(1,3,3), imshow(Ig_g);         % Gauss gürültülü görüntü (filtre sonrası)
