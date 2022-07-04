%creating histogram plots from brain-extracted ihMT maps

%include spm for niftiread
addpath('/data/pt_02478/SPM_Prisma');
spm_dir = '/data/pt_02478/SPM_Prisma';

% select paths
maps_path = '/data/pt_02478/Optimization_20210727/28341.0c_20210727_102942.SKYRA.tar/28341.0c_20210727_102942.SKYRA/ihMT/';
output_path = '/data/pt_02478/Optimization_20210727/28341.0c_20210727_102942.SKYRA.tar/28341.0c_20210727_102942.SKYRA/plots';

cd(maps_path)

% parameter values
TR = [27.8, 34, 40, 46, 52] %ms

% load file names
filenames = dir('ihMT*_brain.nii');
filenames_GM = dir('ihMT*_brain_GM.nii');
filenames_WM = dir('ihMT*_brain_WM.nii');

% load niftis into arrays for brain, WM and GM
for map = 1:size(filenames,1)

    maps{map} = niftiread(fullfile(filenames(map).folder, filenames(map).name));
    samples = size(maps{1,map});
    maps{map} = nonzeros(reshape(maps{map}, [1,samples]));
    
end
for map = 1:size(filenames_WM,1)

    WM{map} = niftiread(fullfile(filenames_WM(map).folder, filenames_WM(map).name));
    samples = size(WM{1,map});
    WM{map} = nonzeros(reshape(WM{map}, [1,samples]));
end
for map = 1:size(filenames_GM,1)
    GM{map} = niftiread(fullfile(filenames_GM(map).folder, filenames_GM(map).name));
    samples = size(GM{1,map});
    GM{map} = nonzeros(reshape(GM{map}, [1,samples]));
end
%compute means over tissue classes
if size(filenames_GM,1) == size(filenames_WM,1)
    for map = 1:size(filenames_GM,1)
         meanGM{map} = mean(GM{map});
         stdGM{map} = std(GM{map});
         meanWM{map} = mean(WM{map});
         stdWM{map} = std(WM{map});
    end
else
    sprintf('number of WM or GM masks is not equal')
end


% plot overlapping histograms - smoothed edges only
fig = figure

[values, edges] = histcounts(maps{1},2000, 'Normalization', 'probability');
centers = (edges(1:end-1)+edges(2:end))/2;
plot(centers, smooth(values), 'Color', [0 0.4470 0.7410],'Linewidth',3)
hold on
[values, edges] = histcounts(maps{2},2000, 'Normalization', 'probability');
centers = (edges(1:end-1)+edges(2:end))/2;
plot(centers, smooth(values), 'Color', [0.8500 0.3250 0.0980],'Linewidth',3)
hold on
[values, edges] = histcounts(maps{3},2000, 'Normalization', 'probability');
centers = (edges(1:end-1)+edges(2:end))/2;
plot(centers, smooth(values), 'Color', [0.9290 0.6940 0.1250],'Linewidth',3)
hold on
[values, edges] = histcounts(maps{4},2000, 'Normalization', 'probability');
centers = (edges(1:end-1)+edges(2:end))/2;
plot(centers, smooth(values), 'Color', [0.4940 0.1840 0.5560],'Linewidth',3)
hold on
[values, edges] = histcounts(maps{5},2000, 'Normalization', 'probability');
centers = (edges(1:end-1)+edges(2:end))/2;
plot(centers, smooth(values), 'Color', [0.4660 0.6740 0.1880],'Linewidth',3)
hold on

legend (strcat('TR = ',num2str(TR(1)),' ms'), strcat('TR = ',num2str(TR(2)),' ms'),...
    strcat('TR = ',num2str(TR(3)),' ms'), strcat('TR = ',num2str(TR(4)),' ms'),...
    strcat('TR = ',num2str(TR(5)),' ms'))

xlim([-0.5,1]);

ylabel('counts', 'FontSize',12,'FontWeight','bold')
xlabel('ihMTRsat', 'FontSize',12,'FontWeight','bold')

savefig(fullfile(output_path, 'ihMTsat_brain_histogram_edges.fig'));
saveas(fig, fullfile(output_path,'ihMTsat_brain_histogram_edges.png'));


% plot overlapping histograms 
fig = figure 
histogram(maps{1},2000,'FaceColor', [0 0.4470 0.7410],  'FaceAlpha', 0.3, 'LineStyle', 'none');
hold on
histogram(maps{2},2000,'FaceColor', [0.8500 0.3250 0.0980],  'FaceAlpha', 0.3, 'LineStyle', 'none');
hold on
histogram(maps{3},2000,'FaceColor', [0.9290 0.6940 0.1250],  'FaceAlpha', 0.3, 'LineStyle', 'none');
hold on
histogram(maps{4},2000,'FaceColor', [0.4940 0.1840 0.5560],  'FaceAlpha', 0.3, 'LineStyle', 'none');
hold on
histogram(maps{5},2000,'FaceColor', [0.4660 0.6740 0.1880],  'FaceAlpha', 0.3, 'LineStyle', 'none');


legend (strcat('TR = ',num2str(TR(1)),' ms'), strcat('TR = ',num2str(TR(2)),' ms'),...
    strcat('TR = ',num2str(TR(3)),' ms'), strcat('TR = ',num2str(TR(4)),' ms'),...
    strcat('TR = ',num2str(TR(5)),' ms'))

xlim([-0.5,1]);

ylabel('counts', 'FontSize',12,'FontWeight','bold')
xlabel('ihMTRsat', 'FontSize',12,'FontWeight','bold')

savefig(fullfile(output_path, 'ihMTsat_brain_histograms.fig'));
saveas(fig, fullfile(output_path,'ihMTsat_brain_histograms.png'));
 
% plot GM-WM contrast
fig = figure

errorbar(TR(:), [meanGM{:}], [stdGM{:}], 'ko','MarkerFaceColor',[0.4940 0.1840 0.5560], 'MarkerSize', 8)
hold on
errorbar(TR(:), [meanWM{:}], [stdWM{:}], 'ko','MarkerFaceColor', [0.9290 0.6940 0.1250],'MarkerSize', 8)
ylabel('Mean ihMTsat in GM and WM \pm SD ', 'FontSize',12,'FontWeight','bold')
xlabel('TR', 'FontSize',12,'FontWeight','bold')

l = legend('Gray matter', 'White matter', 'Location', 'NorthWest');
l.FontSize = 12;
legend boxoff

savefig(fullfile(output_path, 'ihMTsat_muGMWM.fig'));
saveas(fig, fullfile(output_path,'ihMTsat_muGMWM.png'));
