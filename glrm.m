function glrm(path_maps, path_mask)
% implementation based on by Luke Edwards's code 
% path to the MPM Results
% "mask" is a brain (sample) mask, and "R1.data", "R2s.data" and 
%"MTsat.data" are the MPMs.
% January 2021 Lenka Vaculciakova
%% arguments for testing
    path_mask = '/data/pt_np-vaculciakova/ihMT/Leipzig_invivo_ihMT_Dec_2020/08950.3f_20201202_070128.PRISMA/niftis/pdw_lv_mtflash3d_v1g_0012'
    path_maps = '/data/pt_np-vaculciakova/ihMT/Leipzig_invivo_ihMT_Dec_2020/08950.3f_20201202_070128.PRISMA/5K_results/std/Results'
    cd(path_mask)
    mask_vol = spm_vol('average_image_brain_mask.nii');
    mask=spm_read_vols(mask_vol);
    mask = logical(mask);
 
    cd(path_maps)
    [~,~]=mkdir('linearModel');
    fname=dir('*_MTsat.nii')
    MTsat_vol = spm_vol(fname.name);
    MTsat.data=spm_read_vols(MTsat_vol);
    R1_vol = spm_vol(strrep(fname.name,'MTsat','R1'));
    R1.data=spm_read_vols(R1_vol);
    R2s_vol = spm_vol(strrep(fname.name,'MTsat','R2s_OLS'));
    R2s.data=spm_read_vols(R2s_vol);
    
    % Fit model

    D=[ones(nnz(mask),1),MTsat.data(mask),R2s.data(mask)];
    beta=robustfit(D,R1.data(mask),[],[],'off');
    % Output
    disp(beta)

    residuals=zeros(size(R2s.data));
    residuals(mask)=R1.data(mask)-D*beta;

    Vres=MTsat_vol; % copy header from a loaded nifti
    Vres.fname=['linearModel/res' '.nii'];
    spm_write_vol(Vres,residuals);
end