#!/bin/bash

#SBATCH -p shared
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 6000
#SBATCH -t 0-4:00
#SBATCH -J remove_filt
#SBATCH -o logs/remove_filt_%A_%a.out
#SBATCH -e logs/remove_filt_%A_%a.err
#SBATCH --constraint=holyib
#SBATCH --array=1-10


#Use user-installed version of bcftools (v. 1.6)


SPECIES=$1

bcftools view \
-f .,PASS,LowQual \
-R ../genome/bedfiles/All_HF_Whole_Genome_Include_Sites_d50.bed \
-o genotype_res_invariant_filtered/${SPECIES}_FilteredSNPs_${SLURM_ARRAY_TASK_ID} \
--exclude-types indels \
-O z \
genotype_res_invariant_filterlabel/${SPECIES}_FilteredSNPs_${SLURM_ARRAY_TASK_ID}.vcf.gz

bcftools view \
-r ../genome/bedfiles/All_HF_Whole_Genome_Include_Autosomal_Sites_d50.bed \
-o genotype_res_invariant_filtered_cov_ind_autosomal/${SPECIES}_FilteredSNPs_${SLURM_ARRAY_TASK_ID}.vcf.gz \
-O z \
genotype_res_invariant_filtered/${SPECIES}_FilteredSNPs_${SLURM_ARRAY_TASK_ID}.vcf.gz