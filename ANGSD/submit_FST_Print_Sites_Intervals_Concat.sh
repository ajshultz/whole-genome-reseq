#!/bin/bash

#pop1 pop2 input_directory output_directory

sh /hd2/HFWGReseq/whole-genome-reseq/ANGSD/run_FST_Print_Sites_Intervals_Concat.sh Eastern_90 Eastern_01 /hd2/HFWGReseq/angsd/results_fst /hd2/HFWGReseq/angsd/results_fst_allsites
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Intervals.sbatch Eastern_90 Eastern_14 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/angsd/results_saf_100MB/Eastern_9014_100MB_Autosomal.sfs
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Intervals.sbatch Eastern_01 Eastern_14 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/angsd/results_saf_100MB/Eastern_0114_100MB_Autosomal.sfs
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Intervals.sbatch Western_01 Western_14 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/angsd/results_saf_100MB/Western_0114_100MB_Autosomal.sfs
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Intervals.sbatch Eastern_90 Western_01 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/angsd/results_saf_100MB/Eastern_90_100MB_Western_01_Autosomal.sfs
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Intervals.sbatch Eastern_14 Western_14 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/angsd/results_saf_100MB/Eastern_14_100MB_Western_14_Autosomal.sfs
sleep 1