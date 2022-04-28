#!/bin/bash

#SBATCH -p fast
#SBATCH -c 4
#SBATCH -N 1 
#SBATCH --mem-per-cpu 4000
#SBATCH -t 20:00:00 
#SBATCH -o bigwig_INPUT.out
#SBATCH -e bigwig_INPUT.err

ROOTDIR="/projects/cancer"
IMAGES="/projects/cancer/images"
RAWDATA="/projects/cancer/pipeline/raw_files"
TRIMDATA="/projects/cancer/pipeline/Trim_data"
REFGENOME="/projects/cancer/db_files"
BAMDATA="/projects/cancer/pipeline/bam_files"

cd ${BAMDATA}

singularity exec -B ${ROOTDIR}:${ROOTDIR} ${IMAGES}/deepTools.simg /tool_deps/_conda/envs/__deeptools@2.5.1/bin/python /tool_deps/_conda/envs/__deeptools@2.5.1/bin/bamCoverage -b sorted_unique_example.bam --binSize 10 --normalizeUsingRPKM -o ${ROOTDIR}/pipeline/output_files/example.bw

