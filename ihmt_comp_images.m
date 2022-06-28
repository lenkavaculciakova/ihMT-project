function ihmt_comp_images(path_niis, out_path, input_type, offset)
% compute MTR, eMTR, MTasym, ihMTR and ihMTRinv based on the pdw image and mtw 
%(mm, pp, pm, mp) combinations. 
% path_nii - path to the folder containing all the niftis from the
%            measurement.
% out_path - output directory
% input_type - either '1echo', 'avg_img', 'map'
% offset in kHz
% January 2021 Lenka Vaculciakova

%% arguments for testing
 path_niis = '/data/pt_np-vaculciakova/ihMT/Leipzig_invivo_ihMT_Dec_2020/08950.3f_20201202_070128.PRISMA/niftis/'
 out_path = '/data/pt_np-vaculciakova/ihMT/Leipzig_invivo_ihMT_Dec_2020/08950.3f_20201202_070128.PRISMA/5K_results/ihmt/'
 input_type = 'avg_img'; %'1echo','avg_img', 'map'
 offset = 5;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    cd(path_niis)
    %% load all the data neessary to compute MTR, eMTR, MTasym,ihMTR and
    % ihMTRinv
    weighting = {'pdw', 't1w'};
    for ii = 1:length(weighting)
        if strcmp(input_type,'1echo')
            loc = dir(strcat(weighting{ii},'_*/*-1.nii'));
            file_vol = spm_vol(fullfile(loc.folder,loc.name));
            S.(weighting{ii}) = spm_read_vols(file_vol);
        elseif strcmp(input_type,'avg_img')
            loc = dir(strcat(weighting{ii},'_*/average_image.nii'));
            file_vol = spm_vol(fullfile(loc.folder,loc.name));
            S.(weighting{ii}) = spm_read_vols(file_vol);
        end
    end

    ihmt_type = {'mm', 'mp', 'pm', 'pp'};
    for ii = 1:length(ihmt_type)
        if strcmp(input_type,'1echo')
            loc = dir(strcat('lv_*', num2str(offset), 'K_',ihmt_type{ii},'_*/*-1.nii'));
            file_vol = spm_vol(fullfile(loc.folder,loc.name));
            S.(ihmt_type{ii}) = spm_read_vols(file_vol);
        elseif strcmp(input_type,'avg_img')
            loc = dir(strcat(strcat('lv_*', num2str(offset), 'K_',ihmt_type{ii},'_*/average_image.nii')));
            file_vol = spm_vol(fullfile(loc.folder,loc.name));
            S.(ihmt_type{ii}) = spm_read_vols(file_vol);
        end
    end

    %% Computation based on the publication: Tobias C. Wood et al. 2020
    % Compute MTR
    MTR = 1-((S.pp + S.mm)./(2*S.pdw));
    % Compute eMTR
    eMTR = 1- ((S.pm + S.mp)./(2*S.pdw));
    % Compute MTasym
    MTasym = ((S.pp - S.mm)./(S.pdw));
    % Compute ihMTR
    ihMTR = 2*(eMTR - MTR);
    % Compute ihMTRinv
    ihMTRinv = (2*S.t1w).*(1/S.pm + 1/S.mp - 1/S.pp - 1/S.mm);

    %% Write out the data
    cd(out_path)
    [~,~]=mkdir(input_type);
    parameters = {MTR, eMTR, MTasym, ihMTR, ihMTRinv};
    par_names = {'MTR', 'eMTR', 'MTasym', 'ihMTR', 'ihMTRinv'};

    for par = 1:length(parameters)
        file_vol.dt(1)=16; % setting the data type to float 32
        file_vol.descrip = '3T 3D RM TR=24.2ms/TE=2.3ms/FA=6deg/SO=PFP\MT 02-Dec-2020 9:15:13.287';
        Vout=file_vol; % copy header from a loaded nifti
        Vout.fname=[input_type '/' par_names{par} '.nii'];
        spm_write_vol(Vout,parameters{par});
        clear Vout
    end
end