#!/bin/bash

#samples bamlistdir sitesfile anc interval

sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_MLOnly_SpecificIntervals.sbatch Eastern_90 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists_NoRel /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/All_HF_Whole_Genome_Include_Autosomal_Sites_d50.angsdsites results/UraSib_consensus.fa 1
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_SpecificIntervals.sbatch Eastern_90 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists_NoRel /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/All_HF_Whole_Genome_Include_Autosomal_Sites_d50.angsdsites results/UraSib_consensus.fa 20
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_MLOnly_ZChr.sbatch Eastern_90 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists_NoRel /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/All_HF_Whole_Genome_Include_ZChr_Sites_d50.angsdsites results/UraSib_consensus.fa
sleep 1

sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_MLOnly_SpecificIntervals.sbatch Eastern_01 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists_NoRel /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/All_HF_Whole_Genome_Include_Autosomal_Sites_d50.angsdsites results/UraSib_consensus.fa 1
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_SpecificIntervals.sbatch Eastern_01 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists_NoRel /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/All_HF_Whole_Genome_Include_Autosomal_Sites_d50.angsdsites results/UraSib_consensus.fa 20
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_MLOnly_ZChr.sbatch Eastern_01 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists_NoRel /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/All_HF_Whole_Genome_Include_ZChr_Sites_d50.angsdsites results/UraSib_consensus.fa
sleep 1
