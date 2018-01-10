#!/bin/bash

#pop1 pop2 sfs_file

sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Intervals.sbatch Eastern_90 Eastern_01 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/results_saf_merged/Eastern_9001_Autosomal.sfs
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Intervals.sbatch Eastern_90 Eastern_14 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/results_saf_100MB/Eastern_9014_100MB_Autosomal.sfs
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Intervals.sbatch Eastern_01 Eastern_14 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/results_saf_100MB/Eastern_0114_100MB_Autosomal.sfs
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Intervals.sbatch Western_01 Western_14 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/results_saf_100MB/Western_0114_100MB_Autosomal.sfs
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Intervals.sbatch Eastern_90 Western_01 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/results_saf_100MB/Eastern_90_100MB_Western_01_Autosomal.sfs
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Intervals.sbatch Eastern_14 Western_14 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/results_saf_100MB/Eastern_14_100MB_Western_14_Autosomal.sfs
sleep 1