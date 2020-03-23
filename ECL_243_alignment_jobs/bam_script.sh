#!/bin/bash -l
#SBATCH --array=1-2

# where Sam_file_list.txt is a text file containing the list of sam files

file=$(head -n "$SLURM_ARRAY_TASK_ID"q;d /home/sawalkes/Sam_file_list.txt | tail -1)
samtools view -bT /home/sawalkes/data/reference_genome/PeMa.fna.gz \
$file \
> $file.fastq.bam

# PeMA.fna.gz is the reference genome downloaded from ncbi