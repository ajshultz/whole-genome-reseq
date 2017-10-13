#! /usr/bin/env python

import re, sys, os, sets, getopt, argparse

'''Script to take a fasta index file, or other text file where fasta sequence names have desired order for output fasta, and directory of individual fasta files (e.g. as created by create_anc_fasta.py), read them in and write them to a single output fasta in the order desired.
'''

def grab_scaff_name(faidx_line):
	faidx_line = faidx_line.strip().split("\t")
	return(faidx_line[0])

def fasta_read_write(in_handle,out,scaff_name):
	try:
		scaff_fasta = open(("%s.%s.fasta")%(in_handle,scaff_name),"r")
		for line in scaff_fasta:
			out.write(line)
		scaff_fasta.close()
	except IOError:
		print ("%s file is missing")%(scaff_name)

def main():
	parser = argparse.ArgumentParser()
        parser.add_argument("--faidx", help="fasta index with desired order")
        parser.add_argument("--input_handle", help="input_handle.scaffold_xx.fasta")
        parser.add_argument("--out", help="output file path and file name")
        
        args = parser.parse_args()
        out_file = args.out
        in_handle = args.input_handle
        faidx_file = args.faidx

	#Open index and output file
	faidx = open(faidx_file,"r")
	out = open(out_file,"w")
	
	#Iterate through faidx, grab scaffold name, and add appropriate scaffold file to output
	for line in faidx:
		scaff = grab_scaff_name(line)
		fasta_read_write(in_handle,out,scaff)
		
	faidx.close()
	out.close()

	
        
        
        

if __name__ == "__main__":
    main()