lineSize = 2;
showSize = 100;

b = load("../DataSets/ExperiencedAgent2.txt"); % Observing an experienced agent
c = load("../DataSets/EachOtherAgent2.txt"); % Observing an inexperienced agent

%a = a(:,1:showSize);
b = b(:,1:showSize);
c = c(:,1:showSize);
figure
hold on;

%mean1 = mean(a, 1);
mean2 = mean(b, 1);
mean3 = mean(c, 1);

% Std ve %95 güven aralığı
%std1 = std(a, 0, 1);
std2 = std(b, 0, 1);
std3 = std(c, 0, 1);

n = size(b,1);
ci95 = 1.96 / sqrt(n);
%ub1 = mean1 + ci95 * std1;
%lb1 = mean1 - ci95 * std1;
ub2 = mean2 + ci95 * std2;
lb2 = mean2 - ci95 * std2;
ub3 = mean3 + ci95 * std3;
lb3 = mean3 - ci95 * std3;


% X-axis in actual environment steps
steps = linspace(0, 10000, showSize);

h2 = fill([steps fliplr(steps)], [ub2 fliplr(lb2)], [0.75 0.75 0.75], ...
    'EdgeColor','none', 'FaceAlpha',0.6, 'DisplayName','');

h2.Annotation.LegendInformation.IconDisplayStyle = 'off';

h3 = fill([steps fliplr(steps)], [ub3 fliplr(lb3)], [0.75 0.75 0.75], ...
    'EdgeColor','none', 'FaceAlpha',0.6, 'DisplayName','');

h3.Annotation.LegendInformation.IconDisplayStyle = 'off';


%plot(steps, mean1,'LineWidth', lineSize, 'Color', [0 0 0]);
plot(steps, mean2,'LineWidth', lineSize, 'Color', [0.5 0.5 0.5]);
plot(steps, mean3,'LineWidth', lineSize, 'Color', [0 0 0], 'Linestyle', '-.');

legend('SLDRL Agent - Observing Experienced Agent', 'SLDRL Agent - Observing Inexperienced Agent');
xlabel('Environment Steps');
ylabel('Best Path Length');
ylim([8, max([mean(b, 1), mean(c, 1)]) + 1]); % Y eksenini 0'dan başlat
xticks(0:1000:10000);
grid on;
%xlim([0 80]);
title('Performance of SLDRL Agent in Different Experiment Setups');
