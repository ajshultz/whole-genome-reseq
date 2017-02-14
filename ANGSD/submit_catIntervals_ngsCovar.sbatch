#!/bin/bash

#samples nind nintervals

sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_genolik_PCA_Intervals.sbatch HFCCCP 226 16
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_genolik_PCA_Intervals.sbatch All_HF 210 19
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_genolik_PCA_Intervals.sbatch Eastern_900114 146 19
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_genolik_PCA_Intervals.sbatch Western_0114 64 19