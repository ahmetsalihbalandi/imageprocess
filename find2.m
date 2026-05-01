A=zeros(16);
I=find(rand(16,1)>0.5);
A(:,I)=1;

clc;clear all;
A=imread('circuit.tif');
dims=size(A);
B=imread('onion.png');
dims=size(B);
length=length(B);

clc;clear all;
A=imread("cameraman.tif");
imshow(A);
B=fliplr(A);imshow(B);
C=fliplr(B);imshow(C);
subplot(1,3,1);imshow(A);
subplot(1,3,2);imshow(B);
subplot(1,3,3);imshow(C);