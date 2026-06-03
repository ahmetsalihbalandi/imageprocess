I=imread('pout.tif');
pz=0:255;
Im=histeq(I,pz);

subplot(2,2,1);imshow(I);
subplot(2,2,2);imshow(Im);
subplot(2,2,3);imhist(I);
subplot(2,2,4);imhist(Im);