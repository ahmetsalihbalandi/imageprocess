clear all; clc;
A=imread("cameraman.tif");
B=imread("rice.png");
C=A;
for i=1:256
    for j=1:256
        if B(i,j)>A(i,j)
            C(i,j)=B(i,j);
        end
    end
end    

figure; imshow(A); title("cameraman");
figure; imshow(B); title("rice");
figure; imshow(C); title("processed");