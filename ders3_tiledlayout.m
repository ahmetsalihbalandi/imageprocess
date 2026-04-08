clear all;clc;
A=imread("onion.png");
figure;
tiledlayout(2,4,"TileSpacing","tight");   % 2 satır, 4 sütunluk düzenli grafik alanı oluştur

C = bitshift(A, 0);                       % 0 bit kaydırma (orijinal görüntü)
nexttile;
imshow(C);

C = bitshift(A, -1);                      % 1 bit sola kaydır (parlaklık yarıya iner)
nexttile;
imshow(C);

C = bitshift(A, -2);                      % 2 bit sola kaydır
nexttile;
imshow(C);

C = bitshift(A, -3);                      % 3 bit sola kaydır
nexttile;
imshow(C);

C = bitshift(A, -4);
nexttile;
imshow(C);

C = bitshift(A, -5);
nexttile;
imshow(C);

C = bitshift(A, -6);
nexttile;
imshow(C);

C = bitshift(A, -7);
nexttile;
imshow(C);
