#!/bin/bash

#SBATCH -p serial_requeue
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 6000
#SBATCH -t 0-05:00:00
#SBATCH -J blast_ggprot
#SBATCH -o blast_ggprot_%j.out
#SBATCH -e blast_ggprot_%j.err
#SBATCH --constraint=holyib

module load blast

blastp -db  GCF_000002315.4_Gallus_gallus-5.0_protein.faa -query HF.genome.all.maker.proteins.fasta -out HF_blast_GG.blastp -evalue 0.000001 -outfmt 6 -num_alignments 1 -seg yes -soft_masking true -lcase_masking -max_hsps 1