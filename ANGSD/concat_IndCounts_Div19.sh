#!/bin/bash

COUNT=0

#Check if all files are present
for i in {0..31}

do


if [ -f ./All_HF_Scaffold_Indiv_Coverage_Stats_Int19_$i.txt.ind.mean.txt ]
then
COUNT=$(($COUNT+1))

else
echo Int19_$i missing
fi


done


#If all files present copy first file to a new file to hold concatenated results and gunzip
if [ "$COUNT" -eq "32" ]

then	
	cp All_HF_Scaffold_Indiv_Coverage_Stats_Int19_0.txt.ind.mean.txt All_HF_Scaffold_Indiv_Coverage_Stats_Int19.txt.ind.mean.txt
	cp All_HF_Scaffold_Indiv_Coverage_Stats_Int19_0.txt.ind.median.txt All_HF_Scaffold_Indiv_Coverage_Stats_Int19.txt.ind.median.txt
	cp All_HF_Scaffold_Indiv_Coverage_Stats_Int19_0.txt.ind.sd.txt All_HF_Scaffold_Indiv_Coverage_Stats_Int19.txt.ind.sd.txt
	cp All_HF_Scaffold_Indiv_Coverage_Stats_Int19_0.txt.exclude.sites All_HF_Scaffold_Indiv_Coverage_Stats_Int19.txt.exclude.sites
	
	for i in {1..31}
		do	
		cat All_HF_Scaffold_Indiv_Coverage_Stats_Int19_$i.txt.ind.mean.txt | tail -n +2 >> All_HF_Scaffold_Indiv_Coverage_Stats_Int19.txt.ind.mean.txt	
		cat All_HF_Scaffold_Indiv_Coverage_Stats_Int19_$i.txt.ind.median.txt | tail -n +2 >> All_HF_Scaffold_Indiv_Coverage_Stats_Int19.txt.ind.median.txt	
		cat All_HF_Scaffold_Indiv_Coverage_Stats_Int19_$i.txt.ind.median.txt | tail -n +2 >> All_HF_Scaffold_Indiv_Coverage_Stats_Int19.txt.ind.median.txt	
		cat All_HF_Scaffold_Indiv_Coverage_Stats_Int19_$i.txt.exclude.sites >> All_HF_Scaffold_Indiv_Coverage_Stats_Int19.txt.exclude.sites	
		echo Int19_$i is finished
		
		done

else
	echo Something is wrong
fi
