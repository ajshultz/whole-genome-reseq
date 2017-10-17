#!/bin/bash

#SBATCH -p serial_requeue
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 8000
#SBATCH -t 2-00:00:00
#SBATCH -J IndFilt
#SBATCH -o logs/IndFilt_%j.out
#SBATCH -e logs/IndFilt_%j.err


#Use user-installed version of vcftools (v. 0.1.15)
module load zlib
source /n/home13/ashultz/sw/progs/vcftools-0.1.15/setup.sh

INDS_FILE=$1
VCF_HANDLE=$2

#Filter related individuals and sites not passing coverage filters
vcftools --gzvcf genotype_res_filtered/All_HFs_FilteredSNPsIndsCov.recode.vcf.gz \
--keep ${INDS_FILE} \
--recode --recode-INFO-all \
--out genotype_res_filtered_indsubsets/${VCF_HANDLE}

bgzip genotype_res_filtered_indsubsets/${VCF_HANDLE}.vcf

