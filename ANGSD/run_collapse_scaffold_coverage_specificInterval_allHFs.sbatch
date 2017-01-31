#!/bin/bash

#SBATCH -p general
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 16000
#SBATCH -t 0-08:00
#SBATCH -J collapse_counts
#SBATCH -o ./logs/collapse_counts_%A_%a.out
#SBATCH -e ./logs/collapse_counts_%A_%a.err
#SBATCH --constraint=holyib
#SBATCH --array=1-19

module load python

python ../../whole-genome-reseq/ANGSD/collapse_scaffold_coverage_specificInterval.py -i ./results/All_HF_Int${SLURM_ARRAY_TASK_ID}_Counts.txt.pos.gz -o All_HF_Scaffold_Coverage_Stats_Int${SLURM_ARRAY_TASK_ID}.txt