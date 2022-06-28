%creating histogram plots from brain-extracted ihMT maps

%include spm for niftiread
addpath('/data/pt_02478/SPM_Prisma');
spm_dir = '/data/pt_02478/SPM_Prisma';

% select paths
maps_path = '/data/pt_02478/Optimization_20220615/25052.d9_20220615_073345.SKYRA/ihMT';
output_path = '/data/pt_02478/Optimization_20220615/25052.d9_20220615_073345.SKYRA/plots';

cd(maps_path)

% load file names
filenames = dir('ihMT*_bm.nii');

% load niftis into an array
for map = 1:size(filenames,1)

    maps{map} = niftiread(fullfile(filenames(map).folder, filenames(map).name));
    samples = size(maps{1,map});
    maps{map} = nonzeros(reshape(maps{map}, [1,samples]));
    
end


figure
counter = 1;
for map = [4,1,3,2]%1: size(filenames,1)

subplot(2,3,counter)

histogram(maps{map},2000,'FaceColor', 'b', 'LineStyle', 'none');
title(strcat(' ',regexprep(filenames(map).name(9:end-7),'_', ' ')))

xlim([-1,2.5]);
%if counter >1
%    xlim([-0.5,1]);
%end
% OR 
% if (mod(counter,2) == 0)
%     xlim([-0.5,1]);
% else
%     xlim([-2,8]);
% end

ylabel('counts', 'FontSize',12,'FontWeight','bold')
xlabel('ihMTRsat', 'FontSize',12,'FontWeight','bold')

counter=counter+1;
end

    
savefig(fullfile(output_path, 'ihMTsat_brain_histograms.fig'));

h=gcf;
set(h,'PaperOrientation','landscape');
set(h,'PaperUnits','normalized');
set(h,'PaperPosition', [0 0 1 1]);
print(gcf, '-dpdf', fullfile(output_path,'ihMTsat_brain_histograms.pdf'));

% overlapping
figure
histogram(maps{4},2000,'FaceColor', 'r', 'FaceAlpha', 0.5, 'LineStyle', 'none');
hold on
histogram(maps{1},2000,'FaceColor', 'c',  'FaceAlpha', 0.5, 'LineStyle', 'none');
hold on
histogram(maps{3},2000,'FaceColor', 'g',  'FaceAlpha', 0.4, 'LineStyle', 'none');
hold on
histogram(maps{2},2000,'FaceColor', 'm',  'FaceAlpha', 0.2, 'LineStyle', 'none');
legend('standard', strcat(' ',regexprep(filenames(1).name(9:end-7),'_', ' ')), ...
    strcat(' ',regexprep(filenames(3).name(9:end-7),'_', ' ')), ...
    strcat(' ',regexprep(filenames(2).name(9:end-7),'_', ' ')))
xlim([-1,3]);

ylabel('counts', 'FontSize',12,'FontWeight','bold')
xlabel('ihMTRsat', 'FontSize',12,'FontWeight','bold')

savefig(fullfile(output_path, 'ihMTsat_brain_histograms_overlapped.fig'));

h=gcf;
set(h,'PaperOrientation','normalized');
set(h,'PaperUnits','inches');
set(h,'PaperPosition', [0 0 1 1]);
print(gcf, '-dpdf', fullfile(output_path,'ihMTsat_brain_histograms_overlapped.pdf'));

