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

SAMPLES=$1
DIRECTORY=$2

Rscript --vanilla ../whole-genome-reseq/ANGSD/manhattanPlotOnlyFromLRT_Cluster.R ${SAMPLES} ${DIRECTORY} >  ${DIRECTORY}/${SAMPLES}.Rout 
