#!/bin/bash

#SBATCH -p general
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 24000
#SBATCH -t 1-00:00:00
#SBATCH -J angsd_lrt_plot
#SBATCH -o logs/angsd_lrt_plot_%j.out
#SBATCH -e logs/angsd_lrt_plot_%j.err
#SBATCH --constraint=holyib

module load R

SPECIES=$1
SITES_FILE=$2
OUTPUT_DIR=$3
QUAL_DIR=$4

Rscript --vanilla ../whole-genome-reseq/ANGSD/plot_QC_dists.R ${SPECIES} ${SITES_FILE} ${OUTPUT_DIR} ${QUAL_DIR} > ${OUTPUT_DIR}/${SAMPLES}.Rout 
