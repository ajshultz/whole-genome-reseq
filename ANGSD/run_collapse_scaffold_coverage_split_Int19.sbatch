#!/bin/bash

#SBATCH -p serial_requeue
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 8000
#SBATCH -t 0-02:00
#SBATCH -J collapse_counts
#SBATCH -o ./logs/split_int19_%j.out
#SBATCH -e ./logs/split_int19_%j.err
#SBATCH --constraint=holyib

module load python

python ../whole-genome-reseq/ANGSD/collapse_scaffold_coverage_split_Int19.py -i ind_count_results_int19/All_HF_Int19_Counts.txt -o ind_count_results_int19/All_HF_Int19