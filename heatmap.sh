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
#SBATCH --mem-per-cpu 8000
#SBATCH -t 20:00:00 
#SBATCH -o heatmap_d.out
#SBATCH -e heatmap_d.err

ROOT="/projects/cancer"
IMAGES="/projects/cancer/images"
RAWDATA="/projects/cancer/pipeline/raw_files"
TRIMDATA="/projects/cancer/pipeline/Trim_data"
REFGENOME="/projects/cancer/db_files"
BAMDATA="/projects/cancer/pipeline/bam_files"
OUTPUT="/projects/cancer/pipeline/output_files"


cd ${OUTPUT}

# Design the matrix where the specific regions in a given BED file are checked in different BigWig files
singularity exec -B ${ROOT}:${ROOT} ${IMAGES}/deepTools.simg /tool_deps/_conda/envs/__deeptools@2.5.1/bin/python /tool_deps/_conda/envs/__deeptools@2.5.1/bin/computeMatrix reference-point -R myc_cml_peaks_peaks.narrowPeak --referencePoint TSS -S myc_cml.bw myc_cml_published.bigWig -b 10000 -a 10000 -p 6 --samplesLabel Workflow Published -o matrix_scaled.gz --sortRegions descend --outFileNameMatrix matrix_scaled.tab --outFileSortedRegions genes_sorted.bed

# Plot the matrix in a heatmap
singularity exec -B ${ROOT}:${ROOT} ${IMAGES}/deepTools.simg /tool_deps/_conda/envs/__deeptools@2.5.1/bin/python /tool_deps/_conda/envs/__deeptools@2.5.1/bin/plotHeatmap -m matrix_scaled.gz --colorMap YlGnBu --legendLocation none --sortRegions no --missingDataColor "#FFF6EB" -out heatmap.pdf
