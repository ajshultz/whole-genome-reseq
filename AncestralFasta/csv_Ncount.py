#! /usr/bin/env python

import re, sys, os, sets, getopt, argparse

'''Script to take a fasta index file, or other text file where fasta sequence names have desired order for output fasta, and directory of individual csv files (e.g. as created by create_anc_fasta.py), reads them in and counts the total number of bases tested, and nubmer of Ns included in output.
'''

def grab_scaff_name(faidx_line):
	faidx_line = faidx_line.strip().split("\t")
	return(faidx_line[0])

def fasta_read_count(in_handle,scaff_name,ncount,basecount):
	try:
		scaff_csv = open(("%s.%s.csv")%(in_handle,scaff_name),"r")
		for line in scaff_csv:
			line = line.strip().split(",")
			if line[0] != "chr":
				basecount += 1
				if line[8] == "N":
					ncount += 1
		scaff_csv.close()
		return(ncount,basecount)
	except IOError:
		print ("%s file is missing")%(scaff_name)

def main():
	parser = argparse.ArgumentParser()
        parser.add_argument("--faidx", help="fasta index with desired order")
        parser.add_argument("--input_handle", help="input_handle.scaffold_xx.csv")
        parser.add_argument("--out", help="output file path and file name")
        
        args = parser.parse_args()
        out_file = args.out
        in_handle = args.input_handle
        faidx_file = args.faidx

	#Open index and output file
	faidx = open(faidx_file,"r")
	out = open(out_file,"w")
	
	#Iterate through faidx, grab scaffold name, and count number of bases tested, and number of Ns in file.
	Ns = 0
	bases = 0
	for line in faidx:
		scaff = grab_scaff_name(line)
		Ns,bases = fasta_read_count(in_handle,scaff,Ns,bases)
	
	out.write("%d total bases tested\n"%bases)
	out.write("%d Ns written to ancestral fasta"%Ns)
	
	faidx.close()
	out.close()

	
        
        
        

if __name__ == "__main__":
    main()