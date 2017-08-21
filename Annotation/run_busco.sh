#!/bin/bash
#SBATCH -p serial_requeue
#SBATCH -n 16
#SBATCH -N 1
#SBATCH --mem 16000
#SBATCH -t 5:00:00
#SBATCH -J busco
#SBATCH -o logs/busco_%j.out
#SBATCH -e logs/busco_%j.err

#Load busco conda environment
source activate busco

#Run busco using avian lineages, and chicken augustus model
run_BUSCO.py -i ../final.assembly.homo.fa -o HF_busco_res -l aves_odb9 -m genome -c 1 -sp chicken -f -c 16