#!/bin/bash

#SBATCH -p serial_requeue
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 4000
#SBATCH -t 6:00:00
#SBATCH -J vcfINFO
#SBATCH -o logs/vcfINFO_%j.out
#SBATCH -e logs/vcfINFO_%j.err
#SBATCH --constraint=holyib

#Use user-installed version of vcftools (v. 0.1.15)
source /n/home13/ashultz/sw/progs/vcftools-0.1.15/setup.sh

SAMPLES=$1
INT=$2

#extract a variety of summary stats from each interval file for each specified species

vcftools --gzvcf genotype_res/All_${SAMPLES}s_Int${INT}.vcf.gz --out qual_info/${SAMPLES}_Int${INT}_MQ --get-INFO MQ

vcftools --gzvcf genotype_res/All_${SAMPLES}s_Int${INT}.vcf.gz --out qual_info/${SAMPLES}_Int${INT}_DP --get-INFO DP

vcftools --gzvcf genotype_res/All_${SAMPLES}s_Int${INT}.vcf.gz --out qual_info/${SAMPLES}_Int${INT}_RPRS --get-INFO ReadPosRankSum

vcftools --gzvcf genotype_res/All_${SAMPLES}s_Int${INT}.vcf.gz --out qual_info/${SAMPLES}_Int${INT}_BQRS --get-INFO BaseQRankSum

vcftools --gzvcf genotype_res/All_${SAMPLES}s_Int${INT}.vcf.gz --out qual_info/${SAMPLES}_Int${INT}_MQRS --get-INFO MQRankSum

vcftools --gzvcf genotype_res/All_${SAMPLES}s_Int${INT}.vcf.gz --out qual_info/${SAMPLES}_Int${INT}_QD --get-INFO QD

vcftools --gzvcf genotype_res/All_${SAMPLES}s_Int${INT}.vcf.gz --out qual_info/${SAMPLES}_Int${INT}_MLEAC --get-INFO MLEAC

vcftools --gzvcf genotype_res/All_${SAMPLES}s_Int${INT}.vcf.gz --out qual_info/${SAMPLES}_Int${INT}_MLEAF --get-INFO MLEAF

vcftools --gzvcf genotype_res/All_${SAMPLES}s_Int${INT}.vcf.gz --out qual_info/${SAMPLES}_Int${INT}_CRS --get-INFO ClippingRankSum

vcftools --gzvcf genotype_res/All_${SAMPLES}s_Int${INT}.vcf.gz --out qual_info/${SAMPLES}_Int${INT}_ExH --get-INFO ExcessHet

vcftools --gzvcf genotype_res/All_${SAMPLES}s_Int${INT}.vcf.gz --out qual_info/${SAMPLES}_Int${INT}_SOR --get-INFO SOR

vcftools --gzvcf genotype_res/All_${SAMPLES}s_Int${INT}.vcf.gz --out qual_info/${SAMPLES}_Int${INT}_SOR --missing-indiv

