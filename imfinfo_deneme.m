clear all; clc;

imfinfo('cameraman.tif')

i1=imread('cameraman.tif');
imwrite(i1,'cameraman.jpg','jpg');
imfinfo('cameraman.jpg')