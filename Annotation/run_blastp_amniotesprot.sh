#!/bin/bash

#SBATCH -p serial_requeue
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 6000
#SBATCH -t 0-05:00:00
#SBATCH -J blast_makerprot
#SBATCH -o blast_makerprot_%j.out
#SBATCH -e blast_makerprot_%j.err
#SBATCH --constraint=holyib

module load blast

blastp -db maker_protevi_othersp.fa -input_type fasta -dbtype prot -query HF.genome.all.maker.proteins.fasta -out HF_blast_Amniotes.blastp -evalue 0.000001 -outfmt 6 -num_alignments 1 -seg yes -soft_masking true -lcase_masking -max_hsps 1
