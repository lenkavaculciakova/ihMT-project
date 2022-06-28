%-----------------------------------------------------------------------
% Job saved on 06-Aug-2021 22:49:10 by cfg_util (rev $Rev: 6942 $)
% spm SPM - SPM12 (7219)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
matlabbatch{1}.spm.util.imcalc.input = {
                                        '/data/pt_02478/Optimization_20210727/28341.0c_20210727_102942.SKYRA/ihMT/MTsat_dual_TR52ms.nii,1'
                                        '/data/pt_02478/Optimization_20210727/28341.0c_20210727_102942.SKYRA/ihMT/MTsat_mono_TR52ms.nii,1'
                                        };
matlabbatch{1}.spm.util.imcalc.output = 'ihMTsat_TR52ms';
matlabbatch{1}.spm.util.imcalc.outdir = {'/data/pt_02478/Optimization_20210727/28341.0c_20210727_102942.SKYRA/ihMT'};
matlabbatch{1}.spm.util.imcalc.expression = 'i1-i2';
matlabbatch{1}.spm.util.imcalc.var = struct('name', {}, 'value', {});
matlabbatch{1}.spm.util.imcalc.options.dmtx = 0;
matlabbatch{1}.spm.util.imcalc.options.mask = 0;
matlabbatch{1}.spm.util.imcalc.options.interp = 1;
matlabbatch{1}.spm.util.imcalc.options.dtype = 16;
