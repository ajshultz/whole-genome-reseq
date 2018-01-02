#!/bin/bash

#SBATCH -p shared
#SBATCH -n 12
#SBATCH -N 1
#SBATCH --mem 48000
#SBATCH -t 2-0:00:00
#SBATCH -J angsd_af_GLF
#SBATCH -o logs_postdis/angsd_af_glf_%j.out
#SBATCH -e logs_postdis/angsd_af_glf_%j.err
#SBATCH --constraint=holyib

#Use ANGSD 9.12
module load gcc/4.8.2-fasrc01 ngsTools/20170201-fasrc01

REF=../genome/final.assembly.homo.fa

SAMPLES=$1
BAMLISTDIR=$2

#Use GATK model for GL calculation, infer major/minor based on allele frequency, write called genotypes for individuals, and print major and minor alleles
#Filters are only keep unique hits, remove "bad" reads, no trimming, (didn't use filter for reads where mates could be mapped), only keep reads with a minimum mapping quality of 20, minimum base quality of 20

angsd -bam ${BAMLISTDIR}/${SAMPLES}_BamList.txt -ref $REF -uniqueOnly 1 -remove_bads 1 -trim 0 -minMapQ 20 -minQ 20 -only_proper_pairs 1 -out results_maf/${SAMPLES}_autoonly_SNPs -doMaf 3 -doMajorMinor 4 -GL 2 -doGLF 3 -nThreads 12 -sites ../genome/bedfiles/All_HF_Whole_Genome_Include_Autosomal_Sites_d50.angsdsites
