#!/bin/bash

NAMES=( "AU_01" "AU_90" "AU_14" "CA_01" "CA_14" "IL_14" "MA_14" "ME_01" "ME_90" "NY_01" "NY_90" "OH_01" "OH_90" "WA_01" "WA_14" )
NINT=20


for i in ${NAMES[@]}
do
python ~/GitRepos/whole-genome-reseq/ANGSD/sum_interval_sfs.py -d interval_sfs -s ${i} -n ${NINT}
done