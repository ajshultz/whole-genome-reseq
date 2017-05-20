#!/bin/bash

#SBATCH -p serial_requeue
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 4000
#SBATCH -t 10:00:00
#SBATCH -J gzip
#SBATCH -o logs/gzip_%j.out
#SBATCH -e logs/gzip_%j.err

FILE=$1

gzip ${FILE}