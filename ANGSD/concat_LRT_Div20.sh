#!/bin/bash

SAMPLE=$1

COUNT=0

#Check if all files are present
for i in {0..30}

do

if [ -f ./${SAMPLE}_20_$i.lrt0.gz ]
then
COUNT=$(($COUNT+1))

else
echo ${SAMPLE}_20_$i missing file
fi

done


#If all files present copy first file to a new file to hold concatenated results and gunzip
if [ "$COUNT" -eq "31" ]

then	
	cp ${SAMPLE}_20_0.lrt0.gz ${SAMPLE}_20.lrt0.gz
	gunzip ${SAMPLE}_20.lrt0.gz
	
	for i in {1..30}
		do	
		zcat ${SAMPLE}_20_$i.lrt0.gz | tail -n +2 >> ${SAMPLE}_20.lrt0	
		done
	
	gzip  ${SAMPLE}_20.lrt0

else
	echo Something is wrong
fi