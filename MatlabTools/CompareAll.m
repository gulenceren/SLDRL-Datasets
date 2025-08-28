%a = load('../DataSets/NoCopyAgent1.txt'); % Pure DRL agent
c = load('../DataSets/8PathsAgent1.txt'); % Pre-defined trajectories
b = load('../DataSets/ExpertAgent1.txt'); % Expert trajectory
d = load('../DataSets/ExperiencedAgent2.txt'); % Observing experienced agent
e = load('../DataSets/EachOtherAgent2.txt'); % observing inexperienced agent
showSize = 100;
lineSize = 2;
%a = a(:,1:showSize);
b = b(:,1:showSize);
c = c(:,1:showSize);
d = d(:,1:showSize);
e = e(:,1:showSize);
figure;
hold on;

%mean1 = mean(a, 1);
mean2 = mean(b, 1);
mean3 = mean(c, 1);
mean4 = mean(d, 1);
mean5 = mean(e, 1);

% Std ve %95 güven aralığı
%std1 = std(a, 0, 1);
std2 = std(b, 0, 1);
std3 = std(c, 0, 1);
std4 = std(d, 0, 1);
std5 = std(e, 0, 1);

n = size(b,1);
ci95 = 1.96 / sqrt(n);
%ub1 = mean1 + ci95 * std1;
%lb1 = mean1 - ci95 * std1;
ub2 = mean2 + ci95 * std2;
lb2 = mean2 - ci95 * std2;
ub3 = mean3 + ci95 * std3;
lb3 = mean3 - ci95 * std3;
ub4 = mean4 + ci95 * std4;
lb4 = mean4 - ci95 * std4;
ub5 = mean5 + ci95 * std5;
lb5 = mean5 - ci95 * std5;

% X-axis in actual environment steps
steps = linspace(0, 10000, showSize);

%h1 = fill([steps fliplr(steps)], [ub1 fliplr(lb1)], [0.75 0.75 0.75], ...
%    'EdgeColor',[0.35 0.35 0.35], 'LineStyle','-', 'FaceAlpha',0.4, 'DisplayName','');

%h1.Annotation.LegendInformation.IconDisplayStyle = 'off';

h2 = fill([steps fliplr(steps)], [ub2 fliplr(lb2)], [0.75 0.75 0.75], ...
    'EdgeColor','none', 'FaceAlpha',0.6, 'DisplayName','');

h2.Annotation.LegendInformation.IconDisplayStyle = 'off';

h3 = fill([steps fliplr(steps)], [ub3 fliplr(lb3)], [0.75 0.75 0.75], ...
    'EdgeColor','none', 'FaceAlpha',0.6, 'DisplayName','');

h3.Annotation.LegendInformation.IconDisplayStyle = 'off';

h4 = fill([steps fliplr(steps)], [ub4 fliplr(lb4)], [0.75 0.75 0.75], ...
    'EdgeColor','none', 'FaceAlpha',0.6, 'DisplayName','');

h4.Annotation.LegendInformation.IconDisplayStyle = 'off';

h5 = fill([steps fliplr(steps)], [ub5 fliplr(lb5)], [0.75 0.75 0.75], ...
    'EdgeColor','none', 'FaceAlpha',0.6, 'DisplayName','');

h5.Annotation.LegendInformation.IconDisplayStyle = 'off';



%plot(steps, mean1,'LineWidth', lineSize, 'Color', [0 0 0]);
plot(steps, mean2,'LineWidth', lineSize, 'Color', [0 0 0]);
plot(steps, mean3,'LineWidth', lineSize, 'Color', [0.5 0.5 0.5]);
plot(steps, mean4,'LineWidth', lineSize, 'Linestyle', '-.','Color', [0 0 0]);
plot(steps, mean5,'LineWidth', lineSize, 'Linestyle', '-.','Color', [0.5 0.5 0.5]);

xlabel('Environment Steps');

xticks(0:1000:10000);
ylim([7, max([mean(a, 1), mean(b, 1)]) + 1]); % Y eksenini 0'dan başlat
grid on;
%xlim([0 80]);
legend('Expert Trajectory', 'Pre-defined Trajectories','Observing Experienced Agent','Observing Inexperienced Agent');
title('Performance of SLDRL Agent in Different Experiment Setups');

% Statistical tests and results for 'c'
