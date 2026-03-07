clc; clear all;
st = imread('chess.png');

st_new = im2gray(st);              % güvenli griye çevirme (RGB/grayscale/indexed hepsini kapsar)
subplot(1,2,1); imshow(st_new); title('Gray');

n = 8;
st_lowres = imresize(st_new, [n n], 'nearest');  % çok küçültürken bloklu görünüm için 'nearest'
subplot(1,2,2); imshow(st_lowres, 'InitialMagnification', 800); title('8x8 (nearest)');