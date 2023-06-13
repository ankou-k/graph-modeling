function [L] = multi_zero_force(H,I)
row=size(I,1);
for i=1:row
    [t,~,~]=zero_force(H,I(i,:),[],[]);
    if t==1
        L(end+1)=i;
    else
    end
end
end


      
