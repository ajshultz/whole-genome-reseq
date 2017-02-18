#!/bin/bash

#SBATCH -p serial_requeue
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 24000
#SBATCH -t 0-5:00:00
#SBATCH -J angsd_lrt_plot
#SBATCH -o logs/angsd_lrt_plot_%j.out
#SBATCH -e logs/angsd_lrt_plot_%j.err
#SBATCH --constraint=holyib

module load R

SAMPLES=$1
DIRECTORY=$2
SITES=$3

gunzip ${DIRECTORY}/${SAMPLES}_cat.lrt0.gz

Rscript --vanilla ../whole-genome-reseq/ANGSD/manhattanFromLRT_Cluster.R ${SAMPLES} ${DIRECTORY} ${SITES} >  ${DIRECTORY}/${SAMPLES}.Rout 

gzip ${DIRECTORY}/${SAMPLES}_cat.lrt0