nrow=9;ncols=9;
A=ones(nrow,ncols);
for i=1:nrow
    for j=1:ncols
        if i==j
            A(i,j)=2;
        elseif abs(i-j)==1
            A(i,j)=1;
        else
            A(i,j)=0;
        end
    end
end
A