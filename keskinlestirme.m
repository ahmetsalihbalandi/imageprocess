A=imread('test_blur.jpg');
A=edgetaper(A,ones(25));
[J,PSF] = deconvblind(A,ones(10));
subplot(1,4,1), imshow(A,[]);
subplot(1,4,2), imshow(J,[]);

h=fspecial('gaussian',[10 10],3);
[J,PSF] = deconvblind(A,h);
subplot(1,4,3), imshow(J,[]);
J = deconvwnr(A,PSF,0.01);
subplot(1,4,4), imshow(J,[]);