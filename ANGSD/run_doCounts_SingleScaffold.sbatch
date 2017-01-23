#!/bin/bash

#SBATCH -p general
#SBATCH -n 8
#SBATCH -N 1
#SBATCH --mem 12000
#SBATCH -t 1-00:00:00
#SBATCH -J angsd_Counts
#SBATCH -o logs/angsd_Counts_%j.out
#SBATCH -e logs/angsd_Counts_%j.err
#SBATCH --constraint=holyib

module load angsd/0.911-fasrc01

SAMPLES=$1
BAMLISTDIR=$2
MINCOV=$3
MAXCOV=$4
SCAFFOLD=$5

#Use Samtools model for GL calculation, infer major/minor based on HF reference, calculate Likelhood Ratio Tests comparing samples from different time points.

angsd -bam ${BAMLISTDIR}/${SAMPLES}_BamList.txt -out results/${SAMPLES}_Scaffold_${SCAFFOLD}_Counts.txt -uniqueOnly 1 -remove_bads 1 -trim 0 -minMapQ 20 -only_proper_pairs 0 -minQ 20 -setMinDepth ${MINCOV} -setMaxDepth ${MAXCOV} -doCounts 1 -dumpCounts 2 -nThreads 8 -r scaffold_${SCAFFOLD}:
