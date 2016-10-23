function [total_weight] = TotalWeight(content)
    total_weight = 0;
    for item=1:numel(content)
        if content(item).situation == 1
            total_weight = total_weight + content(item).weight;
        end
    end

end
