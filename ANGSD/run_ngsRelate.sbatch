#!/bin/bash

#SBATCH -p general
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 36000
#SBATCH -t 3-0:00:00
#SBATCH -J ngsrelate
#SBATCH -o logs/ngsrelate_%j.out
#SBATCH -e logs/ngsrelate_%j.err
#SBATCH --constraint=holyib

module load gcc/4.8.2-fasrc01 ngsTools/20170201-fasrc01

POP=$1
INDCOUNT=$2

#Extract MAF frequencies
zcat ${POP}_SNPs.mafs.gz | cut -f6 | sed 1d > ${POP}_freq

#Run ngsRelate between all individual pairs
ngsRelate -g ${POP}_SNPs.glf.gz -n ${INDCOUNT} -f ${POP}_freq >${POP}_ngsrelate.res