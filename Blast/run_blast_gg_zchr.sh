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

tblastn -query ./z-linked_proteins/gallus_gallus/out.fa -out gallus_gallus_z-linked_output.txt -outfmt 7 -db HoFi