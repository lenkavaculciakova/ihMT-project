%-----------------------------------------------------------------------
% Job saved on 06-Aug-2021 22:35:13 by cfg_util (rev $Rev: 6942 $)
% spm SPM - SPM12 (7219)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
matlabbatch{1}.spm.util.imcalc.input = {
                                        '/data/pt_02478/Optimization_20210727/28341.0c_20210727_102942.SKYRA/maps/ihmt_maps/TR_27p8ms/mm/Results/s2021-07-27_10-29-104742-00001-00080-1_RFSC_MTsat.nii,1'
                                        '/data/pt_02478/Optimization_20210727/28341.0c_20210727_102942.SKYRA/maps/ihmt_maps/TR_27p8ms/pp/Results/s2021-07-27_10-29-104742-00001-00080-1_RFSC_MTsat.nii,1'
                                        };
matlabbatch{1}.spm.util.imcalc.output = 'MTsat_monol_TR27p8';
matlabbatch{1}.spm.util.imcalc.outdir = {'/data/pt_02478/Optimization_20210727/28341.0c_20210727_102942.SKYRA/ihMT'};
matlabbatch{1}.spm.util.imcalc.expression = '(i1+i2)./2';
matlabbatch{1}.spm.util.imcalc.var = struct('name', {}, 'value', {});
matlabbatch{1}.spm.util.imcalc.options.dmtx = 0;
matlabbatch{1}.spm.util.imcalc.options.mask = 0;
matlabbatch{1}.spm.util.imcalc.options.interp = 1;
matlabbatch{1}.spm.util.imcalc.options.dtype = 16;
matlabbatch{2}.spm.util.imcalc.input = {
                                        '/data/pt_02478/Optimization_20210727/28341.0c_20210727_102942.SKYRA/maps/ihmt_maps/TR_27p8ms/mp/Results/s2021-07-27_10-29-104742-00001-00080-1_RFSC_MTsat.nii,1'
                                        '/data/pt_02478/Optimization_20210727/28341.0c_20210727_102942.SKYRA/maps/ihmt_maps/TR_27p8ms/pm/Results/s2021-07-27_10-29-104742-00001-00080-1_RFSC_MTsat.nii,1'
                                        };
matlabbatch{2}.spm.util.imcalc.output = 'MTsat_dual_TR27p8';
matlabbatch{2}.spm.util.imcalc.outdir = {'/data/pt_02478/Optimization_20210727/28341.0c_20210727_102942.SKYRA/ihMT'};
matlabbatch{2}.spm.util.imcalc.expression = '(i1+i2)./2';
matlabbatch{2}.spm.util.imcalc.var = struct('name', {}, 'value', {});
matlabbatch{2}.spm.util.imcalc.options.dmtx = 0;
matlabbatch{2}.spm.util.imcalc.options.mask = 0;
matlabbatch{2}.spm.util.imcalc.options.interp = 1;
matlabbatch{2}.spm.util.imcalc.options.dtype = 16;
