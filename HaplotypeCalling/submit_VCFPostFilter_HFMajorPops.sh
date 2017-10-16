#!/bin/bash
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/HaplotypeCalling/run_VCFPostFilter_IndSelect.sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/IndLists_NoRel/Eastern_01_IndList.txt Eastern_01
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/HaplotypeCalling/run_VCFPostFilter_IndSelect.sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/IndLists_NoRel/Eastern_90_IndList.txt Eastern_90
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/HaplotypeCalling/run_VCFPostFilter_IndSelect.sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/IndLists_NoRel/Eastern_14_IndList.txt Eastern_14
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/HaplotypeCalling/run_VCFPostFilter_IndSelect.sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/IndLists_NoRel/Western_01_IndList.txt Western_01
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/HaplotypeCalling/run_VCFPostFilter_IndSelect.sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/IndLists_NoRel/Western_14_IndList.txt Western_14