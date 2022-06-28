#!/bin/bash
# first remove signal from below the tip of the nose to neck usin 'remove_signal_from_neck.sh'
# if reference is not of desired resolution, use 'downsample_reference.sh'
# then coregister images

DATA_PATH="/data/pt_02478/Optimization_20210628/28341.0c_20210628_083113.SKYRA/niftis/"

declare -a INPUT_FOLDER=("t1w_lv_mtflash3d_v1m_2mm_0007")

INPUT_FILE="/average_image_zerofilled.nii" #"avg_image_fsl.nii"
REF="/t1_mprage_ADNI_32Ch_0056/s2021-06-28_08-31-102415-00001-00144-1.nii" #   "downsampled_ref_isis.nii" #
OUTPUT_FILE="/avg_image_coreg.nii"

matrix="/avg_image_coreg.mat"

# uncomment if you want to pre-rotate the image / reference by 30 deg due to the acquisition FOV being under the angle using isistransform
# isistransform -in $DATA_PATH$INPUT_FILE -rotate x y 5.76 -pix_center -out $DATA_PATH${INPUT_FILE%.nii}"_rot.nii"
# isistransform -in $DATA_PATH$REF -rotate x y 0.52 -pix_center -out $DATA_PATH${REF%.nii.gz}"_rot.nii"

# uncomment if you want to pre-rotate the image / reference by 30 deg due to the acquisition FOV being under the angle by applying transformation matrix
#FSL flirt -in $DATA_PATH$REF -ref $DATA_PATH$REF -out $DATA_PATH${REF%.nii.gz}"_rot.nii" -init $DATA_PATH"rot_ref_by_30deg.mat" -applyxfm


#	FSL flirt -in $DATA_PATH$INPUT_FILE -ref $DATA_PATH$REF -out $DATA_PATH$OUTPUT_FILE -omat  $DATA_PATH$matrix -bins 256 -cost normcorr -searchrx -35 35 -searchry -35 35 -searchrz -35 35 -coarsesearch 10 -finesearch 2 -dof 6 -interp trilinear
#	gunzip -f $DATA_PATH$OUTPUT_FILE.gz

for FOLDER in "${INPUT_FOLDER[@]}";
do

	FSL flirt  -in $DATA_PATH$FOLDER$INPUT_FILE -ref $DATA_PATH$REF -out $DATA_PATH$FOLDER$OUTPUT_FILE -omat $DATA_PATH$FOLDER$matrix -bins 256 -cost mutualinfo -searchrx -90 90 -searchry -90 90 -searchrz -90 90 -dof 6  -interp trilinear
	gunzip -f $DATA_PATH$FOLDER$OUTPUT_FILE.gz

done



