#!/bin/bash
#sbatch sbatchscript samples bamlistdir mincov maxcov scaffold
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_doCounts_SingleScaffold.sbatch All_HF /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists 60 10000 562
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_doCounts_SingleScaffold.sbatch All_HF /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists 60 4000 2
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_doCounts_SingleScaffold.sbatch All_HF /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists 60 4000 19

