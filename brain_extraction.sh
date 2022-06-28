#!/bin/bash
# path to the pdw image - best to use average of 8
IN_PATH='/data/pt_02478/Optimization_20210707/11774.93_20210707_073232.SKYRA/niftis/pdw_lv_mtflash3d_v1m_2mm_0010/'
cd $IN_PATH

img='average_image'

FSL bet $img $img -R -f 0.5 -g 0 -n -m
gunzip ${img}_mask.nii.gz
rm $img.nii.gz

