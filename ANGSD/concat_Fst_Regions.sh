#!/bin/bash

NAMES=( "Eastern_90" "Eastern_01" "Eastern_14" "Western_01" "Western_14" "CC" "CP" )
NINT=20


for i in ${NAMES[@]}
do
#../whole-genome-reseq/ANGSD/concat_Theta_gz_and_sliding_int1.10.sh ${i} results_theta_subpops
../whole-genome-reseq/ANGSD/concat_Fst_gz_and_sliding.sh ${i} results_fst
done

