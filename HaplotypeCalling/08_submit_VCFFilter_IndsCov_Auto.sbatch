#!/bin/bash

sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/HaplotypeCalling/08_run_VCFFilter_IndsCov_Auto.sbatch HF
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/HaplotypeCalling/08_run_VCFFilter_IndsCov_Auto_CCCP.sbatch CP
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/HaplotypeCalling/08_run_VCFFilter_IndsCov_Auto_CCCP.sbatch CC




