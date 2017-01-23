#!/bin/bash

#SBATCH -p general
#SBATCH -n 128
#SBATCH --mem-per-cpu 8000
#SBATCH -t 8000
#SBATCH -J maker
#SBATCH -o mk.out
#SBATCH -e mk.err
#SBATCH --constraint=holyib

module load gcc/4.8.2-fasrc01 openmpi/1.8.3-fasrc02 maker/2.31.8-fasrc01

LD_PRELOAD=/n/sw/fasrcsw/apps/Comp/gcc/4.8.2-fasrc01/openmpi/1.8.3-fasrc02/lib64/libmpi.so

mpiexec -mca btl ^openib -np 128 maker maker_opts.ctl maker_bopts.ctl maker_exe.ctl -fix_nucleotides