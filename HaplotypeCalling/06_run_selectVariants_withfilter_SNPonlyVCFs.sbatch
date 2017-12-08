#!/bin/bash

#SBATCH -p general
#SBATCH -n 2
#SBATCH -N 1
#SBATCH --mem 6000
#SBATCH -t 0-12:00
#SBATCH -J selectVariants
#SBATCH -o logs/SelVar_%j.out
#SBATCH -e logs/SelVar_%j.err

module load java/1.8.0_45-fasrc01

SPECIES=$1


java -Xmx12g -XX:ParallelGCThreads=1 -jar ~/sw/bin/GenomeAnalysisTK.jar \
-T SelectVariants \
-R ../genome/final.assembly.homo.fa \
-V genotype_res/All_${SPECIES}s_Combined.vcf.gz \
-o genotype_res_filtered/All_${SPECIES}s_FilteredSNPs.vcf.gz \
-select "QD > 2.0 || MQ > 40.0 || FS < 60.0 || SOR < 3.0 || MQRankSum > -4.0 || ReadPosRankSum > -3.0" \
-selectType SNP