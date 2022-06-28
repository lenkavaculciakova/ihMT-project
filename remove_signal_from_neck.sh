#!/bin/bash

DATA_PATH="/data/pt_02478/Optimization_20210628/28341.0c_20210628_083113.SKYRA/niftis/"

declare -a INPUT_FOLDER=("ihmtw_lv_mtflash3d_v1m_2mm_fa10_8kHz_0p16ms_4pairs_mm_0019" "ihmtw_lv_mtflash3d_v1m_2mm_fa10_8kHz_0p16ms_4pairs_mp_0025" "ihmtw_lv_mtflash3d_v1m_2mm_fa10_8kHz_0p16ms_4pairs_pm_0022" "ihmtw_lv_mtflash3d_v1m_2mm_fa10_8kHz_0p16ms_4pairs_pm_0054" "ihmtw_lv_mtflash3d_v1m_2mm_fa10_8kHz_0p16ms_4pairs_pp_0016" "ihmtw_lv_mtflash3d_v1m_2mm_fa10_8kHz_0p24ms_4pairs_mm_0031" "ihmtw_lv_mtflash3d_v1m_2mm_fa10_8kHz_0p24ms_4pairs_mp_0033" "ihmtw_lv_mtflash3d_v1m_2mm_fa10_8kHz_0p24ms_4pairs_pm_0032" "ihmtw_lv_mtflash3d_v1m_2mm_fa10_8kHz_0p24ms_4pairs_pp_0028" "ihmtw_lv_mtflash3d_v1m_2mm_fa10_8kHz_0p48ms_4pairs_mm_0037" "ihmtw_lv_mtflash3d_v1m_2mm_fa10_8kHz_0p48ms_4pairs_mp_0039" "ihmtw_lv_mtflash3d_v1m_2mm_fa10_8kHz_0p48ms_4pairs_pm_0038" "ihmtw_lv_mtflash3d_v1m_2mm_fa10_8kHz_0p48ms_4pairs_pp_0036" "ihmtw_lv_mtflash3d_v1m_2mm_fa10_8kHz_0p72ms_4pairs_mm_0043" "ihmtw_lv_mtflash3d_v1m_2mm_fa10_8kHz_0p72ms_4pairs_mp_0045" "ihmtw_lv_mtflash3d_v1m_2mm_fa10_8kHz_0p72ms_4pairs_pm_0044" "ihmtw_lv_mtflash3d_v1m_2mm_fa10_8kHz_0p72ms_4pairs_pp_0042" "ihmtw_lv_mtflash3d_v1m_2mm_fa10_8kHz_0p96ms_4pairs_mm_0049" "ihmtw_lv_mtflash3d_v1m_2mm_fa10_8kHz_0p96ms_4pairs_mp_0051" "ihmtw_lv_mtflash3d_v1m_2mm_fa10_8kHz_0p96ms_4pairs_pm_0050" "ihmtw_lv_mtflash3d_v1m_2mm_fa10_8kHz_0p96ms_4pairs_pp_0048" "pdw_lv_mtflash3d_v1m_2mm_0010" "t1w_lv_mtflash3d_v1m_2mm_0007")

INPUT_FILE="/average_image.nii" #"T1.nii" #"average_image.nii" #
OUTPUT_FILE="/average_image_cropped.nii" #"average_image_cropped.nii" #
FOV_READ=256 #in mm

HEIGHT=196 #in mm

HEIGHT2=$(($FOV_READ-$HEIGHT))

for FOLDER in "${INPUT_FOLDER[@]}";
do
	FSL robustfov -i $DATA_PATH$FOLDER$INPUT_FILE -b $HEIGHT -r $DATA_PATH$FOLDER$OUTPUT_FILE
	FSL robustfov -i $DATA_PATH$FOLDER$INPUT_FILE -b $HEIGHT2 -r $DATA_PATH$FOLDER${OUTPUT_FILE%.nii}2.nii

	FSL fslmaths $DATA_PATH$FOLDER${OUTPUT_FILE%.nii}2.nii -mul 0 $DATA_PATH$FOLDER"/zero_fill.nii"

	FSL fslmerge -y $DATA_PATH$FOLDER${OUTPUT_FILE%cropped.nii}zerofilled.nii $DATA_PATH$FOLDER'/zero_fill.nii' $DATA_PATH$FOLDER$OUTPUT_FILE
done

