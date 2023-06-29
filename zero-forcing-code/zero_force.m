function [tv,C,D] = zero_force(H,I,C,D) %tv is truth value for did we sucessfully force, C is the forcing chain, 
%H is the graph and I is the initally forced set, D is the list of forcer
%vertices (C is the list of those that were forced)
Istart=I;
a=1;
n0=numnodes(H);
while a<=length(I) %go through all vertices
    i=I(a);
    N=neighbors(H,i); %look at neighbors
    Nd=size(N,1);
    cu=0; %counter for unforced neighbors of i
    j=1; %counter for neighbors
    ca=0; %initialize ca.
    while j<=Nd %loop through neighbors
        if any(I(:)==N(j))
            j=j+1;
        else
            cu=cu+1;
            if cu>=2
                j=Nd+1;
            else 
                ca=j; %record j as a candidate force - then need to actually force 
            % if c doesn't exceed 1 and not force if it does
                j=j+1;
            end
        end
    end
    if cu==1 %i.e. there is a force from i to some neighbor
        I(end+1)=N(ca);%add forced vertex to the vertex forcing list
        C(end+1)=N(ca); %add vertex to the forced list
        D(end+1)=i;%add vertex to the list of forcers
        if length(I)==n0
            tv=1;
            a=n0+1;
        else
            a=a+1;
        end
    else
        a=a+1;
    end
end
if length(I)==n0
else
    if length(I)==length(Istart)
    tv=0;
    else
    [tv,C,D]=zero_force(H,I,C,D);
    end
end
end


    