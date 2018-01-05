#!/bin/bash

#SBATCH -p shared
#SBATCH -n 12
#SBATCH -N 1
#SBATCH --mem 150000
#SBATCH -t 1-0:00:00
#SBATCH -J angsd_saf
#SBATCH -o logs_postdis/angsd_saf_%j.out
#SBATCH -e logs_postdis/angsd_saf_%j.err
#SBATCH --constraint=holyib

module load gcc/4.8.2-fasrc01 ngsTools/20170201-fasrc01

REF=../genome/final.assembly.homo.fa

SAMPLES=$1


#Will only run on specified region of interest, ideally a defined functional category.


realSFS results_saf_merged/${SAMPLES}_merged.saf.idx -P 8 > results_saf_merged/${SAMPLES}_Autosomal.sfs