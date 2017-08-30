#!/bin/bash

sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/HaplotypeCalling/run_selectVariants.sbatch HF
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/HaplotypeCalling/run_selectVariants.sbatch CP
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/HaplotypeCalling/run_selectVariants.sbatch CC