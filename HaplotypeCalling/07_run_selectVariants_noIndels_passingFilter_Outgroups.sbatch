#!/bin/bash

#SBATCH -p shared
#SBATCH -n 2
#SBATCH -N 1
#SBATCH --mem 6000
#SBATCH -t 0-4:00
#SBATCH -J selectVariants
#SBATCH -o logs/SelVar_%A_%a.out
#SBATCH -e logs/SelVar_%A_%a.err
#SBATCH --constraint=holyib
#SBATCH --array=1-10

module load java/1.8.0_45-fasrc01

SPECIES=$1


java -Xmx5g -XX:ParallelGCThreads=1 -jar ~/sw/bin/GenomeAnalysisTK.jar \
-T SelectVariants \
-R ../genome/final.assembly.homo.fa \
-V genotype_res_invariant_filterlabel/All_${SPECIES}s_FilteredSNPs_Int${SLURM_ARRAY_TASK_ID}.vcf.gz \
-o genotype_res_invariant_filtered/All_${SPECIES}s_FilteredSNPs_Int${SLURM_ARRAY_TASK_ID}.vcf.gz \
--excludeFiltered \
--selectTypeToExclude INDEL