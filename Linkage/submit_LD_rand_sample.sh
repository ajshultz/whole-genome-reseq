#!/bin/bash

#Run script to randomly subset LD file results. Run from inside directory with results
#Arguments: 1:population 2:proportion lines to pull 3:output directory 4:input file directory
#For now going to try pulling 1% of lines
sbatch ../whole-genome-reseq/Linkage/run_LD_rand_sample.sh Eastern_90_28inds 0.01 linkage_rand_samples linkage_28inds
sleep 1
sbatch ../whole-genome-reseq/Linkage/run_LD_rand_sample.sh Eastern_01_28inds 0.01 linkage_rand_samples linkage_28inds
sleep 1
sbatch ../whole-genome-reseq/Linkage/run_LD_rand_sample.sh Eastern_14_28inds 0.01 linkage_rand_samples linkage_28inds
sleep 1
sbatch ../whole-genome-reseq/Linkage/run_LD_rand_sample.sh Western_01_28inds 0.01 linkage_rand_samples linkage_28inds
sleep 1
sbatch ../whole-genome-reseq/Linkage/run_LD_rand_sample.sh Western_14_28inds 0.01 linkage_rand_samples linkage_28inds
sleep 1