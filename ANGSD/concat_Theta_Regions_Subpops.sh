#!/bin/bash

NAMES=( "Eastern_90" "Eastern_01" "Eastern_14" "Western_01" "Western_14" "CC" "CP" )
NINT=20


for i in ${NAMES[@]}
do
#../whole-genome-reseq/ANGSD/concat_Theta_gz_and_sliding_int1.10.sh ${i} results_theta_subpops
../whole-genome-reseq/ANGSD/concat_Theta_gz_and_sliding.sh ${i} results_theta
done

NAMES=( "AU_01" "AU_90" "AU_14" "CA_01" "CA_14" "IL_14" "MA_14" "ME_01" "ME_90" "NY_01" "NY_90" "OH_01" "OH_90" "WA_01" "WA_14" )
NINT=20


for i in ${NAMES[@]}
do
#../whole-genome-reseq/ANGSD/concat_Theta_gz_and_sliding_int1.10.sh ${i} results_theta_subpops
../whole-genome-reseq/ANGSD/concat_Theta_gz_and_sliding.sh ${i} results_theta_subpops
done