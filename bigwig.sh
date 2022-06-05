#!/bin/bash

################################################################################
## Project Title: Workflow for analyzing ChIP-seq data
## Student: David Arambilet Morilla
## Supervisor: Dr. Jose Luis Mosquera Mayo
## Description: Generation of Bigwig file for the data visualization.
## Date: 2022.05.16  (First release: 2022.05.12)
################################################################################


#SBATCH -p fast
#SBATCH -c 4
#SBATCH -N 1 
#SBATCH --mem-per-cpu 4000
#SBATCH -t 20:00:00 
#SBATCH -o bigwig_INPUT.out
#SBATCH -e bigwig_INPUT.err

ROOT="/projects/cancer"
IMAGES="/projects/cancer/images"
RAWDATA="/projects/cancer/pipeline/raw_files"
TRIMDATA="/projects/cancer/pipeline/Trim_data"
REFGENOME="/projects/cancer/db_files"
BAMDATA="/projects/cancer/pipeline/bam_files"

cd ${BAMDATA}

# Giving a BAM file, it generates the BigWig file for its visualization
singularity exec -B ${ROOT}:${ROOT} ${IMAGES}/deepTools.simg /tool_deps/_conda/envs/__deeptools@2.5.1/bin/python /tool_deps/_conda/envs/__deeptools@2.5.1/bin/bamCoverage -b sorted_unique_myc_input.bam --binSize 10 --normalizeUsingRPKM -o ${ROOT}/pipeline/output_files/myc_input.bw

