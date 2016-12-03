#!/bin/bash

#SBATCH -p general
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 16000
#SBATCH -t 2-00:00
#SBATCH -o ./logs/dedup_%j.out
#SBATCH -e ./logs/dedup_%j.err
#SBATCH --constrain holyib

SAMPLE=$1

module load java/1.8.0_45-fasrc01

java -Xmx8g -jar ~/sw/bin/picard.jar MarkDuplicates TMP_DIR=tmp \
I=${SAMPLE}_1_mergebamalign.bam \
I=${SAMPLE}_2_mergebamalign.bam \
O=${SAMPLE}.dedup.bam METRICS_FILE=${SAMPLE}.dedup.metrics.txt \
REMOVE_DUPLICATES=true TAGGING_POLICY=All