#!/bin/bash

#SBATCH -p general
#SBATCH -n 2
#SBATCH -N 1
#SBATCH --mem 8000
#SBATCH -t 1-00:00
#SBATCH -J genotypeCP
#SBATCH -o ./logs/genotypeGVCF_CP_%A_%a.out
#SBATCH -e ./logs/genotypeGVCF_CP_%A_%a.err
#SBATCH --constraint=holyib
#SBATCH --array=1-10

module load java/1.8.0_45-fasrc01

SAMPLE=$1

java -Xmx6g -XX:ParallelGCThreads=1 -jar ~/sw/bin/GenomeAnalysisTK.jar \
-T GenotypeGVCFs \
-R ../genome/final.assembly.homo.fa \
--variant interval_list_${SLURM_ARRAY_TASK_ID}/CP_01_${SLURM_ARRAY_TASK_ID}.raw.g.vcf.gz \
--variant interval_list_${SLURM_ARRAY_TASK_ID}/CP_02_${SLURM_ARRAY_TASK_ID}.raw.g.vcf.gz \
--variant interval_list_${SLURM_ARRAY_TASK_ID}/CP_03_${SLURM_ARRAY_TASK_ID}.raw.g.vcf.gz \
--variant interval_list_${SLURM_ARRAY_TASK_ID}/CP_04_${SLURM_ARRAY_TASK_ID}.raw.g.vcf.gz \
--variant interval_list_${SLURM_ARRAY_TASK_ID}/CP_05_${SLURM_ARRAY_TASK_ID}.raw.g.vcf.gz \
--variant interval_list_${SLURM_ARRAY_TASK_ID}/CP_06_${SLURM_ARRAY_TASK_ID}.raw.g.vcf.gz \
--variant interval_list_${SLURM_ARRAY_TASK_ID}/CP_07_${SLURM_ARRAY_TASK_ID}.raw.g.vcf.gz \
--variant interval_list_${SLURM_ARRAY_TASK_ID}/CP_08_${SLURM_ARRAY_TASK_ID}.raw.g.vcf.gz \
--heterozygosity 0.005 \
-o genotype_res/All_CPs_Int${SLURM_ARRAY_TASK_ID}.vcf.gz \
-L split_fai_10/final.assembly.homo.fa_${SLURM_ARRAY_TASK_ID}.interval_list