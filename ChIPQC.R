################################################################################
## Project Title: Workflow for analyzing ChIP-seq data
## Student: David Arambilet Morilla
## Supervisor: Dr. Jose Luis Mosquera Mayo
## Description: Mapping of the trimmed reads into a SAM file that then will be processed into a BAM file.
## Date: 2022.05.30  (First release: 2022.05.30)
################################################################################

library(ChIPQC)
# Load the summary file
samples<-read.csv("samples.csv")
# Create the ChIPQC object
chipObj<-ChIPQC(samples, annotation="hg38")
# Obtain the quality report
ChIPQCreport(chipObj, reportName="ChIPQC report: myc", reportFolder="ChIPQCreport")

