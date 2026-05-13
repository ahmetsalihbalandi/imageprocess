A=zeros(64);
for i=1:64
    for j=1:64
        if rand>0.5
            A(i,j)=ones;
        end
    end
end

imshow(A);