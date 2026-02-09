C=imread('liftingbody.png');
A=C(:,1:64);
B=C(33:64,:);
D=C(75:75+362,75:75+362);

figure;
imshow(C);
figure;
imshow(A);
figure;
imshow(B);
figure;
imshow(D)