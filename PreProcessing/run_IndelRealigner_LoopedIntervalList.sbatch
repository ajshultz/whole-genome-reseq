#!/bin/bash

#SBATCH -p general
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 16000
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

java -Xmx8g -jar ~/sw/bin/picard.jar MergeSamFiles \
I=./interval_list_1/${SAMPLE}_1.realigned.bam \
I=./interval_list_2/${SAMPLE}_2.realigned.bam \
I=./interval_list_3/${SAMPLE}_3.realigned.bam \
I=./interval_list_4/${SAMPLE}_4.realigned.bam \
I=./interval_list_5/${SAMPLE}_5.realigned.bam \
I=./interval_list_6/${SAMPLE}_6.realigned.bam \
I=./interval_list_7/${SAMPLE}_7.realigned.bam \
I=./interval_list_8/${SAMPLE}_8.realigned.bam \
I=./interval_list_9/${SAMPLE}_9.realigned.bam \
I=./interval_list_10/${SAMPLE}_10.realigned.bam \
I=./interval_list_11/${SAMPLE}_11.realigned.bam \
I=./interval_list_12/${SAMPLE}_12.realigned.bam \
I=./interval_list_13/${SAMPLE}_13.realigned.bam \
I=./interval_list_14/${SAMPLE}_14.realigned.bam \
I=./interval_list_15/${SAMPLE}_15.realigned.bam \
I=./interval_list_16/${SAMPLE}_16.realigned.bam \
I=./interval_list_17/${SAMPLE}_17.realigned.bam \
I=./interval_list_18/${SAMPLE}_18.realigned.bam \
I=./interval_list_19/${SAMPLE}_19.realigned.bam \
I=./interval_list_20/${SAMPLE}_20.realigned.bam \
O=./merged_realigned_bams/${SAMPLE}_realigned.bam

java -Xmx8g -jar ~/sw/bin/picard.jar SortSam \
I=./merged_realigned_bams/${SAMPLE}_realigned.bam \
O=./merged_realigned_bams/${SAMPLE}_realigned.sorted.bam \
SORT_ORDER=coordinate

java -Xmx8g -jar ~/sw/bin/picard.jar BuildBamIndex \
I=./merged_realigned_bams/${SAMPLE}_realigned.sorted.bam

if [ -f ./merged_realigned_bams/${SAMPLE}_realigned.sorted.bam ]
then
  rm ./merged_realigned_bams/${SAMPLE}_realigned.bam
  for i in {1..20};
  do
  rm ./interval_list_$i/${SAMPLE}_$i.realigned.bam
  rm ./interval_list_$i/${SAMPLE}_$i.realigned.bai
  done
fi