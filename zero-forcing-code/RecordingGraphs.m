classdef RecordingGraphs
    properties
        %all data is vertical
        BeForced = {}
        Forcers = {}
        NumForces = {} %how many times forcing happened
        SetsForced = {} %the set that led to the result
        NumItems = 0; %how many items there are in this occurance of class
        SetSize = 0
        GraphName = ""
        NumSteps = 0

    end
    methods
        function obj = read_force_pairs(obj, file1, file2)
            %file1 is forcees, file2 is forcers
            %read them in as horizontal arrays (only 1 row), can invert to
            %have 1 column
            obj.BeForced = readlines(file1, "EmptyLineRule","skip");
            obj.Forcers = readlines(file2, "EmptyLineRule","skip");
            %obj.BeForced = obj.BeForced.'; %inverts array 
            %disp(size(obj.BeForced));
            
        end
        
        function obj = set_num_forces(obj, numForces)
            if isempty(obj.Forcers) || isempty(obj.BeForced) || (size(obj.Forcers,1) ~= size(obj.BeForced,1))
                disp("error, cannot calculate number of forces")
            else
                obj.NumForces = numForces;
            end
        end

        function obj = set_rows_forced(obj, allSets, goodForces)
            %allSets is a matrix of all the sets 
            %SetsForced is a vertical matrix, all other data is horizontal
            if isempty(goodForces) == 0 %not empty
                obj.NumItems = size(goodForces,2);
                fprintf("Number of successful force sets is: %d \n", obj.NumItems);
                obj.SetsForced = strings(obj.NumItems, 1);
                for i=1:size(goodForces, 2)
                    stringify = int2str(allSets(goodForces(1, i), :)); %change set array to string
                    %disp(stringify);
                    obj.SetsForced(i,1) = stringify; 
                end
            end
        end
        
        function obj = set_starting_info(obj, graphName, num_steps, set_size)
            %graphName is the name by which graph will be referred to.
            %num_steps is how many clone/anticlone steps there were to get
            %to final graph. set_size is the size of the forcing sets
            obj.GraphName = graphName;
            obj.NumSteps = num_steps;
            obj.SetSize = set_size;
        end

        function table(obj, filename, sheet_name, start_cell)
            %filename is the excel filename to record data into
            %sheet_name is 'ILT' or 'ILAT'
            %start cell is where to start recording data into table, eg. A1
            %TABLE SETUP: "Starting Graph" "Clone/Anticlone Steps" "Force set size" "Force set" "Num forces" "Forcees" "Forcers"
            if obj.NumItems > 0
                %var_names = ["Starting Graph" "Clone/Anticlone Steps" "Force set size" "Force set" "Num forces" "Forcees" "Forcers"];
                %stats = [var_names; zeros(obj.NumItems, 7)];

                %turn name into a matrix
                name = cell(obj.NumItems,1);
                name(:) = {obj.GraphName};
                
                %turn numsteps into a matrix
                steps = cell(obj.NumItems,1);
                steps(:) = {obj.NumSteps};

                %turn force set size into a matrix
                set_size = cell(obj.NumItems,1);
                set_size(:) = {obj.SetSize};
                
                % for i=1:obj.NumItems
                %     graph_info = [obj.GraphName obj.NumSteps obj.SetSize obj.SetsForced(i) obj.NumForces(i) obj.BeForced(i) obj.Forcers(i)];
                %     stats(i,:) = graph_info;
                % end
                
                %create table
                %P = table(stats(2:end, :)); %,'VariableNames', var_names)
                T = table(name, steps, set_size, obj.SetsForced, obj.NumForces, obj.BeForced, obj.Forcers);
                writetable(T,filename,'Sheet',sheet_name,'Range',start_cell, 'WriteVariableNames',false); 
            end
        end

    end
end
