!#/bin/bash

#Run within whole-genome-reseq/BamLists_NoRel

for i in {1..5}

do

grep -v "AU" Eastern_90_BamList.txt | shuf | head -n 20 > _20randinds/Eastern_90_20inds_${i}_BamList.txt
grep -v "AU" Eastern_01_BamList.txt | shuf | head -n 20 > _20randinds/Eastern_01_20inds_${i}_BamList.txt
grep -v "AU" Eastern_14_BamList.txt | shuf | head -n 20 > _20randinds/Eastern_14_20inds_${i}_BamList.txt
grep -v "AU" Western_01_BamList.txt | shuf | head -n 20 > _20randinds/Western_01_20inds_${i}_BamList.txt
grep -v "AU" Western_14_BamList.txt | shuf | head -n 20 > _20randinds/Western_14_20inds_${i}_BamList.txt

done