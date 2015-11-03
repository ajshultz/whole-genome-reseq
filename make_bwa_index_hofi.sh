#!/bin/bash

#SBATCH -p serial_requeue
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 8000
#SBATCH -t 4:00:00
#SBATCH -J bwa_index
#SBATCH -o bwa_index_%j.out
#SBATCH -e bwa_index_%j.err

source new-modules.sh
module load bwa

bwa index -p haeMex final.assembly.homo.fa
