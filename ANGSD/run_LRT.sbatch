#!/bin/bash

#SBATCH -p general
#SBATCH -n 12
#SBATCH -N 1
#SBATCH --mem 48000
#SBATCH -t 3-00:00:00
#SBATCH -J angsd_LRT
#SBATCH -o logs/angsd_LRT_%j.out
#SBATCH -e logs/angsd_LRT_%j.err
#SBATCH --constrain=holyib

module load angsd/0.911-fasrc01

REF=../genome/final.assembly.homo.fa

SAMPLES=$1
BAMLISTDIR=$2

#Use SAMtools model for GL calculation, infer major/minor based on HF reference, calculate Likelhood Ratio Tests comparing samples from different time points.

angsd -bam ${BAMLISTDIR}/${SAMPLES}_BamList.txt -ref ${REF} -out results/LRT_${SAMPLES} -uniqueOnly 1 -remove_bads 1 -trim 0 -minMapQ 20 -only_proper_pairs 0 -minQ 20 -minInd 20  -doMaf 2 -doMajorMinor 4 -GL 1 -nThreads 12 -ybin ${BAMLISTDIR}/${SAMPLES}_yBin.txt -doAsso 1 -SNP_pval 1e-6 -minMaf 0.10

