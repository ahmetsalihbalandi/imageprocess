clear all; close all; clc;
I = imread('baby.jpg');
figure(1); imshow(I);title("olceklenmis");
M=max(I,[],"all");
Idouble=double(I)/double(M);
figure(2);imshow(Idouble);title("divided by M");
avg=mean(Idouble,["all"]);
if avg>0.5
    disp("ak");
end
if avg<=0.5
    disp("kara")
end