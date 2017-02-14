#!/bin/bash

SAMPLE=$1
DIRECTORY=$2

COUNT=0

#Check if all files are present
for i in {1..20}

do

if [ -f ${DIRECTORY}/${SAMPLE}_Int$i.thetas.gz ]
then
COUNT=$(($COUNT+1))

else
echo ${SAMPLE}_$i missing file
fi

done


#If all files present copy first file to a new file to hold concatenated results and gunzip
if [ "$COUNT" -eq "20" ]

then	
	
	zcat ${DIRECTORY}/${SAMPLE}_Int$i.thetas.gz| head -n 1 > ${DIRECTORY}/${SAMPLE}_Rand.thetas
	
	for i in {1..20}
		do	
		zcat ${DIRECTORY}/${SAMPLE}_Int$i.thetas.gz | shuf -n 10000 >> ${DIRECTORY}/${SAMPLE}_Rand.thetas	
		done

else
	echo Something is wrong
fi