#! /usr/bin/env python

import re, sys, os, itertools, sets, getopt        # Load standard modules I often use


"""
This script will take in a fasta index (.fai) file (-f <name of file>), number of pieces for desired split (-n <default 10>), which program (-p <1 for GATK, 2 for ANGSD, GATK default>), and an output directory (-o <output dir>).
"""

def main(argv):
	try:
		opts,args = getopt.getopt(argv,'hf:o:n:p:',)
	except getopt.GetOptError:
		print "SplitFasta.py -f <name of file> -n <number of splits, default 10> -p <program: 1 for GATK, 2 for ANGSD> -o <output dir>"
		sys.exit(2)
			
	inputfai=''
	outputdir = './'
	n = 10
	program = 1

	for opt, arg in opts:
		if opt == "-h":
			print "SplitFasta.py -f <name of file> -n <number of splits, default 10> -p <program: 1 for GATK, 2 for ANGSD> -o <output dir>"
			sys.exit(2)
		elif opt == "-f":
			inputfai = arg
		elif opt == "-o":
			outputdir = arg
		elif opt == "-n":
			n = int(arg)
		elif opt == "-p":
			p = int(arg)
	
	#Open input		
	fai = open(inputfai,"r")

	faiList = []
	totLen = 1
	cumStart = []
	cumEnd = []
	
	#For each line in the .fai file, append data to a list, and create two additional lists with cumulative start and end positions.
	for line in fai:
		line = line.strip().split("\t")
		faiList.append(line)
		cumStart.append(totLen)
		totLen = totLen + int(line[1])
		cumEnd.append(totLen)

	#Create interval based on total length of scaffolds, and create list of start and end values
	interval = (totLen/n)+1
	intervalNums = range(1,n+1)
	intervalEnd = [x * interval for x in intervalNums]
	intervalStart = [(x - interval) + 1 for x in intervalEnd]
	
	#Create list of which file each scaffold should go to, depending on where it falls on the interval list. Note that scaffolds that span intervals will be moved to the preceeding interval.
	fileDes = []
	for i in range(len(faiList)):
		fileDes.append(0)
		for j in range(n):
			if cumStart[i] >= intervalStart[j] and cumEnd[i] < intervalEnd[j]:
				fileDes[i] = (j+1)
			elif j < (n-1) and cumStart[i] >= intervalStart[j] and cumEnd[i] < intervalEnd[(j+1)] and cumStart[i] < intervalStart[(j+1)]:
				fileDes[i] = (j+1)
	
	#Create list of output files based on input .fai handle.
	outHandle = inputfai[:-4]
	outList = []
	
	for i in range(n):
		outFile = (outputdir+outHandle+"_"+(str(i+1))+".interval_list")
		outList.append(open(outFile,"w"))
	
	if p == 1:			
	#Append scaffold name to appropriate output file.						
		for i in range(len(faiList)):
			outList[fileDes[(i)]-1].write(faiList[i][0]+"\n")
		
	elif p == 2:
		#Append scaffold name to appropriate output file, add colon for ANGSD.						
		for i in range(len(faiList)):
			outList[fileDes[(i)]-1].write(faiList[i][0]+":\n")	

	for i in range(n):
		outList[i].close()

	fai.close()

if __name__ == "__main__":
		main(sys.argv[1:])