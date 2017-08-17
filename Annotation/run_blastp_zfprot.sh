#!/bin/bash

#SBATCH -p serial_requeue
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 6000
#SBATCH -t 0-05:00:00
#SBATCH -J blast_zfprot
#SBATCH -o blast_zfprot_%j.out
#SBATCH -e blast_zfprot_%j.err
#SBATCH --constraint=holyib

module load blast

blastp -db  GCF_000151805.1_Taeniopygia_guttata-3.2.4_protein.faa -query HF.genome.all.maker.proteins.fasta -out HF_blast_ZF.blastp -evalue 0.000001 -outfmt 6 -num_alignments 1 -seg yes -soft_masking true -lcase_masking -max_hsps 1