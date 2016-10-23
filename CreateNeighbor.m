function [outputContent] = CreateNeighbor(inputContent, bag_volume)
    r = randperm(numel(inputContent));
    for j=1:numel(r)
        if inputContent(r(j)).situation == 1
            inputContent(r(j)).situation = 0;
            outputContent = Choose(inputContent, bag_volume);
            break;
        end
    end
end
