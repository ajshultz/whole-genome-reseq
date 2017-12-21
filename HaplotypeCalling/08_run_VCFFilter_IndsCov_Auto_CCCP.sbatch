#!/bin/bash

#SBATCH -p serial_requeue
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 8000
#SBATCH -t 0-00:04:00
#SBATCH -J CovIndFilt
#SBATCH -o logs/CovIndFilt_%A_%a.out
#SBATCH -e logs/CovIndFilt_%A_%a.err
#SBATCH --constraint=holyib
#SBATCH --array=1-30


#Use user-installed version of vcftools (v. 0.1.15)
module load zlib
module load tabix
source /n/home13/ashultz/sw/progs/vcftools-0.1.15/setup.sh

SPECIES=$1


#Filter related individuals and sites not passing coverage filters
vcftools --gzvcf genotype_res_invariant_filtered/All_${SPECIES}s_FilteredSNPs_Int${SLURM_ARRAY_TASK_ID}.recode.vcf.gz \
--exclude-bed ../genome/bedfiles/All_HF_Whole_Genome_Exclude_Sites_d50.bed \
--recode --recode-INFO-all \
--out genotype_res_invariant_filtered_cov_ind/All_${SPECIES}s_FilteredSNPs_Int${SLURM_ARRAY_TASK_ID} \
2> logs_vcftools/All_${SPECIES}s_Int${SLURM_ARRAY_TASK_ID}_remove-filtered.log

bgzip genotype_res_invariant_filtered_cov_ind/All_${SPECIES}s_FilteredSNPs_Int${SLURM_ARRAY_TASK_ID}.recode.vcf
tabix -p vcf genotype_res_invariant_filtered_cov_ind/All_${SPECIES}s_FilteredSNPs_Int${SLURM_ARRAY_TASK_ID}.recode.vcf.gz

#Create autosome only vcf
vcftools --gzvcf genotype_res_invariant_filtered_cov_ind/All_${SPECIES}s_FilteredSNPs_Int${SLURM_ARRAY_TASK_ID}.recode.vcf.gz \
--bed ../genome/bedfiles/All_HF_Whole_Genome_Include_Autosomal_Sites_d50.bed \
--recode --recode-INFO-all \
--out genotype_res_invariant_filtered_cov_ind/All_${SPECIES}s_FilteredSNPs_Autosomal_Int${SLURM_ARRAY_TASK_ID}

bgzip genotype_res_invariant_filtered_cov_ind_autosomal/All_${SPECIES}s_FilteredSNPs_Autosomal_Int${SLURM_ARRAY_TASK_ID}.recode.vcf
tabix -p vcf genotype_res_invariant_filtered_cov_ind_autosomal/All_${SPECIES}s_FilteredSNPs_Autosomal_Int${SLURM_ARRAY_TASK_ID}.recode.vcf.gz



