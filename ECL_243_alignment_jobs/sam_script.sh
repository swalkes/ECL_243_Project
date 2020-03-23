#!/bin/bash -l
#SBATCH -D /home/sawalkes/ncbi/public/sra
#SBATCH -J sam_files
#SBATCH -t 24:00:00
#SBATCH -n 10
#SBATCH -p High
#SBATCH --mem=16000
#SBATCH -o bwa_run.out
#SBATCH -e bwa_run.err
#SBATCH --array=1-2 

dos2unix Fastq_list.txt # converts txt file to be read by unix, gets rid of ^M
file=$(head -n $SLURM_ARRAY_TASK_ID /home/sawalkes/Fastq_list.txt | tail -1)
bwa mem -M -t 8 /home/sawalkes/data/reference_genome/genome_index \
$file \ 
> $file.sam
