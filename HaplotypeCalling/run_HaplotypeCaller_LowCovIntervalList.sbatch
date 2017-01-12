#!/bin/bash

#SBATCH -p general
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 12000
#SBATCH -t 4-00:00
#SBATCH -J gvcf
#SBATCH -o ./logs/gvcf_%A_%a.out
#SBATCH -e ./logs/gvcf_%A_%a.err
#SBATCH --constrain=holyib
#SBATCH --array=1-10

module load java/1.8.0_45-fasrc01

SAMPLE=$1

java -Xmx8g -jar ~/sw/bin/GenomeAnalysisTK.jar \
-T HaplotypeCaller \
-R ../genome/final.assembly.homo.fa \
-minPruning 1 \
-minDanglingBranchLength 1 \
-I ../preprocess/${SAMPLE}.dedup.sorted.bam \
--emitRefConfidence GVCF \
-o interval_list_${SLURM_ARRAY_TASK_ID}/${SAMPLE}_${SLURM_ARRAY_TASK_ID}.raw.g.vcf \
-L split_fai_10/final.assembly.homo.fa_${SLURM_ARRAY_TASK_ID}.interval_list