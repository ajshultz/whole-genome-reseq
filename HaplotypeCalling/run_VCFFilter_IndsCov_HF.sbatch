#!/bin/bash

#SBATCH -p serial_requeue
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 24000
#SBATCH -t 6:00:00
#SBATCH -J CovIndFilt
#SBATCH -o logs/CovIndFilt_%j.out
#SBATCH -e logs/CovIndFilt_%j.err


#Use user-installed version of vcftools (v. 0.1.15)
source /n/home13/ashultz/sw/progs/vcftools-0.1.15/setup.sh

#Filter related individuals and sites not passing coverage filters
vcftools --gzvcf genotype_res_filtered/All_HFs_FilteredSNPs.vcf.gz \
—remove-indv CA_01_08 \
—remove-indv CA_14_05 \
—remove-indv CA_14_11 \
—remove-indv MA_14_15 \
—remove-indv MA_14_16 \
—remove-indv ME_01_11 \
—remove-indv ME_01_12 \
—remove-indv ME_90_12 \
—remove-indv NY_01_07 \
—remove-indv NY_01_08 \
—remove-indv NY_90_04 \
—remove-indv OH_90_02 \
—remove-indv WA_14_05 \
—remove-indv WA_14_09 \
--exclude-bed ../genome/bedfiles/All_HF_Whole_Genome_Exclude_Sites_d50.bed\
--recode --recode-INFO-all \
--out genotype_res_filtered/All_HFs_FilteredSNPsIndsCov.vcf.gz

#Create autosome only vcf
vcftools --gzvcf genotype_res_filtered/All_HFs_FilteredSNPsIndsCov.vcf.gz\
--include-bed ../genome/bedfiles/All_HF_Whole_Genome_Include_Autosomal_Sites_d50.bed \
--out genotype_res_filtered/All_HFs_FilteredSNPsIndsCov_Auto.vcf.gz
