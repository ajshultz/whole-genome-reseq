#!/bin/bash

COUNT=0

#Check if all files are present
for i in {1..20}

do

if [ -f ./All_HF_Scaffold_Indiv_Coverage_Stats_Int$i.txt.ind.mean.txt ]
then
COUNT=$(($COUNT+1))

else
echo Int_$i missing
fi

done


#If all files present copy first file to a new file to hold concatenated results and gunzip
if [ "$COUNT" -eq "20" ]

then	
	cp All_HF_Scaffold_Indiv_Coverage_Stats_Int1.txt.ind.mean.txt All_HF_Scaffold_Indiv_Coverage_Stats_WholeGenome.txt.ind.mean.txt
	cp All_HF_Scaffold_Indiv_Coverage_Stats_Int1.txt.ind.median.txt All_HF_Scaffold_Indiv_Coverage_Stats_WholeGenome.txt.ind.median.txt
	cp All_HF_Scaffold_Indiv_Coverage_Stats_Int1.txt.ind.sd.txt All_HF_Scaffold_Indiv_Coverage_Stats_WholeGenome.txt.ind.sd.txt
	cp All_HF_Scaffold_Indiv_Coverage_Stats_Int1.txt.exclude.sites All_HF_Scaffold_Indiv_Coverage_Stats_WholeGenome.txt.exclude.sites
	
	for i in {2..20}
		do	
		cat All_HF_Scaffold_Indiv_Coverage_Stats_Int$i.txt.ind.mean.txt | tail -n +2 >> All_HF_Scaffold_Indiv_Coverage_Stats_WholeGenome.txt.ind.mean.txt	
		cat All_HF_Scaffold_Indiv_Coverage_Stats_Int$i.txt.ind.median.txt | tail -n +2 >> All_HF_Scaffold_Indiv_Coverage_Stats_WholeGenome.txt.ind.median.txt	
		cat All_HF_Scaffold_Indiv_Coverage_Stats_Int$i.txt.ind.median.txt | tail -n +2 >> All_HF_Scaffold_Indiv_Coverage_Stats_WholeGenome.txt.ind.median.txt	
		cat All_HF_Scaffold_Indiv_Coverage_Stats_Int$i.txt.exclude.sites >> All_HF_Scaffold_Indiv_Coverage_Stats_WholeGenome.txt.exclude.sites	
		echo int_$i is finished
		
		done

else
	echo Something is wrong
fi