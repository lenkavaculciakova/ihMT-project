%-----------------------------------------------------------------------
% Job saved on 01-Feb-2021 22:13:15 by cfg_util (rev $Rev: 6942 $)
% spm SPM - SPM12 (7219)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
matlabbatch{1}.spm.util.imcalc.input = {
                                        '/data/pt_np-vaculciakova/ihMT/Leipzig_invivo_ihMT_Dec_2020/08950.3f_20201202_070128.PRISMA/niftis/lv_mtflash3d_v1g_5K_pp_1pair_0018/raverage_image.nii,1'
                                        '/data/pt_np-vaculciakova/ihMT/Leipzig_invivo_ihMT_Dec_2020/08950.3f_20201202_070128.PRISMA/niftis/lv_mtflash3d_v1g_5K_mm_1pair_0021/raverage_image.nii,1'
                                        '/data/pt_np-vaculciakova/ihMT/Leipzig_invivo_ihMT_Dec_2020/08950.3f_20201202_070128.PRISMA/niftis/pdw_lv_mtflash3d_v1g_0012/average_image.nii,1'
                                        };
matlabbatch{1}.spm.util.imcalc.output = 'MTasym_spm';
matlabbatch{1}.spm.util.imcalc.outdir = {'/data/pt_np-vaculciakova/ihMT/Leipzig_invivo_ihMT_Dec_2020/08950.3f_20201202_070128.PRISMA/5K_results/ihmt/avg_img'};
matlabbatch{1}.spm.util.imcalc.expression = '(i1-i2)./(i3)';
matlabbatch{1}.spm.util.imcalc.var = struct('name', {}, 'value', {});
matlabbatch{1}.spm.util.imcalc.options.dmtx = 0;
matlabbatch{1}.spm.util.imcalc.options.mask = 0;
matlabbatch{1}.spm.util.imcalc.options.interp = 1;
matlabbatch{1}.spm.util.imcalc.options.dtype = 16;
