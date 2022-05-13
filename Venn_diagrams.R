library(VennDiagram)

# Generamos las listas que queramos comparar
cml_our<-read.table("cml_genes_pipeline.txt")
cml_pub<-read.table("cml_genes_published.txt")
geneLists <- list(cml_our,cml_pub)

# Para eliminar si hubiera huecos vacios (NA)
geneLists <- lapply(geneLists, function(x) x[!is.na(x)]) 
VENN.LIST <- geneLists

# Opciones de plot (colores, tamaño cifras, rotulos, etc).
venn.plot <- venn.diagram(VENN.LIST, euler.d=TRUE, scaled=TRUE ,NULL, 
                          fill=c("dodgerblue", "orange"),
                          alpha=c(0.5,0.5),
                          cex = 2,
                          cat.fontface=8,
                          category=c("Pipeline", "published"),
                          main = "CML genes pipeline vs published")

# Para ver el plot se usa la funcion grid.draw() 
grid.draw(venn.plot)


