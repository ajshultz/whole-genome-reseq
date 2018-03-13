#!/bin/bash

#Run within HFWGreseq/genome/bedfiles

bedtools random -l 50000 -n 100 -seed 2356 -g ../final.assembly.homo.genome > genome_subset_5MB_50kbSegments_1.bed

bedtools intersect -a genome_subset_5MB_50kbSegments_1.bed -b All_HF_Whole_Genome_Include_Autosomal_Sites_d50.bed > genome_subset_5MB_50kbSegments_autosomal_1.bed

bedtools sort -i genome_subset_5MB_50kbSegments_autosomal_1.bed -faidx ../final.assembly.homo.fa.fai | awk '{print $1"\t"$2+1"\t"$3}'  > genome_subset_5MB_50kbSegments_autosomal_1.angsdsites



bedtools random -l 50000 -n 100 -seed 1532 -g ../final.assembly.homo.genome > genome_subset_5MB_50kbSegments_2.bed

bedtools intersect -a genome_subset_5MB_50kbSegments_2.bed -b All_HF_Whole_Genome_Include_Autosomal_Sites_d50.bed > genome_subset_5MB_50kbSegments_autosomal_2.bed

bedtools sort -i genome_subset_5MB_50kbSegments_autosomal_2.bed -faidx ../final.assembly.homo.fa.fai | awk '{print $1"\t"$2+1"\t"$3}'  > genome_subset_5MB_50kbSegments_autosomal_2.angsdsites



bedtools random -l 50000 -n 100 -seed 1669 -g ../final.assembly.homo.genome > genome_subset_5MB_50kbSegments_3.bed

bedtools intersect -a genome_subset_5MB_50kbSegments_3.bed -b All_HF_Whole_Genome_Include_Autosomal_Sites_d50.bed > genome_subset_5MB_50kbSegments_autosomal_3.bed

bedtools sort -i genome_subset_5MB_50kbSegments_autosomal_3.bed -faidx ../final.assembly.homo.fa.fai | awk '{print $1"\t"$2+1"\t"$3}'  > genome_subset_5MB_50kbSegments_autosomal_3.angsdsites




bedtools random -l 50000 -n 100 -seed 7422 -g ../final.assembly.homo.genome > genome_subset_5MB_50kbSegments_4.bed

bedtools intersect -a genome_subset_5MB_50kbSegments_4.bed -b All_HF_Whole_Genome_Include_Autosomal_Sites_d50.bed > genome_subset_5MB_50kbSegments_autosomal_4.bed

bedtools sort -i genome_subset_5MB_50kbSegments_autosomal_4.bed -faidx ../final.assembly.homo.fa.fai | awk '{print $1"\t"$2+1"\t"$3}'  > genome_subset_5MB_50kbSegments_autosomal_4.angsdsites



bedtools random -l 50000 -n 100 -seed 2843 -g ../final.assembly.homo.genome > genome_subset_5MB_50kbSegments_5.bed

bedtools intersect -a genome_subset_5MB_50kbSegments_5.bed -b All_HF_Whole_Genome_Include_Autosomal_Sites_d50.bed > genome_subset_5MB_50kbSegments_autosomal_5.bed

bedtools sort -i genome_subset_5MB_50kbSegments_autosomal_5.bed -faidx ../final.assembly.homo.fa.fai | awk '{print $1"\t"$2+1"\t"$3}'  > genome_subset_5MB_50kbSegments_autosomal_5.angsdsites




bedtools random -l 50000 -n 100 -seed 9714 -g ../final.assembly.homo.genome > genome_subset_5MB_50kbSegments_6.bed

bedtools intersect -a genome_subset_5MB_50kbSegments_6.bed -b All_HF_Whole_Genome_Include_Autosomal_Sites_d50.bed > genome_subset_5MB_50kbSegments_autosomal_6.bed

bedtools sort -i genome_subset_5MB_50kbSegments_autosomal_6.bed -faidx ../final.assembly.homo.fa.fai | awk '{print $1"\t"$2+1"\t"$3}'  > genome_subset_5MB_50kbSegments_autosomal_6.angsdsites




bedtools random -l 50000 -n 100 -seed 2457 -g ../final.assembly.homo.genome > genome_subset_5MB_50kbSegments_7.bed

bedtools intersect -a genome_subset_5MB_50kbSegments_7.bed -b All_HF_Whole_Genome_Include_Autosomal_Sites_d50.bed > genome_subset_5MB_50kbSegments_autosomal_7.bed

bedtools sort -i genome_subset_5MB_50kbSegments_autosomal_7.bed -faidx ../final.assembly.homo.fa.fai | awk '{print $1"\t"$2+1"\t"$3}'  > genome_subset_5MB_50kbSegments_autosomal_7.angsdsites




bedtools random -l 50000 -n 100 -seed 6365 -g ../final.assembly.homo.genome > genome_subset_5MB_50kbSegments_8.bed

bedtools intersect -a genome_subset_5MB_50kbSegments_8.bed -b All_HF_Whole_Genome_Include_Autosomal_Sites_d50.bed > genome_subset_5MB_50kbSegments_autosomal_8.bed

bedtools sort -i genome_subset_5MB_50kbSegments_autosomal_8.bed -faidx ../final.assembly.homo.fa.fai | awk '{print $1"\t"$2+1"\t"$3}'  > genome_subset_5MB_50kbSegments_autosomal_8.angsdsites




bedtools random -l 50000 -n 100 -seed 2682 -g ../final.assembly.homo.genome > genome_subset_5MB_50kbSegments_9.bed

bedtools intersect -a genome_subset_5MB_50kbSegments_9.bed -b All_HF_Whole_Genome_Include_Autosomal_Sites_d50.bed > genome_subset_5MB_50kbSegments_autosomal_9.bed

bedtools sort -i genome_subset_5MB_50kbSegments_autosomal_9.bed -faidx ../final.assembly.homo.fa.fai | awk '{print $1"\t"$2+1"\t"$3}'  > genome_subset_5MB_50kbSegments_autosomal_9.angsdsites




bedtools random -l 50000 -n 100 -seed 5822 -g ../final.assembly.homo.genome > genome_subset_5MB_50kbSegments_10.bed

bedtools intersect -a genome_subset_5MB_50kbSegments_10.bed -b All_HF_Whole_Genome_Include_Autosomal_Sites_d50.bed > genome_subset_5MB_50kbSegments_autosomal_10.bed

bedtools sort -i genome_subset_5MB_50kbSegments_autosomal_10.bed -faidx ../final.assembly.homo.fa.fai | awk '{print $1"\t"$2+1"\t"$3}'  > genome_subset_5MB_50kbSegments_autosomal_10.angsdsites

