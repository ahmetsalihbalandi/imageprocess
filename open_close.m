A=imread('openclose_shapes.png');
A=~logical(A);

se=strel('disk',3); bw1=imopen(A,se);
bw2=imclose(A,se);
subplot(3,2,1), imshow(bw1); subplot(3,2,2), imshow(bw2);

se=strel('disk',6); bw1=imopen(A,se);
bw2=imclose(A,se);
subplot(3,2,3), imshow(bw1); subplot(3,2,4), imshow(bw2);

se=strel('disk',15); bw1=imopen(A,se);
bw2=imclose(A,se);
subplot(3,2,5), imshow(bw1); subplot(3,2,6), imshow(bw2);