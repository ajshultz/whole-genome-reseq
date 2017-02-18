#!/bin/bash
#Asso1 Interval List
#samples bamlistdir sitesfile
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_pvals_plot_LRT.sbatch Eastern_9001 results_LRTInt_Asso1_GL1 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/All_HF_Scaffold_Indiv_Coverage_Stats_WholeGenome.txt.exclude.sites
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_pvals_plot_LRT.sbatch Eastern_9014 results_LRTInt_Asso1_GL1 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/All_HF_Scaffold_Indiv_Coverage_Stats_WholeGenome.txt.exclude.sites
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_pvals_plot_LRT.sbatch Eastern_0114 results_LRTInt_Asso1_GL1 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/All_HF_Scaffold_Indiv_Coverage_Stats_WholeGenome.txt.exclude.sites
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_pvals_plot_LRT.sbatch Western_0114 results_LRTInt_Asso1_GL1 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/All_HF_Scaffold_Indiv_Coverage_Stats_WholeGenome.txt.exclude.sites
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_pvals_plot_LRT.sbatch Eastern_90_Western_01 results_LRTInt_Asso1_GL1 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/All_HF_Scaffold_Indiv_Coverage_Stats_WholeGenome.txt.exclude.sites
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_pvals_plot_LRT.sbatch Eastern_14_Western_14 results_LRTInt_Asso1_GL1 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/All_HF_Scaffold_Indiv_Coverage_Stats_WholeGenome.txt.exclude.sites
sleep 1
