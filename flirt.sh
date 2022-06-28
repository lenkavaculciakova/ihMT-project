#!/bin/bash

DATA_PATH="/data/pt_np-vaculciakova/ihMT/Optimization_202010601/13061.30_20210601_131110.SKYRA/niftis/"

REF="pdw_lv_mtflash3d_v1m_2mm_0012/"
cd $DATA_PATH$REF
ref_img="$(echo *-1.nii)"

matrix="mat.xfm"

declare -a INPUT_FOLDERS=("mtw_lv_mtflash3d_v1m_8kHz_fa10_mm_4pairs_1ms_0045/" "mtw_lv_mtflash3d_v1m_8kHz_fa10_mm_4pairs_1ms_0051/" "mtw_lv_mtflash3d_v1m_8kHz_fa10_mm_4pairs_1ms_0048/"
"mtw_lv_mtflash3d_v1m_8kHz_fa10_mm_4pairs_1ms_0042/" "mtw_lv_mtflash3d_v1m_8kHz_fa10_mm_4pairs_2ms_0033/" "mtw_lv_mtflash3d_v1m_8kHz_fa10_mm_4pairs_2ms_0039/" "mtw_lv_mtflash3d_v1m_8kHz_fa10_mm_4pairs_2ms_0036/"
"mtw_lv_mtflash3d_v1m_8kHz_fa10_mm_4pairs_2ms_0030/"
"mtw_lv_mtflash3d_v1m_8kHz_fa10_mm_4pairs_4ms_0021/" "mtw_lv_mtflash3d_v1m_8kHz_fa10_mm_4pairs_4ms_0027/" "mtw_lv_mtflash3d_v1m_8kHz_fa10_mm_4pairs_4ms_0024/"
"mtw_lv_mtflash3d_v1m_8kHz_fa10_mm_4pairs_4ms_0018/")

for INPUT in "${INPUT_FOLDERS[@]}";
do
	cd $DATA_PATH$INPUT
	in_img="$(echo *-1.nii)"

	FSL flirt -in $DATA_PATH$INPUT$in_img -ref $DATA_PATH$REF$ref_img -out 	$DATA_PATH$INPUT${in_img%.nii}flirt.nii -omat  $DATA_PATH$INPUT$matrix -bins 256 -cost normcorr -searchrx -15 15 -searchry -15 15 -searchrz -15 15 -coarsesearch 5 -finesearch 1 -dof 6 -interp trilinear
	gunzip -f $DATA_PATH$INPUT${in_img%.nii}flirt.nii.gz

	for ind in 2 3 4 5 6
	do
		FSL flirt -in $DATA_PATH$INPUT${in_img%1.nii}$ind'.nii' -ref $DATA_PATH$REF$ref_img -applyxfm -init $DATA_PATH$INPUT$matrix -out $DATA_PATH$INPUT${in_img%.nii}$ind'flirt.nii'
	gunzip -f $DATA_PATH$INPUT${in_img%.nii}$ind'flirt.nii.gz'
	done
done

