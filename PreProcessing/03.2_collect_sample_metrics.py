#! /usr/bin/env python

import re, sys, os, itertools, sets, getopt        # Load standard modules I often use

'''
Takes a directory (-f, <default .>) and input of sample names (-s), and can collect sample-level alignment (-a <output name>) and dedup (-d <output>) metrics. Will only collect for read pairs (both forward and reverse reads).
'''

def main(argv):
	try:
		opts,args = getopt.getopt(argv,'hf:s:a:d:',)
	except getopt.GetOptError:
		print "collect_sample_metrics.py -f <directory> -s <sample list> -a <alignment output name> -d <dedup output name>"
		sys.exit(2)
			
	directory = "."
	sampleNamesFile = ""
	alignFile = ""
	dedupFile = ""

	for opt, arg in opts:
		if opt == "-h":
			print "collect_sample_metrics.py -f <directory> -s <sample list> -a <alignment output name> -d <dedup output name>"
			sys.exit(2)
		elif opt == "-f":
			directory = arg
		elif opt == "-s":
			sampleNamesFile = arg
		elif opt == "-a":
			alignFile = arg
		elif opt == "-d":
			dedupFile = arg

	dirList = os.listdir(directory)
	sampleList = open(sampleNamesFile,"r")
	
	samples = []
	alignMetDict = {}
	dedupMetDict = {}

	for line in sampleList:
		samples.append(line.strip())
	
	#List files in directory, and search for files with alignment_metrics or dedup.metrics	
	for file in dirList:
		fileSplit = file.strip().split(".")
		if len(fileSplit)>2:
			if fileSplit[-2] == "alignment_metrics":
				aMet = open(file,"r")
				for line in aMet:
					splitline = line.split("\t")
					try:
					#Look for lines with the paired data at the sample level (no read group but sample in sample list, add to dict)
						if splitline[-3] in samples and splitline[-2] == "" and splitline[0] == "PAIR":
							alignMetDict[splitline[-3]] = line
					except (IndexError):
						pass
			elif fileSplit[-2] == "metrics" and fileSplit[-3] == "dedup":
				dMet = open(file,"r")
				for line in dMet:
					splitline = line.split("\t")
					try:
					#Look for lines with the first element in the sample list, add to dict
						if splitline[0] in samples:
							dedupMetDict[splitline[0]] = line
					except (IndexError):
						pass

	
	align = open(alignFile,"w")
	dedup = open(dedupFile,"w")
	
	align.write("SAMPLE\tCATEGORY\tTOTAL_READS\tPF_READS\tPCT_PF_READS\tPF_NOISE_READS\tPF_READS_ALIGNED\tPCT_PF_READS_ALIGNED\tPF_ALIGNED_BASES\tPF_HQ_ALIGNED_READS\tPF_HQ_ALIGNED_BASES\tPF_HQ_ALIGNED_Q20_BASES\tPF_HQ_MEDIAN_MISMATCHES\tPF_MISMATCH_RATE\tPF_HQ_ERROR_RATE\tPF_INDEL_RATE\tMEAN_READ_LENGTH\tREADS_ALIGNED_IN_PAIRS\tPCT_READS_ALIGNED_IN_PAIRS\tBAD_CYCLES\tSTRAND_BALANCE\tPCT_CHIMERAS\tPCT_ADAPTER\tSAMPLE\tLIBRARY\tREAD_GROUP\n")
	dedup.write("LIBRARY\tUNPAIRED_READS_EXAMINED\tREAD_PAIRS_EXAMINED\tSECONDARY_OR_SUPPLEMENTARY_RDS\tUNMAPPED_READS\tUNPAIRED_READ_DUPLICATES\tREAD_PAIR_DUPLICATES\tREAD_PAIR_OPTICAL_DUPLICATES\tPERCENT_DUPLICATION\tESTIMATED_LIBRARY_SIZE\n")
	
	for sample in samples:
		if sample in alignMetDict.keys():
			align.write(sample+"\t"+alignMetDict[sample])
		elif sample not in alignMetDict.keys():
			print sample+" does not have alignment metrics."
	
	for sample in samples:
		if sample in dedupMetDict.keys():
			dedup.write(dedupMetDict[sample])
		elif sample not in dedupMetDict.keys():
			print sample+" does not have dedup metrics."
	
	sampleList.close()
	align.close()
	dedup.close()

if __name__ == "__main__":
		main(sys.argv[1:])