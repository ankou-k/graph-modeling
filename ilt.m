%flaw of design: reordering while creating clones would break it
%what would reordering be used for?
function new_graph = ilt(G, num_reps)
    
    %display original graph
    num_displays = num_reps + 1; %starting + each repitition

    if mod(num_displays, 10) == 0
        t = tiledlayout(ceil(num_displays/5),5);
    elseif mod(num_displays, 8) == 0
        t = tiledlayout(ceil(num_displays/4),4);
    elseif mod(num_displays, 6) == 0
        t = tiledlayout(ceil(num_displays/3),3);
    else
        t = tiledlayout(ceil(num_displays/2),2);
    end
    
    title(t,"ILT Model")

    nexttile
    plot(G);
    title("Starting graph")
    
    %repeat the cloning specified amount of times
    for rep = 1:num_reps

        G = clone_graph(G); %cloning step

        %display next model of graph
        nexttile
        plot(G);
        title("Graph " + string(rep));
    end
    
    new_graph = G;  
end

