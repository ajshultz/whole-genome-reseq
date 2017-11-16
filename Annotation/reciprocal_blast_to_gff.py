#! /usr/bin/env python


'''This script will use the results from two reciprocal blastp searches and update a gff file from one species with gene IDs from the other. The blastp searches must have returned single alignments in tab-delimited text output format (e.g. run as: blastp -db  Species1.fasta -query Species2.fasta -out ZF_blast_HF.blastp -evalue 0.000001 -outfmt 6 -num_alignments 1 -seg yes -soft_masking true -lcase_masking -max_hsps 1). It also requires the NCBI gene ID table for the taxon with gene IDs to translate accession numbers to NCBI gene IDs.

Arguments:
--gff <GFF file for species 1>
--blast1 <blastp results for species 1 blasted against species 2 database>
--blast2 <blastp results for species 2 blasted against species 1 database>
--geneid <Protein ID table for species 2 (tab-delimited file with gene ID in 6th column and protein ID in 8th column>
--out <output GFF file name>
'''

import re, sys, os, sets, argparse

#Take a file with blast results and return a dictionary with query ID as they key and target ID as the value
def blast_res_dict(blast_res_file):
	blast_res = open(blast_res_file,"r")
	blast_res_dict={}
	for line in blast_res:
		line = line.strip().split("\t")
		blast_res_dict[line[0]] = line[1]
	blast_res.close()
	return(blast_res_dict)

#Take a gene ID translation table (from NCBI) and create a dictionary with the accession ID as the key and gene ID as the value
def geneid_dict(geneidfile):
	geneid = open(geneidfile,"r")
	geneid_dict = {}
	for line in geneid:
		line = line.strip().split("\t")
		geneid_dict[line[7]] = line[5]
	geneid.close()
	return(geneid_dict)

#Take reciprocal BLAST result dictionaries, and only return a dictionary with species1:species2 keys for those that are reciprocal hits.
def reciprocal_match(blast1_res,blast2_res):
	clean_dict = {}
	for blast1_sp1val in blast1_res.keys():
		blast1_sp2val = blast1_res[blast1_sp1val]
		blast2_sp1val = "missing"
		try:
			blast2_sp1val = blast2_res[blast1_sp2val]
		except:
			pass
		if blast1_sp1val == blast2_sp1val:
			clean_dict[blast1_sp1val] = blast1_sp2val
		else:
			pass
			#print ("%s:%s, but %s:%s"%(blast1_sp1val,blast1_sp2val,blast2_sp1val,blast1_sp2val))
	return(clean_dict)

#Replace protein ID dictionary values to gene IDs		
def blast_protein_to_geneid(blast_res,geneid_dict):
	for key in blast_res:
		prot_id = blast_res[key]
		gene_id = geneid_dict[prot_id]
		blast_res[key] = gene_id
	return(blast_res)

#Take the ID from a gff file, split according to feature type, and replace the gene ID name with the blasted gene ID.
def translate_id(feature,id,clean_blastres):
	id = id.split(";")
	new_id = id
	if feature == "gene":
		id_id = id[0][3:]
		id_name = id[1][5:]
		try:
			id_id = clean_blastres[(id_id+"-mRNA-1")]
			id_name = clean_blastres[(id_name+"-mRNA-1")]
			new_id = "ID=%s;Name=%s"%(id_id,id_name)
		except:
			new_id = "ID=%s;Name=%s"%(id_id,id_name)
	
	elif feature == "mRNA":
		id_id = id[0][3:]
		id_parent = id[1][7:]
		id_name = id[2][5:]
		try:
			id_id = clean_blastres[id_id]
			id_parent = clean_blastres[id_parent+"-mRNA-1"]
			id_name = clean_blastres[id_name]
		except:
			pass
		new_id[0] = "ID=%s"%id_id
		new_id[1] = "Parent=%s"%id_parent
		new_id[2] = "Name=%s"%id_name
		new_id = ";".join(new_id)
	elif feature in ["CDS","exon", "three_prime_utr","five_prime_utr"]:
		id_id = id[0][3:]
		id_id_id = id_id.split(":")
		id_parent = id[1][7:]
		try:		
			id_id_id[0] = clean_blastres[id_id_id[0]]
			id_parent = clean_blastres[id_parent]
		except:
			pass
		id_id = ":".join(id_id_id)
		new_id[0] = "ID=%s"%id_id
		new_id[1] = "Parent=%s"%id_parent
		new_id = ";".join(new_id)		
	return(new_id)
	
	
	try:
		#Search for segment of ID that contains ID= statement
		id_seg_pos = [i for i, val in enumerate(id) if re.search("ID=",val)][0]
		id_seg = id[id_seg_pos]
		#Test if there is a name statement in there as well, indicating a gene If there is, split by a colon and replace name for both pieces, but add the '
		if re.search("Name=",id[id_seg_pos]):
			id_seg = id_seg.split(";")
			id_seg_1 = id_seg[0][3:]
			id_seg_2 = id_seg[1][5:]
			try:
				id_seg_1 = clean_blastres[(id_seg_1+"-mRNA-1")]
				id_seg_2 = clean_blastres[(id_seg_2+"-mRNA-1")]
				new_id_seg = "ID=%s;Name=%s"%(id_seg_1,id_seg_2)
			except:
				new_id_seg = "ID=%s;Name=%s"%(id_seg_1,id_seg_2)
		
		
	except:
		id = ":".join(id)
	return(id)

def main():
	#Parse arguments
	parser = argparse.ArgumentParser()
        parser.add_argument("--gff", help="GFF file for species 1")
        parser.add_argument("--blast1", help="blastp results for species 1 blasted against species 2 database")
        parser.add_argument("--blast2", help="blastp results for species 2 blasted against species 1 database")
        parser.add_argument("--geneid", help="Gene ID table for species 2 (tab-delimited file with gene ID in 3rd column and accession in 12th column")
        parser.add_argument("--out", help="output GFF file name")
        
        args = parser.parse_args()
        gfffile = args.gff
        blast1file = args.blast1
        blast2file = args.blast2
        geneidfile = args.geneid
        outfile = args.out
	
	#Create dictionaries from blast files
	blast1_res = blast_res_dict(blast1file)
	blast2_res = blast_res_dict(blast2file)
	
	#Create protein to gene ID translation dictionary
	geneid_trans = geneid_dict(geneidfile)
	
	#Clean blast results to only include reciprocal best hits.
	clean_blast1res = reciprocal_match(blast1_res,blast2_res)

	#Replace protein IDs with gene IDs
	clean_blast1res = blast_protein_to_geneid(clean_blast1res,geneid_trans)

	gff = open(gfffile,"r")
	out = open(outfile,"w")
	
	#Read gff file line by line. First check if line contains genome information, if not, write back to file (e.g. comments, separators). Then, check if genome feature is a gene, mRNA, exon, CDS, five_prime_utr, or three_prime_utr. If not one of those, write the line to file. If it is, try to translate the gene ID to the corresponding blasted gene ID
	for line in gff:
		newline = line.strip().split("\t")
		if len(newline) >= 9:
			feature = newline[2]
			if feature in ["gene","mRNA","CDS","exon","five_prime_utr","three_prime_utr"]:
				id = newline[8]
				new_id = translate_id(feature,id,clean_blast1res)
				newline[8] = new_id
				newline="\t".join(newline)
				out.write("%s\n"%newline)
			else:
				out.write(line)
		else:
			out.write(line)


	gff.close()
	out.close()

if __name__ == "__main__":
    main()