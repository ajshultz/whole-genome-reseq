#!/bin/bash

#SBATCH -p general
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 12000
#SBATCH -t 1-00:00
#SBATCH -o ./logs/realign_%j.out
#SBATCH -e ./logs/realign_%j.err
#SBATCH --constrain=holyib

SAMPLE=$1

module load java/1.8.0_45-fasrc01

for i in {1..20};

do

java -Xmx8g -jar ~/sw/bin/GenomeAnalysisTK.jar \
-T IndelRealigner \
-R ../genome/final.assembly.homo.fa \
-I ../preprocess/${SAMPLE}.dedup.sorted.bam \
-targetIntervals ./interval_list_$i/HFCCCP_indel_$i.intervals \
-L split_fai/final.assembly.homo.fa_$i.interval_list \
-o ./interval_list_$i/${SAMPLE}_$i.realigned.bam

done