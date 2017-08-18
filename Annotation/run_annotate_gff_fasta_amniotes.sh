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

maker_functional_gff maker_protevi_othersp.fa \
HF_blast_Amniotes.blastp HF.genome.gff \
> HF.genome_Amniotesfunctional.gff

maker_functional_fasta maker_protevi_othersp.fa \
HF_blast_Amniotes.blastp
HF.genome.all.maker.proteins.fasta \
> HF.genome.all.maker_Amniotesfunctional.proteins.fasta

maker_functional_fasta maker_protevi_othersp.fa \
HF_blast_Amniotes.blastp \
HF.genome.all.maker.transcripts.fasta \
> HF.genome.all.maker_Amniotesfunctional.transcripts.fasta
