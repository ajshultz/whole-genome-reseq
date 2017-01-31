#! /usr/bin/env python

import re, sys, os, itertools, sets, getopt        # Load standard modules I often use

'''
Takes a directory (-f, <default .>) and input of sample names (-s), and checks whether or not haplotype caller finished. Will make a new script to resubmit those jobs that previously failed. You have to specify the number of intervals (-n <default 10>). Note that this needs to be run from directory that contains interval directories, named "interval_list_n". You also can include a list of samples/intervals that need GATK 3.7 (-v <file of samples_interval>). The new sbatch script filename is given by -o <filename>
'''

def main(argv):
	try:
		opts,args = getopt.getopt(argv,'hd:s:n:v:o:')
	except getopt.GetOptError:
		print "haplocaller_check.py -d <directory> -s <sample list> -n <number of intervals> -v <file of sample_intervals> -o <output file name>"
		sys.exit(2)
			
	directory = "."
	sampleNamesFile = ""
	intervalNum = 10
	newVersionFile=""
	outputFile=""

	for opt, arg in opts:
		if opt == "-h":
			print "haplocaller_check.py -d <directory> -s <sample list> -n <number of intervals -v <file of sample_intervals> -o <output file name>"
			sys.exit(2)
		elif opt == "-d":
			directory = arg
		elif opt == "-s":
			sampleNamesFile = arg
		elif opt == "-n":
			intervalNum = int(arg)
		elif opt == "-v":
			newVersionFile = arg
		elif opt == "-o":
			outputFile = arg

		
	dirList = {}
	sampleList = open(sampleNamesFile,"r")
	intervalList = range(1,intervalNum+1)
	newVersionList = open(newVersionFile,"r")
	output = open(outputFile,"w")
	
	output.write("#!/bin/bash\n\n")

	for i in intervalList:
		dirList["int_"+str(i)] = os.listdir(directory+"/interval_list_"+str(i))
	
	samples = []

	for line in sampleList:
		samples.append(line.strip())
	
	newVersion = []
	
	if len(newVersionFile) > 1:
		for line in newVersionList:
			newVersion.append(line.strip())
	
	for ind in samples:
		for i in intervalList:
			if ind+"_"+str(i)+".raw.g.vcf.idx" not in dirList["int_"+str(i)]:
				if ind+"_"+str(i) in newVersion:
					output.write("sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/HaplotypeCalling/run_HaplotypeCaller_LowCovSpecificIntervalRealigned3.7.sbatch "+ind+" "+str(i)+"\nsleep 1\n")
				else: 
					output.write("sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/HaplotypeCalling/run_HaplotypeCaller_LowCovSpecificIntervalRealigned.sbatch "+ind+" "+str(i)+"\nsleep 1\n")
				
		
	sampleList.close()
	newVersionList.close()
	output.close()


if __name__ == "__main__":
		main(sys.argv[1:])