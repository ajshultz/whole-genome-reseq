#!/bin/bash

#SBATCH -p serial_requeue
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 6000
#SBATCH -t 0-05:00:00
#SBATCH -J blast_zchr
#SBATCH -o blast_zchr_%j.out
#SBATCH -e blast_zchr_%j.err
#SBATCH --constraint=holyib

module load blast

tblastn -query ./z-linked_proteins/zebra_finch/out.fa -out tae_gut_z-linked_output.txt -outfmt 7 -db HoFi