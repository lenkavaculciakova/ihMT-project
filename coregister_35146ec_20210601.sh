#!/bin/bash
# first remove signal from below the tip of the nose to neck usin 'remove_signal_from_neck.sh'
# if reference is not of desired resolution, use 'downsample_reference.sh'
# then coregister images

DATA_PATH="/data/pt_np-vaculciakova/ihMT/Optimization_202010601/35146.ec_20210601_074734.SKYRA/niftis/"

declare -a INPUT_FOLDER=("mtw_lv_mtflash3d_v1m_4kHz_fa10_mm_1p5_0011/" "mtw_lv_mtflash3d_v1m_4kHz_fa10_mp_1p5_0013/" "mtw_lv_mtflash3d_v1m_4kHz_fa10_pm_1p5_0012/" "mtw_lv_mtflash3d_v1m_4kHz_fa10_pp_1p5_0010/")

INPUT_FILE="average_image.nii" #"avg_image_fsl.nii"
REF="t1_mp2rage_p3_32Ch_T1_Images_0045/downsampled_ref.nii" #   "downsampled_ref_isis.nii" #
OUTPUT_FILE="avg_image_coreg.nii"

matrix="avg_image_coreg.mat"

# uncomment if you want to pre-rotate the image / reference by 30 deg due to the acquisition FOV being under the angle using isistransform
# isistransform -in $DATA_PATH$INPUT_FILE -rotate x y 5.76 -pix_center -out $DATA_PATH${INPUT_FILE%.nii}"_rot.nii"
# isistransform -in $DATA_PATH$REF -rotate x y 0.52 -pix_center -out $DATA_PATH${REF%.nii.gz}"_rot.nii"

# uncomment if you want to pre-rotate the image / reference by 30 deg due to the acquisition FOV being under the angle by applying transformation matrix
#FSL flirt -in $DATA_PATH$REF -ref $DATA_PATH$REF -out $DATA_PATH${REF%.nii.gz}"_rot.nii" -init $DATA_PATH"rot_ref_by_30deg.mat" -applyxfm


#	FSL flirt -in $DATA_PATH$INPUT_FILE -ref $DATA_PATH$REF -out $DATA_PATH$OUTPUT_FILE -omat  $DATA_PATH$matrix -bins 256 -cost normcorr -searchrx -35 35 -searchry -35 35 -searchrz -35 35 -coarsesearch 10 -finesearch 2 -dof 6 -interp trilinear
#	gunzip -f $DATA_PATH$OUTPUT_FILE.gz

#for FOLDER in "${INPUT_FOLDER[@]}";
#do

#	FSL flirt  -in $DATA_PATH$FOLDER$INPUT_FILE -ref $DATA_PATH$REF -out $DATA_PATH$FOLDER$OUTPUT_FILE -omat $DATA_PATH$FOLDER$matrix -bins 256 -cost mutualinfo -searchrx -90 90 -searchry -90 90 -searchrz -90 90 -dof 6  -interp trilinear
#	gunzip -f $DATA_PATH$FOLDER$OUTPUT_FILE.gz

#done

##########################################################################
#declare -a INPUT_FOLDER=("mtw_lv_mtflash3d_v1m_4kHz_fa10_mm_1p7_0018/" "mtw_lv_mtflash3d_v1m_4kHz_fa10_mp_1p7_0020/" "mtw_lv_mtflash3d_v1m_4kHz_fa10_pm_1p7_0019/" "mtw_lv_mtflash3d_v1m_4kHz_fa10_pp_1p7_0017/")

#REF="mtw_lv_mtflash3d_v1m_4kHz_fa10_pp_1p5_0010/avg_image_coreg.nii" #   "downsampled_ref_isis.nii" #

#for FOLDER in "${INPUT_FOLDER[@]}";
#do

#	FSL flirt  -in $DATA_PATH$FOLDER$INPUT_FILE -ref $DATA_PATH$REF -out $DATA_PATH$FOLDER$OUTPUT_FILE -omat $DATA_PATH$FOLDER$matrix -bins 256 -cost mutualinfo -searchrx -90 90 -searchry -90 90 -searchrz -90 90 -dof 6  -interp trilinear
#	gunzip -f $DATA_PATH$FOLDER$OUTPUT_FILE.gz

#done

##########################################################################
#declare -a INPUT_FOLDER=("mtw_lv_mtflash3d_v1m_4kHz_fa10_mm_2mm_0025/" "mtw_lv_mtflash3d_v1m_4kHz_fa10_mp_2mm_0027/" "mtw_lv_mtflash3d_v1m_4kHz_fa10_pm_2mm_0026/" "mtw_lv_mtflash3d_v1m_4kHz_fa10_pp_2mm_0024/")

#REF="mtw_lv_mtflash3d_v1m_4kHz_fa10_pp_1p7_0017/avg_image_coreg.nii" #   "downsampled_ref_isis.nii" #

#for FOLDER in "${INPUT_FOLDER[@]}";
#do

#	FSL flirt  -in $DATA_PATH$FOLDER$INPUT_FILE -ref $DATA_PATH$REF -out $DATA_PATH$FOLDER$OUTPUT_FILE -omat $DATA_PATH$FOLDER$matrix -bins 256 -cost mutualinfo -searchrx -90 90 -searchry -90 90 -searchrz -90 90 -dof 6  -interp trilinear
#	gunzip -f $DATA_PATH$FOLDER$OUTPUT_FILE.gz

#done

##########################################################################
#declare -a INPUT_FOLDER=("mtw_lv_mtflash3d_v1m_4kHz_fa10_mm_2p5_0032/" "mtw_lv_mtflash3d_v1m_4kHz_fa10_mp_2p5_0034/" "mtw_lv_mtflash3d_v1m_4kHz_fa10_pm_2p5_0033/" "mtw_lv_mtflash3d_v1m_4kHz_fa10_pp_2p5_0031/")

#REF="mtw_lv_mtflash3d_v1m_4kHz_fa10_pp_2mm_0024/avg_image_coreg.nii" #   "downsampled_ref_isis.nii" #

#for FOLDER in "${INPUT_FOLDER[@]}";
#do

#	FSL flirt  -in $DATA_PATH$FOLDER$INPUT_FILE -ref $DATA_PATH$REF -out $DATA_PATH$FOLDER$OUTPUT_FILE -omat $DATA_PATH$FOLDER$matrix -bins 256 -cost mutualinfo -searchrx -90 90 -searchry -90 90 -searchrz -90 90 -dof 6  -interp trilinear
#	gunzip -f $DATA_PATH$FOLDER$OUTPUT_FILE.gz

#done
##########################################################################
declare -a INPUT_FOLDER=("pdw_lv_mtflash3d_v1m_1p5_0008/" "pdw_lv_mtflash3d_v1m_1p7_0015/" "pdw_lv_mtflash3d_v1m_2mm_0022/" "pdw_lv_mtflash3d_v1m_2p5_0029/")

REF="mtw_lv_mtflash3d_v1m_4kHz_fa10_pp_1p5_0010/avg_image_coreg.nii" #   "downsampled_ref_isis.nii" #

for FOLDER in "${INPUT_FOLDER[@]}";
do

	FSL flirt  -in $DATA_PATH$FOLDER$INPUT_FILE -ref $DATA_PATH$REF -out $DATA_PATH$FOLDER$OUTPUT_FILE -omat $DATA_PATH$FOLDER$matrix -bins 256 -cost mutualinfo -searchrx -90 90 -searchry -90 90 -searchrz -90 90 -dof 6  -interp trilinear
	gunzip -f $DATA_PATH$FOLDER$OUTPUT_FILE.gz

done
