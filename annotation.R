################################################################################
## Project Title: Workflow for analyzing ChIP-seq data
## Student: David Arambilet Morilla
## Supervisor: Dr. Jose Luis Mosquera Mayo
## Description: Mapping of the trimmed reads into a SAM file that then will be processed into a BAM file.
## Date: 2022.05.25  (First release: 2022.05.17)
################################################################################

#Load libraries
library(ChIPseeker)
library(TxDb.Hsapiens.UCSC.hg38.knownGene)
library(openxlsx)
library(data.table)

# Set working directories
setwd("C:/Users/darambilet/Desktop/")

# Read bed file
peaks<-readPeakFile("myc_cml.bed")

# Load annotation database
txdb <- TxDb.Hsapiens.UCSC.hg38.knownGene

# Annotate the peaks
peakAnnot<-annotatePeak(peaks,tssRegion=c(-3000, 3000), TxDb=txdb, annoDb="org.Hs.eg.db")

# Visualize genomic distribution of annotated peaks
plotAnnoBar(peakAnnot)

# Export results in excel format
dataf_peakannot<-as.data.frame(peakAnnot)
openxlsx::write.xlsx(dataf_peakannot,"myc_cml.xlsx")


