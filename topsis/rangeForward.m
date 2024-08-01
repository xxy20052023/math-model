function [x]=rangeForward(y,low,high)
    M=max([low-min(y),max(y)-high,0]);
    x=zeros(size(y,1),1);
    for i=1:size(y,1)
        if y(i)<low
            x(i)=1-(low-y(i))/M;
        elseif y(i)>high
            x(i)=1-(y(i)-high)/M;
        else
            x(i)=1;
        end
    end
    
end