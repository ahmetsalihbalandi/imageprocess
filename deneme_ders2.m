% clc;close all;clear all;
% A=imread('baby.jpg');
% imshow(A);title("orijinal");
% B=fliplr(A);imshow(B);title("y eksenine göre simetrik");
% C=flipud(B);imshow(C);title("orijine göre simetrik");

% subplot(1,3,1);imshow(A);title("orijinal");
% subplot(1,3,2);imshow(B);title("y ekseninde simetrik");
% subplot(1,3,3);imshow(C);title("orijinde simetrik");

clc;close all;clear all;
A=imread('cameraman.tif');
B=imread('rice.png');
% figure;imshow(A);figure;imshow(B);
C=fliplr(A);
D=flipud(B);
% figure;imshow(C);figure;imshow(D);
E=imadd(A,C);
F=A+C;
figure;imshow(E);figure;imshow(F);