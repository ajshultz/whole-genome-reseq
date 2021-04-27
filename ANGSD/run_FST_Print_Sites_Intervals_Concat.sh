#!/bin/bash

POP1=$1
POP2=$2
INPUT_DIRECTORY=$3
OUTPUT_DIRECTORY=$4

COUNT=0

#Check if all files are present
for i in {1..20}

do

if [ -f ${INPUT_DIRECTORY}/${POP1}.${POP2}_Int$i.fst.idx ]
then
COUNT=$(($COUNT+1))

else
echo ${INPUT_DIRECTORY}/${POP1}.${POP2}_Int$i missing fst index
fi

done


#If all files present, print individual site FSTs, concatenated into a single file.
if [ "$COUNT" -eq "20" ]

then	
	
	touch ${OUTPUT_DIRECTORY}/${POP1}.${POP2}.fst.allsites 
	
	for i in {1..20}
		do	
		realSFS fst print ${INPUT_DIRECTORY}/${POP1}.${POP2}_Int$i.fst.idx >> ${OUTPUT_DIRECTORY}/${POP1}.${POP2}.fst.allsites
		done

else
	echo Something is wrong
fi

