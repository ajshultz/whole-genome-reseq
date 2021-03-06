#!/bin/bash

#SBATCH -p shared
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 16000
#SBATCH -t 0-12:00:00
#SBATCH -J AncRec
#SBATCH -o ../logs/AncRec_%A_%a.out
#SBATCH -e ../logs/AncRec_%A_%a.err
#SBATCH --constraint=holyib
#SBATCH --array=1-30


module load samtools
module load tabix

#Running in anc_fasta directory in gatk
#Run ancestral state reconstruction for every scaffold in interval file. Interval file corresponds to intervals in outgroup vcfs
cat ../split_fai_30/final.assembly.homo.fa_${SLURM_ARRAY_TASK_ID}.interval_list | while read int
do
python /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/AncestralFasta/create_anc_fasta.py --ref ../../genome/final.assembly.homo.fa --vcf_in ../genotype_res_filtered/All_HFs_FilteredSNPsIndsCov.recode.vcf.gz --vcf_out1 ../genotype_res_invariant_filtered_split30/All_CCs_FilteredSNPs_Combined_Sorted_${SLURM_ARRAY_TASK_ID}.vcf.gz --vcf_out2 ../genotype_res_invariant_filtered_split30/All_CPs_FilteredSNPs_Combined_Sorted_${SLURM_ARRAY_TASK_ID}.vcf.gz --vcf_out3 ../outgroups_filtered/PinEnu_FilteredSNPs_${SLURM_ARRAY_TASK_ID}.vcf.gz --vcf_out4 ../outgroups_filtered/CarEry_FilteredSNPs_${SLURM_ARRAY_TASK_ID}.vcf.gz --vcf_out5 ../outgroups_filtered/UraSib_FilteredSNPs_${SLURM_ARRAY_TASK_ID}.vcf.gz --chr ${int} --out ./HF
done
