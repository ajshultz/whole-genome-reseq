#!/bin/bash

#SBATCH -p general
#SBATCH -n 12
#SBATCH -N 1
#SBATCH --mem 36000
#SBATCH -t 2-0:00:00
#SBATCH -J angsd_af_GLF
#SBATCH -o logs/angsd_af_glf_%j.out
#SBATCH -e logs/angsd_af_glf_%j.err
#SBATCH --constraint=holyib

module load angsd/0.911-fasrc01

REF=../genome/final.assembly.homo.fa

SAMPLES=$1
BAMLISTDIR=$2

#Use GATK model for GL calculation, infer major/minor based on allele frequency, write called genotypes for individuals, and print major and minor alleles
#Filters are only keep unique hits, remove "bad" reads, no trimming, (didn't use filter for reads where mates could be mapped), only keep reads with a minimum mapping quality of 20, minimum read depth of 16 and maximum of 70 (based on the expectations of each specific time period and locality), only keep sites where there are data for at least half of the individuals in Auburn samples (should be relevant for other localities as well. Minimum base quality of 20

angsd -bam ${BAMLISTDIR}/${SAMPLES}_BamList.txt -ref $REF -uniqueOnly 1 -remove_bads 1 -trim 0 -minMapQ 20 -minQ 20 -minInd 4 -setMinDepth 16 -setMaxDepth 70 -only_proper_pairs 0 -out results/${SAMPLES}_autoonly_SNPs -doMaf 1 -doMajorMinor 1 -GL 2 -doGLF 3 -snp_pval 1e-6 -nThreads 12 -minmaf 0.05 -sites ../genome/bedfiles/All_HF_Whole_Genome_Include_Autosomal_Sites_d50.angsdsites
