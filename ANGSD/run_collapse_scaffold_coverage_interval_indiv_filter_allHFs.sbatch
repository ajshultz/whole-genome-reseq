#!/bin/bash

#SBATCH -p serial_requeue
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 96000
#SBATCH -t 0-08:00
#SBATCH -J collapse_counts
#SBATCH -o ./logs/collapse_counts_%A_%a.out
#SBATCH -e ./logs/collapse_counts_%A_%a.err
#SBATCH --constraint=holyib
#SBATCH --array=1-19

module load python

python ../whole-genome-reseq/ANGSD/collapse_scaffold_coverage_interval_indiv_filter.py -i ./results/All_HF_Int${SLURM_ARRAY_TASK_ID}_Counts.txt -o ./results_indiv_cov/All_HF_Scaffold_Indiv_Coverage_Stats_Int${SLURM_ARRAY_TASK_ID}.txt -b ../whole-genome-reseq/BamLists/All_HF_BamList.txt -u 9.2 -l 0.5