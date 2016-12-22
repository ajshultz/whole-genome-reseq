#! /usr/bin/env python

import sys


#Take a file with the list of all files in a directory, identify which libraries do not have deduped files, and prints those names to the screen. First input should be list of all files in directory, second should be original submission file.

dirListFile = sys.argv[1]
origSubmitFile = sys.argv[2]

dirList = open(dirListFile,"r")
origSubmit = open(origSubmitFile,"r")

commands = {}

for line in origSubmit:
	if line[0] == "#":
		pass
	else:
		splitline = line.strip().split(" ")
		sample = splitline[2]
		commands[sample] = line


successful = []
	
for line in dirList:
	splitline = line.strip().split(".")
	if len(splitline) > 1:
		if splitline[1] == "validate":
			successful.append(splitline[0])
		else:
			pass
		
for key in commands.keys():
	if key not in successful:
		print key+" has no validation file."
		

dirList.close()
origSubmit.close()