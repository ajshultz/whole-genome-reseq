#!/bin/bash

#SBATCH -p general
#SBATCH -n 2
#SBATCH -N 1
#SBATCH --mem 8000
#SBATCH -t 1-00:00
#SBATCH -J genotypeOut
#SBATCH -o ./logs/genotypeGVCF_Out_%A_%a.out
#SBATCH -e ./logs/genotypeGVCF_Out_%A_%a.err
#SBATCH --constraint=holyib
#SBATCH --array=1-30

module load java/1.8.0_45-fasrc01

SAMPLE=$1

java -Xmx6g -XX:ParallelGCThreads=1 -jar ~/sw/bin/GenomeAnalysisTK.jar \
-T GenotypeGVCFs \
-R ../genome/final.assembly.homo.fa \
--variant outgroups/${SAMPLE}_${SLURM_ARRAY_TASK_ID}.raw.g.vcf \
--heterozygosity 0.005 \
--includeNonVariantSites \
-o outgroups/${SAMPLE}_${SLURM_ARRAY_TASK_ID}.vcf \
-L split_fai_30/final.assembly.homo.fa_${SLURM_ARRAY_TASK_ID}.interval_list