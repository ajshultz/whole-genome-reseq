#!/bin/bash

#SBATCH -p general
#SBATCH -n 12
#SBATCH -N 1
#SBATCH --mem 100000
#SBATCH -t 0-16:00:00
#SBATCH -J angsd
#SBATCH -o angsd_sfs_%j.out
#SBATCH -e angsd_sfs_%j.err
#SBATCH --mail-type=END
#SBATCH --mail-user=allisonjshultz@gmail.com


source new-modules.sh
module load angsd/0.911-fasrc01

REF=../genome/final.assembly.homo.fa

YEAR=$1




#Filters are only keep unique hits, remove "bad" reads, no trimming, (didn't use filter for reads where mates could be mapped), only keep reads with a minimum mapping quality of 20, minimum read depth of 30 and maximum of 100 (based on the distribution), only keep sites where there are data for at least half of the individuals. Minimum base quality of 20

#1) Calculate "global estimate" of the SFS
#angsd -bam Au_BAMList_${YEAR}.txt -anc $REF -uniqueOnly 1 -remove_bads 1 -trim 0 -minMapQ 20 -minQ 20 -minInd 4 -setMinDepth 30 -setMaxDepth 100 -out results/Au_${YEAR} -nThreads 12 -GL 1 -doSaf 1

# Obtain the ML estimate of the SFS
realSFS results/Au_${YEAR}.saf.idx -P 12 > results/Au_${YEAR}.sfs

#2) Calculate theta for each site
angsd -bam Au_BAMList_${YEAR}.txt -anc $REF -uniqueOnly 1 -remove_bads 1 -trim 0 -minMapQ 20 -minQ 20 -minInd 4 -setMinDepth 30 -setMaxDepth 100 -out results/Au_${YEAR} -nThreads 12 -GL 1 -doThetas 1 -doSaf 1 -pest results/Au_${YEAR}.sfs

#3) Estimate Tajima's D and other statistics for each site
thetaStat make_bed results/Au_${YEAR}.thetas.gz
thetaStat do_stat results/Au_${YEAR}.thetas.gz 

