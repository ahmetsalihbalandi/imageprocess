clear all; clc;

A = imread('cameraman.tif');    % Yoğunluk (intensity) görüntüsünü oku

figure;imshow(A);                      % Görüntüyü imshow ile göster
figure;imagesc(A);                     % Görüntüyü imagesc komutu ile yeniden göster
axis image;                     % Görüntünün oranını (aspect ratio) düzelt
axis off;                       % Eksen etiketlerini (axis labelling) kapat
figure;colormap(gray);                 % Görüntüyü gri tonlarda (grayscale) göster
