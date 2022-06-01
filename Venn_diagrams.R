################################################################################
## Project Title: Workflow for analyzing ChIP-seq data
## Student: David Arambilet Morilla
## Supervisor: Dr. Jose Luis Mosquera Mayo
## Description: Mapping of the trimmed reads into a SAM file that then will be processed into a BAM file.
## Date: 2022.05.25  (First release: 2022.05.25)
################################################################################

library(VennDiagram)

# Generating the lists to compare
cml_our<-read.table("cml_genes_pipeline.txt")
cml_pub<-read.table("cml_genes_published.txt")
geneLists <- list(cml_our,cml_pub)

# Remove NA values
geneLists <- lapply(geneLists, function(x) x[!is.na(x)]) 
VENN.LIST <- geneLists

# Customization of the venn diagram
venn.plot <- venn.diagram(VENN.LIST, euler.d=TRUE, scaled=TRUE ,NULL, 
                          fill=c("dodgerblue", "orange"),
                          alpha=c(0.5,0.5),
                          cex = 2,
                          cat.fontface=8,
                          category=c("Pipeline", "published"),
                          main = "CML genes pipeline vs published")

# Ploting the venn diagram
grid.draw(venn.plot)


