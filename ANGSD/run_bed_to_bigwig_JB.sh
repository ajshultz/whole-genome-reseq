#!/bin/bash
# J Burley 
# Date: June 29 2017
# Purpose: This is part of a solution for identifying the z-chromosome sequence that may be embedded in autosomal scafs. use bedtools genomecov to output the coverage per base for each sample in bedgraph format, then convert this to a light-weight filetype, bigwig. the bw file will be viewed on the "genome browser" IGV to ID regions in certain scaffolds where coverage drops wayyy off for female samples. Easily said.

#SBATCH -p general
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 50000
#SBATCH -t 1:00:00
#SBATCH -J bam2bw_3
#SBATCH -o Logs/bam2bw_3_%j.out
#SBATCH -e Logs/bam2bw_3_%j.err

#LINKS

# bam link already exists in Data/

#VARIABLES

SAMPLE=$1

#MODULES

module load bedtools/2.17.0-fasrc01
module load ucsc/20150820-fasrc01

#COMMANDS

#first had to sort the bedfile

bedtools genomecov -i Code/BFHE336010v2_sorted.bed -ibam Data/${SAMPLE}.realigned.bam -bga > Results/BamtoBigWig/${SAMPLE}.bedGraph
# -bga asks it to output in bedgraph AND report sites with zero coverag, so, if desired, it is easy to make a list of any site that has no information for any sample.

# example of bedgraph to bigwig: http://genome.ucsc.edu/goldenPath/help/bigWig.html#Ex3

# first, need to sort the bedGraph file so that the scafs go 1,10,100,100, etc., otherwise throws up error "[file] is not case-sensitive sorted at line 48825158.  Please use "sort -k1,1 -k2,2n" with LC_COLLATE=C,  or bedSort and try again."

bedSort Results/BamtoBigWig/${SAMPLE}.bedGraph Results/BamtoBigWig/${SAMPLE}_bedsort.bedGraph
#sort -k 1,1 ${SAMPLE}_.bedGraph > ${SAMPLE}_sorted.bedGraph # these outputs still wernt compatable with bedgraphtobigwig

bedGraphToBigWig Results/BamtoBigWig/${SAMPLE}_bedsort.bedGraph Code/scaf_3504.sizes Results/BamtoBigWig/${SAMPLE}.bw

#NOTES

# unsure why the submit script didnt work...