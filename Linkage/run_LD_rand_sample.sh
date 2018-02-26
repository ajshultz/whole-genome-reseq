#!/bin/bash

#SBATCH -p shared
#SBATCH -n 5
#SBATCH -N 1
#SBATCH --mem 60000
#SBATCH -t 5-0:00:00
#SBATCH -J ld_sample
#SBATCH -o logs/mapgd_ld_samp_%j.out
#SBATCH -e logs/mapgd_ld_samp_%j.err
#SBATCH --constraint=holyib


#The purpose of this script is to take one file per scaffold of linkage results from mapgd, and randomly sample a specified proportion of lines. Users must supply arguments... Will produce 5 files with different random samples drawn from files.


POP=$1
PROPORTION=$2
OUT_DIR=$3
INPUT_DIR=$4

#Create output file, and write header for 1-10 random files
for i in {1..5}

do

OUT_FILE=${OUT_DIR}/${POP}_sample_${PROPORTION}_${i}.linkage.txt
echo SCAFF_X$'\t'POS_X$'\t'SCAFF_Y$'\t'POS_Y$'\t'DIST$'\t'BEST_D$'\t'BEST_Dprime$'\t'BEST_D2$'\t'BEST_R2$'\t'ADJ_BEST_D$'\t'ADJ_BEST_Dprime$'\t'ADJ_BEST_D$'\t'ADJ_BEST_r2$'\t'Ni$'\t'LOGLIKE > ${OUT_FILE}

done

for SCAFF_NUM in {0..7026}

do
#Grab number of sites in scaffold file, subtract header lines
SITES=$(wc -l < ${INPUT_DIR}/${POP}_scaffold_${SCAFF_NUM}_10kbMax.linkage)
SITES=$((${SITES}-6))

#Calculate number of lines to keep from a given proportion
SUB_SITES=$(echo ${SITES}*${PROPORTION} | bc)
SUB_SITES=${SUB_SITES%%.*}

#Grab contents of scaffold, remove first 6 rows, shuffle, and append subset of lines to output file - repeat shuffle and output 10 times

cat ${INPUT_DIR}/${POP}_scaffold_${SCAFF_NUM}_10kbMax.linkage | tail -n +7 | tee >(shuf | head -n $SUB_SITES >> ${OUT_DIR}/${POP}_sample_${PROPORTION}_1.linkage.txt ) >(shuf | head -n $SUB_SITES >> ${OUT_DIR}/${POP}_sample_${PROPORTION}_2.linkage.txt) >(shuf | head -n $SUB_SITES >> ${OUT_DIR}/${POP}_sample_${PROPORTION}_3.linkage.txt) >(shuf | head -n $SUB_SITES >> ${OUT_DIR}/${POP}_sample_${PROPORTION}_4.linkage.txt) | shuf | head -n $SUB_SITES >> ${OUT_DIR}/${POP}_sample_${PROPORTION}_5.linkage.txt

#gzip input file
gzip ${INPUT_DIR}/${POP}_scaffold_${SCAFF_NUM}_10kbMax.linkage

echo scaffold_${SCAFF_NUM} for ${POP} finished

done

