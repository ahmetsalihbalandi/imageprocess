A=rand(4)

x=linspace(-1,1,50); y=x
[X,Y]=meshgrid(x,y)
mesh(X.^2+Y.^2)

clear
A=ones(128);
surf(A);
figure;
A=imread('rice.png');
B=repmat(A,2,2);
imshow(B);
tresh=100.*rand(size(A));
I=find(tresh>A);
A(I)=0;
figure;
imshow(A);