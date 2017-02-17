#!/bin/bash

#samples nind nintervals

sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_catIntervals_ngsCovar.sbatch HFCCCP 225 16 results_pca
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_catIntervals_ngsCovar.sbatch All_HF 209 16 results_pca
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_catIntervals_ngsCovar.sbatch Eastern_900114 146 19 results_pca
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_catIntervals_ngsCovar.sbatch Western_0114 63 19 results_pca