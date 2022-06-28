#!/bin/bash

DATA_PATH="/data/pt_np-vaculciakova/ihMT/Optimization_202010601/13061.30_20210601_131110.SKYRA/niftis/test_copy/"

cd $DATA_PATH

FSL fslmaths s2021*1.nii -add s2021*2.nii -add s2021*3.nii -add s2021*4.nii -add s2021*5.nii -add s2021*6.nii -div 6 avg_image_fsl -odt float
gunzip -f $DATA_PATH'avg_image_fsl.nii.gz'




