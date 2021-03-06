#!/bin/bash

SAMPLE=$1
DIRECTORY=$2

COUNT=0

#Check if all files are present
for i in {1..20}

do

if [ -f ${DIRECTORY}/${SAMPLE}_Int$i.fst.gz ]
then
COUNT=$(($COUNT+1))

else
echo ${SAMPLE}_$i missing file
fi

done


#If all files present copy first file to a new file to hold concatenated results and gunzip
if [ "$COUNT" -eq "20" ]

then	
	
	#zcat ${DIRECTORY}/${SAMPLE}_Int1.fst.gz > ${DIRECTORY}/${SAMPLE}_cat.fst
	cp ${DIRECTORY}/${SAMPLE}_Int1.fst_1kbWin_1kbStep ${DIRECTORY}/${SAMPLE}_cat_1.20.fst_1kbWin_1kbStep
		cp ${DIRECTORY}/${SAMPLE}_Int1.fst_2.5kbWin_.5kbStep ${DIRECTORY}/${SAMPLE}_cat.fst_1.20_2.5kbWin_.5kbStep
	
	for i in {2..20}
		do	
		cat ${DIRECTORY}/${SAMPLE}_Int${i}.fst_1kbWin_1kbStep | tail -n +2 >> ${DIRECTORY}/${SAMPLE}_cat_1.20.fst_1kbWin_1kbStep
		cat ${DIRECTORY}/${SAMPLE}_Int${i}.fst_2.5kbWin_.5kbStep | tail -n +2 >> ${DIRECTORY}/${SAMPLE}_cat_1.20.fst_2.5kbWin_.5kbStep		
		#zcat ${DIRECTORY}/${SAMPLE}_Int${i}.fst.gz | tail -n +2 >> ${DIRECTORY}/${SAMPLE}_cat.fst
		done

	gzip ${DIRECTORY}/${SAMPLE}_cat.fst
	
else
	echo Something is wrong
fi