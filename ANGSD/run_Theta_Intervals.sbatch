#!/bin/bash

#SBATCH -p general
#SBATCH -n 12
#SBATCH -N 1
#SBATCH --mem 32000
#SBATCH -t 0-8:00:00
#SBATCH -J angsd_theta
#SBATCH -o logs/angsd_theta_%A_%a.out
#SBATCH -e logs/angsd_theta_%A_%a.err
#SBATCH --constraint=holyib
#SBATCH --array=15-20

module load angsd/0.911-fasrc01

REF=../genome/final.assembly.homo.fa

SAMPLES=$1
BAMLISTDIR=$2
SITES=$3
ANC=$4

#Filters are only keep unique hits, remove "bad" reads, no trimming, (didn't use filter for reads where mates could be mapped), only keep reads with a minimum mapping quality of 20 only keep sites where there are data for at least half of the individuals. Minimum base quality of 20

#Calculate theta for each site

angsd -bam ${BAMLISTDIR}/${SAMPLES}_BamList.txt -ref $REF -anc ${ANC} -uniqueOnly 1 -remove_bads 1 -trim 0 -minMapQ 20 -minQ 20 -sites ${SITES} -only_proper_pairs 0 -nThreads 12 -out results_theta_cov1.7/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID} -doCounts 1 -doMaf 1 -doMajorMinor 1 -GL 1 -doThetas 1 -doSaf 1 -pest results_saf/${SAMPLES}_Genome.sfs -rf split_fai_20_angsd/final.assembly.homo.fa_${SLURM_ARRAY_TASK_ID}.interval_list

N_CHR=$(zcat results_theta_cov1.7/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID}.thetas.gz | tail -n+2 | cut -s -f 1 | uniq | wc -l)
echo $N_CHR

#3) Estimate Tajima's D and other statistics for each site
thetaStat make_bed results_theta_cov1.7/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID}.thetas.gz
thetaStat do_stat results_theta_cov1.7/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID}.thetas.gz -win 1000 -step 1000 -nChr ${N_CHR} -outnames results_theta_cov1.7/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID}_1kbWin_1kbStep
thetaStat do_stat results_theta_cov1.7/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID}.thetas.gz -win 2500 -step 500 -nChr ${N_CHR} -outnames results_theta_cov1.7/${SAMPLES}_Int${SLURM_ARRAY_TASK_ID}_2.5kbWin_.5kbStep