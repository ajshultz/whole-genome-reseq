#!/bin/bash

#SBATCH -p general
#SBATCH -n 8
#SBATCH -N 1
#SBATCH --mem 24000
#SBATCH -t 3-00:00:00
#SBATCH -J angsd_OutFasta
#SBATCH -o logs/angsd_OutFasta_%j.out
#SBATCH -e logs/angsd_OutFasta_%j.err
#SBATCH --constrain=holyib

module load angsd/0.911-fasrc01

#Use angsd to create a Fasta file from the consensus of the three outgroups. Will use most frequent base, or a random tie if necessary.

angsd -bam /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/BamLists/Outgroup_BamList.txt -out results/Outgroup_consensus.fa -uniqueOnly 1 -remove_bads 1 -trim 0 -minMapQ 20 -only_proper_pairs 0 -minQ 20 -doCounts 1 -doFasta 2
