%Function clones of all the vertices in G
function new_graph = anticlone_graph(G)
     num_vertices = numnodes(G);
     %for each vertex with index 1 to num_vertices (original size)
     for v = 1:num_vertices
    
        %name for the future clone
        name = "Node" + string(v + num_vertices);
    
        %create vertex clone
        G = addnode(G, name);
        %plot(G);
        clone = findnode(G, name);
            
        %edge between clone and v and neighbours of v
        %rotate to have horizontal matrix
        v_neighbours = rot90([v; neighbors(G,v)]);

        %create set of non-v neighbours
        clone_neighbours = setdiff(1:num_vertices,v_neighbours);
           
        G = addedge(G, clone_neighbours, clone, 1); %start nodes, end nodes, weight
        %plot(G);
     end

     new_graph = G;
end
