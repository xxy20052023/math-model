x=input("intput the matrix:");
%x is the matrix to judge
[m,n]=size(x);
disp(['there are ' num2str(m) 'objects and ' num2str(n) 'indicators']);
is=input('dose the matrix need to be forwarded? yes, enter 1,others ,0');
%judge whether to forward

%正向化过程
if is
    col=input('input the index of columns that need to be forwarded');
    %col is the index of columns that need to be forwarded
    type=input('输入这几列需要正向化的类型，1是极小型，2是中间型，3是区间型');
    for i=1:size(col,2)
       if type(i) ==1
           x(:,col(i))=minForward(x(:,col(i)));
       elseif type(i)==2
           best=input('输入中间型的best值');
           x(:,col(i))=middleForward(x(:,col(i)),best);
       elseif type(i)==3
           low=input('请输入区间的下限');
           high=input('请输入区间的上限');
           x(:,col(i))=rangeForward(x(:,col(i)),low,high);
       end
    end
end


%开始标准化
S1=sum(x.^2,1).^0.5;
for i=1:size(x,2)
    for j=1:size(x,1)
        x(j,i)=x(j,i)/S1(i);
    end
end


%开始计算
MA=max(x);
MA=repmat(MA,m,1);
disp(size(MA));
MA=(MA-x).^2;
DA=sum(MA,2);
DA=DA.^0.5;
MI=min(x);
MI=repmat(MI,m,1);
MI=(x-MI).^2;
DI=sum(MI,2);
DI=DI.^0.5;
ANS=DI./(DI+DA);
S1=sum(ANS);
ANS=ANS/S1*100;


disp(ANS);
