function plotAgentComparisonWithCI()

allReward1 = zeros(100,100);
allReward2 = zeros(100,100);

data = load("DQN1/SLDRL_MultiResults.mat");
allReward1(1:40,:) = data.allRewardsDQN;

data2 = load("SLDRL1/SLDRL_MultiResults.mat");
allReward2(1:40,:) = data2.allRewardsSLDRL;

data3 = load("DQN2/SLDRL_MultiResults.mat");
allReward1(41:60,:) = data3.allRewardsDQN;

data4 = load("SLDRL2/SLDRL_MultiResults.mat");
allReward2(41:60,:) = data4.allRewardsSLDRL;

data5 = load("DQN3/SLDRL_MultiResults.mat");
allReward1(61:100,:) = data5.allRewardsDQN;

data6 = load("SLDRL3/SLDRL_MultiResults.mat");
allReward2(61:100,:) = data6.allRewardsSLDRL;

% Ortalamalar
mean1 = mean(allReward1, 1);
mean2 = mean(allReward2, 1);

% Std ve %95 güven aralığı
std1 = std(allReward1, 0, 1);
std2 = std(allReward2, 0, 1);

n = size(allReward1,1);
ci95 = 1.96 / sqrt(n);
ub1 = mean1 + ci95 * std1;
lb1 = mean1 - ci95 * std1;
ub2 = mean2 + ci95 * std2;
lb2 = mean2 - ci95 * std2;

% Grafik
episodes = 1:size(allReward1,2);
figure;
hold on;

% Önce güvenlik aralıklarını çiz

h1 = fill([episodes fliplr(episodes)], [ub1 fliplr(lb1)], [0.75 0.75 0.75], ...
    'EdgeColor','none', 'FaceAlpha',0.6, 'DisplayName','');

h1.Annotation.LegendInformation.IconDisplayStyle = 'off';

h2 = fill([episodes fliplr(episodes)], [ub2 fliplr(lb2)], [0.75 0.75 0.75], ...
    'EdgeColor','none', 'FaceAlpha',0.6, 'DisplayName','');

h2.Annotation.LegendInformation.IconDisplayStyle = 'off';

% Sonra ortalama çizgileri en üstte çiz
plot(episodes, mean1, 'b', 'LineWidth', 2, 'DisplayName','Pure DRL Agent', 'Color', [0 0 0]);
plot(episodes, mean2, 'r', 'LineWidth', 2, 'DisplayName','SLDRL Agent', 'Color', [0.5 0.5 0.5]);

xlabel("Episode");
ylabel("Reward");
legend('Location','best');
title("SLDRL Agent vs Pure DRL Agent - Mean Reward");
grid on;
hold off;

figure;
hold on;

copyRatios = zeros(100,100);

data7 = load("SLDRL1/SLDRL_MultiResults.mat");
copyRatios(1:40,:) = data7.allCopyRatiosSLDRL;

data8 = load("SLDRL2/SLDRL_MultiResults.mat");
copyRatios(41:60,:) = data8.allCopyRatiosSLDRL;

data9 = load("SLDRL3/SLDRL_MultiResults.mat");
copyRatios(61:100,:) = data9.allCopyRatiosSLDRL;

mean3 = mean(copyRatios, 1);

std3 = std(copyRatios, 0, 1);
n = size(copyRatios,1);
ci95 = 1.96 / sqrt(n);
ub3 = mean3 + ci95 * std3;
lb3 = mean3 - ci95 * std3;


h3 = fill([episodes fliplr(episodes)], [ub3 fliplr(lb3)], [0.75 0.75 0.75], ...
     'EdgeColor','none', 'FaceAlpha',0.6, 'DisplayName','');

h3.Annotation.LegendInformation.IconDisplayStyle = 'off';

plot(episodes, mean3, 'b', 'LineWidth', 2, 'DisplayName','Pure DRL Agent', 'Color', [0 0 0]);
grid on;

xlabel('Episode');
ylabel('Ratio of enacted actions');
legend('Enact ratio');
title('Ratio of Enacted Actions for SLDRL Agent')

end
