#!/bin/bash

#DATA_PATH='/data/pt_02478/Optimization_20210628/28341.0c_20210628_083113.SKYRA/'
#DATA_PATH='/data/pt_02478/Optimization_20210630/08950.3f_20210630_072253.SKYRA/'
#DATA_PATH='/data/pt_02478/Optimization_20210630/15484.08_20210630_121538.SKYRA/'
DATA_PATH='/data/pt_02478/Optimization_20211206/35516.ae_20211206_085756.SKYRA/'

#MASK='niftis/pdw_lv_mtflash3d_v1m_2mm_0010/average_image_brain_mask.nii.gz'
#MASK='niftis/pdw_lv_mtflash3d_v1m_2mm_0010/average_image_brain_mask.nii.gz'
MASK='ihMT/avg_pdw_image_brain_mask.nii'

IMAGES_PATH='maps/'

#FOLDERS=("rf240us_120us/" "rf240us_250us/" "rf240us_500us/" "rf240us_1000us/" "rf240us_1500us/" "rf240us_2000us/")
FOLDERS=("fa_6/" "fa_9/" "fa_12/" "fa_15/" "fa_18/")

SAT_SCHEME=("mp" "pm" "mm" "pp")

#FILE='/Results/s2021-06-28_08-31-085404-00001-00088-1_RFSC_MTsat.nii'
#FILE='/Results/s2021-06-30_07-22-084532-00001-00088-1_RFSC_MTsat.nii'
FILE='/Results/s2021-12-06_08-57-091508-00001-00080-1_RFSC_MTsat.nii'

for folder in "${FOLDERS[@]}";
do
	for sat in "${SAT_SCHEME[@]}";
	do 
		FSL fslmaths $DATA_PATH$IMAGES_PATH$folder$sat$FILE -mul $DATA_PATH$MASK $DATA_PATH$IMAGES_PATH$folder$sat${FILE%.nii}_brain.nii -odt float
		gunzip $DATA_PATH$IMAGES_PATH$folder$sat${FILE%.nii}_brain.nii.gz

	done
done

#FSL fslmaths $DATA_PATH"maps/standard/"$FILE -mul $DATA_PATH$MASK $DATA_PATH"maps/standard/"${FILE%.nii}_brain.nii -odt float
#gunzip $DATA_PATH"maps/standard/"${FILE%.nii}_brain.nii.gz

