%%
% 
% <latex>
% \begin{tabular}{|c|c|} \hline
% $n$ & $n!$ \\ \hline
% 1 & 1 \\
% 2 & 2 \\
% 3 & 6 \\ \hline
% \end{tabular}
% </latex>
% 

classdef context < handle
    properties
        instance_names
        instances
        buffer_size
    end
    %%
    % 
    % <latex>
    % \begin{tabular}{|c|c|} \hline
    % $n$ & $n!$ \\ \hline
    % 1 & 1 \\
    % 2 & 2 \\
    % 3 & 6 \\ \hline
    % \end{tabular}
    % </latex>
    % 
    
    methods
        function object = context()
            object.buffer_size = 1000;
        end
        function [instance] = get(object, instance_name)
            index = context.indexOfValue(instance_name, object.instance_names);
            instance = object.instances(index);
        end
        function set(object, instance_name, instance)
           % instance_names = object.instance_names;
            context.add(instance_name, object.instance_names);
            context.add(instance, object.instances);
        end
        
        function object = set.instances(object, instances)
            error('PLEASE do not directly touch the Systems context %s \n%s', ...
                object, instances );
        end
    end
    
    %%
    % 
    % <latex>
    % \begin{tabular}{|c|c|} \hline
    % $n$ & $n!$ \\ \hline
    % 1 & 1 \\
    % 2 & 2 \\
    % 3 & 6 \\ \hline
    % \end{tabular}
    % </latex>
    % 
    
    
   methods (Static = true) 
     function [index] = indexOfValue(value, value_list)        
        for index = 1:length(value_list)
            current = value_list(index);
            if current == value
                return;
            end
        end
        index = 0;
     end 
     function [value_list] = add(value, value_list)
         index = length(value_list)+1; % TODO DYN array for any class handle/value
         value_list(index) = value;
     end
   end % methods Static = true
end