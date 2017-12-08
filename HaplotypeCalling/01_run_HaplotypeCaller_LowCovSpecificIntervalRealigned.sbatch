#!/bin/bash

#SBATCH -p general
#SBATCH -n 2
#SBATCH -N 1
#SBATCH --mem 8000
#SBATCH -t 5-00:00
#SBATCH -J gvcf
#SBATCH -o ./logs/gvcf_%j.out
#SBATCH -e ./logs/gvcf_%j.err
#SBATCH --constraint=holyib

module load java/1.8.0_45-fasrc01

SAMPLE=$1
INTERVALNUM=$2

java -Xmx4g -XX:ParallelGCThreads=1 -jar ~/sw/bin/GenomeAnalysisTK.jar \
-T HaplotypeCaller \
-R ../genome/final.assembly.homo.fa \
-minPruning 1 \
-minDanglingBranchLength 1 \
-I ../indelrealign/merged_realigned_bams/${SAMPLE}_realigned.sorted.bam \
--emitRefConfidence GVCF \
-o interval_list_${INTERVALNUM}/${SAMPLE}_${INTERVALNUM}.raw.g.vcf \
-L split_fai_10/final.assembly.homo.fa_${INTERVALNUM}.interval_list