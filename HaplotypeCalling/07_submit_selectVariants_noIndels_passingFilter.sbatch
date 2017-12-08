#!/bin/bash

sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/HaplotypeCalling/07_run_selectVariants_noIndels_passingFilter.sbatch HF
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/HaplotypeCalling/07_run_selectVariants_noIndels_passingFilter.sbatch CP
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/HaplotypeCalling/07_run_selectVariants_noIndels_passingFilter.sbatch CC

#Outgroups
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/HaplotypeCalling/07_run_selectVariants_noIndels_passingFilter_Outgroups.sbatch UraSib
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/HaplotypeCalling/07_run_selectVariants_noIndels_passingFilter_Outgroups.sbatch PinEnu
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/HaplotypeCalling/07_run_selectVariants_noIndels_passingFilter_Outgroups.sbatch CarEry



