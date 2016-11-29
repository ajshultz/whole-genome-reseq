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
IND=$2
BARCODE=$3
INDREPNUM=$4
FLOWCELL=$5
LANE=$6
DATE=$7

module load java/1.8.0_45-fasrc01

java -Xmx4g -jar ~/sw/bin/picard.jar FastqToSam \
    FASTQ=$FASTQDIR/$IND_$BARCODE.R1.fastq.gz \ #first read file of pair
    FASTQ2=$FASTQDIR/$IND_$BARCODE.R2.fastq.gz \ #second read file of pair
    OUTPUT=$IND_$INDREPNUM_fastqtosam.bam \
    READ_GROUP_NAME=$FLOWCELL.$LANE \ #required; changed from default of A
    SAMPLE_NAME=$IND \ #required
    LIBRARY_NAME=$IND \ #required 
    PLATFORM_UNIT=$FLOWCELL.$LANE.$IND \
    PLATFORM=ILLUMINA \
    SEQUENCING_CENTER=BAUER \
    RUN_DATE=$DATET00:00:00-0400