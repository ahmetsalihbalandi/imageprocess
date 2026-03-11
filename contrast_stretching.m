I=imread('pout.tif');
Ics=imadjust(I,stretchlim(I,[0.5 0.95]),[]);
subplot(2,2,1);imshow(I);
subplot(2,2,2);imshow(Ics);

subplot(2,2,3);imhist(I);
subplot(2,2,4);imhist(Ics);