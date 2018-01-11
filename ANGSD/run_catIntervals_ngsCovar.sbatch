#!/bin/bash

#SBATCH -p shared
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 16000
#SBATCH -t 1-0:00:00
#SBATCH -J angsd_pca
#SBATCH -o logs_postdis/angsd_pca_%j.out
#SBATCH -e logs_postdis/angsd_pca_%j.err
#SBATCH --constraint=holyib

#Have to reload ngsTools
module load gcc/4.8.2-fasrc01 ngsTools/20170201-fasrc01

SAMPLES=$1
NIND=$2
NINTERVAL=$3
DIRECTORY=$4

sh /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/concat_PCA.sh ${SAMPLES} ${NINTERVAL} ${DIRECTORY}

N_SITES=$(zcat results_pca/${SAMPLES}_cat.mafs.gz | tail -n+2 | wc -l)
echo $N_SITES

ngsCovar -probfile results_pca/${SAMPLES}_cat.geno -outfile results_pca/${SAMPLES}.covar -nind ${NIND} -minmaf 0.05 -nsites $N_SITES