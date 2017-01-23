#!/bin/bash

#SBATCH -p general
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 16000
#SBATCH -t 1-00:00
#SBATCH -o ./logs/realign_%j.out
#SBATCH -e ./logs/realign_%j.err
#SBATCH --constraint=holyib

SAMPLE=$1

module load java/1.8.0_45-fasrc01

java -Xmx8g -jar ~/sw/bin/GenomeAnalysisTK.jar \
-T IndelRealigner \
-R final.assembly.homo.fa \
-I ${SAMPLE}.dedup.sorted.bam \
-targetIntervals HFCCCP_indel.intervals \
-o ${SAMPLE}.realigned.bam