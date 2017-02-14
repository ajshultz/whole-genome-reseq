#!/bin/bash

SAMPLE=$1
INTERVALS=$2

COUNT=0

#Check if all files are present
for i in {1..${INTERVALS}}

do

if [ -f ./${SAMPLE}_$i.mafs.gz ]
then
COUNT=$(($COUNT+1))

else
echo ${SAMPLE}_$i missing file
fi

done


#If all files present copy first file to a new file to hold concatenated results and gunzip
if [ "$COUNT" -eq ${INTERVALS} ]

then	
	cp ${SAMPLE}_1.mafs.gz ${SAMPLE}_cat.mafs.gz
	gunzip ${SAMPLE}_cat.mafs.gz
	
	cp ${SAMPLE}_1.geno ${SAMPLE}_cat.geno
	
	for i in {2..${INTERVALS}}
		do	
		zcat ${SAMPLE}_$i.mafs.gz | tail -n +2 >> ${SAMPLE}_cat.mafs
		cat ${SAMPLE}_$i.geno >> ${SAMPLE}_cat.geno
		done
	
	gzip  ${SAMPLE}_cat.mafs

else
	echo Something is wrong
fi