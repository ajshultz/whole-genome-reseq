#! /usr/bin/env python

import re, sys, os, itertools, sets, getopt        # Load standard modules I often use
import numpy, gzip

'''
Takes a directory (-f, <default .>) and cycles through results from -doCounts pos files to compute the average, median, and standard deviation of coverage for each scaffold. Set up to work for 20 intervals, with interval 20 split up into 30 additional intervals. The output filename is given by -o <filename>
'''

def main(argv):
	try:
		opts,args = getopt.getopt(argv,'hd:o:')
	except getopt.GetOptError:
		print "collapse_scaffold_coverage.py -d <directory> -o <output file name>"
		sys.exit(2)
			
	directory = "."
	outputFile=""

	for opt, arg in opts:
		if opt == "-h":
			print "collapse_scaffold_coverage.py -d <directory> -o <output file name>"
			sys.exit(2)
		elif opt == "-d":
			directory = arg
		elif opt == "-o":
			outputFile = arg

		
	dirList = {}
	intervalList = range(1,20)
	intervalList_int20= range(1,31)
	output = open(outputFile,"w")
	output.write("scaffold\tmedian_cov\tmean_cov\tsd_cov\tmax_cov\n")
	
	scaffold_res = {}

	for i in intervalList:
		scaffold_temp = {}
		interval = gzip.open('All_HF_Int'+str(i)+'_Counts.txt.pos.gz','rb')
		for line in interval:
			line = line.strip().split("\t")
			if line[0] == "chr":
				pass
			else:
				scaff=line[0]
				scaff=scaff.split("_")
				if int(scaff[1]) not in scaffold_temp.keys():
					scaffold_temp[int(scaff[1])]=[int(line[2])]
				else:
					scaffold_temp[int(scaff[1])].append(int(line[2]))
		interval.close()
		for scaff in scaffold_temp.keys():
			#print scaffold_temp[scaff]
			scaff_res=[str(numpy.median(scaffold_temp[scaff]))]
			scaff_res.append(str(round(numpy.mean(scaffold_temp[scaff]),1)))
			scaff_res.append(str(round(numpy.std(scaffold_temp[scaff]),1)))
			scaff_res.append(str(max(scaffold_temp[scaff])))
			scaffold_res[scaff]=scaff_res

	for i in intervalList_int20:
		scaffold_temp = {}
		interval = gzip.open('All_HF_Int20_'+str(i)+'_Counts.txt.pos.gz','rb')
		for line in interval:
			line = line.strip().split("\t")
			if line[0] == "chr":
				pass
			else:
				scaff=line[0]
				scaff=scaff.split("_")
				if int(scaff[1]) not in scaffold_temp.keys():
					scaffold_temp[int(scaff[1])]=[int(line[2])]
				else:
					scaffold_temp[int(scaff[1])].append(int(line[2]))
		interval.close()
		for scaff in scaffold_temp.keys():
			#print scaffold_temp[scaff]
			scaff_res=[str(numpy.median(scaffold_temp[scaff]))]
			scaff_res.append(str(round(numpy.mean(scaffold_temp[scaff]),1)))
			scaff_res.append(str(round(numpy.std(scaffold_temp[scaff]),1)))
			scaff_res.append(str(max(scaffold_temp[scaff])))
			scaffold_res[scaff]=scaff_res

			
	scaff_order = sorted(scaffold_res.keys())
	
	for scaff in scaff_order:
		res_temp = "\t".join(scaffold_res[scaff])
		output.write(str(scaff)+"\t"+res_temp+"\n")

			
		
				
	output.close()


if __name__ == "__main__":
		main(sys.argv[1:])