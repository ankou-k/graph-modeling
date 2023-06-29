% Modifications by Alex Panfilov from multi_zero_force(H,I)
% Purpose: keep track of forcer-forcee pairs in .txt files for sets that fully force

function [L, numForces] = multi_zero_force_info(H,I)
% H is graph
% I is matrix of subsets that are being tried (each row is
% subset) 
% eg. 32 vertices, 1-16 are forced, then mess with the last row (last 16
% since always doubling -> how much of those need to be forced for the
% graph to be forced
%D is the list of forcer, vertices (C is the list of those that were forced)
L = [];
numForces = [];
row=size(I,1);
%open file to append forcee-forcer pairs
beForcedFile = fopen('beForcedFile.txt','w');
forceFile = fopen('forceFile.txt','w');
for i=1:row
    [t,C,D]=zero_force(H,I(i,:),[],[]);
    if t==1 %truth value - 1 if forced successfully
        L(end+1)=i;
        numForces(end+1, 1)=size(C,2);
        %print C and D to file
        fprintf(beForcedFile, '%d ', C);
        fprintf(beForcedFile, '\n');
        fprintf(forceFile, '%d ', D);
        fprintf(forceFile, '\n');
        %forcee(end+1)=C;
        %forcer(end+1)=D;
    else
    end
end
%close file for forcee-forcer pairs
fclose(force_file);
end


      
