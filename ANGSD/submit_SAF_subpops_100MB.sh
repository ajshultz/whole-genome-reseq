#!/bin/bash

#samples bamlistdir sitesfile anc

sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_100MB.sbatch AU_90 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists_NoRel /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/genome_subset_100MB_shuffled_sorted.angsdsites /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/gatk/anc_fasta/HF_ancestral_alleles.fasta
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_100MB.sbatch AU_01 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists_NoRel /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/genome_subset_100MB_shuffled_sorted.angsdsites /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/gatk/anc_fasta/HF_ancestral_alleles.fasta
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_100MB.sbatch AU_14 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists_NoRel /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/genome_subset_100MB_shuffled_sorted.angsdsites /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/gatk/anc_fasta/HF_ancestral_alleles.fasta
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_100MB.sbatch CA_01 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists_NoRel /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/genome_subset_100MB_shuffled_sorted.angsdsites /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/gatk/anc_fasta/HF_ancestral_alleles.fasta
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_100MB.sbatch CA_14 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists_NoRel /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/genome_subset_100MB_shuffled_sorted.angsdsites /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/gatk/anc_fasta/HF_ancestral_alleles.fasta
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_100MB.sbatch IL_14 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists_NoRel /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/genome_subset_100MB_shuffled_sorted.angsdsites /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/gatk/anc_fasta/HF_ancestral_alleles.fasta
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_100MB.sbatch MA_14 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists_NoRel /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/genome_subset_100MB_shuffled_sorted.angsdsites /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/gatk/anc_fasta/HF_ancestral_alleles.fasta
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_100MB.sbatch ME_01 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists_NoRel /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/genome_subset_100MB_shuffled_sorted.angsdsites /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/gatk/anc_fasta/HF_ancestral_alleles.fasta
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_100MB.sbatch ME_90 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists_NoRel /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/genome_subset_100MB_shuffled_sorted.angsdsites /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/gatk/anc_fasta/HF_ancestral_alleles.fasta
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_100MB.sbatch NY_01 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists_NoRel /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/genome_subset_100MB_shuffled_sorted.angsdsites /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/gatk/anc_fasta/HF_ancestral_alleles.fasta
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_100MB.sbatch NY_90 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists_NoRel /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/genome_subset_100MB_shuffled_sorted.angsdsites /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/gatk/anc_fasta/HF_ancestral_alleles.fasta
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_100MB.sbatch OH_01 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists_NoRel /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/genome_subset_100MB_shuffled_sorted.angsdsites /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/gatk/anc_fasta/HF_ancestral_alleles.fasta
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_100MB.sbatch OH_90 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists_NoRel /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/genome_subset_100MB_shuffled_sorted.angsdsites /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/gatk/anc_fasta/HF_ancestral_alleles.fasta
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_100MB.sbatch WA_01 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists_NoRel /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/genome_subset_100MB_shuffled_sorted.angsdsites /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/gatk/anc_fasta/HF_ancestral_alleles.fasta
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_100MB.sbatch WA_14 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists_NoRel /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/genome_subset_100MB_shuffled_sorted.angsdsites /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/gatk/anc_fasta/HF_ancestral_alleles.fasta
sleep 1