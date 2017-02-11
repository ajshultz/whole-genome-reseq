#!/bin/bash

#SBATCH -p general
#SBATCH -n 8
#SBATCH -N 1
#SBATCH --mem 16000
#SBATCH -t 1-0:00:00
#SBATCH -J angsd_saf_merge
#SBATCH -o logs/angsd_saf_merge_%j.out
#SBATCH -e logs/angsd_saf_merge_%j.err
#SBATCH --constraint=holyib

module load angsd/0.911-fasrc01

SAMPLES=$1

realSFS cat results_saf/${SAMPLES}* -P 8 -outnames ${SAMPLES}_merged