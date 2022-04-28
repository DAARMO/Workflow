#!/bin/bash
#SBATCH -p fast
#SBATCH -c 2
#SBATCH -N 1 
#SBATCH --mem-per-cpu 5000
#SBATCH -t 05:00:00 
#SBATCH -o qual.out
#SBATCH -e qual.err

MAIN="/projects/cancer/pipeline"
RAWDATA="/projects/cancer/pipeline/raw_files"
IMAGES="/projects/cancer/images"

### FASTQC QUALITY REPORT ###

singularity exec -B ${MAIN}:${MAIN} ${IMAGES}/fastqcmachalen.img fastqc ${RAWDATA}/example.fastq -o ${MAIN}/fastqc_files
