%FIRST DIMENSION IS HOW MANY ROWS
%SECOND DIMENSION IS HOW MANY COLUMNS

%VARIABLES
name = "ILT_K2_4";
graph_type = 'ILT'; %either 'ILT' or 'ILAT', for excel
NUM_STAGES = 4; 
set_size = 7;
excelfile = "Zero_forcing_stats.xlsx";
beForcedFile = 'beForcedFile.txt';
forceFile = 'forceFile.txt';

%CRETATE starting graph
clique_arr = clique_graph(2);
G = graph(clique_arr, 'omitselfloops');

%PLOT starting graph
t = tiledlayout(2,1);
title(t,"Zero Forcing");
nexttile
plot(G);
title("Starting graph");

%CREATE resulting graph
H = IIM_clone(G, NUM_STAGES);

%PLOT resulting graph
nexttile
plot(H);
title("Resulting graph");

%INITIAL FORCED SETS ("colouring" a set blue)
v = 1:1:16;
w = 17:1:32;
combinations = nchoosek(w, set_size);
%all_combinations = combinations;

%SET FORCED ITEMS
mat_size = size(combinations, 1);
first = repmat(v, [mat_size 1]);
all_combinations = [first combinations];

fprintf("Number of combinations of size %d tried: %d \n", size(all_combinations, 2), size(all_combinations, 1));

%ZERO-FORCING
%[successfulForces, numForces] = multi_zero_force_info(H,all_combinations);
[successfulForces, numForces, maxForces] = multi_zero_force_count(H,all_combinations, 4);
fprintf("Max count of forces: %d \n", maxForces)

if isempty(successfulForces)
    disp("The successful forces list is empty.");
else
    %disp(successfulForces);
    %disp(numForces);
    fprintf("Just ran multi zero forcing, number of successful forces is %d. \n", size(successfulForces, 2));
end

%INPUT data into class
% info = RecordingGraphs;
% info = set_starting_info(info, name, NUM_STAGES, set_size);
% info = read_force_pairs(info, beForcedFile, forceFile);
% info = set_num_forces(info, numForces);
% info = set_rows_forced(info, all_combinations, successfulForces);

%CONCATENATE stats to graph
%table(info, excelfile, graph_type, 'A182');


%vertices 32
%PART A: sets: all 1-16 + choose 7 of last 16
%if doesn't force completely: who forced, max forces
%likely won't completely force, if does same info as 16 vertices graph

%PART B: sets: all 1-16 + choose 8 of last 16

%lab book of results

%PART C: sets: choose 15 of 32 (should fail)
