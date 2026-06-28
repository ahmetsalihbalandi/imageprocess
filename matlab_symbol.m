clear all; clc;

% 1. "membrane" fonksiyonu MATLAB logosunun yüzeyini üretir
[x, y, z] = membrane(1, 50);   % (1,50): mod numarası ve çözünürlük

% 2. Yüzeyi çizdir
figure('Color',[1 1 1])
surf(x, y, z);

% 3. Görsel ayarlar – tam MATLAB logosu görünümü
shading interp;         % yumuşak renk geçişi
colormap(jet);          % orijinal MATLAB renk skalası
axis off;               % eksenleri kaldır
axis equal;             % oranları koru
lighting phong;         % düzgün aydınlatma
camlight left;          % ışık yönü
view([-37.5, 30]);      % klasik MATLAB logo açısı
title('MATLAB Sembolü (Membrane)');

