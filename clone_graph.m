%Function clones of all the vertices in G
function new_graph = clone_graph(G)
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
        neighbouring_set = rot90([v; neighbors(G,v)]);
           
        G = addedge(G, neighbouring_set, clone, 1); %start nodes, end nodes, weight
        %plot(G);
     end

     new_graph = G;
end
