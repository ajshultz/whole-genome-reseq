#!/bin/bash

#SBATCH -p general
#SBATCH -n 2
#SBATCH -N 1
#SBATCH --mem 12000
#SBATCH -t 1-00:00
#SBATCH -J catVariants
#SBATCH -o ./logs/catVariants_%j.out
#SBATCH -e ./logs/catVariants_%j.err
#SBATCH --constraint=holyib

module load java/1.8.0_45-fasrc01


java -Xmx10g -XX:ParallelGCThreads=1 -cp ~/sw/bin/GenomeAnalysisTK.jar org.broadinstitute.gatk.tools.CatVariants \
--reference ../genome/final.assembly.homo.fa \
--variant genotype_res/All_CPs_Int1.vcf.gz \
--variant genotype_res/All_CPs_Int2.vcf.gz \
--variant genotype_res/All_CPs_Int3.vcf.gz \
--variant genotype_res/All_CPs_Int4.vcf.gz \
--variant genotype_res/All_CPs_Int5.vcf.gz \
--variant genotype_res/All_CPs_Int6.vcf.gz \
--variant genotype_res/All_CPs_Int7.vcf.gz \
--variant genotype_res/All_CPs_Int8.vcf.gz \
--variant genotype_res/All_CPs_Int9.vcf.gz \
--variant genotype_res/All_CPs_Int10.vcf.gz \
--output genotype_res/All_CPs_Combined.vcf.gz \
--assumeSorted