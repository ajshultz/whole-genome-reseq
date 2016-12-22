#!/bin/bash

#SBATCH -p serial_requeue
#SBATCH -n 4
#SBATCH -N 1
#SBATCH --mem 8000
#SBATCH -t 0-12:00:00
#SBATCH -J angsd_quality
#SBATCH -o angsd_quality_%j.out
#SBATCH -e angsd_quality_%j.err
#SBATCH --mail-type=END
#SBATCH --mail-user=allisonjshultz@gmail.com

source new-modules.sh
module load angsd

REF=../genome/final.assembly.homo.fa

#Output distribution of quality scores and per-site depths  (global and per-sample), with some quality filtering - only keep unique hits, remove "bad" reads, no trimming, (didn't use filter for reads where mates could be mapped), only keep reads with a minimum mapping quality of 20.

angsd -nThreads 4 -bam Au_BAMList_All.txt -ref $REF -out results/All.qc -uniqueOnly 1 -remove_bads 1 -trim 0 -minMapQ 20 -doQsDist 1 -doDepth 1 -doCounts 1 -maxDepth 1000