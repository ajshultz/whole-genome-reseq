#!/bin/bash

#SBATCH -p general
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 8000
#SBATCH -t 48:00:00
#SBATCH -J mpileup
#SBATCH -o mpileup_%j.out
#SBATCH -e mpileup_%j.err


module load centos6/samtools-0.1.19-fasrc01_gcc-4.4.7

samtools mpileup -ugDf /n/holyscratch/edwards_lab/HOFI_new/Genome/final.assembly.homo.fa ../mapping/*.clean.bam | bcftools view -cvg - > Au_all.raw.vcf 
