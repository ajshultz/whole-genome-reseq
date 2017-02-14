#!/bin/bash

#SBATCH -p serial_requeue
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 1000
#SBATCH -t 0-0:10:00
#SBATCH -J angsd_lrt_plot
#SBATCH -o logs/angsd_lrt_plot_%j.out
#SBATCH -e logs/angsd_lrt_plot_%j.err
#SBATCH --constraint=holyib

module load R

SAMPLES=$1
DIRECTORY=$2

gunzip ${DIRECTORY}/${SAMPLES}_cat.lrt0.gz

Rscript --vanilla ../whole-genome-reseq/ANGSD/manhattanFromLRT_Cluster.R ${SAMPLES} ${DIRECTORY} >  ${DIRECTORY}/${SAMPLES}.Rout 

gzip ${DIRECTORY}/${SAMPLES}_cat.lrt0