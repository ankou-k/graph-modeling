%FIRST DIMENSION IS HOW MANY ROWS
%SECOND DIMENSION IS HOW MANY COLUMNS

%VARIABLES
name = "ILAT_K3_3";
graph_type = 'ILAT'; %either 'ILT' or 'ILAT', for excel
NUM_STAGES = 3;
excelfile = "Zero_forcing_stats.xlsx";
beForcedFile = 'beForcedFile.txt';
forceFile = 'forceFile.txt';
partial_forces = 'partialForces.txt';

%CRETATE starting graph
clique_arr = clique_graph(3);
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
v = 1:1:24;
%w = 19:1:32;
num_choose_v = 14;
%num_choose_w = 15;
set_size = num_choose_v;
combinations = nchoosek(v, num_choose_v);
num_forces = 24 - set_size;

fprintf("Number of combinations of size %d tried: %d \n", size(combinations, 2), size(combinations, 1));

%ZERO-FORCING
[successfulForces] = multi_zero_force_info(H,combinations);

size = size(combinations, 2);

if successfulForces > 0
    %INPUT data into class
    info = RecordingGraphs;
    info = set_starting_info(info, name, NUM_STAGES, set_size, num_forces);
    info = read_force_pairs(info, beForcedFile, forceFile);
    %info = set_num_forces(info, numForces);
    info = set_rows_forced(info, combinations, successfulForces);
    
    %CONCATENATE stats to graph
    T = table(info, excelfile, graph_type, 'A2123');
end

%vertices 32
%PART A: sets: all 1-16 + choose 7 of last 16
%if doesn't force completely: who forced, max forces
%likely won't completely force, if does same info as 16 vertices graph

%PART B: sets: all 1-16 + choose 8 of last 16

%lab book of results

%PART C: sets: choose 15 of 32 (should fail)
