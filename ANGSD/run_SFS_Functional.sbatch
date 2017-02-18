#!/bin/bash

#SBATCH -p general
#SBATCH -n 8
#SBATCH -N 1
#SBATCH --mem 30000
#SBATCH -t 0-8:00:00
#SBATCH -J angsd_saf
#SBATCH -o logs/angsd_saf_%j.out
#SBATCH -e logs/angsd_saf_%j.err
#SBATCH --constraint=holyib

module load angsd/0.911-fasrc01

REF=../genome/final.assembly.homo.fa

SAMPLES=$1
SITES=$2
FUNCTION=$3



#Will only run on specified region of interest, ideally a defined functional category.


realSFS results_saf/${SAMPLES}_merged.saf.idx -P 8 -sites ${SITES} > results_saf_function/${SAMPLES}_${FUNCTION}.sfs