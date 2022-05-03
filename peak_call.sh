#!/bin/bash

#SBATCH -p fast
#SBATCH -c 1
#SBATCH -N 1 
#SBATCH --mem-per-cpu 8000
#SBATCH -t 10:00:00 
#SBATCH -o peak.out
#SBATCH -e peak.err

ROOTDIR="/projects/cancer"
RAWDATA="/projects/cancer/pipeline/raw_files"
IMAGES="/projects/cancer/images"
TRIMDATA="/projects/cancer/pipeline/Trim_data"
ALIDATA="/projects/cancer/pipeline/bam_files"
REFGENOME="/projects/cancer/db_files"
BAMDATA="/projects/cancer/pipeline/bam_files"

cd ${BAMDATA}

singularity exec -B ${ROOTDIR}:${ROOTDIR} ${IMAGES}/macs2.simg macs2 callpeak -B -t sorted_unique_example.bam -c sorted_unique_example_input.bam -n ${ROOTDIR}/pipeline/output_files/example_peaks
