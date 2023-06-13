function [L,F] = multi_zero_force_number(H,I,ind)
row=size(I,1);
L=[];
F=[];
for i=1:length(ind)
    [t,C,~]=zero_force(H,I(ind(i),:),[],[]);
    if t==1
        L(end+1)=i;
    else
        if length(C)~=0
            F(end+1)=length(C);
    end
end
end
end