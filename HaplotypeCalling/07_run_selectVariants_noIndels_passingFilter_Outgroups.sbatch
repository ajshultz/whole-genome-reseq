#!/bin/bash

#SBATCH -p serial_requeue
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 1000
#SBATCH -t 0-1:00
#SBATCH -J remove_filt
#SBATCH -o logs/remove_filt_%A_%a.out
#SBATCH -e logs/remove_filt_%A_%a.err
#SBATCH --constraint=holyib
#SBATCH --array=1-30


#Use user-installed version of bcftools (v. 1.6)
SPECIES=$1

bcftools view \
-f .,PASS,LowQual \
-R ../genome/bedfiles/All_HF_Whole_Genome_Include_Sites_d50.bed \
-o outgroups_filtered/${SPECIES}_FilteredSNPs_${SLURM_ARRAY_TASK_ID}.vcf.gz \
--exclude-types indels \
-O z \
outgroups_filterlabel/${SPECIES}_FilteredSNPs_${SLURM_ARRAY_TASK_ID}.vcf.gz