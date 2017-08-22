#!/bin/bash

#SBATCH -p general
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 20000
#SBATCH -t 10:00:00
#SBATCH -J vcfINFO
#SBATCH -o logs/vcfINFO_%j.out
#SBATCH -e logs/vcfINFO_%j.err
#SBATCH --constraint=holyib
#SBATCH --array=1-10

module load vcftools/0.1.14-fasrc01

SAMPLES=$1

#extract a variety of summary stats from each interval file for each specified species

vcftools --gzvcf genotype_res/All_${SAMPLES}s_Int${SLURM_ARRAY_TASK_ID}.vcf.gz --out qual_info/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID}_MQ --get-INFO MQ
vcftools --gzvcf genotype_res/All_${SAMPLES}s_Int${SLURM_ARRAY_TASK_ID}.vcf.gz --out qual_info/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID_DP --get-INFO DP
vcftools --gzvcf genotype_res/All_${SAMPLES}s_Int${SLURM_ARRAY_TASK_ID}.vcf.gz --out qual_info/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID_RPRS --get-INFO ReadPosRankSum
vcftools --gzvcf genotype_res/All_${SAMPLES}s_Int${SLURM_ARRAY_TASK_ID}.vcf.gz --out qual_info/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID_BQRS --get-INFO BaseQRankSum
vcftools --gzvcf genotype_res/All_${SAMPLES}s_Int${SLURM_ARRAY_TASK_ID}.vcf.gz --out qual_info/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID_MQRS --get-INFO MQRankSum
vcftools --gzvcf genotype_res/All_${SAMPLES}s_Int${SLURM_ARRAY_TASK_ID}.vcf.gz --out qual_info/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID_QD --get-INFO QD
vcftools --gzvcf genotype_res/All_${SAMPLES}s_Int${SLURM_ARRAY_TASK_ID}.vcf.gz --out qual_info/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID_MLEAC --get-INFO MLEAC
vcftools --gzvcf genotype_res/All_${SAMPLES}s_Int${SLURM_ARRAY_TASK_ID}.vcf.gz --out qual_info/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID_MLEAF --get-INFO MLEAF
vcftools --gzvcf genotype_res/All_${SAMPLES}s_Int${SLURM_ARRAY_TASK_ID}.vcf.gz --out qual_info/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID_CRS --get-INFO ClippingRankSum
vcftools --gzvcf genotype_res/All_${SAMPLES}s_Int${SLURM_ARRAY_TASK_ID}.vcf.gz --out qual_info/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID_ExH --get-INFO ExcessHet
vcftools --gzvcf genotype_res/All_${SAMPLES}s_Int${SLURM_ARRAY_TASK_ID}.vcf.gz --out qual_info/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID_SOR --get-INFO SOR
vcftools --gzvcf genotype_res/All_${SAMPLES}s_Int${SLURM_ARRAY_TASK_ID}.vcf.gz --out qual_info/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID_SOR --missing-indiv

