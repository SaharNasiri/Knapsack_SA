function [outputContent] = Choose(inputContent, bag_volume) 
    r = randperm(numel(inputContent));
    totalWeight = TotalWeight(inputContent);
    
    for i=1:numel(r)
        if inputContent(r(i)).situation ~= 1
            totalWeight = totalWeight + inputContent(r(i)).weight;
            if totalWeight <= bag_volume
                inputContent(r(i)).situation = 1;
            else
                totalWeight = totalWeight - inputContent(r(i)).weight;
            end  
        end
    end
    outputContent = inputContent;
end
