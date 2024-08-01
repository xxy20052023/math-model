function [x]=middleForward(y,best)
    a=abs(y-best);
    Max=max(a);
    x=a/Max;
    x=1-x;
end