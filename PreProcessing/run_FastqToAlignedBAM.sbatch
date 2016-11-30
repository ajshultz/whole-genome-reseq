#!/bin/bash

#SBATCH -p general
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 4000
#SBATCH -t 0-8:00
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
module load bwa/0.7.9a-fasrc01


	
java -Xmx4G -jar ~/sw/bin/picard.jar SamToFastq \
	I=${SAMPLE}_${SAMPLEREPNUM}_markilluminaadapters.bam \
	FASTQ=/dev/stdout \
	CLIPPING_ATTRIBUTE=XT CLIPPING_ACTION=2 INTERLEAVE=true NON_PF=true \
	TMP_DIR=./tmp | \ 
bwa mem -M -t 1 -p haeMex /dev/stdin | \  
java -Xmx4G -jar ~/sw/bin/picard.jar MergeBamAlignment \
	ALIGNED_BAM=/dev/stdin \
	UNMAPPED_BAM=${SAMPLE}_${SAMPLEREPNUM}_fastqtosam.bam \ 
	OUTPUT=${SAMPLE}_${SAMPLEREPNUM}_mapped.bam \
	R=final.assembly.homo.fa CREATE_INDEX=true ADD_MATE_CIGAR=true \
	CLIP_ADAPTERS=false CLIP_OVERLAPPING_READS=true \
	INCLUDE_SECONDARY_ALIGNMENTS=true MAX_INSERTIONS_OR_DELETIONS=-1 \
	PRIMARY_ALIGNMENT_STRATEGY=MostDistant ATTRIBUTES_TO_RETAIN=XS \
	TMP_DIR=./tmp