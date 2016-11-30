#!/bin/bash

#SBATCH -p serial_requeue
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 1000
#SBATCH -t 0-0:30:00
#SBATCH -J vcf_depth
#SBATCH -o vcf_depth_%j.out
#SBATCH -e vcf_depth_%j.err

~/sw/progs/vcftools/bin/vcftools --vcf ../mpileup/Au_all.raw.vcf --out max4missingmaxvcf --depth --max-missing-count 4
