#!/bin/bash

#SBATCH -p general
#SBATCH -n 8
#SBATCH -N 1
#SBATCH --mem 30000
#SBATCH -t 0-8:00:00
#SBATCH -J angsd_saf
#SBATCH -o logs/angsd_saf_%j.out
#SBATCH -e logs/angsd_saf_%j.err
#SBATCH --constraint=holyib

module load angsd/0.911-fasrc01

REF=../genome/final.assembly.homo.fa

SAMPLES=$1
BAMLISTDIR=$2
SITES=$3
ANC=$4


#Filters are only keep unique hits, remove "bad" reads, no trimming, (didn't use filter for reads where mates could be mapped), only keep reads with a minimum mapping quality of 20 only keep sites where there are data for at least half of the individuals. Minimum base quality of 20

#Will only run on specified region of interest.

angsd -bam ${BAMLISTDIR}/${SAMPLES}_BamList.txt -anc ${ANC} -uniqueOnly 1 -remove_bads 1 -trim 0 -minMapQ 20 -minQ 20 -sites ${SITES} -only_proper_pairs 0 -nThreads 8 -out results_saf_subpops/${SAMPLES}_ZChr -doSaf 1 -GL 1 -skipTriallelic 1 -rf z_chr_cov_scaffs.angsdrf

realSFS results_saf_subpops/${SAMPLES}_ZChr.saf.idx -P 8 > results_saf_subpops/${SAMPLES}_ZChr.sfs