Y = imread('me_at_the_palace.jpg');
figure; subplot(2,3,1); imshow(Y); title('me!');

Y = im2gray(Y);
Sobelx = [1 0 -1; 2 0 -2; 1 0 -1];
Sobely = [1 2 1; 0 0 0; -1 -2 -1];
Sx = mat2gray(conv2(Y, Sobelx));
Sy = mat2gray(conv2(Y, Sobely));
subplot(2,3,2); imshow(Sx); zoom(3); title('x-derivative');
subplot(2,3,3); imshow(Sy); zoom(3); title('y-derivative');

G = sqrt(Sx.^2 + Sy.^2);
subplot(2,3,4); imshow(G); zoom(3); title('Gradient magnitude');

Lap = [0 -1 0; -1 4 -1; 0 -1 0];
LapRot = [-1 -1 -1; -1 8 -1; -1 -1 -1];
L = mat2gray(conv2(Y, Lap));
Lr = mat2gray(conv2(Y, LapRot));
subplot(2,3,5); imshow(L); zoom(3); title('Laplacian');
subplot(2,3,6); imshow(Lr); zoom(3); title('Double Laplacian');

