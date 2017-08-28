#!/bin/bash

#SBATCH -p general
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 4000
#SBATCH -t 6:00:00
#SBATCH -J vcfINFO
#SBATCH -o logs/vcfINFO_%A_%a.out
#SBATCH -e logs/vcfINFO_%A_%a.err
#SBATCH --constraint=holyib
#SBATCH --array=1-10

#Use user-installed version of vcftools (v. 0.1.15)
source /n/home13/ashultz/sw/progs/vcftools-0.1.15/setup.sh

SAMPLES=$1

#extract a variety of summary stats from each interval file for each specified species

vcftools --gzvcf genotype_res/All_${SAMPLES}s_Int${SLURM_ARRAY_TASK_ID}.vcf.gz --out qual_info/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID}_MQ --get-INFO MQ

vcftools --gzvcf genotype_res/All_${SAMPLES}s_Int${SLURM_ARRAY_TASK_ID}.vcf.gz --out qual_info/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID}_DP --get-INFO DP

vcftools --gzvcf genotype_res/All_${SAMPLES}s_Int${SLURM_ARRAY_TASK_ID}.vcf.gz --out qual_info/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID}_RPRS --get-INFO ReadPosRankSum

vcftools --gzvcf genotype_res/All_${SAMPLES}s_Int${SLURM_ARRAY_TASK_ID}.vcf.gz --out qual_info/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID}_BQRS --get-INFO BaseQRankSum

vcftools --gzvcf genotype_res/All_${SAMPLES}s_Int${SLURM_ARRAY_TASK_ID}.vcf.gz --out qual_info/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID}_MQRS --get-INFO MQRankSum

vcftools --gzvcf genotype_res/All_${SAMPLES}s_Int${SLURM_ARRAY_TASK_ID}.vcf.gz --out qual_info/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID}_QD --get-INFO QD

vcftools --gzvcf genotype_res/All_${SAMPLES}s_Int${SLURM_ARRAY_TASK_ID}.vcf.gz --out qual_info/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID}_MLEAC --get-INFO MLEAC

vcftools --gzvcf genotype_res/All_${SAMPLES}s_Int${SLURM_ARRAY_TASK_ID}.vcf.gz --out qual_info/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID}_MLEAF --get-INFO MLEAF

vcftools --gzvcf genotype_res/All_${SAMPLES}s_Int${SLURM_ARRAY_TASK_ID}.vcf.gz --out qual_info/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID}_CRS --get-INFO ClippingRankSum

vcftools --gzvcf genotype_res/All_${SAMPLES}s_Int${SLURM_ARRAY_TASK_ID}.vcf.gz --out qual_info/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID}_ExH --get-INFO ExcessHet

vcftools --gzvcf genotype_res/All_${SAMPLES}s_Int${SLURM_ARRAY_TASK_ID}.vcf.gz --out qual_info/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID}_SOR --get-INFO SOR

vcftools --gzvcf genotype_res/All_${SAMPLES}s_Int${SLURM_ARRAY_TASK_ID}.vcf.gz --out qual_info/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID}_missing --missing-indv

