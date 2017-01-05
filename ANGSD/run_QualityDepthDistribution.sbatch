#!/bin/bash

#SBATCH -p general
#SBATCH -n 8
#SBATCH -N 1
#SBATCH --mem 12000
#SBATCH -t 2-0:00
#SBATCH -J angsd_quality
#SBATCH -o angsd_quality_%j.out
#SBATCH -e angsd_quality_%j.err
#SBATCH --constrain=holyib

source new-modules.sh
module load angsd

SAMPLES=$1
BAMLISTDIR=$2
MAXDEPTH=$3
REF=../genome/final.assembly.homo.fa

#Output distribution of quality scores and per-site depths  (global and per-sample), with some quality filtering - only keep unique hits, remove "bad" reads, no trimming, (didn't use filter for reads where mates could be mapped because many reads may span different scaffolds due to fragmented nature of reference), only keep reads with a minimum mapping quality of 20.

angsd -nThreads 8 -bam ${BAMLISTDIR}/${SAMPLES}_BamList.txt -ref ${REF} -out results/${SAMPLES}.qc -uniqueOnly 1 -remove_bads 1 -trim 0 -minMapQ 20 -only_proper_pairs 0 -doQsDist 1 -doDepth 1 -doCounts 1 -maxDepth ${MAXDEPTH}