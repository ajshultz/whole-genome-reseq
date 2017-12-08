#!/bin/bash

#SBATCH -p general
#SBATCH -n 2
#SBATCH -N 1
#SBATCH --mem 8000
#SBATCH -t 1-00:00
#SBATCH -J genotypeCC
#SBATCH -o ./logs/genotypeGVCF_CC_%A_%a.out
#SBATCH -e ./logs/genotypeGVCF_CC_%A_%a.err
#SBATCH --constraint=holyib
#SBATCH --array=1-10

module load java/1.8.0_45-fasrc01

SAMPLE=$1

java -Xmx6g -XX:ParallelGCThreads=1 -jar ~/sw/bin/GenomeAnalysisTK.jar \
-T GenotypeGVCFs \
-R ../genome/final.assembly.homo.fa \
--variant interval_list_${SLURM_ARRAY_TASK_ID}/CC_01_${SLURM_ARRAY_TASK_ID}.raw.g.vcf.gz \
--variant interval_list_${SLURM_ARRAY_TASK_ID}/CC_02_${SLURM_ARRAY_TASK_ID}.raw.g.vcf.gz \
--variant interval_list_${SLURM_ARRAY_TASK_ID}/CC_03_${SLURM_ARRAY_TASK_ID}.raw.g.vcf.gz \
--variant interval_list_${SLURM_ARRAY_TASK_ID}/CC_04_${SLURM_ARRAY_TASK_ID}.raw.g.vcf.gz \
--variant interval_list_${SLURM_ARRAY_TASK_ID}/CC_05_${SLURM_ARRAY_TASK_ID}.raw.g.vcf.gz \
--variant interval_list_${SLURM_ARRAY_TASK_ID}/CC_06_${SLURM_ARRAY_TASK_ID}.raw.g.vcf.gz \
--variant interval_list_${SLURM_ARRAY_TASK_ID}/CC_07_${SLURM_ARRAY_TASK_ID}.raw.g.vcf.gz \
--variant interval_list_${SLURM_ARRAY_TASK_ID}/CC_08_${SLURM_ARRAY_TASK_ID}.raw.g.vcf.gz \
--heterozygosity 0.005 \
-o genotype_res_invariant/All_CCs_Int${SLURM_ARRAY_TASK_ID}.vcf.gz \
--includeNonVariantSites \
-L split_fai_10/final.assembly.homo.fa_${SLURM_ARRAY_TASK_ID}.interval_list