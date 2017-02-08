#! /usr/bin/env python

import re, sys, os, itertools, sets, getopt        # Load standard modules I often use
import numpy, gzip

'''
Splits counts and pos files from interval 19 into multiple smaller intervals.
'''

def main(argv):
	try:
		opts,args = getopt.getopt(argv,'ho:i:')
	except getopt.GetOptError:
		print "collapse_scaffold_coverage_split_Int19.py -o <output handle> -i <name of input .gzipped interval handle> "
		sys.exit(2)
			
	outputHandle="All_HF_Int19"
	intervalHandle="All_HF_Int19_Counts.txt"

	for opt, arg in opts:
		if opt == "-h":
			print "collapse_scaffold_coverage_split_Int19.py -o <output handle> -i <name of input .gzipped interval handle> "
			sys.exit(2)
		elif opt == "-o":
			outputHandle = arg
		elif opt == "-i":
			intervalHandle = arg

	posInfo = gzip.open(intervalHandle+".pos.gz","rb")
	indCount = gzip.open(intervalHandle+".counts.gz","rb")

	outfile_count = []
	outfile_pos = []

	for i in range(1,31):
		outfile_count.append(gzip.open(outputHandle+"_"+str(i)+"_Counts.txt.counts.gz","w"))
		outfile_pos.append(gzip.open(outputHandle+"_"+str(i)+"_Counts.txt.pos.gz","w"))

	#Iterate through pos and counts files simultaneously
	for pos, counts in itertools.izip(posInfo,indCount):
		newpos = pos.strip().split("\t")
		newcounts = counts.strip().split("\t")
		#For each position but the header, extract the scaffold and position, count the number of individuals sequenced, and the mean coverage for all individuals, as well as those with any reads.
		if newpos[0] == "chr":
			for i in range(0,30):
				outfile_count[i].write(counts)
				outfile_pos[i].write(pos)
		elif newpos[0][0:11] == "scaffold_60":
			outfile_count[0].write(counts)
			outfile_pos[0].write(pos)
		elif newpos[0][0:11] == "scaffold_61":
			outfile_count[1].write(counts)
			outfile_pos[1].write(pos)
		elif newpos[0][0:11] == "scaffold_62":
			outfile_count[2].write(counts)
			outfile_pos[2].write(pos)
		elif newpos[0][0:11] == "scaffold_63":
			outfile_count[3].write(counts)
			outfile_pos[3].write(pos)
		elif newpos[0][0:11] == "scaffold_64":
			outfile_count[4].write(counts)
			outfile_pos[4].write(pos)
		elif newpos[0][0:11] == "scaffold_65":
			outfile_count[5].write(counts)
			outfile_pos[5].write(pos)
		elif newpos[0][0:11] == "scaffold_66":
			outfile_count[6].write(counts)
			outfile_pos[6].write(pos)
		elif newpos[0][0:11] == "scaffold_67":
			outfile_count[7].write(counts)
			outfile_pos[7].write(pos)
		elif newpos[0][0:11] == "scaffold_68":
			outfile_count[8].write(counts)
			outfile_pos[8].write(pos)
		elif newpos[0][0:11] == "scaffold_69":
			outfile_count[9].write(counts)
			outfile_pos[9].write(pos)
		elif newpos[0][0:11] == "scaffold_70":
			outfile_count[10].write(counts)
			outfile_pos[10].write(pos)
		elif newpos[0][0:11] == "scaffold_71":
			outfile_count[11].write(counts)
			outfile_pos[11].write(pos)
		elif newpos[0][0:11] == "scaffold_72":
			outfile_count[12].write(counts)
			outfile_pos[12].write(pos)
		elif newpos[0][0:11] == "scaffold_73":
			outfile_count[13].write(counts)
			outfile_pos[13].write(pos)
		elif newpos[0][0:11] == "scaffold_74":
			outfile_count[14].write(counts)
			outfile_pos[14].write(pos)
		elif newpos[0][0:11] == "scaffold_75":
			outfile_count[15].write(counts)
			outfile_pos[15].write(pos)
		elif newpos[0][0:11] == "scaffold_76":
			outfile_count[16].write(counts)
			outfile_pos[16].write(pos)
		elif newpos[0][0:11] == "scaffold_77":
			outfile_count[17].write(counts)
			outfile_pos[17].write(pos)
		elif newpos[0][0:11] == "scaffold_78":
			outfile_count[18].write(counts)
			outfile_pos[18].write(pos)
		elif newpos[0][0:11] == "scaffold_79":
			outfile_count[19].write(counts)
			outfile_pos[19].write(pos)
		elif newpos[0][0:11] == "scaffold_80":
			outfile_count[20].write(counts)
			outfile_pos[20].write(pos)
		elif newpos[0][0:11] == "scaffold_81":
			outfile_count[21].write(counts)
			outfile_pos[21].write(pos)
		elif newpos[0][0:11] == "scaffold_82":
			outfile_count[22].write(counts)
			outfile_pos[22].write(pos)
		elif newpos[0][0:11] == "scaffold_83":
			outfile_count[23].write(counts)
			outfile_pos[23].write(pos)
		elif newpos[0][0:11] == "scaffold_84":
			outfile_count[24].write(counts)
			outfile_pos[24].write(pos)
		elif newpos[0][0:11] == "scaffold_85":
			outfile_count[25].write(counts)
			outfile_pos[25].write(pos)
		elif newpos[0][0:11] == "scaffold_86":
			outfile_count[26].write(counts)
			outfile_pos[26].write(pos)
		elif newpos[0][0:11] == "scaffold_87":
			outfile_count[27].write(counts)
			outfile_pos[27].write(pos)
		elif newpos[0][0:11] == "scaffold_88":
			outfile_count[28].write(counts)
			outfile_pos[28].write(pos)
		elif newpos[0][0:11] == "scaffold_89":
			outfile_count[29].write(counts)
			outfile_pos[29].write(pos)
		elif newpos[0][0:11] == "scaffold_90":
			outfile_count[30].write(counts)
			outfile_pos[30].write(pos)
		elif newpos[0][0:11] == "scaffold_91":
			outfile_count[30].write(counts)
			outfile_pos[30].write(pos)
	
	
	posInfo.close()
	indCount.close()			
	for i in range(0,30):
		outfile_count[i].close()
		outfile_pos[i].close()


if __name__ == "__main__":
		main(sys.argv[1:])