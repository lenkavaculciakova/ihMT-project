#!/bin/bash

DATA_PATH='/data/pt_02478/Optimization_20210707/11774.93_20210707_073232.SKYRA/'

MASK='niftis/pdw_lv_mtflash3d_v1m_2mm_0010/average_image_mask.nii'

IMAGES_PATH='ihMT/'

FILES=("ihMTRsat_240us.nii" "ihMTRsat_320us.nii" "ihMTRsat_400us.nii" "ihMTRsat_480us.nii" )

for file in "${FILES[@]}";
do
	FSL fslmaths $DATA_PATH$IMAGES_PATH$file -mul $DATA_PATH$MASK $DATA_PATH$IMAGES_PATH${file%.nii}_brain.nii -odt float
gunzip $DATA_PATH$IMAGES_PATH${file%.nii}_brain.nii.gz

done
