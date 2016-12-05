#!/bin/bash

#SBATCH -p general
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 16000
#SBATCH -t 1-00:00
#SBATCH -o ./logs/sort_index_sum_%j.out
#SBATCH -e ./logs/sort_index_sum_%j.err
#SBATCH --constrain holyib

SAMPLE=$1

module load java/1.8.0_45-fasrc01

java -Xmx8g -jar ~/sw/bin/picard.jar SortSam \
I=${SAMPLE}.dedup.bam \
O=${SAMPLE}.dedup.sorted.bam \
SORT_ORDER=coordinate

java -Xmx8g -jar ~/sw/bin/picard.jar BuildBamIndex \
I=${SAMPLE}.dedup.sorted.bam

java -Xmx8g -jar ~/sw/bin/picard.jar CollectAlignmentSummaryMetrics \
I=${SAMPLE}.dedup.sorted.bam \
R=final.assembly.homo.fa \
METRIC_ACCUMULATION_LEVEL=SAMPLE \
METRIC_ACCUMULATION_LEVEL=READ_GROUP \
O=${SAMPLE}.alignment_metrics.txt

java -Xmx8g -jar ~/sw/bin/picard.jar ValidateSamFile \
I=${SAMPLE}.dedup.sorted.bam \
O=${SAMPLE}.validate.txt MODE=SUMMARY
