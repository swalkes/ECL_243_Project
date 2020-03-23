#!/bin/bash -l


module load plink

# ALL_POPs_batch_1.plink.ped is a ped file containing all individuals from all transects

plink --ped ALL_POPs_batch_1.plink.ped --make-vcf --out ALL_POPs_batch_1.plink.vcf



