#!/bin/bash

################################################################################
## Project Title: Workflow for analyzing ChIP-seq data
## Student: David Arambilet Morilla
## Supervisor: Dr. Jose Luis Mosquera Mayo
## Description: Quality check of the raw .fastq data.
## Date: 2022.05.16  (First release: 2022.05.12)
################################################################################


#SBATCH -p fast
#SBATCH -c 2
#SBATCH -N 1 
#SBATCH --mem-per-cpu 5000
#SBATCH -t 05:00:00 
#SBATCH -o qual.out
#SBATCH -e qual.err

ROOTDIR="/projects/cancer"
IMAGES="/projects/cancer/images"
RAWDATA="/projects/cancer/pipeline/raw_files"
TRIMDATA="/projects/cancer/pipeline/Trim_data"
REFGENOME="/projects/cancer/db_files"
BAMDATA="/projects/cancer/pipeline/bam_files"
OUTPUT="/projects/cancer/pipeline/output_files"

### FASTQC QUALITY REPORT ###

singularity exec -B ${ROOTDIR}:${ROOTDIR} ${IMAGES}/fastqcmachalen.img fastqc ${RAWDATA}/example.fastq -o ${ROOTDIR}/fastqc_files
