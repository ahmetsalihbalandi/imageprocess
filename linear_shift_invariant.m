% A = imread("baby.jpg");     % read in an image
% [rows dims] = size(A);               % get image dimensions
% Abuild = zeros(size(A));             % construct zero image of equal size
% 
% % Randomly sample 1% of points only and convolve with gaussian PSF
% sub = rand(rows .* dims, 1) < 0.01;
% Abuild(sub) = A(sub); 
% h = fspecial('gaussian', [10 10], 2);
% B10 = filter2(h, Abuild);
% 
% subplot(1,2,1), imagesc(Abuild); axis image; axis off; colormap(gray); title('Object points')
% subplot(1,2,2), imagesc(B10); axis image; axis off; colormap(gray); title('Response of LSI system')

A = imread("baby.jpg");                 
if ndims(A) == 3
    A = rgb2gray(A);                    
end
A = im2double(A);                       

[rows, cols] = size(A);                 
Abuild = zeros(size(A));                

sub = rand(rows, cols) < 0.01;          % %1 rastgele nokta
Abuild(sub) = A(sub);                   

B10 = imgaussfilt(Abuild, 2, 'FilterSize', 11);  % 🔧 11 --> TEK SAYI

subplot(1,2,1), imagesc(Abuild), axis image off, colormap(gray)
title('Object points')
subplot(1,2,2), imagesc(B10), axis image off, colormap(gray)
title('Response of LSI system')
