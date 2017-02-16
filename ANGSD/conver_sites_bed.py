#! /usr/bin/env python

import re, sys, os, itertools, sets, getopt        # Load standard modules I often use
import numpy, gzip

'''
Convert previous exclude sites file to bed file by subtracting 1 from first position
'''

def main(argv):
	try:
		opts,args = getopt.getopt(argv,'ho:i:')
	except getopt.GetoptError:
		print "convert_sites_bed.py -o <output file> -i <input file>"
		sys.exit(2)
			
	outputFile=""
	inputFile=""

	for opt, arg in opts:
		if opt == "-h":
			print "convert_sites_bed.py -o <output file> -i <input file>"
			sys.exit(2)
		elif opt == "-o":
			outputFile = arg
		elif opt == "-i":
			inputFile = arg

	input = open(inputFile,"r")
	output = open(outputFile,"w")
	
	for line in input:
		line = line.strip().split("\t")
		line[1] = str(int(line[1])-1)
		newline = "\t".join(line)
		output.write(newline+"\n")
	
	
	input.close()
	output.close()


if __name__ == "__main__":
		main(sys.argv[1:])