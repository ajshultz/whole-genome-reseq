#!/bin/bash

#SBATCH -p shared
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 4000
#SBATCH -t 1-00:00:00
#SBATCH -J angsd_Pathway
#SBATCH -o logs_postdis/angsd_Pathway_%j.out
#SBATCH -e logs_postdis/angsd_Pathway_%j.err
#SBATCH --constraint=holyib


INPUTFILE=$1
NAME=$2
SAVEDIR=$3


module load R/3.4.1-fasrc01
export R_LIBS_USER=$HOME/sw/R:$R_LIBS_USER
Rscript ../whole-genome-reseq/PathwayAnalyses/HF_SNPAnnot_Pathway.R ${INPUTFILE} ${NAME} ${SAVEDIR}