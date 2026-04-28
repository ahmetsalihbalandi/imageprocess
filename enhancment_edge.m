A = imread("cameraman.jpg");
k = fspecial("laplacian");
B=imfilter(A,k);
C=imsubtract(A,B);
subplot(1,3,1), imshow(A);
subplot(1,3,2), imagesc(B);axis image;axis off
subplot(1,3,3), imshow(C);