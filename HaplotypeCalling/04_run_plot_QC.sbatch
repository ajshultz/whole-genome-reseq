#!/bin/bash

#SBATCH -p serial_requeue
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 24000
#SBATCH -t 0-01:00:00
#SBATCH -J angsd_qc_plot
#SBATCH -o logs/qc_plot_%j.out
#SBATCH -e logs/qc_plot_%j.err
#SBATCH --constraint=holyib

module load R/3.4.1-fasrc01
export R_LIBS_USER=$HOME/sw/R:$R_LIBS_USER

SPECIES=$1
SITES_FILE=$2
OUTPUT_DIR=$3
QUAL_DIR=$4
STAT=$5

Rscript --vanilla ../whole-genome-reseq/HaplotypeCalling/plot_QC_dists.R ${SPECIES} ${SITES_FILE} ${OUTPUT_DIR} ${QUAL_DIR} ${STAT} > ${OUTPUT_DIR}/${SPECIES}_${STAT}.Rout 
