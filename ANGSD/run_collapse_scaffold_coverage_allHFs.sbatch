#!/bin/bash

#SBATCH -p general
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 16000
#SBATCH -t 1-00:00
#SBATCH -J collapse_counts
#SBATCH -o ./logs/collapse_counts_%j.out
#SBATCH -e ./logs/collapse_counts_%j.err
#SBATCH --constraint=holyib

module load python

python ../../whole-genome-reseq/ANGSD/collapse_scaffold_coverage.py -d . -o All_HF_Scaffold_Coverage_Stats.txt