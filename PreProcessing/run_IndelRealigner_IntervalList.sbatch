#!/bin/bash

#SBATCH -p general
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 12000
#SBATCH -t 1-00:00
#SBATCH -o ./logs/realign_%A_%a.out
#SBATCH -e ./logs/realign_%A_%a.err
#SBATCH --constrain=holyib
#SBATCH --array=1-20

SAMPLE=$1

module load java/1.8.0_45-fasrc01

java -Xmx8g -jar ~/sw/bin/GenomeAnalysisTK.jar \
-T IndelRealigner \
-R ../genome/final.assembly.homo.fa \
-I ../preprocess/${SAMPLE}.dedup.sorted.bam \
-targetIntervals ./interval_list_${SLURM_ARRAY_TASK_ID}/HFCCCP_indel_${SLURM_ARRAY_TASK_ID}.intervals \
-L split_fai/final.assembly.homo.fa_${SLURM_ARRAY_TASK_ID}.interval_list \
-o ./interval_list_${SLURM_ARRAY_TASK_ID}/${SAMPLE}_${SLURM_ARRAY_TASK_ID}.realigned.bam