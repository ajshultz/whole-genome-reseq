#!/bin/bash

#samples 
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Merge.sbatch Eastern_90 
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Merge.sbatch Eastern_01 
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Merge.sbatch Eastern_14 
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Merge.sbatch Western_01 
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Merge.sbatch Western_14 
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Merge.sbatch CC 
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Merge.sbatch CP 
