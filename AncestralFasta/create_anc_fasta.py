#! /usr/bin/env python

import re, sys, os, sets, getopt
from itertools import izip        
import gzip
import re
import sys
import subprocess
import os
import argparse

'''
Some code borrowed and modified from Sonal Singhal here: https://github.com/singhal/postdoc/blob/master/simple_ancestral_alleles.py
Need to run for each scaffold (chr)
'''

def get_vcf(vcffile, type):
        file = gzip.open(vcffile, 'r')
        var = dict()
        for l in file:
                if not re.match("#", l):
                        d = re.split('\t', l)

                        alleles = [d[3]] + re.split(",", d[4])
                        
                        # do not want to include indels in this variant dictionary
                        # cannot use these to polarize
                        indel = False
                        for allele in alleles:
                            if len(allele) > 1:
                            	#Added this additional if statement because with only 1 sample GATK cannot distinguish the possibility of another allele. For our purposes we just set that to the reference allele though.
                            	if allele != "<NON_REF>":
                                	indel = True
                        
                        if not indel:
                                # do not want any alleles included that are at zero frequency
                                # not useful for anything but to show ref, and we already have that
                                allele_counts = dict()
                                for i in range(len(alleles)):
                                        allele_counts[alleles[i]] = len(re.findall('\s%s[\/|\:]' % i, l)) + len(re.findall('\/%s' % i, l))
                                tot_n = sum(allele_counts.values())
                                
				if tot_n > 0:

					af_real = dict()
	
					for i in allele_counts:

                	                        af = allele_counts[i] / float(tot_n)
                        	                if af > 0:
                                	        	af_real[i] = '%.3f' % af
					# for the ingroup, do not want to include fixed or polyallelic sites, so deal with that here
					if type == 'in':
						if len(af_real) == 2:
                                			var[int(d[1])] = af_real
					else:
						var[int(d[1])] = af_real
        file.close()
        return var


def get_history(pos, var_out, ref):
	if pos in var_out:
		if len(var_out[pos]) == 1:
			return var_out[pos].keys()[0]	
		else:
			return var_out[pos]
	else:
		return ref

#Need to make a version to account for the distance of far outgroups - I am using a vcf with invariant sites, so any sites not included in the variant dictionary should be set to N instead of the ref.
def get_history_farout(pos, var_out, ref):
	if pos in var_out:
		if len(var_out[pos]) == 1:
			return var_out[pos].keys()[0]	
		else:
			return var_out[pos]
	else:
		return 'N'


def check_equal(iterator):
	return len(set(iterator)) <= 1

#Added 5th outgroup (we have 3 far outgroups)
def call_ancestral_allele(b_in, b_out1, b_out2, b_out3, b_out4, b_out5):
	
	near_out = []
	far_out1 = 'N'
	far_out2 = []
	
	#If not a dictionary, add base to near_out. If it is a dictionary (polymorphic), check whether both bases are shared with the ingroup. If only 1, add that to near_out. If both (or missing data), nothing added to near_out.
	if not isinstance(b_out1, dict):
		if b_out1 in ['A', 'T', 'C', 'G']:
			near_out.append(b_out1)
	if isinstance(b_out1, dict):
		joint_poly = list(b_out1.viewkeys() & b_in.keys())
		if joint_poly == 1:
			near_out.append(joint_poly[0])
			
	if not isinstance(b_out2, dict):
		if b_out2 in ['A', 'T', 'C', 'G']:
			near_out.append(b_out2)
	if isinstance(b_out2, dict):
		joint_poly = list(b_out2.viewkeys() & b_in.keys())
		if joint_poly == 1:
			near_out.append(joint_poly[0])
			
	if not isinstance(b_out3, dict):
		if b_out3 in ['A', 'T', 'C', 'G']:
			far_out1 = b_out3
	if isinstance(b_out3, dict):
		joint_poly = list(b_out3.viewkeys() & b_in.keys())
		if joint_poly == 1:
			far_out1 = joint_poly[0]
					
	if not isinstance(b_out4, dict):
		if b_out4 in ['A', 'T', 'C', 'G']:
			far_out2.append(b_out4)
	if isinstance(b_out4, dict):
		joint_poly = list(b_out4.viewkeys() & b_in.keys())
		if joint_poly == 1:
			far_out2.append(joint_poly[0])	

	if not isinstance(b_out5, dict):
		if b_out5 in ['A', 'T', 'C', 'G']:
			far_out2.append(b_out5)
	if isinstance(b_out5, dict):
		joint_poly = list(b_out5.viewkeys() & b_in.keys())
		if joint_poly == 1:
			far_out2.append(joint_poly[0])	
	
	
	#Calculate near out ancestor
	if len(near_out) == 2:
		if check_equal(near_out):
			near_out_anc = near_out[0]
		else:
			near_out_anc = near_out
	elif len(near_out) == 1:
		near_out_anc = near_out[0]
	else:
		near_out_anc = 'N'
		
	#Calculate far_out2 ancestor
	if len(far_out2) == 2:
		if check_equal(far_out2):
			far_out2_anc = far_out2[0]
		else:
			far_out2_anc = far_out2
	elif len(far_out2) == 1:
		far_out2_anc = far_out2[0]
	else:
		far_out2_anc = 'N'
	

	#Ancestral state calculation rules:
	#near_out_anc is not polymorphic:
	if not isinstance(near_out_anc, list):
		if near_out_anc == far_out1 or near_out_anc == far_out2_anc:
			return near_out_anc
		elif near_out_anc != far_out1 and isinstance(far_out2_anc, list):
			return 'N'
		elif near_out_anc != 'N' and far_out1 == 'N' and far_out2_anc == 'N':
			return near_out_anc
		elif near_out_anc == 'N' and far_out1 == far_out2_anc:
			return far_out1
		elif near_out_anc != far_out1 and far_out1 == far_out2_anc:
			if far_out1 in b_in:
				return far_out1
			elif near_out_anc in b_in:
				return near_out_anc
	
	#near_out_anc is polymorphic
	elif isinstance(near_out_anc, list):
		if far_out1 == far_out2_anc:
			return far_out1
		elif far_out1 in near_out_anc and far_out2_anc not in near_out_anc:
			return far_out1
		else:
			return 'N'

	return 'N'
	
