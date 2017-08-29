#!/bin/bash

sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/HaplotypeCalling/run_plot_QC.sbatch CP /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/angsd/results_indiv_cov_1.5/All_HF_Scaffold_Indiv_Coverage_Stats_WholeGenome.txt.exclude.sites qual_info/_QC_Plots qual_info

sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/HaplotypeCalling/run_plot_QC.sbatch CC /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/angsd/results_indiv_cov_1.5/All_HF_Scaffold_Indiv_Coverage_Stats_WholeGenome.txt.exclude.sites qual_info/_QC_Plots qual_info

sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/HaplotypeCalling/run_plot_QC.sbatch HF /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/angsd/results_indiv_cov_1.5/All_HF_Scaffold_Indiv_Coverage_Stats_WholeGenome.txt.exclude.sites qual_info/_QC_Plots qual_info