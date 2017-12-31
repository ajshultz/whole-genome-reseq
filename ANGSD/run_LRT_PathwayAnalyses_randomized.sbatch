#!/bin/bash

#SBATCH -p shared
#SBATCH -n 6
#SBATCH -N 1
#SBATCH --mem 16000
#SBATCH -t 1-00:00:00
#SBATCH -J angsd_LRT_rand
#SBATCH -o logs_postdis/angsd_LRT_rand_%j.out
#SBATCH -e logs_postdis/angsd_LRT_rand_%j.err
#SBATCH --constraint=holyib


RANDOMNUM=$1

cd results_LRT_randomized
sh ../whole-genome-reseq/ANGSD/concat_LRT_Div20.sh Eastern_9001_rand${RANDOMNUM}
sh ../whole-genome-reseq/ANGSD/concat_LRT.sh Eastern_9001_rand${RANDOMNUM}
gunzip Eastern_9001_rand${RANDOMNUM}_cat.lrt0.gz

cd ../

awk '{print $1"\t"$2-1"\t"$2"\t"$6}' results_LRT_randomized/Eastern_9001_rand${RANDOMNUM}_cat.lrt0 > results_pathway_randomized/Eastern_9001_rand${RANDOMNUM}_cat.lrt0.bed


sed '1d' results_pathway_randomized/Eastern_9001_rand${RANDOMNUM}_cat.lrt0.bed > results_pathway_randomized/Eastern_9001_rand${RANDOMNUM}_cat_nohead.lrt0.bed
bedtools map -a ../genome/gff/HF.genome.gene.ZFannotations_sorted.gff -b results_pathway_randomized/Eastern_9001_rand${RANDOMNUM}_cat_nohead.lrt0.bed -c 4 -o max -g ../genome/final.assembly.homo.genome > results_pathway_randomized/Eastern_9001_rand${RANDOMNUM}_genes_max.bed

module load R/3.4.1-fasrc01
export R_LIBS_USER=$HOME/sw/R:$R_LIBS_USER
Rscript ../whole-genome-reseq/PathwayAnalyses/HF_SNPAnnot_Pathway.R results_pathway_randomized/Eastern_9001_rand${RANDOMNUM}_genes_max.bed Eastern_9001_rand${RANDOMNUM}_genes > results_pathway_randomized/Eastern_9001_rand${RANDOMNUM}_RRes.log