def get_chromosome(genome, chr):
	outfile = genome + '_' + chr
	subprocess.call('samtools faidx %s %s > %s' % (genome, chr, outfile), shell=True)
	out_f = open(outfile, 'r')
	locus_name = out_f.next()
	return outfile, out_f

#Make sure to send this to the vcf reader
def get_chromosome_vcf(vcf_file, species, chr):
	outfile = species + '_' + chr + '.vcf.gz'
	subprocess.call('/n/home13/ashultz/sw/progs/vcftools-0.1.15/binvcftools --gzvcf %s --chr %s --recode --stdout | gzip -c > %s' %(vcf_file, chr, outfile), shell=True)
	#subprocess.call('/Users/allisonshultz/miniconda2/bin/vcftools --gzvcf %s --chr %s --recode --stdout | gzip -c > %s' %(vcf_file, chr, outfile), shell=True)
	return outfile

def pp_hist(base_info):
	if isinstance(base_info, dict):
		return "|".join("%s:%s" % bp_pair for bp_pair in base_info.items())
	else:
		return base_info

#As everything is mapped to the HF reference for me, I can delete the fasta calls outside of the reference, and the various position arguments.
def trawl_genome(out_file, anc_fasta_file, chr, f_ref, var_in, var_out1, var_out2, var_out3, var_out4, var_out5):
	out = open(out_file, 'w')
	anc_fasta = open(anc_fasta_file, "w")
	out.write('chr,position,ingroup,outgroup1,outgroup2,faroutgroup3,faroutgroup4,faroutgroup5,ancestralallele\n')
	anc_fasta.write('>%s\n' %(chr))
	
	for line_count, (l_ref) in enumerate(f_ref):
		l_ref = l_ref.strip()
		
		if len(l_ref) != 60:
			print 'Fasta lines not 60 bases, oh no!'
			quit()

		for ix, (b_ref) in enumerate(l_ref):
			# get the current genome position, need to iterate through reference and get each base value.	
			# need to add 1 because python indexes at 0; genomes are at index 1
			pos = line_count * 60 + ix + 1
			
			# this is a variable position
			if pos in var_in:
				b_in = var_in[pos]
				
				b_out1call = get_history(pos, var_out1, b_ref)
				b_out2call = get_history(pos, var_out2, b_ref)
				b_out3call = get_history_farout(pos, var_out3, b_ref)
				b_out4call = get_history_farout(pos, var_out4, b_ref)
				b_out5call = get_history_farout(pos, var_out5, b_ref)
				
				anc_allele = call_ancestral_allele(b_in, b_out1call, b_out2call, b_out3call, b_out4call, b_out5call)

				out.write('%s,%s,%s,%s,%s,%s,%s,%s,%s\n' % \
					(chr, pos, pp_hist(b_in), pp_hist(b_out1call), pp_hist(b_out2call), pp_hist(b_out3call), pp_hist(b_out4call), pp_hist(b_out5call), anc_allele))
				anc_fasta.write(anc_allele)
				

			else:
				anc_fasta.write(b_ref)
							
	out.close()
	anc_fasta.close()
	return


