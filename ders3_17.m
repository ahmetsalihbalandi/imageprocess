% Example 1.7
% Matlab code

D=imread('onion.png');

Dred=D(:,:,1);
Dgreen=D(:,:,2);
Dblue=D(:,:,3);

subplot(2,2,1); imshow(D); axis image;

subplot(2,2,2); imshow(Dred); title('red');
subplot(2,2,3); imshow(Dgreen); title('green');
subplot(2,2,4); imshow(Dblue); title('blue');