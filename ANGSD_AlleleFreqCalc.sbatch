#!/bin/bash

#SBATCH -p general
#SBATCH -n 12
#SBATCH -N 1
#SBATCH --mem 12000
#SBATCH -t 2-00:00:00
#SBATCH -J angsd
#SBATCH -o angsd_af_%j.out
#SBATCH -e angsd_af_%j.err
#SBATCH --mail-type=END
#SBATCH --mail-user=allisonjshultz@gmail.com


source new-modules.sh
module load angsd/0.911-fasrc01

REF=../genome/final.assembly.homo.fa

YEAR=$1

#Use SAMtools model for GL calculation, infer major/minor based on HF reference, write called genotype encoded as -1,0,1,2, and print major and minor alleles
#Filters are only keep unique hits, remove "bad" reads, no trimming, (didn't use filter for reads where mates could be mapped), only keep reads with a minimum mapping quality of 20, minimum read depth of 30 and maximum of 100 (based on the distribution), only keep sites where there are data for at least half of the individuals. Minimum base quality of 20

angsd -bam Au_BAMList_${YEAR}.txt -ref $REF -uniqueOnly 1 -remove_bads 1 -trim 0 -minMapQ 20 -minQ 20 -minInd 4 -setMinDepth 30 -setMaxDepth 100 -out results/Au_${YEAR} -doMaf 3 -doMajorMinor 4 -GL 1 -nThreads 12