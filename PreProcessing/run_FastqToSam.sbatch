#!/bin/bash

#SBATCH -p general
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 4000
#SBATCH -t 0:05:00
#SBATCH -o ./logs/fastq_sam_%j.out
#SBATCH -e ./logs/fastq_sam_%j.err
#SBATCH --constrain holyib

FASTQDIR=$1
IND=$2
BARCODE=$3
INDREPNUM=$4
FLOWCELL=$5
LANE=$6
DATE=$7

module load java/1.8.0_45-fasrc01

echo $IND

echo $FASTQDIR/$IND_$BARCODE.R1.fastq.gz

echo java -Xmx4g -jar ~/sw/bin/picard.jar FastqToSam \
    FASTQ=$FASTQDIR/$IND_$BARCODE.R1.fastq.gz \
    FASTQ2=$FASTQDIR/$IND_$BARCODE.R2.fastq.gz \
    OUTPUT=$IND_$INDREPNUM_fastqtosam.bam \
    READ_GROUP_NAME=$FLOWCELL.$LANE \
    SAMPLE_NAME=$IND \
    LIBRARY_NAME=$IND \
    PLATFORM_UNIT=$FLOWCELL.$LANE.$IND \
    PLATFORM=ILLUMINA \
    SEQUENCING_CENTER=BAUER \
    RUN_DATE=$DATE
    