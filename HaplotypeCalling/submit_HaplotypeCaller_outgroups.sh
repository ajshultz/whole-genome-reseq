#!/bin/bash

sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/HaplotypeCalling/run_HaplotypeCaller_LowCovIntervalList.sbatch PinEnu
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/HaplotypeCalling/run_HaplotypeCaller_LowCovIntervalList.sbatch UraSib
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/HaplotypeCalling/run_HaplotypeCaller_LowCovIntervalList.sbatch CarEry