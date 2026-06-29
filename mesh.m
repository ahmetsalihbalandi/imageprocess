A=randn(4)

x=linspace(-1,1,50);
y=x

[X,Y]=meshgrid(x,y);
mesh(X.^2+Y.^2);