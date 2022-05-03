#Load all libraries...
library(ChIPseeker)
library(TxDb.Hsapiens.UCSC.hg38.knownGene)
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
library(openxlsx)
library(data.table)

# Set working directories (IN PATH ADD THE PATH OF THE BED FILES)
setwd("C:/Users/darambilet/Desktop/")

# Read bed file (example.bed)
peaks<-readPeakFile("degs_chip_down.bed")

# Load annotation database
txdb <- TxDb.Hsapiens.UCSC.hg38.knownGene

# Annotate the peaks
peakAnnot<-annotatePeak(peaks,tssRegion=c(-3000, 3000), TxDb=txdb, annoDb="org.Hs.eg.db")

# Visualize genomic distribution of annotated peaks
plotAnnoBar(peakAnnot)

# Export results in excel format
dataf_peakannot<-as.data.frame(peakAnnot)
openxlsx::write.xlsx(dataf_peakannot,"example.xlsx")


