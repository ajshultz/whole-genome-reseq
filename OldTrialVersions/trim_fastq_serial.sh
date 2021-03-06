#!/bin/bash

#SBATCH -p serial_requeue
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 8000
#SBATCH -t 1:00:00
#SBATCH -J serialtrimFastq
#SBATCH -o trim_%j.out
#SBATCH -e trim_%j.err

#trims Illumina adaptors from paired-end sequencing using Trimmomatic
#may need to adjust parameters for specific circumstances
#requires Trimmomatic 0.32 or greater
#requires all fastq files to be trimmed to use the same adaptor file and be in the same directory

#this is based on a local install of Trimmomatc; change $TRIMPATH as necessary

TRIMPATH=~/sw/bin/Trimmomatic-0.32/trimmomatic-0.32.jar

#make adapter file; assumes that all fastq files to be trimmed use the same adaptor sequence
#note that this current file merges nextera and other adapters which should be okay but may not be ideal for final processing
#nextera sequences are derived from files distributed with Trimmomatic but look correct
if [ ! -s adapters.fa ]
then
	echo -e ">PrefixPE/1\nAATGATACGGCGACCACCGAGATCTACACTCTTTCCCTACACGACGCTCTTCCGATCT\n>PrefixPE/2\nGATCGGAAGAGCACACGTCTGAACTCCAGTCAC" > adapters.fa #Apollo
fi

#specify the name of the first pair as the first argument on the command line and the base name for the output as the second argument

INFILE=$1
OUTFILE=$2

java -jar $TRIMPATH PE -threads 1 -basein $INFILE -baseout $OUTFILE ILLUMINACLIP:adapters.fa:2:30:10:1:true
