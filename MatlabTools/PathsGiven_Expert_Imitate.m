lineSize = 2;
showSize = 100;
a = load('../DataSets/ExpertCopy1.txt'); % Number of triggered imitate behaviors - observing an expert
b = load('../DataSets/8PathsCopy1.txt'); % Number of triggered imitate behaviors - observing pre-defined trajectories
a = a(:,1:showSize);
figure;
plot(mean(a,1),'LineWidth', lineSize, 'Color', [0 0 0]);
hold on;
b = b(:,1:showSize);
plot(mean(b,1),'LineWidth', lineSize, 'Color', [0.5 0.5 0.5]);
for i = 10 : 10 : size(a,2)
	set1 = a(:,i);
	meanX = mean(set1);
	alphaX = std(set1);
	z = 1.96;
	errorX = z * alphaX / sqrt(size(set1,1))
	line([i i],[meanX + errorX meanX - errorX], 'Marker','*','Color', [0 0 0]);
end
for i = 5 : 10 : size(a,2)
	set1 = b(:,i);
	meanX = mean(set1);
	alphaX = std(set1);
	z = 1.96;
	errorX = z * alphaX / sqrt(size(set1,1))
	line([i i],[meanX + errorX meanX - errorX], 'Marker','*','Color', [0.5 0.5 0.5]);
end
xlabel('Time');
ylabel('Number of imitate behaviors');
legend('Expert trajectory','Predefined trajectories');
title('Imitate behavior');
