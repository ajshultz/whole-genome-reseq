#!/bin/bash

#SBATCH -p serial_requeue
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 1000
#SBATCH -t 0-0:30:00
#SBATCH -J vcf_subset
#SBATCH -o vcf_subset_%j.out
#SBATCH -e vcf_subset_%j.err

~/sw/progs/vcftools/bin/vcftools --vcf ../mpileup/Au_all.raw.vcf --out Au-Max4Missing --max-missing-count 4 --recode