def clean_up(chr_out, f_out):
	f_out.close()
	os.remove(chr_out)
	

def main():
	parser = argparse.ArgumentParser()
        parser.add_argument("--chr", help="chromosome for which to run analysis")
        parser.add_argument("--ref", help="reference genome fasta for which to run analysis")
        parser.add_argument("--vcf_in", help="vcf for ingroup for which to run analysis")
        parser.add_argument("--vcf_out1", help="vcf for outgroup 1 (CC) for which to run analysis")
        parser.add_argument("--vcf_out2", help="vcf for outgroup 2 (CP) for which to run analysis")
        parser.add_argument("--vcf_out3", help="vcf for outgroup 3 (PinEnu) for which to run analysis")
        parser.add_argument("--vcf_out4", help="vcf for outgroup 4 (CarEry) for which to run analysis")
        parser.add_argument("--vcf_out5", help="vcf for outgroup 5 (UraSib) for which to run analysis")
        parser.add_argument("--out", help="output file path and stem for results")
        
        args = parser.parse_args()
        chr = args.chr
        genome_ref = args.ref
        vcf_in = args.vcf_in
        vcf_out1 = args.vcf_out1
        vcf_out2 = args.vcf_out2
        vcf_out3 = args.vcf_out3
        vcf_out4 = args.vcf_out4
        vcf_out5 = args.vcf_out5
        out_stem = args.out

	#For real script will need to add a step to run it through the vcftools command to select the scaffold of interest.
	#HF
 	#vcf_in = 'All_HFs_testfile.vcf.gz'
 	#CC and CP
	#vcf_out1 = 'All_CCs_testfile.vcf.gz'
	sp1 = 'CC'
	#vcf_out2 = 'All_CPs_testfile.vcf.gz'
	sp2 = 'CP'
	#Distant finches
	#vcf_out3 = 'PinEnu_1.vcf.gz'
	sp3 = 'PinEnu'
	#vcf_out4 = 'CarEry_1.vcf.gz'
	sp4 = 'CarEry'
	#vcf_out5 = 'UraSib_1.vcf.gz'
	sp5 = 'UraSib'

	#Reference (HF) fasta and output files (output csv and new fasta with ancestral alleles)
 	#genome_ref = 'final.assembly.homo.fa'
 	out_file = '%s_ancestral_allele.%s.csv' % (out_stem,chr)
 	anc_fasta_file = '%s_ancestral_allele.%s.fasta' % (out_stem,chr)
	
 	var_in = get_vcf(vcf_in, 'in')

	vcf_chr_out1 = get_chromosome_vcf(vcf_out1, sp1, chr) 	
 	var_out1 = get_vcf(vcf_out1, 'out')	
 	
	vcf_chr_out2 = get_chromosome_vcf(vcf_out2, sp2, chr) 	
 	var_out2 = get_vcf(vcf_out2, 'out')
	
	vcf_chr_out3 = get_chromosome_vcf(vcf_out3, sp3, chr)
 	#vcf_chr_out3 = 'PinEnu_scaffold_0_test.vcf.gz'
 	var_out3 = get_vcf(vcf_chr_out3, 'out')
	 	
 	vcf_chr_out4 = get_chromosome_vcf(vcf_out4, sp4, chr)
 	#vcf_chr_out4 = 'CarEry_scaffold_0_test.vcf.gz'
 	var_out4 = get_vcf(vcf_chr_out4, 'out')

 	vcf_chr_out5 = get_chromosome_vcf(vcf_out5, sp5, chr)
 	#vcf_chr_out5 = 'UraSib_scaffold_0_test.vcf.gz'
 	var_out5 = get_vcf(vcf_chr_out5, 'out')


 	chr_ref, f_ref = get_chromosome(genome_ref, chr)

 	trawl_genome(out_file, anc_fasta_file, chr, f_ref, var_in, var_out1, var_out2, var_out3, var_out4, var_out5)
 	
##Need to add clean up for vcfs - remove scaffold files that have been created.
 	clean_up(vcf_chr_out1, var_out1)
 	clean_up(vcf_chr_out2, var_out2)
 	clean_up(vcf_chr_out3, var_out3)
 	clean_up(vcf_chr_out4, var_out4)
  	clean_up(vcf_chr_out5, var_out5)
 	clean_up(chr_ref, f_ref)



if __name__ == "__main__":
    main()