a = load('../DataSets/NoCopyAgent1.txt'); % Pure DRL agent
c = load('../DataSets/8PathsAgent1.txt'); % Pre-defined trajectories
b = load('../DataSets/ExpertAgent1.txt'); % Expert trajectory
d = load('../DataSets/ExperiencedAgent4.txt'); % Observing experienced agent
e = load('../DataSets/EachOtherAgent2.txt'); % observing inexperienced agent
showSize = 100;
lineSize = 2;
a = a(:,1:showSize);
b = b(:,1:showSize);
c = c(:,1:showSize);
d = d(:,1:showSize);
e = e(:,1:showSize);
figure;
hold on;

plot(mean(a,1),'LineWidth', lineSize, 'Color', [0 0 0]);
plot(mean(b,1),'LineWidth', lineSize, 'Color', [0.4 0.4 0.4]);
plot(mean(c,1),'LineWidth', lineSize, 'Color', [0.7 0.7 0.7]);
plot(mean(d,1),'LineWidth', lineSize, 'Linestyle', '-.','Color', [0 0 0]);
plot(mean(e,1),'LineWidth', lineSize, 'Linestyle', '-.','Color', [0.4 0.4 0.4]);


for i = 5 : 10 : size(a,2)
    set1 = a(:,i);
    meanX = mean(set1);
    alphaX = std(set1);
    z = 1.96;
    errorX = z * alphaX / sqrt(size(set1,1));
    line([i i],[meanX + errorX meanX - errorX], 'Marker','*','Color', [0 0 0]);
end
for i = 10 : 10 : size(c,2)
    set1 = b(:,i);
    meanX = mean(set1);
    alphaX = std(set1);
    z = 1.96;
    errorX = z * alphaX / sqrt(size(set1,1));
    line([i i],[meanX + errorX meanX - errorX], 'Marker','*','Color', [0.4 0.4 0.4]);
end
for i = 10 : 10 : size(a,2)
    set1 = c(:,i);
    meanX = mean(set1);
    alphaX = std(set1);
    z = 1.96;
    errorX = z * alphaX / sqrt(size(set1,1));
    line([i i],[meanX + errorX meanX - errorX], 'Marker','*','Color', [0.7 0.7 0.7]);
end
for i = 10 : 10 : size(a,2)
    set1 = d(:,i);
    meanX = mean(set1);
    alphaX = std(set1);
    z = 1.96;
    errorX = z * alphaX / sqrt(size(set1,1));
    line([i i],[meanX + errorX meanX - errorX], 'Marker','*','Color', [0 0 0]);
end
for i = 10 : 10 : size(a,2)
    set1 = e(:,i);
    meanX = mean(set1);
    alphaX = std(set1);
    z = 1.96;
    errorX = z * alphaX / sqrt(size(set1,1));
    line([i i],[meanX + errorX meanX - errorX], 'Marker','*','Color', [0.4 0.4 0.4]);
end
xlabel('Time');
ylabel('Best Path Length');
ylim([7, max([mean(a, 1), mean(b, 1)]) + 1]); % Y eksenini 0'dan başlat
legend('Pure DRL Agent', 'Expert Trajectory', 'Pre-defined Trajectories','Observing Experienced Agent','Observing Inexperienced Agent');
title('Performance of SLDRL Agent in Different Experiment Setups');

% Statistical tests and results for 'c'
c_diff = zeros(size(c,2),2);
for i = 1 : size(c,2)
    c_diff(i,1) = i;
    c_diff(i,2) = ttest(c(:,i), a(:,i));
end
c_diff

% Statistical tests and results for 'a'
a_diff = zeros(size(a,2),2);
for i = 1 : size(a,2)
    a_diff(i,1) = i;
    a_diff(i,2) = ttest(d(:,i), c(:,i));
end
a_diff

e_diff = zeros(size(a,2),2);
for i = 1 : size(a,2)
    e_diff(i,1) = i;
    e_diff(i,2) = ttest(b(:,i), d(:,i));
end
e_diff

for i = 1 : size(a,2)
    g_diff(i,1) = i;
    g_diff(i,2) = ttest(c(:,i), b(:,i));
end
g_diff
