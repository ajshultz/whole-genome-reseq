#!/bin/bash

sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/HaplotypeCalling/run_GenotypeGVCF_OutgroupIntervalList.sbatch PinEnu
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/HaplotypeCalling/run_GenotypeGVCF_OutgroupIntervalList.sbatch UraSib
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/HaplotypeCalling/run_GenotypeGVCF_OutgroupIntervalList.sbatch CarEry