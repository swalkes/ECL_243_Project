#!/bin/bash -l
#SBATCH -o fst.out
#SBATCH -e fst.err

module load vcftools

# txt files are each lists of individuals from separate populations with IDs that map back to the vcf file
for y in *txt; do
for x in *txt; do
vcftools --vcf plink.vcf --weir-fst-pop $y --weir-fst-pop $x --out popn_vs_popse
done
done

# fst calculation listed in the .err file and manually copied to an excel spreadsheet for 
# plotting in R 