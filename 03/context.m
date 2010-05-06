classdef context < handle
    properties
        instance_names
        instances
    end
    methods
        function object = context()
            
        end
        function [instance] = get(object, instance_name)
            index = indexOfValue(instance_name, object.instance_names);
            instance = object.instances(index);
        end
        function set(object, instance, instance_name)
            add(instance, object.instances);
            add(instance_name, object.instance_names);
        end
    end
    
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
         value_list(length(value_list)) = value;
     end
   end % methods Static = true
end