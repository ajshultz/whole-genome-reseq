#!/bin/bash

#SBATCH -p serial_requeue
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 32000
#SBATCH -t 0-01:00:00
#SBATCH -J angsd_lrt_plot
#SBATCH -o logs/qc_plot_%j.out
#SBATCH -e logs/qc_plot_%j.err	
SITES_FILE=$2
OUTPUT_DIR=$3
QUAL_DIR=$4
STAT=$5

Rscript --vanilla ../whole-genome-reseq/HaplotypeCalling/plot_QC_dists.R ${SPECIES} ${SITES_FILE} ${OUTPUT_DIR} ${QUAL_DIR} ${STAT} > ${OUTPUT_DIR}/${SAMPLES}.Rout 
