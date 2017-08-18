#!/bin/bash

#SBATCH -p serial_requeue
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 6000
#SBATCH -t 0-05:00:00
#SBATCH -J blast_gffannotation
#SBATCH -o blast_gffannotation_%j.out
#SBATCH -e blast_gffannotation_%j.err
#SBATCH --constraint=holyib

module load gcc/5.2.0-fasrc02 openmpi/2.0.1-fasrc01 maker/2.31.8-fasrc01

maker_functional_gff GCF_000247815.1_FicAlb1.5_protein.faa \
HF_blast_FA.blastp HF.genome.gff \
> HF.genome_FAfunctional.gff

maker_functional_fasta GCF_000247815.1_FicAlb1.5_protein.faa \
HF_blast_FA.blastp
HF.genome.all.maker.proteins.fasta \
> HF.genome.all.maker_FAfunctional.proteins.fasta

maker_functional_fasta GCF_000247815.1_FicAlb1.5_protein.faa \
HF_blast_FA.blastp \
HF.genome.all.maker.transcripts.fasta \
> HF.genome.all.maker_FAfunctional.transcripts.fasta
