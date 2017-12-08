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

#Use user-installed version of vcftools (v. 0.1.15)
module load zlib
module load tabix
source /n/home13/ashultz/sw/progs/vcftools-0.1.15/setup.sh

SPECIES=$1

vcftools --gzvcf genotype_res_invariant_filterlabel/All_${SPECIES}s_FilteredSNPs_Int${SLURM_ARRAY_TASK_ID}.vcf.gz \
--remove-filtered badSeq \
--remove-filtered badMap \
--remove-filtered badStrand \
--remove-indels \
--recode --recode-INFO-all \
--out genotype_res_invariant_filtered/All_${SPECIES}s_FilteredSNPs_Int${SLURM_ARRAY_TASK_ID} \
2> logs_vcftools/All_${SPECIES}s_Int${SLURM_ARRAY_TASK_ID}_remove-filtered.log

bgzip genotype_res_invariant_filtered/All_${SPECIES}s_FilteredSNPs_Int${SLURM_ARRAY_TASK_ID}.recode.vcf
tabix -p vcf genotype_res_invariant_filtered/All_${SPECIES}s_FilteredSNPs_Int${SLURM_ARRAY_TASK_ID}.recode.vcf.gz