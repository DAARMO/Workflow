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
#SBATCH -t 30:00:00 
#SBATCH -o align.out
#SBATCH -e align.err

ROOT="/projects/cancer"
IMAGES="/projects/cancer/images"
RAWDATA="/projects/cancer/pipeline/raw_files"
TRIMDATA="/projects/cancer/pipeline/Trim_data"
REFGENOME="/projects/cancer/db_files"
BAMDATA="/projects/cancer/pipeline/bam_files"

cd ${TRIMDATA}
# Alignment

singularity exec -B ${ROOT}:${ROOT} ${IMAGES}/bowtie2machalen.img bowtie2 -x ${REFGENOME}/Human_GRCh38/Human_GRCh38 -U input_hepg2_trimmed.fq -p 4 --no-unal -S ${BAMDATA}/output_input.sam

# Processing the SAM file into an indexed and sorted BAM file
cd ${BAMDATA}

singularity exec -B ${ROOT}:${ROOT} ${IMAGES}/deepTools.simg /tool_deps/_conda/pkgs/samtools-1.4.1-0/bin/samtools view -Sb output_input.sam > output_input.bam

singularity exec -B ${ROOT}:${ROOT} ${IMAGES}/deepTools.simg /tool_deps/_conda/pkgs/samtools-1.4.1-0/bin/samtools view -H output_input.bam > input_header

# Select uniquely mapped reads
# grep -v "XS:" combined with cat file - remove the rows with XS:, which represent the reads that have been aligned multiple times

singularity exec -B ${ROOT}:${ROOT} ${IMAGES}/deepTools.simg /tool_deps/_conda/pkgs/samtools-1.4.1-0/bin/samtools view -F 4 output_input.bam | grep -v "XS:" | cat input_header - > unique_input.sam

singularity exec -B ${ROOT}:${ROOT} ${IMAGES}/deepTools.simg /tool_deps/_conda/pkgs/samtools-1.4.1-0/bin/samtools view -Sb unique_input.sam > unique_input.bam

# Sort and index final BAM files

singularity exec -B ${ROOT}:${ROOT} ${IMAGES}/deepTools.simg /tool_deps/_conda/pkgs/samtools-1.4.1-0/bin/samtools sort unique_input.bam -o sorted_unique_input_hepg2.bam

singularity exec -B ${ROOT}:${ROOT} ${IMAGES}/deepTools.simg /tool_deps/_conda/pkgs/samtools-1.4.1-0/bin/samtools index sorted_unique_input_hepg2.bam

# Remove sam and headers

        rm input_header
        rm output_input.sam
        rm output_input.bam
        rm unique_input.sam
	rm unique_input.bam

