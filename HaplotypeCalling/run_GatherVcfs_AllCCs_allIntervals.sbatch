#!/bin/bash

#SBATCH -p general
#SBATCH -n 2
#SBATCH -N 1
#SBATCH --mem 12000
#SBATCH -t 1-00:00
#SBATCH -J GatherVcfs
#SBATCH -o ./logs/GatherVcfs%j.out
#SBATCH -e ./logs/GatherVcfs%j.err
#SBATCH --constraint=holyib

module load java/1.8.0_45-fasrc01


java -Xmx10g -XX:ParallelGCThreads=1 -cp ~/sw/bin/picard.jar GatherVcfs \
I=genotype_res/All_CCs_Int1.vcf.gz \
I=genotype_res/All_CCs_Int2.vcf.gz \
I=genotype_res/All_CCs_Int3.vcf.gz \
I=genotype_res/All_CCs_Int4.vcf.gz \
I=genotype_res/All_CCs_Int5.vcf.gz \
I=genotype_res/All_CCs_Int6.vcf.gz \
I=genotype_res/All_CCs_Int7.vcf.gz \
I=genotype_res/All_CCs_Int8.vcf.gz \
I=genotype_res/All_CCs_Int9.vcf.gz \
I=genotype_res/All_CCs_Int10.vcf.gz \
O=genotype_res/All_CCs_Combined.vcf.gz