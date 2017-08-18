#!/bin/bash

#SBATCH -p serial_requeue
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 8000
#SBATCH -t 10:00:00
#SBATCH -J gzip_vcfs
#SBATCH -o ../logs/gzip_vcfs_%j.out
#SBATCH -e ../logs/gzip_vcfs_%j.err

module load tabix

for i in $(ls);
  do
    if [[ $i =~ .*\.vcf.gz$ ]];
    then
      gunzip $i
      i2=${i/.gz/}
      bgzip $i2
      tabix -p vcf $i
      echo "$i is fixed"
    fi
done
