lineSize = 2;
showSize = 100;
a = load("../DataSets/NoCopyAgent1.txt"); % Pure DRL agent
b = load("../DataSets/ExpertAgent1.txt"); % Observing an expert agent
a = a(:,1:showSize);
b = b(:,1:showSize);
figure
hold on;
plot(mean(a,1),'LineWidth', lineSize, 'Color', [0 0 0]);
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
legend('Pure DRL Agent','SLDRL Agent - Expert Trajectory');
xlabel('Time');
ylabel('Best Path Length');
ylim([8, max([mean(a, 1), mean(b, 1)]) + 1]); % Y eksenini 0'dan başlat
title('Best Path Length - Expert Trajectory');
diff = zeros(size(a,2),2);
for i = 1 : size(a,2)
	diff(i,1) = i;
	diff(i,2) = ttest(a(:,i),b(:,i));
end
diff
