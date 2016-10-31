clc; clear all; close all;

%-------------Problem Definition------------%

load('Object.mat');
Bag = 30;
ChooseFunc = @(objects) Choose(objects, Bag);

%-------Parameters---------%

maxIt = 100;
maxItPerTemp = 10;
T0 = 100;
alpha = 0.95;

figure;
%hold on;
%C = {'b','r','g','y', 'k', 'm', 'c', 'w',[.5 .6 .7],[.8 .2 .6]}; % Cell array of colros.
%colors=['+'; 'o'; '*'; 's'];
%cmap = colormap(parula(10));
%x = 0:.01:1; 

%-------Initialization---------%
%for j=1:2
    %alpha = alpha - 0.1;
    %T0 = T0 - 200;
solution = ChooseFunc(Object);
bag_equipment = solution;
currentValue = TotalValue(bag_equipment);
bestSolution = bag_equipment;
bestValue = zeros(1, maxIt);
T = T0;

%-------Main Loop---------%


for it=1:maxIt
    for t=1:maxItPerTemp
        solution = CreateNeighbor(bag_equipment, Bag);
        if TotalWeight(solution) > Bag
        end
        newValue = TotalValue(solution);
        delta = newValue - currentValue;
        if delta > 0
            bag_equipment = solution;
            currentValue = TotalValue(bag_equipment);
        else
            p = exp(delta/T);
            if rand < p
                bag_equipment = solution;
                currentValue = TotalValue(bag_equipment);
            end
        end
        if newValue > TotalValue(bestSolution)
            bestSolution = bag_equipment;
        end
    end
    bestValue(it) = TotalValue(bestSolution);
    disp(['Iteration: ' num2str(it) ' Best Value: ' num2str(bestValue(it))]);
    disp('Best Bag = ');
    result = [];
    for i=1:numel(bestSolution)
    
        if bestSolution(i).situation == 1
            result = [result bestSolution(i).weight];
        end
    end
    T = alpha*T;
end

%-------Result---------%

%plot(bestValue, 'color',C{j},'marker','o');
plot(bestValue);
xlabel('Iteration');
ylabel('Bag_Value');


disp('Best Bag = ');
result = [];
for i=1:numel(bestSolution)
    
    if bestSolution(i).situation == 1
        result = [result bestSolution(i).weight];
    end
end
result