#!/bin/bash

#SBATCH -p general
#SBATCH -n 24
#SBATCH -N 1
#SBATCH --mem 256000
#SBATCH -t 5-00:00:00
#SBATCH -J angsd
#SBATCH -o angsd_fst_%j.out
#SBATCH -e angsd_fst_%j.err
#SBATCH --mail-type=END
#SBATCH --mail-user=allisonjshultz@gmail.com


source new-modules.sh
module load angsd/0.911-fasrc01

REF=../genome/final.assembly.homo.fa



#Filters are only keep unique hits, remove "bad" reads, no trimming, (didn't use filter for reads where mates could be mapped), only keep reads with a minimum mapping quality of 20, minimum read depth of 30 and maximum of 100 (based on the distribution), only keep sites where there are data for at least half of the individuals. Minimum base quality of 20

#1) Calculate "global estimate" of the SFS for each year
#angsd -bam Au_BAMList_95.txt -anc $REF -uniqueOnly 1 -remove_bads 1 -trim 0 -minMapQ 20 -minQ 20 -minInd 4 -setMinDepth 30 -setMaxDepth 100 -out results/Au_95 -nThreads 16 -GL 1 -doSaf 1
#angsd -bam Au_BAMList_01.txt -anc $REF -uniqueOnly 1 -remove_bads 1 -trim 0 -minMapQ 20 -minQ 20 -minInd 4 -setMinDepth 30 -setMaxDepth 100 -out results/Au_01 -nThreads 16 -GL 1 -doSaf 1
#angsd -bam Au_BAMList_14.txt -anc $REF -uniqueOnly 1 -remove_bads 1 -trim 0 -minMapQ 20 -minQ 20 -minInd 4 -setMinDepth 30 -setMaxDepth 100 -out results/Au_14 -nThreads 16 -GL 1 -doSaf 1

# Obtain the pairwise population 2dsfs
realSFS results/Au_95.saf.idx results/Au_01.saf.idx -P 24 > results/Au_95.01.sfs.ml


#Prepare fst for analysis and get global estimates
realSFS fst index results/Au_95.saf.idx results/Au_01.saf.idx -sfs results/Au_95.01.sfs.ml -fstout results/Au_95.01_fst

#Do sliding window ever 1kb, with step intervals of 200 bp
realSFS fst stats2 results/Au_95.01_fst.fst.idx -win 1000 -step 200 > Au_95.01_Fst_SlidingWindow

