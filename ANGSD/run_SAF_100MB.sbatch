#!/bin/bash

#SBATCH -p shared
#SBATCH -n 8
#SBATCH -N 1
#SBATCH --mem 24000
#SBATCH -t 1-0:00:00
#SBATCH -J angsd_saf
#SBATCH -o logs_postdis/angsd_saf_%j.out
#SBATCH -e logs_postdis/angsd_saf_%j.err
#SBATCH --constraint=holyib


#Use ANGSD 9.12
module load gcc/4.8.2-fasrc01 ngsTools/20170201-fasrc01

REF=../genome/final.assembly.homo.fa

SAMPLES=$1
BAMLISTDIR=$2
SITES=$3
ANC=$4


#Filters are only keep unique hits, remove "bad" reads, no trimming, only keep reads with a minimum mapping quality of 20 only keep sites where there are data for at least half of the individuals. Minimum base quality of 20

angsd -bam ${BAMLISTDIR}/${SAMPLES}_BamList.txt -anc ${ANC} -uniqueOnly 1 -remove_bads 1 -trim 0 -minMapQ 20 -minQ 20 -sites ${SITES} -only_proper_pairs 1 -nThreads 8 -out results_saf_100MB/${SAMPLES}_100MB -doSaf 1 -GL 2 -skipTriallelic 1

#realSFS results_saf/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID}.saf.idx -P 8 > results_sfs/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID}.sfs