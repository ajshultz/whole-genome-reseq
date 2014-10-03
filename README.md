whole-genome-reseq
===============

Scripts and material for the processing and analysis of low-coverage individually-barcoded population genomes. 

Note that some code modified from tsackton/ratite-genomics

Preprocessing
-------------

1. rename_files_*.sh: readname raw sequencing read files for ease of use
2. trim_fastq.sh: trim reads with Trimmomatic to remove adapter sequence

Map reads to assemblies
-----------------------

1. make_bwa_index.sh: index assembly
2. run_bwa_mem.sh: map reads to assembly, sort BAM, and dedup
(submit_mapping_jobs.sh submits this script to SLURM for each read/assembly combination)
3. merge_bams.sh: merge and second round dedup from BAM files produced by run_bwa_mem