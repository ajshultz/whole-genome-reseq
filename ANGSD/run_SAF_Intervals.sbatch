#!/bin/bash

#SBATCH -p general
#SBATCH -n 8
#SBATCH -N 1
#SBATCH --mem 32000
#SBATCH -t 0-10:00:00
#SBATCH -J angsd_saf
#SBATCH -o logs/angsd_saf_%A_%a.out
#SBATCH -e logs/angsd_saf_%A_%a.err
#SBATCH --constraint=holyib
#SBATCH --array=1-20

#Using my own install of angsd v1.18

REF=../genome/final.assembly.homo.fa

SAMPLES=$1
VCFDIR=$2
SITES=$3
ANC=$4
FAI=$5
NIND=$6

#Calculate the site SFS for a genome interval, then calculate ML expectation.

angsd -vcf-gl ${VCFDIR}/${SAMPLES}.vcf.gz -fai ${FAI} -nind ${NIND} -anc ${ANC} -sites ${SITES} -nThreads 8 -out results_saf/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID} -doSaf 1 -rf split_fai_20_angsd/final.assembly.homo.fa_${SLURM_ARRAY_TASK_ID}.interval_list

realSFS results_saf/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID}.saf.idx -P 8 > ${SAMPLES}_Int${SLURM_ARRAY_TASK_ID}.sfs