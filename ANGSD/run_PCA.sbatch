#!/bin/bash

#SBATCH -p general
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 64000
#SBATCH -t 1-0:00:00
#SBATCH -J angsd_pca
#SBATCH -o logs/angsd_pca_%j.out
#SBATCH -e logs/angsd_pca_%j.err
#SBATCH --constraint=holyib

#Use ANGSD 9.12
#module load gcc/4.8.2-fasrc01 ngsTools/20170201-fasrc01

REF=../genome/final.assembly.homo.fa

SAMPLES=$1
BAMLISTDIR=$2
SITES=$3
NIND=$4
NSITES=$5


#Filters are only keep unique hits, remove "bad" reads, no trimming, (didn't use filter for reads where mates could be mapped), only keep reads with a minimum mapping quality of 20 only keep sites where there are data for at least half of the individuals. Minimum base quality of 20

#angsd -bam ${BAMLISTDIR}/${SAMPLES}_BamList.txt -ref $REF -uniqueOnly 1 -remove_bads 1 -trim 0 -minMapQ 20 -minQ 20 -sites ${SITES} -only_proper_pairs 0 -nThreads 12 -out results_pca/${SAMPLES} -doCounts 1 -doMaf 1 -doMajorMinor 1 -GL 1 -skipTriallelic 1 -SNP_pval 1e-6 -doGeno 32 -doPost 1

#gunzip results_pca/${SAMPLES}.geno.gz

#For some reason this is giving me a permission denied error, so I am running on its own and feeding as a command.
#N_SITES=zcat results_pca/${SAMPLES}.mafs.gz | tail -n+2 | wc -l
#echo $N_SITES

#Have to reload ngsTools
module load ngsTools/0.615-fasrc01

ngsCovar -probfile results_pca/${SAMPLES}.geno -outfile results_pca/${SAMPLES}.covar -nind ${NIND} -nsites ${N_SITES} -call 0 -norm 0