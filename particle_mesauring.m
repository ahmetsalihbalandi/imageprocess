A=imread('enamel.jpg'); subplot(1,3,1), imshow(A)
bw=~im2bw(A,0.4); bw = imfill(bw,'holes');
subplot(1,3,2), imshow(bw);

[L,num_0]=bwlabel(bw);

se=strel('disk',2);

count =0;
num=num_0;

while num>0
    count=count + 1;
    bw=imerode(bw,se);
    [L,num]=bwlabel(bw);
    P(count)=num_0-num;
    figure(2); imshow(bw); drawnow;
end

figure(2); subplot(1,2,1), plot(0:count,[0 P],'ro');
axis square;axis([0 count 0 max(P)]);
xlabel('Size'); ylabel('Particles removed');
subplot(1,2,2); plot(diff([0 P]),'k*'); axis square;