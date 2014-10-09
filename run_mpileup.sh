#!/bin/bash

#SBATCH -p general
#SBATCH -n 2
#SBATCH -N 1
#SBATCH --mem 16000
#SBATCH -t 7-00:00:00
#SBATCH -J mpileup
#SBATCH -o mpileup_%j.out
#SBATCH -e mpileup_%j.err

source new-modules.sh
module load samtools
module load bcftools

samtools mpileup -ug -t D -f /n/regal/edwards_lab/hofi/Genome/final.assembly.homo.fa ../mapping/*.clean.bam | bcftools call -vmO z - > Au_all.raw.vcf 
