#!/bin/bash

################################################################################
## Project Title: Workflow for analyzing ChIP-seq data
## Student: David Arambilet Morilla
## Supervisor: Dr. Jose Luis Mosquera Mayo
## Description: Peak calling step, generation of BED files.
## Date: 2022.05.16  (First release: 2022.05.12)
################################################################################


#SBATCH -p fast
#SBATCH -c 1
#SBATCH -N 1 
#SBATCH --mem-per-cpu 8000
#SBATCH -t 10:00:00 
#SBATCH -o peak.out
#SBATCH -e peak.err

ROOT="/projects/cancer"
RAWDATA="/projects/cancer/pipeline/raw_files"
IMAGES="/projects/cancer/images"
TRIMDATA="/projects/cancer/pipeline/Trim_data"
ALIDATA="/projects/cancer/pipeline/bam_files"
REFGENOME="/projects/cancer/db_files"
BAMDATA="/projects/cancer/pipeline/bam_files"

cd ${BAMDATA}

singularity exec -B ${ROOT}:${ROOT} ${IMAGES}/macs2.simg macs2 callpeak -B -t sorted_unique_myc_cml.bam -c sorted_unique_myc_input.bam -n ${ROOT}/pipeline/output_files/myc_cml_peaks
