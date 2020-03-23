#!/bin/bash -l

# bash script to index the reference genome file, where PeMa.fna.gz is the reference genome
bwa index -p /home/sawalkes/data/reference_genome/genome_index \
-a bwtsw /home/sawalkes/data/reference_genome/PeMa.fna.gz