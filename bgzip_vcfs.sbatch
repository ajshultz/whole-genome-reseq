#!/bin/bash

#SBATCH -p serial_requeue
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 4000
#SBATCH -t 10:00:00
#SBATCH -J gzip_vcfs
#SBATCH -o ../logs/gzip_vcfs_%j.out
#SBATCH -e ../logs/gzip_vcfs_%j.err

module load tabix

for i in $(ls);
  do
    if [[ $i =~ .*\.vcf$ ]];
    then
      i2=${i/.vcf/.vcf.gz}
      bgzip $i
      tabix -p vcf $i2
      echo "$i is fixed"
    fi
done
