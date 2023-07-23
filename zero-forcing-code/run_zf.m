%FIRST DIMENSION IS HOW MANY ROWS
%SECOND DIMENSION IS HOW MANY COLUMNS

%VARIABLES
name = "ILAT_K2_4";
graph_type = 'ILAT'; %either 'ILT' or 'ILAT', for excel
NUM_STAGES = 4;
excelfile = "Zero_forcing_stats.xlsx";
beForcedFile = 'beForcedFile.txt';
forceFile = 'forceFile.txt';
partial_forces = 'partialForces.txt';

%CRETATE starting graph
clique_arr = clique_graph(2);
G = graph(clique_arr, 'omitselfloops');

%PLOT starting graph
% t = tiledlayout(2,1);
% title(t,"Zero Forcing");
% nexttile
% plot(G);
% title("Starting graph");

%CREATE resulting graph
if strcmp(graph_type,'ILT')
    H = IIM_clone(G, NUM_STAGES);
elseif strcmp(graph_type,'ILAT')
    H = IIM_anticlone(G, NUM_STAGES);
end


%PLOT resulting graph
% nexttile
% plot(H);
% title("Resulting graph");

%INITIAL FORCED SETS ("colouring" a set blue)
%exclude: 3,4,5,6,9,10,17,18 (direct clones of 1 and 2 at every level)
%n from 1-16, 1 from 17 and 18, m from 19-32, m+n = 15 (16 increases, increase
v = 1:1:16;
w = 19:1:32;
num_choose_v = 10;
num_choose_w = 9;
set_size = num_choose_w + num_choose_v;
combinations_1 = nchoosek(v, num_choose_v);
combinations_2 = nchoosek(w, num_choose_w);
%all_combinations = [1:1:33,35:1:64];
%disp(all_combinations);

%SET FORCED ITEMS
%[ib, ia] = find(true(size(combinations_2, 1), size(combinations_1, 1)));
%all_combinations = [combinations_1(ia(:), :), combinations_2(ib(:), :)];

%first = repmat(v, [mat_size 1]);
%all_combinations = [first combinations];

%fprintf("Number of combinations of size %d tried: %d \n", size(all_combinations, 2), size(all_combinations, 1));

%ZERO-FORCING
%[successfulForces, numForces] = multi_zero_force_info(H,all_combinations);

size_1 = size(combinations_1, 1);
size_2 = size(combinations_2,1);
total_full_forces = 0;
top_max_force = 0;

first = repmat(combinations_1(1,:), size_2, 1);
disp(first);

%disp(combinations_2);

% for i=1:size_1
%     first = repmat(combinations_1(i, :), size_2, 1);
%     all_combinations = [first combinations_2];
%     partial_forces_file = 'partialForces_K2_ILAT4_sz26_temp.txt';
%     [successfulForces, numForces, maxForces] = multi_zero_force_count(H,all_combinations, 1, ">=", partial_forces_file);
%     fprintf("Max count of forces: %d \n", maxForces);
% 
%     if maxForces > top_max_force
%         top_max_force = maxForces;
%     end
% 
%     if isempty(successfulForces)
%         %disp("The successful forces list is empty.");
%     else
%         %disp(successfulForces);
%         %disp(numForces);
%         fprintf("Just ran multi zero forcing, number of successful forces is %d. \n", size(successfulForces, 2));
%         total_full_forces = total_full_forces + successfulForces;
% 
%     end
% end
% fprintf("total successful forces for this batch is %d and max number of forces is %d", total_full_forces, top_max_force);

%INPUT data into class
% info = RecordingGraphs;
% info = set_starting_info(info, name, NUM_STAGES, set_size);
% info = read_force_pairs(info, beForcedFile, forceFile);
% info = set_num_forces(info, numForces);
% info = set_rows_forced(info, all_combinations, successfulForces);

%CONCATENATE stats to graph
%T = table(info, excelfile, graph_type, 'A810');


%vertices 32
%PART A: sets: all 1-16 + choose 7 of last 16
%if doesn't force completely: who forced, max forces
%likely won't completely force, if does same info as 16 vertices graph

%PART B: sets: all 1-16 + choose 8 of last 16

%lab book of results

%PART C: sets: choose 15 of 32 (should fail)
