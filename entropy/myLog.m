function [x]=myLog(y)
    [m,n]=size(y);
    x=zeros(m,n);
    for i=1:m
        for j=1:n
            if y(i,j)~=0
                x(i,j)=log(y(i,j));
            end
        end
    end
end