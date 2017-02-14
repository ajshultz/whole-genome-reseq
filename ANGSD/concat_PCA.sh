#!/bin/bash

SAMPLE=$1
INTERVALS=$2

COUNT=0

#Check if all files are present
for i in $(seq 1 ${INTERVALS})

do
echo $i
if [ -f ./${SAMPLE}_Int$i.mafs.gz ]
then
COUNT=$(($COUNT+1))

else
echo ${SAMPLE}_Int$i missing file
fi

done


#If all files present copy first file to a new file to hold concatenated results and gunzip
if [ "$COUNT" -eq ${INTERVALS} ]

then	
	cp ${SAMPLE}_Int1.mafs.gz ${SAMPLE}_cat.mafs.gz
	gunzip ${SAMPLE}_cat.mafs.gz
	
	cp ${SAMPLE}_Int1.geno ${SAMPLE}_cat.geno
	
	for i in {2..${INTERVALS}}
		do	
		zcat ${SAMPLE}_Int$i.mafs.gz | tail -n +2 >> ${SAMPLE}_cat.mafs
		cat ${SAMPLE}_Int$i.geno >> ${SAMPLE}_cat.geno
		done
	
	gzip  ${SAMPLE}_cat.mafs

else
	echo Something is wrong
fi