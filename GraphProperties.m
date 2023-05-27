classdef GraphProperties
    methods
        %calculates clustering coefficient of given graph
        function coef = clustering_coefficient(obj, G)
            num_vertices = numnodes(G);
            %for each vertex x, calculate c(x)
            total = 0;
            for i = 1:num_vertices
                subgr = subgraph(G, neighbors(G,i));
                edges_amnt = numedges(subgr);
                
                % check that nchoosek is possible (must have at least 2 edges) 
                if degree(G, i) <2
                    denominator = 1; 
                else
                    denominator = nchoosek(degree(G, i), 2);
                end
                result = edges_amnt/denominator;
                total = total + result;
            end
            coef = total/num_vertices;
        end
        
        %function calculating average distance L(G) for graph G
        function avg = average_distance(obj, G)
            num_vertex = numnodes(G);
            sum_distances = sum(distances(G), "all")/2;
            denominator = nchoosek(num_vertex, 2);
            avg = sum_distances/denominator;
        end
    end
end