I = rgb2gray(imread("me_at_the_palace.jpg"));
k = fspecial('log', [20 20], 3.0);
IEzc = edge(I, 'zerocross', [], k);
subplot(1,2,1), imshow(I);
subplot(1,2,2), imshow(IEzc);