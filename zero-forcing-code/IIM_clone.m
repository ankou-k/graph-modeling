function [H] = IIM_clone(H,s) %starts with a graph H runs for s stages
% graph H and
%generates from there. All the variables have same role as PLM_1
n0=numnodes(H);
for c=1:s
    n=numnodes(H);
    H = addnode(H,n); 
    for d=1:n
        N=neighbors(H,d);
            for b=1:n0*2^(c-1)
            if any(N(:) == b) == 1 
            H=addedge(H,(n0*2^(c-1))+d,b,1); %dont know why but it thinks it
            %is a weighted graph so need to set 1 to be the edge weight
            else
            end
            end
            H=addedge(H,d,n0*2^(c-1)+d,1);
    end
end
%plot(H)
end