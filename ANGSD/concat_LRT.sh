#!/bin/bash

SAMPLE=$1

COUNT=0

#Check if all files are present
for i in {1..20}

do

if [ -f ./${SAMPLE}_$i.lrt0.gz ]
then
COUNT=$(($COUNT+1))

else
echo ${SAMPLE}_$i missing file
fi

done


#If all files present copy first file to a new file to hold concatenated results and gunzip
if [ "$COUNT" -eq "20" ]

then	
	cp ${SAMPLE}_1.lrt0.gz ${SAMPLE}_cat.lrt0.gz
	gunzip ${SAMPLE}_cat.lrt0.gz
	
	for i in {2..20}
		do	
		zcat ${SAMPLE}_$i.lrt0.gz | tail -n +2 >> ${SAMPLE}_cat.lrt0	
		done
	
	gzip  ${SAMPLE}_cat.lrt0

else
	echo Something is wrong
fi