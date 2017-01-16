#!/bin/bash
#sbatch sbatchscript samples bamlistdir minind mincov maxcov glmodel asso
#GL 2 + Asso 2
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_LRT_SpecificIntervalAssoGLOpts.sbatch Eastern_9001 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists 56 60 800 2 2
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_LRT_SpecificIntervalAssoGLOpts.sbatch Eastern_9014 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists 48 60 600 2 2
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_LRT_SpecificIntervalAssoGLOpts.sbatch Eastern_0114 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists 48 60 800 2 2
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_LRT_SpecificIntervalAssoGLOpts.sbatch Western_0114 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists 32 60 600 2 2
sleep 1

#GL 1 Asso 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_LRT_SpecificIntervalAssoGLOpts.sbatch Eastern_9001 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists 56 60 800 1 1 18
sleep 1

sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_LRT_SpecificIntervalAssoGLOpts.sbatch Eastern_9014 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists 48 60 600 1 1 18
sleep 1

sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_LRT_SpecificIntervalAssoGLOpts.sbatch Eastern_0114 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists 48 60 800 1 1 18
sleep 1

#GL 1 Asso 2
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_LRT_SpecificIntervalAssoGLOpts.sbatch Eastern_9001 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists 56 60 800 1 2 12
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_LRT_SpecificIntervalAssoGLOpts.sbatch Eastern_9001 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists 56 60 800 1 2 18
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_LRT_SpecificIntervalAssoGLOpts.sbatch Eastern_9001 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists 56 60 800 1 2 19
sleep 1

sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_LRT_SpecificIntervalAssoGLOpts.sbatch Eastern_9014 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists 48 60 600 1 2 12
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_LRT_SpecificIntervalAssoGLOpts.sbatch Eastern_9014 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists 48 60 600 1 2 18
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_LRT_SpecificIntervalAssoGLOpts.sbatch Eastern_9014 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists 48 60 600 1 2 19
sleep 1

sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_LRT_SpecificIntervalAssoGLOpts.sbatch Eastern_0114 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists 48 60 800 1 2 12
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_LRT_SpecificIntervalAssoGLOpts.sbatch Eastern_0114 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists 48 60 800 1 2 18
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_LRT_SpecificIntervalAssoGLOpts.sbatch Eastern_0114 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists 48 60 800 1 2 19
sleep 1

sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_LRT_SpecificIntervalAssoGLOpts.sbatch Western_0114 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists 32 60 600 1 2 19
sleep 1

