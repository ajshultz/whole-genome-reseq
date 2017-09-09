#!/bin/bash

#SBATCH -p serial_requeue
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 8000
#SBATCH -t 0-06:00:00
#SBATCH -J AncRec
#SBATCH -o ../logs/AncRec_%A_%a.out
#SBATCH -e ../logs/AncRec_%A_%a.err
#SBATCH --constraint=holylfs
#SBATCH --array=1-30


module load samtools
module load tabix

#Running in anc_fasta directory in gatk

int_list = ../split_fai_30/final.assembly.homo.fa_${SLURM_ARRAY_TASK_ID}.interval_list

for int in (int_list)
do
python /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/AncestralFasta/create_anc_fasta.py --ref ../../genome/final.assembly.homo.fa --vcf_in ../genotype_res_filtered/All_HFs_FilteredSNPsIndsCov.recode.vcf.gz --vcf_out1 ../genotype_res_filtered/All_CCs_FilteredSNPsIndsCov.recode.vcf.gz --vcf_out2 ../genotype_res_filtered/All_CPs_FilteredSNPsIndsCov.recode.vcf.gz --vcf_out3 ../outgroups/PinEnu_${SLURM_ARRAY_TASK_ID}.vcf.gz --vcf_out4 ../outgroups/CarEry_${SLURM_ARRAY_TASK_ID}.vcf.gz --vcf_out5 ../outgroups/UraSib_${SLURM_ARRAY_TASK_ID}.vcf.gz --chr ${int} --out ./HF
done

for int in (../split_fai_30/final.assembly.homo.fa_${SLURM_ARRAY_TASK_ID}.interval_list)
do
echo ${int}
done