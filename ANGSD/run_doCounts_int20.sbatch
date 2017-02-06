#!/bin/bash

#SBATCH -p general
#SBATCH -n 12
#SBATCH -N 1
#SBATCH --mem 36000
#SBATCH -t 1-00:00:00
#SBATCH -J angsd_doCounts
#SBATCH -o logs/angsd_doCounts20_%A_%a.out
#SBATCH -e logs/angsd_doCounts20_%A_%a.err
#SBATCH --constraint=holyib
#SBATCH --array=0-30

module load angsd/0.911-fasrc01

REF=../genome/final.assembly.homo.fa

SAMPLES=$1
BAMLISTDIR=$2

#Use SamTools model for GL calculation, infer major/minor based on HF reference, calculate Likelhood Ratio Tests comparing samples from different time points.

angsd -bam ${BAMLISTDIR}/${SAMPLES}_BamList.txt -out results/${SAMPLES}_Int20_${SLURM_ARRAY_TASK_ID}_Counts.txt -uniqueOnly 1 -remove_bads 1 -trim 0 -minMapQ 20 -only_proper_pairs 0 -minQ 20 -doCounts 1 -dumpCounts 2 -nThreads 12 -rf split_fai_int20_angsd/final.assembly.homo.fa_20_${SLURM_ARRAY_TASK_ID} 
