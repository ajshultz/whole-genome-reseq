#!/bin/bash

#SBATCH -p shared
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 8000
#SBATCH -t 3-0:00:00
#SBATCH -J ld_calc
#SBATCH -o logs/mapgd_ld_%A_%a.out
#SBATCH -e logs/mapgd_ld_%A_%a.err
#SBATCH --constraint=holyib
#SBATCH --array=1-20


#Running local copy of samtools version 1.6, mapgd version 0.4.32 (although said version 0.4.6 when installing)

SAMPLES=$1
BAMLISTDIR=$2
SITES=$3

SCAFFOLD_FILE=../gatk/split_fai_20/final.assembly.homo.fa_${SLURM_ARRAY_TASK_ID}.interval_list


#for loop over scaffolds in file.

while read SCAFFOLD;
do

	if [ ! -f linkage/${SAMPLES}_${SCAFFOLD}_10kbMax.linkage ]
	then
		#Run from MAPGD directory
		samtools mpileup -q 20 -Q 20 -r ${SCAFFOLD} -l ${SITES} -f ../genome/final.assembly.homo.fa -b ${BAMLISTDIR}/${SAMPLES}_BamList.txt > mpileup/${SAMPLES}_${SCAFFOLD}.mpileup

		grep '^@HD' _generic.header > mapgd_format/${SAMPLES}_${SCAFFOLD}.header
		grep ${SCAFFOLD} _generic.header >> mapgd_format/${SAMPLES}_${SCAFFOLD}.header


		mapgd proview -i mpileup/${SAMPLES}_${SCAFFOLD}.mpileup -H mapgd_format/${SAMPLES}_${SCAFFOLD}.header > mapgd_format/${SAMPLES}_${SCAFFOLD}.pro

		mapgd allele -i mapgd_format/${SAMPLES}_${SCAFFOLD}.pro -c 1 | mapgd filter -p 10 -c 1 -q 0.1 -Q 0.9 > mapgd_format/${SAMPLES}_${SCAFFOLD}.map

		mapgd genotype -p mapgd_format/${SAMPLES}_${SCAFFOLD}.pro -m mapgd_format/${SAMPLES}_${SCAFFOLD}.map > mapgd_format/${SAMPLES}_${SCAFFOLD}.genotype

		mapgd linkage -i mapgd_format/${SAMPLES}_${SCAFFOLD}.genotype -D 10000 -M 4 > linkage/${SAMPLES}_${SCAFFOLD}_10kbMax.linkage
	
		#Remove intermediate files
		rm mapgd_format/${SAMPLES}_${SCAFFOLD}.header
		rm mpileup/${SAMPLES}_${SCAFFOLD}.mpileup
		rm mapgd_format/${SAMPLES}_${SCAFFOLD}.pro
		rm mapgd_format/${SAMPLES}_${SCAFFOLD}.map
		rm mapgd_format/${SAMPLES}_${SCAFFOLD}.genotype
	fi

done < ${SCAFFOLD_FILE}