#!/bin/bash

#SBATCH -p general
#SBATCH -n 128
#SBATCH --mem-per-cpu 8000
#SBATCH -t 8000
#SBATCH -J maker
#SBATCH -o mk_%j.out
#SBATCH -e mk_%j.err
#SBATCH --constraint=holyib

module load gcc/5.2.0-fasrc02 openmpi/2.0.1-fasrc01 maker/2.31.8-fasrc01

export LD_PRELOAD=/n/sw/fasrcsw/apps/Comp/gcc/5.2.0-fasrc02/openmpi/2.0.1-fasrc01/lib64/libmpi.so

AUGUSTUS_CONFIG_PATH=/n/sw/fasrcsw/apps/Core/augustus/3.0.3-fasrc02/config/

mpiexec -mca btl ^openib -np 128 maker maker_opts.ctl maker_bopts.ctl maker_exe.ctl -fix_nucleotides