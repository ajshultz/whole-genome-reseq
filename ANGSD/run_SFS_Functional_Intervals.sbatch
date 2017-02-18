#!/bin/bash

#SBATCH -p general
#SBATCH -n 8
#SBATCH -N 1
#SBATCH --mem 30000
#SBATCH -t 0-5:00:00
#SBATCH -J angsd_saf
#SBATCH -o logs/angsd_saf_%A_%a.out
#SBATCH -e logs/angsd_saf_%A_%a.err
#SBATCH --constraint=holyib
#SBATCH --array=1-20

module load angsd/0.911-fasrc01

REF=../genome/final.assembly.homo.fa

SAMPLES=$1
SITES=$2
FUNCTION=$3

#Will only run on specified region of interest, ideally a defined functional category.


realSFS results_saf/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID}.saf.idx -P 8 -sites ${SITES} > results_saf_function/${SAMPLES}_${FUNCTION}_Int${SLURM_ARRAY_TASK_ID}.sfs