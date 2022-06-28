#!/bin/bash

DATA_PATH="/data/pt_np-vaculciakova/ihMT/Optimization_202010601/13061.30_20210601_131110.SKYRA/niftis/t1_mp2rage_p3_32Ch_T1_Images_0058/"

INPUT_FILE="T1_zerofilled.nii"
OUTPUT_FILE="downsampled_ref"


# Using AFNI

AFNI 3dresample -input $DATA_PATH$INPUT_FILE -prefix $DATA_PATH$OUTPUT_FILE -dxyz 1.25 1.25 1.25
cd $DATA_PATH
AFNI 3dAFNItoNIFTI $DATA_PATH$OUTPUT_FILE"+orig." -prefix $DATA_PATH$OUTPUT_FILE".nii"
cd "/data/pt_np-vaculciakova/ihMT/scripts"


# Using ISIS
# isistransform -in $DATA_PATH$INPUT_FILE -resample 1.25 1.25 1.25 -out $DATA_PATH${OUTPUT_FILE%.nii}"_isis.nii"


