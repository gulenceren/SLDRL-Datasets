%8PathsPath0Agent1.txt'	North
%8PathsPath1Agent1.txt' North East
%8PathsPath2Agent1.txt'	East
%8PathsPath3Agent1.txt'	South East:
%8PathsPath4Agent1.txt'	South
%8PathsPath5Agent1.txt'	South West
%8PathsPath6Agent1.txt'	West
%8PathsPath7Agent1.txt'	North West
pathNum = 8;
numbers = zeros(pathNum,100,100);
p = zeros(pathNum,100,100);
showSize = 100;
filename = strcat('../DataSets/8PathsPath',int2str(0),'Agent1');
filename = strcat(filename,'.txt');
for i = 1 : size(numbers,1)
	filename = strcat('../DataSets/8PathsPath',int2str(i-1),'Agent1');
	filename = strcat(filename,'.txt');
	filename
	p(i,:,:) = load(filename);
end
for path = 1 : size(p,1)
	for i = 1 : size(p,2)
		numbers(path,i,1) = p(path,i,1);
		for k = 2 : 100
			numbers(path,i,k) = numbers(path,i,k-1) + p(path,i,k);
			%numbers(path,i,k) = p(path,i,k);
		end
		for k = 1 : 100
			numbers(path,i,k) = numbers(path,i,k)/k;
		end
	end
end

size(numbers)
size(squeeze(numbers(1,:,:)))
figure;
hold on;
plot(mean(squeeze(numbers(1,:,1:100)),1),'Color', [0 0 0], 'LineWidth',2, 'LineStyle',':');
plot(mean(squeeze(numbers(2,:,1:100)),1),'Color', [0.4 0.4 0.4], 'LineWidth',2, 'LineStyle',':');
plot(mean(squeeze(numbers(3,:,1:100)),1),'Color', [0.8 0.8 0.8], 'LineWidth',2);
plot(mean(squeeze(numbers(4,:,1:100)),1),'Color', [0 0 0], 'LineWidth',2);
plot(mean(squeeze(numbers(5,:,1:100)),1),'Color', [0.4 0.4 0.4], 'LineWidth',2);
plot(mean(squeeze(numbers(6,:,1:100)),1),'Color', [0.8 0.8 0.8], 'LineWidth',2,'LineStyle',':');
plot(mean(squeeze(numbers(7,:,1:100)),1),'Color', [0 0 0], 'LineWidth',2,'LineStyle','-.');
plot(mean(squeeze(numbers(8,:,1:100)),1),'Color', [0.4 0.4 0.4], 'LineWidth',2,'LineStyle','-.');
mean(squeeze(numbers(3,:,1:100)),1)
mean(squeeze(numbers(7,:,1:100)),1)
legend('N','NE', 'E', 'SE','S','SW','W','NW');
xlabel('Time');
ylabel('Average Number of Enactions');
title('Number of Enactions');
xlim([0, 50]);
