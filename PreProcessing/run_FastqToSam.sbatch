#!/bin/bash

#SBATCH -p general
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 4000
#SBATCH -t 4:00:00
#SBATCH -o ./logs/fastq_sam_%j.out
#SBATCH -e ./logs/fastq_sam_%j.err
#SBATCH --constrain holyib

FASTQDIR=$1
SAMPLE=$2
BARCODE=$3
SAMPLEREPNUM=$4
FLOWCELL=$5
LANE=$6
DATE=$7

module load java/1.8.0_45-fasrc01

java -Xmx4g -jar ~/sw/bin/picard.jar FastqToSam \
    FASTQ=${FASTQDIR}/${SAMPLE}_${BARCODE}.R1.fastq.gz \
    FASTQ2=${FASTQDIR}/${SAMPLE}_${BARCODE}.R2.fastq.gz \
    OUTPUT=${SAMPLE}_${SAMPLEREPNUM}_fastqtosam.bam \
    READ_GROUP_NAME=${FLOWCELL}.${LANE} \
    SAMPLE_NAME=${SAMPLE} \
    LIBRARY_NAME=${SAMPLE} \
    PLATFORM_UNIT=${FLOWCELL}.${LANE}.${SAMPLE} \
    PLATFORM=ILLUMINA \
    SEQUENCING_CENTER=BAUER \
    RUN_DATE=${DATE}
    