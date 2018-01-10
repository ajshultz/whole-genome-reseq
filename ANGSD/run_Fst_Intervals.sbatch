#!/bin/bash

#SBATCH -p shared
#SBATCH -n 12
#SBATCH -N 1
#SBATCH --mem 16000
#SBATCH -t 0-8:00:00
#SBATCH -J angsd_fst
#SBATCH -o logs_postdis/angsd_fst_%A_%a.out
#SBATCH -e logs_postdis/angsd_fst_%A_%a.err
#SBATCH --constraint=holyib
#SBATCH --array=1-20

module load gcc/4.8.2-fasrc01 ngsTools/20170201-fasrc01

REF=../genome/final.assembly.homo.fa

POP1=$1
POP2=$2
SFS=$3

#prepare the fst for easy window analysis etc

realSFS fst index results_saf/${POP1}_Int${SLURM_ARRAY_TASK_ID}.saf.idx results_saf/${POP2}_Int${SLURM_ARRAY_TASK_ID}.saf.idx -sfs ${SFS} -P 8 -fstout results_fst/${POP1}.${POP2}_Int${SLURM_ARRAY_TASK_ID}

#get the global estimate
realSFS fst stats results_fst/${POP1}.${POP2}_Int${SLURM_ARRAY_TASK_ID}.fst.idx > results_fst/${POP1}.${POP2}_Int${SLURM_ARRAY_TASK_ID}.global_fst

#sliding window
realSFS fst stats2 results_fst/${POP1}.${POP2}_Int${SLURM_ARRAY_TASK_ID}.fst.idx -win 1000 -step 1000 > results_fst/${POP1}.${POP2}_Int${SLURM_ARRAY_TASK_ID}.fst_1kbWin_1kbStep
realSFS fst stats2 results_fst/${POP1}.${POP2}_Int${SLURM_ARRAY_TASK_ID}.fst.idx -win 2500 -step 500 > results_fst/${POP1}.${POP2}_Int${SLURM_ARRAY_TASK_ID}.fst_2.5kbWin_.5kbStep