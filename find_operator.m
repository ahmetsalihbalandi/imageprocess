clear all; clc;
C=imread('cameraman.tif');
R=imread('rice.png');
A(1:256,1:256)=0;
for i=1:256
    for j=1:256
        if R(i,j)>C(i,j)
            A(i,j)=R(i,j);
            C(i,j)=R(i,j);
        end
    end
end

figure; imshow(C);

clear all;

D=imread('cameraman.tif');
E=imread('rice.png');
