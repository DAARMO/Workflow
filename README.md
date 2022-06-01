# Workflow

Step 1: quality_check.sh --> singularity script used for quality checking of the raw and trimmed data

Step 2: trimming.sh  --> singulairty script used for the trimming of the raw data

Step 3: align.sh --> singularity script used to align the trimmed sequences to the reference genome and process the SAM and BAM files

Step 4: bigwig.sh --> singularity script used to obtain the bigWig files for visualization from BAM files obtained in the alignment step

Step 5: peak_call.sh --> singularity script used in the peak calling step from the aligned BAM files

Step 6: ChIPQC.R --> R script used to perform quality check of the peak calling

Step 7: downstrem analyses:

Step 7.1: annotation.R --> R script used to annotate the BED files obtained from the peak calling

Step 7.2: getfasta.sh --> singularity script used to obtain the sequences from each peak called

Step 7.3: heatmap.sh --> singularity script used to plot heatmaps for comparing different datasets

Step 7.4: Venn_diagrams.R --> R script used to plot venn diagrams for comparing different gene datasets
