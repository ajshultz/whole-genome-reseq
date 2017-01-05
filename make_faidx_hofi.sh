#!/bin/bash

#SBATCH -p general
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 8000
#SBATCH -t 1-00:00:00
#SBATCH -o faidx_%j.out
#SBATCH -e faidx_%j.err
#SBATCH --constrain=holyib

module load samtools

samtools faidx final.assembly.homo.fa
