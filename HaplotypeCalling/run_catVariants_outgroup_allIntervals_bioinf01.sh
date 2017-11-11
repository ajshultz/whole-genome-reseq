#!/bin/bash

SPECIES=$1

module load java/1.8.0_45-fasrc01

java -Xmx10g -XX:ParallelGCThreads=3 -cp ~/sw/bin/GenomeAnalysisTK.jar org.broadinstitute.gatk.tools.CatVariants \
--reference ../genome/final.assembly.homo.fa \
--variant outgroups/${SPECIES}_1.vcf.gz \
--variant outgroups/${SPECIES}_2.vcf.gz \
--variant outgroups/${SPECIES}_3.vcf.gz \
--variant outgroups/${SPECIES}_4.vcf.gz \
--variant outgroups/${SPECIES}_5.vcf.gz \
--variant outgroups/${SPECIES}_6.vcf.gz \
--variant outgroups/${SPECIES}_7.vcf.gz \
--variant outgroups/${SPECIES}_8.vcf.gz \
--variant outgroups/${SPECIES}_9.vcf.gz \
--variant outgroups/${SPECIES}_10.vcf.gz \
--variant outgroups/${SPECIES}_11.vcf.gz \
--variant outgroups/${SPECIES}_12.vcf.gz \
--variant outgroups/${SPECIES}_13.vcf.gz \
--variant outgroups/${SPECIES}_14.vcf.gz \
--variant outgroups/${SPECIES}_15.vcf.gz \
--variant outgroups/${SPECIES}_16.vcf.gz \
--variant outgroups/${SPECIES}_17.vcf.gz \
--variant outgroups/${SPECIES}_18.vcf.gz \
--variant outgroups/${SPECIES}_19.vcf.gz \
--variant outgroups/${SPECIES}_20.vcf.gz \
--variant outgroups/${SPECIES}_21.vcf.gz \
--variant outgroups/${SPECIES}_22.vcf.gz \
--variant outgroups/${SPECIES}_23.vcf.gz \
--variant outgroups/${SPECIES}_24.vcf.gz \
--variant outgroups/${SPECIES}_25.vcf.gz \
--variant outgroups/${SPECIES}_26.vcf.gz \
--variant outgroups/${SPECIES}_27.vcf.gz \
--variant outgroups/${SPECIES}_28.vcf.gz \
--variant outgroups/${SPECIES}_29.vcf.gz \
--variant outgroups/${SPECIES}_30.vcf.gz \
--output outgroups/${SPECIES}_Combined.vcf.gz \
--assumeSorted