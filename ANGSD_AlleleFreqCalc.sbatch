#!/bin/bash

#SBATCH -p general
#SBATCH -n 12
#SBATCH -N 1
#SBATCH --mem 32000
#SBATCH -t 2-00:00:00
#SBATCH -J angsd
#SBATCH -o angsd_%j.out
#SBATCH -e angsd_%j.err
#SBATCH --mail-type=END
#SBATCH --mail-user=allisonjshultz@gmail.com


source new-modules.sh
module load ansd

REF=../genome/final.assembly.homo.fa

YEAR=$1

#Use SAMtools model for GL calculation, infer major/minor based on HF reference, write called genotype encoded as -1,0,1,2, and print major and minor alleles

angsd -bam Au_BAMList_${YEAR}.txt -ref ${REF} -out Au_${YEAR} -doMaf 3 -doMajorMinor 4 -GL 1 -nThreads 12