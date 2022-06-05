#!/bin/bash

################################################################################
## Project Title: Workflow for analyzing ChIP-seq data
## Student: David Arambilet Morilla
## Supervisor: Dr. Jose Luis Mosquera Mayo
## Description: Trimming of the raw data for removing low quality reads.
## Date: 2022.05.16  (First release: 2022.05.12)
################################################################################


#SBATCH -p fast
#SBATCH -c 2
#SBATCH -N 1 
#SBATCH --mem-per-cpu 5000
#SBATCH -t 05:00:00 
#SBATCH -o trim.out
#SBATCH -e trim.err

ROOT="/projects/cancer"
IMAGES="/projects/cancer/images"
RAWDATA="/projects/cancer/pipeline/raw_files"
TRIMDATA="/projects/cancer/pipeline/Trim_data"
REFGENOME="/projects/cancer/db_files"
BAMDATA="/projects/cancer/pipeline/bam_files"
OUTPUT="/projects/cancer/pipeline/output_files"

cd ${RAWDATA}

# Giving a raw FastQ file it performs the adapter trimming of the data
singularity exec -B ${ROOT}:${ROOT} ${IMAGES}/trimgalore.simg trim_galore -q 30 -o ${ROOT}/pipeline/Trim_data input_hepg2.fastq 
