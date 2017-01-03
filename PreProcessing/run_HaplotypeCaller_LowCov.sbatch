#!/bin/bash

#SBATCH -p general
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 20000
#SBATCH -t 7-00:00
#SBATCH -o ./logs/createvcfs_%j.out
#SBATCH -e ./logs/createvcfs_%j.err
#SBATCH --constrain=holyib

module load java/1.8.0_45-fasrc01

SAMPLE=$1

java -Xmx16g -jar ~/sw/bin/GenomeAnalysisTK.jar \
-T HaplotypeCaller \
-R ../genome/final.assembly.homo.fa \
-minPruning 1 \
-minDanglingBranchLength 1 \
-I ../preprocess/${SAMPLE}.dedup.sorted.bam \
--emitRefConfidence GVCF \
-o ${SAMPLE}.raw.g.vcf
