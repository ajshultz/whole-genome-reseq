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


java -Xmx10g -XX:ParallelGCThreads=1 -jar ~/sw/bin/picard.jar GatherVcfs \
I=genotype_res/All_HFs_Int1.vcf.gz \
I=genotype_res/All_HFs_Int2.vcf.gz \
I=genotype_res/All_HFs_Int3.vcf.gz \
I=genotype_res/All_HFs_Int4.vcf.gz \
I=genotype_res/All_HFs_Int5.vcf.gz \
I=genotype_res/All_HFs_Int6.vcf.gz \
I=genotype_res/All_HFs_Int7.vcf.gz \
I=genotype_res/All_HFs_Int8.vcf.gz \
I=genotype_res/All_HFs_Int9.vcf.gz \
I=genotype_res/All_HFs_Int10.vcf.gz \
O=genotype_res/All_HFs_Combined.vcf.gz