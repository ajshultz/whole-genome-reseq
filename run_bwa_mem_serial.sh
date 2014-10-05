#!/bin/bash

#SBATCH -p serial_requeue
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 8000
#SBATCH -t 3:00:00
#SBATCH -J bwa_mem
#SBATCH -o bwa_mem_%j.out
#SBATCH -e bwa_mem_%j.err

module load centos6/bwa-0.7.7
module load centos6/samtools-0.1.19-fasrc01_gcc-4.4.7

GENOME=$1
LIB=$2
RUN=$3
GENOMEDB=$4

READ1="../data/trimmed/${GENOME}_${RUN}_trimmed_1P.fastq.gz"
READ2="../data/trimmed/${GENOME}_${RUN}_trimmed_2P.fastq.gz"
OUTPUT="$GENOME.$RUN"

bwa mem -t 1 -M -R '@RG\tID:'"$GENOME"'\tSM:'"$GENOME"'\tPL:Illumina_'"$RUN"'\tLB:'"$LIB"'\tPU:'"$LIB.$RUN" "${GENOMEDB}" $READ1 $READ2 | samtools view -b -T ${GENOMEDB}.fa - > ${OUTPUT}.bam
scontrol update JobId=$SLURM_JOBID NumNodes=1
./slurm_job_${SLURM_JOBID}_resize.sh 
java -Xmx2g -jar ~/sw/progs/picard-tools-1.121/SortSam.jar TMP_DIR=/scratch INPUT=${OUTPUT}.bam OUTPUT=${OUTPUT}.sorted.bam SORT_ORDER=coordinate
if [ $? -eq 0 ]
then
	rm ${OUTPUT}.bam
fi
java -Xmx2g -jar ~/sw/progs/picard-tools-1.121/MarkDuplicates.jar TMP_DIR=/scratch INPUT=${OUTPUT}.sorted.bam OUTPUT=${OUTPUT}.dedup.bam METRICS_FILE=${OUTPUT}.metrics.txt REMOVE_DUPLICATES=true
rm slurm_job_${SLURM_JOBID}_resize.*