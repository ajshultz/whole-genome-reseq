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
'''
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
						if splitline[-3] in samples and splitline [-2] == "" and splitline[0] == "PAIR":
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
	

	align.close()
	dedup.close()
'''



if __name__ == "__main__":
		main(sys.argv[1:])