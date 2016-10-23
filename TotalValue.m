function [total_value] = TotalValue(content)
    total_value = 0;
    for item=1:numel(content)
        if content(item).situation == 1
            total_value = total_value + content(item).value;
        end
    end

end

