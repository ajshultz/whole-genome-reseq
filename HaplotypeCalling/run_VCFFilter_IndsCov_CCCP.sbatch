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
module load zlib
module load tabix
source /n/home13/ashultz/sw/progs/vcftools-0.1.15/setup.sh

#Filter sites not passing coverage filters
vcftools --gzvcf genotype_res_filtered/All_CPs_FilteredSNPs.vcf.gz \
--exclude-bed ../genome/bedfiles/All_HF_Whole_Genome_Exclude_Sites_d50.bed \
--recode --recode-INFO-all \
--out genotype_res_filtered/All_CPs_FilteredSNPsIndsCov

bgzip genotype_res_filtered/All_CPs_FilteredSNPsIndsCov.recode.vcf


vcftools --gzvcf genotype_res_filtered/All_CCs_FilteredSNPs.vcf.gz \
--exclude-bed ../genome/bedfiles/All_HF_Whole_Genome_Exclude_Sites_d50.bed \
--recode --recode-INFO-all \
--out genotype_res_filtered/All_CCs_FilteredSNPsIndsCov

bgzip genotype_res_filtered/All_CCs_FilteredSNPsIndsCov.recode.vcf