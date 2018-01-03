#!/bin/bash

#SBATCH -p shared
#SBATCH -n 12
#SBATCH -N 1
#SBATCH --mem 30000
#SBATCH -t 0-8:00:00
#SBATCH -J angsd_theta
#SBATCH -o logs_postdis/angsd_theta_%A_%a.out
#SBATCH -e logs_postdis/angsd_theta_%A_%a.err
#SBATCH --constraint=holyib
#SBATCH --array=1-20

module load gcc/4.8.2-fasrc01 ngsTools/20170201-fasrc01

REF=../genome/final.assembly.homo.fa

SAMPLES=$1
BAMLISTDIR=$2
SITES=$3
ANC=$4

#Filters are only keep unique hits, remove "bad" reads, no trimming, (didn't use filter for reads where mates could be mapped), only keep reads with a minimum mapping quality of 20 only keep sites where there are data for at least half of the individuals. Minimum base quality of 20

#Calculate theta for each site

angsd -bam ${BAMLISTDIR}/${SAMPLES}_BamList.txt -ref $REF -anc ${ANC} -uniqueOnly 1 -remove_bads 1 -trim 0 -minMapQ 20 -minQ 20 -sites ${SITES} -only_proper_pairs 1 -nThreads 12 -out results_theta/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID} -doCounts 1 -doMaf 1 -doMajorMinor 1 -GL 2 -doThetas 1 -doSaf 1 -pest results_saf/${SAMPLES}_Genome.sfs -rf split_fai_20_angsd/final.assembly.homo.fa_${SLURM_ARRAY_TASK_ID}.interval_list

N_CHR=$(zcat results_theta/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID}.thetas.gz | tail -n+2 | cut -s -f 1 | uniq | wc -l)
echo $N_CHR

#3) Estimate Tajima's D and other statistics for each site
thetaStat make_bed results_theta/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID}.thetas.gz
thetaStat do_stat results_theta/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID}.thetas.gz -win 1000 -step 1000 -nChr ${N_CHR} -outnames results_theta/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID}_1kbWin_1kbStep
thetaStat do_stat results/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID}.thetas.gz -win 2500 -step 500 -nChr ${N_CHR} -outnames results_theta/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID}_2.5kbWin_.5kbStep