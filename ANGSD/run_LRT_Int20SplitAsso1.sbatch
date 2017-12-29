#!/bin/bash

#SBATCH -p shared
#SBATCH -n 6
#SBATCH -N 1
#SBATCH --mem 24000
#SBATCH -t 1-00:00:00
#SBATCH -J angsd_LRT_20
#SBATCH -o logs_postdis/angsd_LRT_%A_%a.out
#SBATCH -e logs_postdis/angsd_LRT_%A_%a.err
#SBATCH --constraint=holyib
#SBATCH --array=0-30

module load gcc/4.8.2-fasrc01 ngsTools/20170201-fasrc01

REF=../genome/final.assembly.homo.fa

SAMPLES=$1
BAMLISTDIR=$2
SITES=$3


#Use Samtools model for GL calculation, infer major/minor based on HF reference, calculate Likelhood Ratio Tests comparing samples from different time points.

angsd -bam ${BAMLISTDIR}/${SAMPLES}_BamList.txt -ref ${REF} -out results_LRTInt_Asso1_GL2/${SAMPLES}_20_${SLURM_ARRAY_TASK_ID} -uniqueOnly 1 -remove_bads 1 -trim 0 -minMapQ 20 -only_proper_pairs 1 -minQ 20 -sites ${SITES} -doMaf 3 -doMajorMinor 1 -GL 2 -nThreads 6 -ybin ${BAMLISTDIR}/${SAMPLES}_yBin.txt -doAsso 1 -SNP_pval 1e-6 -minMaf 0.10 -rf split_fai_int20_angsd/final.assembly.homo.fa_20_${SLURM_ARRAY_TASK_ID} 
