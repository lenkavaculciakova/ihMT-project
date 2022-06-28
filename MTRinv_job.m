%-----------------------------------------------------------------------
% Job saved on 29-Jun-2021 16:00:32 by cfg_util (rev $Rev: 6942 $)
% spm SPM - SPM12 (7219)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
matlabbatch{1}.spm.util.imcalc.input = {
                                        '/data/pt_np-vaculciakova/ihMT/Leipzig_invivo_ihMT_Dec_2020/08950.3f_20201202_070128.PRISMA/niftis/lv_mtflash3d_v1g_5K_pp_1pair_0018/raverage_image.nii,1'
                                        '/data/pt_np-vaculciakova/ihMT/Leipzig_invivo_ihMT_Dec_2020/08950.3f_20201202_070128.PRISMA/niftis/lv_mtflash3d_v1g_5K_mm_1pair_0021/raverage_image.nii,1'
                                        '/data/pt_np-vaculciakova/ihMT/Leipzig_invivo_ihMT_Dec_2020/08950.3f_20201202_070128.PRISMA/niftis/lv_mtflash3d_v1g_5K_mp_1pair_0027/raverage_image.nii,1'
                                        '/data/pt_np-vaculciakova/ihMT/Leipzig_invivo_ihMT_Dec_2020/08950.3f_20201202_070128.PRISMA/niftis/lv_mtflash3d_v1g_5K_pm_1pair_0024/raverage_image.nii,1'
                                        '/data/pt_np-vaculciakova/ihMT/Leipzig_invivo_ihMT_Dec_2020/08950.3f_20201202_070128.PRISMA/niftis/pdw_lv_mtflash3d_v1g_0012/average_image.nii,1'
                                        };
matlabbatch{1}.spm.util.imcalc.output = 'MTRinv';
matlabbatch{1}.spm.util.imcalc.outdir = {'/data/pt_02478/Optimization_20210628/28341.0c_20210628_083113.SKYRA/ihMT'};
matlabbatch{1}.spm.util.imcalc.expression = '(1./i1+1./i2-1./i3-1./i4).*i5';
matlabbatch{1}.spm.util.imcalc.var = struct('name', {}, 'value', {});
matlabbatch{1}.spm.util.imcalc.options.dmtx = 0;
matlabbatch{1}.spm.util.imcalc.options.mask = 0;
matlabbatch{1}.spm.util.imcalc.options.interp = 1;
matlabbatch{1}.spm.util.imcalc.options.dtype = 16;
