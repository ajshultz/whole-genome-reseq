#!/bin/bash

#SBATCH -p serial_requeue
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 8000
#SBATCH -t 10:00:00
#SBATCH -J gzip_vcfs
#SBATCH -o ../logs/gzip_vcfs_%j.out
#SBATCH -e ../logs/gzip_vcfs_%j.err


for i in $(ls);do
    if [[ $i =~ .*\.vcf$ ]];
    	then
      	gzip $i
      	echo "$i is finished"
    fi
done