lineSize = 2.5;
showSize = 100;
a = load("../DataSets/NoCopyAgent1.txt"); % Pure DRL agent
d = load("../DataSets/ExperiencedAgent4.txt"); % Observing an experienced agent
a = a(:,1:showSize);
d = d(:,1:showSize);
figure
hold on;
plot(mean(a,1),'LineWidth', lineSize, 'Color', [0 0 0]);
plot(mean(d,1),'LineWidth', lineSize, 'Color', [0.75 0.75 0.75]);
for i = 10 : 10 : size(a,2)
	set1 = a(:,i);
	meanX = mean(set1);
	alphaX = std(set1);
	z = 1.96;
	errorX = z * alphaX / sqrt(size(set1,1))
	line([i i],[meanX + errorX meanX - errorX], 'Marker','*','Color', [0 0 0]);
end
for i = 5 : 10 : size(a,2)
	set1 = d(:,i);
	meanX = mean(set1);
	alphaX = std(set1);
	z = 1.96;
	errorX = z * alphaX / sqrt(size(set1,1))
	line([i i],[meanX + errorX meanX - errorX], 'Marker','*','Color', [0.75 0.75 0.75]);
end
legend('Pure DRL Agent','SLDRL Agent - Experienced Agent');
xlabel('Time');
ylabel('Best Path Length');
ylim([8, max([mean(a, 1), mean(d, 1)]) + 1]); % Y eksenini 0'dan başlat
title('Best Path Length - Observing Experienced Agent');
ddiff = zeros(size(a,2),2);
for i = 1 : size(a,2)
	ddiff(i,1) = i;
	ddiff(i,2) = ttest(a(:,i),d(:,i));
end
ddiff
