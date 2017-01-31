#! /usr/bin/env python

import re, sys, os, itertools, sets, getopt        # Load standard modules I often use
import numpy, gzip

'''
Takes the results from -doCounts pos files to compute the average, median, and standard deviation of coverage for each scaffold. Set up to work wiht a specific interval file, given as input <-i interval file>. The output filename is given by -o <filename>. 
'''

def main(argv):
	try:
		opts,args = getopt.getopt(argv,'ho:i:')
	except getopt.GetOptError:
		print "collapse_scaffold_coverage.py -o <output file name> -i <name of input .gzipped interval file>"
		sys.exit(2)
			
	outputFile=""
	intervalFile=""

	for opt, arg in opts:
		if opt == "-h":
			print "collapse_scaffold_coverage.py -o <output file name> -i <name of input .gzipped interval file>"
			sys.exit(2)
		elif opt == "-o":
			outputFile = arg
		elif opt == "-i":
			intervalFile = arg

	output = open(outputFile,"w")
	output.write("scaffold\tmedian_cov\tmean_cov\tsd_cov\tmax_cov\n")
	
	scaffold_res = {}

	scaffold_temp = {}
	interval = gzip.open(intervalFile,'rb')
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
	print "Interval "+str(i)+" is done."
			
	scaff_order = sorted(scaffold_res.keys())
	
	for scaff in scaff_order:
		res_temp = "\t".join(scaffold_res[scaff])
		output.write(str(scaff)+"\t"+res_temp+"\n")
				
	output.close()


if __name__ == "__main__":
		main(sys.argv[1:])