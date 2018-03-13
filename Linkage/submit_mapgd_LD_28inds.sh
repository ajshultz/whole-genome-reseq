#!/bin/bash


#samples bamlistdir sitesfile scaffoldfile

sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/Linkage/run_mapgd_LD_28inds.sbatch Eastern_90_28inds /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists_NoRel /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/All_HF_Whole_Genome_Include_Autosomal_Sites_d50.angsdsites
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/Linkage/run_mapgd_LD_28inds.sbatch Eastern_01_28inds /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists_NoRel /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/All_HF_Whole_Genome_Include_Autosomal_Sites_d50.angsdsites
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/Linkage/run_mapgd_LD_28inds.sbatch Eastern_14_28inds /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists_NoRel /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/All_HF_Whole_Genome_Include_Autosomal_Sites_d50.angsdsites
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/Linkage/run_mapgd_LD_28inds.sbatch Western_01_28inds /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists_NoRel /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/All_HF_Whole_Genome_Include_Autosomal_Sites_d50.angsdsites
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/Linkage/run_mapgd_LD_28inds.sbatch Western_14_28inds /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists_NoRel /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/All_HF_Whole_Genome_Include_Autosomal_Sites_d50.angsdsites

