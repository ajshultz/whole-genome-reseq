#!/bin/bash

NAMES=( "CC" "CP" "Eastern_90" "Eastern_01" "Eastern_14" "Western_01" "Western_14" )
NINT=10


for i in ${NAMES[@]}
do
python ~/GitRepos/whole-genome-reseq/ANGSD/sum_interval_sfs.py -d . -s ${i}_intergenic -n 10
python ~/GitRepos/whole-genome-reseq/ANGSD/sum_interval_sfs.py -d . -s ${i}_introns -n 10
python ~/GitRepos/whole-genome-reseq/ANGSD/sum_interval_sfs.py -d . -s ${i}_cds -n 10
python ~/GitRepos/whole-genome-reseq/ANGSD/sum_interval_sfs.py -d . -s ${i}_3UTR -n 10
python ~/GitRepos/whole-genome-reseq/ANGSD/sum_interval_sfs.py -d . -s ${i}_5UTR -n 10
done