#!/bin/bash

################################################################################
## Project Title: Workflow for analyzing ChIP-seq data
## Student: David Arambilet Morilla
## Supervisor: Dr. Jose Luis Mosquera Mayo
## Description: Mapping of the trimmed reads into a SAM file that then will be processed into a BAM file.
## Date: 2022.05.16  (First release: 2022.05.12)
################################################################################

#SBATCH -p long
#SBATCH -c 4
#SBATCH -N 1 
#SBATCH --mem-per-cpu 4000
#SBATCH -t 20:00:00 
#SBATCH -o getfasta.out
#SBATCH -e getfasta.err

ROOTDIR="/projects/cancer"
IMAGES="/projects/cancer/images"
RAWDATA="/projects/cancer/pipeline/raw_files"
TRIMDATA="/projects/cancer/pipeline/Trim_data"
REFGENOME="/projects/cancer/db_files"
BAMDATA="/projects/cancer/pipeline/bam_files"

cd ${ROOTDIR}/pipeline/output_files

singularity exec -B ${ROOTDIR}:${ROOTDIR} ${IMAGES}/bedtools.simg bedtools getfasta -fi ${REFGENOME}/Human_GRCh38/hg38.fa -bed myc_cml.bed  -fo myc_cml.fasta
