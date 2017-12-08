#!/bin/bash

#SBATCH -p shared
#SBATCH -n 2
#SBATCH -N 1
#SBATCH --mem 6000
#SBATCH -t 0-12:00
#SBATCH -J VariantFiltration
#SBATCH -o logs/VarFil_%A_%a.out
#SBATCH -e logs/VarFil_%A_%a.err
#SBATCH --constraint=holyib
#SBATCH --array=1-10


module load java/1.8.0_45-fasrc01

SPECIES=$1

java -Xmx5g -XX:ParallelGCThreads=1 -jar ~/sw/bin/GenomeAnalysisTK.jar \
-T VariantFiltration \
-R ../genome/final.assembly.homo.fa \
-V genotype_res_invariant/All_${SPECIES}s_Int${SLURM_ARRAY_TASK_ID}.vcf.gz \
--filterExpression "(vc.isSNP() && (vc.hasAttribute('ReadPosRankSum') && ReadPosRankSum < -3.0)) || (vc.hasAttribute('QD') && QD < 2.0) "  \
--filterName "badSeq"  \
--filterExpression "(vc.isSNP() && ((vc.hasAttribute('FS') && FS > 60.0) || (vc.hasAttribute('SOR') && SOR > 3.0)))"  \
--filterName "badStrand"  \
--filterExpression "vc.isSNP() && ((vc.hasAttribute('MQ') && MQ < 40.0) || (vc.hasAttribute('MQRankSum') && MQRankSum < -4.0))"  \
--filterName "badMap"  \
-o genotype_res_invariant_filterlabel/All_${SPECIES}s_FilteredSNPs_Int${SLURM_ARRAY_TASK_ID}.vcf.gz
