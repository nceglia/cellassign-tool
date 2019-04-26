library(cellassign)
library(tensorflow)
library(scran)
library(SingleCellExperiment)

args = commandArgs(trailingOnly=TRUE)
print(args)
sce <- readRDS(args[1])

rho <- readRDS(args[2])

rho <- as.matrix(rho)
counts(sce) <- data.matrix(counts(sce))

s <- sizeFactors(sce)

fit_cellassign <- cellassign(exprs_obj = sce, marker_gene_info = rho, s = s, shrinkage=TRUE)
saveRDS(fit_cellassign, file = 'celltypes.rdata')
