clc; clear all; close all;

%-------------Problem Definition------------%

load('D:\Sahar\QIAU\Evolutionary Process\Knapstack_SA\Objects.mat');
Bag = 30;
%nObjects = size(Objects, 2);
ChooseFunc = @(objects) Choose(objects, Bag);

%-------Parameters---------%

maxIt = 100;
maxItPerTemp = 10;
T0 = 100;
alpha = 0.95;

%-------Initialization---------%

solution = ChooseFunc(Object);
TotalWeight(solution)
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
            disp('aaaaaaaaaaaaaaaaaaa')
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
result
sum(result)
    T = alpha*T;
end

%-------Result---------%

figure;
plot(bestValue);
xlabel('Iteration');
ylabel('Bag_Value');
hold on;

disp('Best Bag = ');
result = [];
for i=1:numel(bestSolution)
    
    if bestSolution(i).situation == 1
        result = [result bestSolution(i).weight];
    end
end
result
