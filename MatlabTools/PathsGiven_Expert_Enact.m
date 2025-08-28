lineSize = 2;
showSize = 100;
a = load('../DataSets/ExpertMove1.txt'); % Number of triggered enact behaviors - observing an expert
b = load('../DataSets/8PathsMove1.txt'); % Number of triggered enact behaviors - observing pre-defined trajectories
a = a(:,1:showSize);
b = b(:,1:showSize);
figure;
hold on;

mean1 = mean(a, 1);
mean2 = mean(b, 1);

% Std ve %95 güven aralığı
std1 = std(a, 0, 1);
std2 = std(b, 0, 1);

n = size(a,1);
ci95 = 1.96 / sqrt(n);
ub1 = mean1 + ci95 * std1;
lb1 = mean1 - ci95 * std1;
ub2 = mean2 + ci95 * std2;
lb2 = mean2 - ci95 * std2;

% X-axis in actual environment steps
steps = linspace(0, 10000, showSize);

h1 = fill([steps fliplr(steps)], [ub1 fliplr(lb1)], [0.75 0.75 0.75], ...
    'EdgeColor','none', 'FaceAlpha',0.6, 'DisplayName','');

h1.Annotation.LegendInformation.IconDisplayStyle = 'off';

h2 = fill([steps fliplr(steps)], [ub2 fliplr(lb2)], [0.75 0.75 0.75], ...
    'EdgeColor','none', 'FaceAlpha',0.6, 'DisplayName','');

h2.Annotation.LegendInformation.IconDisplayStyle = 'off';

plot(steps, mean1,'LineWidth', lineSize, 'Color', [0 0 0]);
plot(steps, mean2,'LineWidth', lineSize, 'Color', [0.5 0.5 0.5]);

xlabel('Environment Steps');
ylabel('Number of enact behaviors');
%ylim([0, max([mean(a, 1), mean(b, 1)]) + 1]);
%xlim([0 80]);
xticks(0:1000:10000);
grid on;
legend('Expert trajectory','Predefined trajectories');
title('Enact behavior');
