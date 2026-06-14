vec=ones(1,16);
for i=2:15
    vec(i+1)=vec(i)+vec(i-1)
end

A(1,:)=vec;
for i=1:15
    A(i+1,:)=[vec(17-i:16) vec(1:16-i)]
end
imagesc(log(A))