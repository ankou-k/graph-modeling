%ILT
n = 7;

%clique graph
arr = ones(n,n);
G = graph(arr, 'omitselfloops');

%build star graph array
fst_col = ones(n,1);
other_col = [1; zeros(n-1, 1)];
star_arr = [fst_col, repmat(other_col, 1, n-1)];
%G = graph(star_arr, 'omitselfloops');

%printing out only start and finish results
% t = tiledlayout(2,2);
% title(t,"ILT Model")
% 
% nexttile
% plot(G);
% title("Starting graph");

%run the ilt algorithm
G2 = ilt(G,8);

%run the ilat algorithm
%G3 = ilat(G, 4);

% nexttile
% plot(G2);
% title("Resulting graph");

%calculate original graph properties
graph_info = GraphProperties;
coef_G = graph_info.clustering_coefficient(G);
avg_distance_G = graph_info.average_distance(G);
fprintf("Starting Graph Info:\nAverage distance: %.3f\nClustering coefficient: %.3f\n\n", avg_distance_G, coef_G);

%ilt properties
exist_ilt = exist("G2", 'var'); %checks to see if graph exists
if exist_ilt == 1
    coef_ILT = graph_info.clustering_coefficient(G2);
    avg_distance_ILT = graph_info.average_distance(G2);
    fprintf("Starting Graph Properties:\nAverage distance: %.3f \nClustering coefficient: %.3f\n\n", avg_distance_ILT, coef_ILT);
end

%ilat properties
exist_ilat = exist("G3", 'var');
if exist_ilat == 1
    coef_ILAT = graph_info.clustering_coefficient(G3);
    avg_distance_ILAT = graph_info.average_distance(G3);
    fprintf("ILAT Graph Properties:\nAverage distance: %.3f\nClustering coefficient: %.3f\n", avg_distance_ILAT, coef_ILAT);
end