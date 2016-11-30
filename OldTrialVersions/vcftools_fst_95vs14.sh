#!/bin/bash

#SBATCH -p serial_requeue
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 4000
#SBATCH -t 0-2:00:00
#SBATCH -J vcf_fst
#SBATCH -o vcf_fst_%j.out
#SBATCH -e vcf_fst_%j.err

~/sw/progs/vcftools/bin/vcftools --vcf Au-Max4Missing.recode.vcf --weir-fst-pop poplist_95.txt --weir-fst-pop poplist_14.txt --out fst_1kb_95vs14 --fst-window-size	1000
