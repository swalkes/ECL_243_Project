#!/bin/bash -l

# loads sratoolkit module required to download SRA files and convert to fastq format
module load sratoolkit

## SraAccList.txt is a text file containing the names of all .sra files on ncbi
prefetch --option-file SraAccList.txt

for fn in *.sra
do
fastq-dump -I --split-files $fn
done
