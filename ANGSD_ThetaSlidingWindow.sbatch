#!/bin/bash

#SBATCH -p general
#SBATCH -n 12
#SBATCH -N 1
#SBATCH --mem 16000
#SBATCH -t 0-24:00:00
#SBATCH -J angsd
#SBATCH -o angsd_theta_%j.out
#SBATCH -e angsd_theta_%j.err
#SBATCH --mail-type=END
#SBATCH --mail-user=allisonjshultz@gmail.com


source new-modules.sh
module load angsd/0.911-fasrc01

REF=../genome/final.assembly.homo.fa

YEAR=$1

#3) Estimate Tajima's D and other statistics for a sliding window
thetaStat do_stat results/Au_${YEAR}.thetas.gz -win 1000 -step 200 -outnames results/Au_${YEAR}.theta.thetasWindow_1kb.gz -nChr 6970