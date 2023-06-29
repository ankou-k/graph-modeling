% Modifications by Alex Panfilov from multi_zero_force(H,I)
% Purpose: find the biggest number of forces accross all the sets (I) and 
% record the sets and forcer-forcee pairs for a given amount of forces

function [L, numForces, max_force] = multi_zero_force_count(H,I, force_number)
% H is graph
% I is matrix of subsets that are being tried (each row is
% subset) 
%D is the list of forcer, vertices (C is the list of those that were forced)
L = [];
numForces = [];
row=size(I,1);
max_force = 0;
force_num_counter = 0;
%open file to append forcee-forcer pairs
filename = 'partialForces.txt';
myfile = fopen(filename,'w');
for i=1:row
    [t,C,D]=zero_force(H,I(i,:),[],[]);
    if size(C, 2) > max_force
        disp(C);
        max_force = size(C,2);
    end
    if size(C,2) == force_number
        force_num_counter = force_num_counter+1;
        fprintf(myfile, 'The set is ');
        fprintf(myfile, '%d ', I(i,:));
        fprintf(myfile, '\nThe ones forcing are ');
        fprintf(myfile, '%d ', D);
        fprintf(myfile, '\nThe ones being forced are ');
        fprintf(myfile, '%d ', C);
        fprintf(myfile, '\n\n');
    end    
    if t==1 %truth value - 1 if forced successfully
        L(end+1)=i;
        %forcee(end+1)=C;
        %forcer(end+1)=D;
    else
    end
end
fprintf("There had been %d sets that forced %d times. Find them in %s file.\n", force_num_counter, force_number, filename);
%close file for forcee-forcer pairs
fclose(myfile);
end


      
