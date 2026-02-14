clear; close all; clc;
img = rgb2gray(imread('Maxi_Lopez.jpg'));
% Fourier dönüşümü
F = fft2(img);
Fshift = fftshift(F);
magnitude = log(abs(Fshift) + 1); % Görselleştirme için büyüklük

% Frekans maskeleme için parametreler
[rows, cols] = size(img);
cx = round(cols/2); % Merkez x
cy = round(rows/2); % Merkez y
radius = 30; % Dairesel filtre yarıçapı

% Frekans bileşenlerini ayırma
components = {};
n = 4; % Görüntü için kaç tane bileşen istiyorsanız
for k = 1:n
  mask = zeros(rows, cols);
  [X, Y] = meshgrid(1:cols, 1:rows);
  mask((X-cx).^2 + (Y-cy).^2 < (k*radius)^2 & ...
       (X-cx).^2 + (Y-cy).^2 >= ((k-1)*radius)^2) = 1;
  F_filtered = Fshift .* mask; % Filtrelenmiş frekans bileşeni
  components{k} = abs(ifft2(ifftshift(F_filtered))); % Ters dönüşüm
end

% Görüntüleri gösterme
figure;
for k = 1:n
  subplot(2, n, k);
  imshow(components{k}, []);
  title(['Bileşen ' num2str(k)]);
end

% Toplam görüntü
reconstructed = sum(cat(3, components{:}), 3);
subplot(2, n, n+1:n*2);
imshow(reconstructed, []);
title('Toplam Görüntü');