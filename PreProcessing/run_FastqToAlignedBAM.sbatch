#!/bin/bash

#SBATCH -p general
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 10000
#SBATCH -t 0-12:00
#SBATCH -o ./logs/fastq_sam_%j.out
#SBATCH -e ./logs/fastq_sam_%j.err
#SBATCH --constraint=holyib

FASTQDIR=$1
SAMPLE=$2
BARCODE=$3
SAMPLEREPNUM=$4
FLOWCELL=$5
LANE=$6
DATE=$7

module load java/1.8.0_45-fasrc01
module load bwa/0.7.9a-fasrc01

java -Xmx8g -jar ~/sw/bin/picard.jar FastqToSam \
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
    
java -Xmx8g -jar ~/sw/bin/picard.jar MarkIlluminaAdapters \
	I=${SAMPLE}_${SAMPLEREPNUM}_fastqtosam.bam \
	O=${SAMPLE}_${SAMPLEREPNUM}_markilluminaadapters.bam \
	M=${SAMPLE}_${SAMPLEREPNUM}_markilluminaadapters_metrics.txt
	TMP_DIR=./tmp
	
java -Xmx8g -jar ~/sw/bin/picard.jar SamToFastq \
	I=${SAMPLE}_${SAMPLEREPNUM}_markilluminaadapters.bam \
	FASTQ=${SAMPLE}_${SAMPLEREPNUM}_samtofastq_interleaved.fq \
	CLIPPING_ATTRIBUTE=XT CLIPPING_ACTION=2 INTERLEAVE=true NON_PF=true \
	TMP_DIR=./tmp
 
bwa mem -M -t 1 -p haeMex ${SAMPLE}_${SAMPLEREPNUM}_samtofastq_interleaved.fq \
	> ${SAMPLE}_${SAMPLEREPNUM}_bwa_mem.sam

java -Xmx8g -jar ~/sw/bin/picard.jar MergeBamAlignment \
	ALIGNED_BAM=${SAMPLE}_${SAMPLEREPNUM}_bwa_mem.sam \
	UNMAPPED_BAM=${SAMPLE}_${SAMPLEREPNUM}_fastqtosam.bam \
	OUTPUT=${SAMPLE}_${SAMPLEREPNUM}_mergebamalign.bam \
	R=final.assembly.homo.fa CREATE_INDEX=true ADD_MATE_CIGAR=true \
	CLIP_ADAPTERS=false CLIP_OVERLAPPING_READS=true \
	INCLUDE_SECONDARY_ALIGNMENTS=true MAX_INSERTIONS_OR_DELETIONS=-1 \
	PRIMARY_ALIGNMENT_STRATEGY=MostDistant ATTRIBUTES_TO_RETAIN=XS \
	TMP_DIR=./tmp
	
if [ -f ${SAMPLE}_${SAMPLEREPNUM}_mergebamalign.bam ]
then
  rm ${SAMPLE}_${SAMPLEREPNUM}_fastqtosam.bam
  rm ${SAMPLE}_${SAMPLEREPNUM}_markilluminaadapters.bam
  rm ${SAMPLE}_${SAMPLEREPNUM}_samtofastq_interleaved.fq
  rm ${SAMPLE}_${SAMPLEREPNUM}_bwa_mem.sam
fi