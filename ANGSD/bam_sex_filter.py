#! /usr/bin/env python

import re, sys, os, itertools, sets, getopt        # Load standard modules I often use

'''
Takes a directory of bam files (-f, <default .>) and csv files with sample names in the first column and sex in the second column (-s), and an output directory for new bam files (-o <output directory name>). Will output only bams of a given sex (-g <"male" or "female">).
'''

def main(argv):
	try:
		opts,args = getopt.getopt(argv,'hf:s:o:g:',)
	except getopt.GetoptError:
		print "bam_sex_filter.py -f <input bam directory> -s <sample and sex csv file> -o <output directory> -g <sex to keep, male or female>"
		sys.exit(2)
			
	inputDir = "."
	sampleNamesFile = ""
	outputDir = ""
	sexToKeep = ""

	for opt, arg in opts:
		if opt == "-h":
			print "bam_sex_filter.py -f <input bam directory> -s <sample and sex csv file> -o <output directory> -g <sex to keep, male or female>"
			sys.exit(2)
		elif opt == "-f":
			inputDir = arg
		elif opt == "-s":
			sampleNamesFile = arg
		elif opt == "-o":
			outputDir = arg
		elif opt == "-g":
			sexToKeep = arg

	dirList = os.listdir(inputDir)
	sampleList = open(sampleNamesFile,"r")
	
	male_samples = []
	female_samples = []

	for line in sampleList:
		line = line.strip().split(",")
		if line[1] == "male":
			male_samples.append(line[0])
		elif line[1] == "female":
			female_samples.append(line[0])
			
	print "Males: "+str(len(male_samples))
	print "Females: "+str(len(female_samples))
	
	if sexToKeep == "male":
		samples = male_samples
	elif sexToKeep == "female":
		samples = female_samples
	else:
		print "Please specify which sex to keep"
	
	
	#List files in directory, and search for files with alignment_metrics or dedup.metrics	
	for file in dirList:
		if re.findall("BamList",file):
			bam = open(inputDir+"/"+file,"r")
			newbam = open(outputDir+"/"+file,"w")
			for line in bam:
				if re.findall('[CC][_][0-9]{2}',line):
					newbam.write(line)
				elif re.findall('[CP][_][0-9]{2}',line):
					newbam.write(line)
				elif re.findall('dedup',line):
					newbam.write(line)
				else:
					newline = re.findall('[A-Z]{2}[_][0-9]{2}[_][0-9]{2}',line)[0]
					if newline in samples:
						newbam.write(line)
		
			newbam.close()
			bam.close()

	sampleList.close()

if __name__ == "__main__":
		main(sys.argv[1:])