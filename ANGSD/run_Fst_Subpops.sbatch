#!/bin/bash

#SBATCH -p shared
#SBATCH -n 12
#SBATCH -N 1
#SBATCH --mem 36000
#SBATCH -t 2-0:00:00
#SBATCH -J angsd_fst
#SBATCH -o logs_postdis/angsd_fst_%A_%a.out
#SBATCH -e logs_postdis/angsd_fst_%A_%a.err
#SBATCH --constraint=holyib
#SBATCH --array=1-20

module load gcc/4.8.2-fasrc01 ngsTools/20170201-fasrc01

REF=../genome/final.assembly.homo.fa

POP1=$1
POP2=$2

#Calculate joint SFS spectrum
realSFS results_saf_merged/${POP1}_merged.saf.idx results_saf_merged/${POP2}_merged.saf.idx -P 12 > results_saf_100MB/${POP1}.${POP2}_100MB.sfs

#prepare the fst for easy window analysis etc

realSFS fst index results_saf_merged/${POP1}_merged.saf.idx results_saf_merged/${POP2}_merged.saf.idx -sfs results_saf_100MB/${POP1}.${POP2}_100MB.sfs -P 12 -fstout results_fst_subpops/${POP1}.${POP2}

#get the global estimate
realSFS fst stats results_fst_subpops/${POP1}.${POP2}.fst.idx > results_fst_subpops/${POP1}.${POP2}.global_fst

#sliding window
realSFS fst stats2 results_fst_subpops/${POP1}.${POP2}.fst.idx -win 1000 -step 1000 > results_fst_subpops/${POP1}.${POP2}.fst_1kbWin_1kbStep
