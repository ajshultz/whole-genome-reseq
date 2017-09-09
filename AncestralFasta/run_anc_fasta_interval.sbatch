#!/bin/bash

#SBATCH -p serial_requeue
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 8000
#SBATCH -t 4-00:00:00
#SBATCH -J CovIndFilt
#SBATCH -o logs/CovIndFilt_%j.out
#SBATCH -e logs/CovIndFilt_%j.err



module load samtools
module load zlib
module load tabix

#Running in anc_fasta directory in gatk
python /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/AncestralFasta/create_anc_fasta.py --ref ../../genome/final.assembly.homo.fa --vcf_in ../genotype_res_filtered/All_HFs_FilteredSNPsIndsCov.recode.vcf.gz --vcf_out1 ../genotype_res_filtered/All_CCs_FilteredSNPsIndsCov.recode.vcf.gz --vcf_out2 All_CPs_FilteredSNPsIndsCov.recode.vcf.gz --vcf_out3 ../outgroups/PinEnu_1.vcf.gz --vcf_out4 ../outgroups/CarEry_1.vcf.gz --vcf_out5 ../outgroups/UraSib_1.vcf.gz --chr scaffold_0 --out ./HF

python /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/AncestralFasta/create_anc_fasta.py --ref ../../genome/final.assembly.homo.fa --vcf_in ../genotype_res_filtered/All_HFs_FilteredSNPsIndsCov.recode.vcf.gz --vcf_out1 ../genotype_res_filtered/All_CCs_FilteredSNPsIndsCov.recode.vcf.gz --vcf_out2 ../genotype_res_filtered/All_CPs_FilteredSNPsIndsCov.recode.vcf.gz --vcf_out3 ../outgroups/PinEnu_30.vcf.gz --vcf_out4 ../outgroups/CarEry_30.vcf.gz --vcf_out5 ../outgroups/UraSib_30.vcf.gz --chr scaffold_1154 --out ./HF