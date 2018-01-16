#!/bin/bash

#pop1 pop2

#################GEOGRAPHIC####################################
#Eastern 1990 geographic
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch AU_90 OH_90
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch AU_90 NY_90
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch AU_90 ME_90
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch OH_90 NY_90
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch OH_90 ME_90
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch NY_90 ME_90
sleep 1

#Eastern 2001 geographic
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch AU_01 OH_01
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch AU_01 NY_01
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch AU_01 ME_01
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch OH_01 NY_01
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch OH_01 ME_01
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch NY_01 ME_01
sleep 1

#Eastern 2014 geographic
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch IL_14 MA_14
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch AU_14 IL_14
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch AU_14 MA_14
sleep 1


#Western 2001 geographic
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch CA_01 WA_01
sleep 1


#Western 2014 geographic
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch CA_14 WA_14
sleep 1


##########################Eastern vs. Western Temporal#############################

#Eastern 90 vs. 01
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch AU_90 AU_01
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch OH_90 OH_01
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch NY_90 NY_01
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch ME_90 ME_01
sleep 1


#Eastern 90 vs. 14
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch AU_90 AU_14
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch OH_90 IL_14
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch NY_90 MA_14
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch ME_90 MA_14
sleep 1


#Eastern 01 vs. 14
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch AU_01 AU_14
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch OH_01 IL_14
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch NY_01 MA_14
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch ME_01 MA_14
sleep 1

#Western 01 vs. 14
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch CA_01 CA_14
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch WA_01 WA_14
sleep 1

##########################Eastern vs. Western Geographic#############################

#Eastern vs. western pre-epizootic
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch AU_90 CA_01
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch OH_90 CA_01
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch NY_90 CA_01
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch ME_90 CA_01
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch AU_90 WA_01
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch OH_90 WA_01
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch NY_90 WA_01
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch ME_90 WA_01
sleep 1

#Eastern vs. western post-epizootic
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch AU_01 CA_14
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch OH_01 CA_14
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch NY_01 CA_14
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch ME_01 CA_14
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch AU_01 WA_14
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch OH_01 WA_14
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch NY_01 WA_14
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch ME_01 WA_14
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch MA_14 CA_14
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch MA_14 WA_14
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch IL_14 CA_14
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_Fst_Subpops.sbatch IL_14 WA_14
sleep 1


