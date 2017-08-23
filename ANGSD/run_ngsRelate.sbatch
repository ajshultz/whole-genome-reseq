#!/bin/bash

#SBATCH -p general
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 14000
#SBATCH -t 1-0:00:00
#SBATCH -J ngsrelate
#SBATCH -o logs/ngsrelate_%j.out
#SBATCH -e logs/ngsrelate_%j.err
#SBATCH --constraint=holyib

#Now use self-installed ngsRelate
module load gcc/4.8.2-fasrc01
#module load  ngsTools/20170201-fasrc01

POP=$1
INDCOUNT=$2

#Extract MAF frequencies
#zcat results/${POP}_autoonly_SNPs.mafs.gz | cut -f6 | sed 1d > results/${POP}_autoonly_freq

#Run ngsRelate between all individual pairs
ngsRelate -g results/${POP}_autoonly_SNPs.glf.gz -n ${INDCOUNT} -f results/${POP}_autoonly_freq -m 0 -s 1 -i 100 > results/${POP}_autoonly_ngsrelate.res2