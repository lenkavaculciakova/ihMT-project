%creating histogram plots from brain-extracted ihMT maps

%include spm for niftiread
addpath('/data/pt_02478/SPM_Prisma');
spm_dir = '/data/pt_02478/SPM_Prisma';

maps_path = '/data/pt_02478/Optimization_20211206/35516.ae_20211206_085756.SKYRA//ihMT/';
output_path = '/data/pt_02478/Optimization_20211206/35516.ae_20211206_085756.SKYRA/plots';
% select paths
ihmt_maps_path = '/data/pt_02478/Optimization_20211206/35516.ae_20211206_085756.SKYRA/maps/';
%std_maps_path = '/data/pt_02478/Optimization_20211206/35516.ae_20211206_085756.SKYRA/maps/';
output_path = '/data/pt_02478/Optimization_20211206/35516.ae_20211206_085756.SKYRA/plots/';

% load standard MTsat location
cd(std_maps_path)
std_filename= dir('Results/*_brain.nii');

% load standard MTsat data 
std_map = niftiread(fullfile(std_filename.folder, std_filename.name));
samples = size(std_map);
std_map = nonzeros(reshape(std_map, [1,samples]));


% load ihMTsat locations
cd(ihmt_maps_path)
ihmt_filenames = dir('*/*/Results/*_brain.nii');


% load niftis into an array
for map = 1:size(ihmt_filenames,1)

    maps{map} = niftiread(fullfile(ihmt_filenames(map).folder, ihmt_filenames(map).name));
    samples = size(maps{1,map});
    maps{map} = nonzeros(reshape(maps{map}, [1,samples]));
    
end


figure
counter = 1;
for map = [1,2,3,4,5]

    subplot(2,3,counter)
    %plot std MTsat
    %histogram(std_map,2000,'FaceColor', 'k', 'LineStyle', 'none', 'FaceAlpha', 0.15);
    hold on

    histogram(maps{4*(map-1)+4},2000,'FaceColor', 'b', 'LineStyle', 'none', 'FaceAlpha', 0.3);
    histogram(maps{4*(map-1)+1},2000,'FaceColor', 'y', 'LineStyle', 'none', 'FaceAlpha', 0.3);
    histogram(maps{4*(map-1)+2},2000,'FaceColor', 'g', 'LineStyle', 'none', 'FaceAlpha', 0.3);
    histogram(maps{4*(map-1)+3},2000,'FaceColor', 'm', 'LineStyle', 'none', 'FaceAlpha', 0.3);
    title(regexprep(ihmt_filenames(4*(map-1)+1).folder(74:end-11),'_', ' '));

    hold off
    xlim([-0.5,10]);
    ylim([0,1000]);

    ylabel('counts', 'FontSize',12,'FontWeight','bold')
    xlabel('ihMTRsat', 'FontSize',12,'FontWeight','bold')
    if counter == 5
        legend('pp', 'mm', 'mp', 'pm') %standard
    end

    counter=counter+1;
end

    
savefig(fullfile(output_path, 'MTsats_brain_histograms.fig'));

h=gcf;
set(h,'PaperOrientation','landscape');
set(h,'PaperUnits','normalized');
set(h,'PaperPosition', [0 0 1 1]);
print(gcf, '-dpdf', fullfile(output_path,'MTsats_brain_histograms.pdf'));
