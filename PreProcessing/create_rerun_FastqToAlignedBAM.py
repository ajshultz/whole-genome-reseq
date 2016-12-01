#! /usr/bin/env python

import sys


#Take a file with the list of all files in a directory, identify which libraries do not have aligned bams, and create a new submission file to rerun them. First input should be list of all files in directory, second should be original submission file, third should be name of new input file.

dirListFile = sys.argv[1]
origSubmitFile = sys.argv[2]
newSubmitFile = sys.argv[3]

dirList = open(dirListFile,"r")
origSubmit = open(origSubmitFile,"r")
newSubmit = open(newSubmitFile,"w")

commands = {}

for line in origSubmit:
	if line[0] == "#":
		newSubmit.write(line+"\n")
	else:
		splitline = line.split(" ")
		sample = splitline[3]+"_"+splitline[5]
		commands[sample] = line

successful = []
	
for line in dirList:
	splitline = line.strip().split("_")
	if splitline[-1] == "mergebamalign.bam":
		successful.append(line[0:10])
	else:
		pass
		
for key in commands.keys():
	if key not in successful:
		newSubmit.write(commands[key])
		

dirList.close()
origSubmit.close()
newSubmit.close()