lineSize = 2;
showSize = 100;
a = load("../DataSets/NoCopyAgent1.txt"); % Pure DRL agent
b = load("../DataSets/ExpertAgent1.txt"); % Observing an expert agent
a = a(:,1:showSize);
b = b(:,1:showSize);
figure
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

%h1 = fill([steps fliplr(steps)], [ub1 fliplr(lb1)], [0.9 0.9 1], ...
%     'EdgeColor','none', 'DisplayName','');  % Agent 1 aralık
h1 = fill([steps fliplr(steps)], [ub1 fliplr(lb1)], [0.75 0.75 0.75], ...
    'EdgeColor','none', 'FaceAlpha',0.6, 'DisplayName','');

h1.Annotation.LegendInformation.IconDisplayStyle = 'off';

%h2 = fill([steps fliplr(steps)], [ub2 fliplr(lb2)], [1 0.9 0.9], ...
%     'EdgeColor','none', 'DisplayName','');  % Agent 2 aralık

h2 = fill([steps fliplr(steps)], [ub2 fliplr(lb2)], [0.75 0.75 0.75], ...
    'EdgeColor','none', 'FaceAlpha',0.6, 'DisplayName','');

h2.Annotation.LegendInformation.IconDisplayStyle = 'off';


% Plot mean lines
plot(steps, mean1, 'LineWidth', lineSize, 'Color', [0 0 0]);
plot(steps, mean2, 'LineWidth', lineSize, 'Color', [0.5 0.5 0.5]);

legend('Pure DRL Agent','SLDRL Agent - Expert Trajectory');
xlabel('Environment Steps');
ylabel('Best Path Length');

xticks(0:1000:10000);
ylim([8, max([mean(a, 1), mean(b, 1)]) + 1]); % Y eksenini 0'dan başlat
grid on;
%xlim([0 80]);
title('Best Path Length - Expert Trajectory');
