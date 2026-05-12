I = rgb2gray(imread('peppers.png'));
k = fspecial('laplacian');
IEI = imfilter(double(I), k, 'symmetric');

subplot(1,2,1), imagesc(I);
subplot(1,2,2), imagesc(IEI);
colormap('gray');
