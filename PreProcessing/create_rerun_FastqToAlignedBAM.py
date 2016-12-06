#! /usr/bin/env python

import sys


#Take a file with the list of individuals, and create an sbatch file for indel realignment file creation. First argument is file with individuals, second is desired sbatch file name.

indListFile = sys.argv[1]
newSbatchFile = sys.argv[2]

indList = open(indListFile,"r")
newSbatch = open(newSbatchFile,"w")

#Create SBATCH header
newSbatch.write("#!/bin/bash\n\n#SBATCH -p general\n#SBATCH -n 1\n#SBATCH -N 1\n#SBATCH --mem 24000\n#SBATCH -t 2-00:00\n#SBATCH -o ./logs/indelcreator_%j.out\n#SBATCH -e ./logs/indelcreator_%j.err\n#SBATCH --constrain holyib\n\n")

#Module loading
newSbatch.write("module load java/1.8.0_45-fasrc01\n\n")

#Beginning of command
newSbatch.write("java -Xmx8g -jar ~/sw/bin/GenomeAnalysisTK.jar \\\n-T RealignerTargetCreator \\\n-R final.assembly.homo.fa \\\n")

inds = []

for line in indList:
	line = line.strip()
	newSbatch.write("-I %s.dedup.sorted.bam \\\n"%line)

newSbatch.write("-o HFCCCP_indel.intervals")

indList.close()
newSbatch.close()